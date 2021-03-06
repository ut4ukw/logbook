unit udmCallBook;

interface

uses
  SysUtils, Classes, uUtils, Windows, Forms, DB, dbf, JvComponentBase, JvThread,
  KDaoDataBase, KDaoTable, Dialogs;

type

  TcbSearch_getStr = function(lpCallSign: PAnsiChar; var lpDestString: PAnsiChar; FileCallBook: PAnsiChar): LongBool; stdcall;

  TCustomCallBookEngine = class
  private
    FDataSet: TDataSet;
  protected
    procedure SetValue(FieldName: string; Value: string);
    procedure Initialize(DataSet: TDataSet; CallbookFileName: string = ''); virtual; abstract;
    procedure DeInitialize; virtual; abstract;
    function Search(CallSign: string; CallbookFileName: string): boolean; virtual; abstract;
  end;

  TCallBookMigrateEngine = class(TCustomCallBookEngine)
  private
    FHandle: THandle;
    FcbSearch_getStr: TcbSearch_getStr;
  public
    procedure Initialize(DataSet: TDataSet; CallbookFileName: string = ''); override;
    procedure DeInitialize; override;
    function Search(CallSign: string; CallbookFileName: string): boolean; override;
  end;

  TRICEngine = class(TCustomCallBookEngine)
  private
    FDbf: TDbf;
    FCallbookFileName: string;
  public
    procedure Initialize(DataSet: TDataSet; CallbookFileName: string = ''); override;
    procedure DeInitialize; override;
    function Search(CallSign: string; CallbookFileName: string): boolean; override;
  end;

  TEQFEngine = class(TCustomCallBookEngine)
  private
    FDatabase: TKADaoDatabase;
    FTable: TKADaoTable;
    FCallbookFileName: string;
  public
    procedure Initialize(DataSet: TDataSet; CallbookFileName: string = ''); override;
    procedure DeInitialize; override;
    function Search(CallSign: string; CallbookFileName: string): boolean; override;
  end;

  TdmCallBook = class(TDataModule)
    thrCallBook: TJvThread;
    procedure thrCallBookExecute(Sender: TObject; Params: Pointer);
    procedure thrCallBookCancelExecute(CurrentThread: TJvThread);
  private
    FCallBookMigrateEngine: TCallBookMigrateEngine;
    FRICEngine: TRICEngine;
    FEQFEngine: TEQFEngine;
    thrHandle:THandle;
    procedure FreeEngine(Engine: TCustomCallBookEngine);
    function NormalizeFileName(FileName:string):string;
    procedure MsgWaitForSingleObject(Handle: THandle);
  public
    procedure Initialize;
    procedure DeInitialize;
    procedure CallInfo;
    function NeedInfo: boolean;
    procedure Break;
  end;

var
  dmCallBook: TdmCallBook;

implementation

uses uCallBookSettingsFrame, uCallbook;
{$R *.dfm}


procedure TdmCallBook.MsgWaitForSingleObject(Handle: THandle);
begin
  repeat
    if MsgWaitForMultipleObjects(1, Handle, False, INFINITE, QS_ALLINPUT) = WAIT_OBJECT_0 + 1 then
      Application.ProcessMessages
    else
      BREAK;
  until True = False;
end;

procedure TCustomCallBookEngine.SetValue(FieldName: string; Value: string);
begin
  if not (FDataSet.State in [dsInsert,dsEdit]) then exit;
  if (Trim(Value) <> '') and (Trim(FDataSet.FieldByName(FieldName).AsString) = '') then
    FDataSet.FieldByName(FieldName).AsString := Value;
end;

procedure TCallBookMigrateEngine.Initialize(DataSet: TDataSet; CallbookFileName: string = '');
begin
  FHandle := LoadLibrary(PWideChar(ExtractFilePath(GetDllFileName) + 'dll_callbook_search.dll'));
  FDataSet := DataSet;
  if FHandle = 0 then
    raise Exception.Create('Error load library : ' + ExtractFilePath(GetDllFileName) + 'dll_callbook_search.dll');
  @FcbSearch_getStr := getProcAddress(FHandle, 'cbSearch_getStr');
  if @FcbSearch_getStr = nil then
    raise Exception.Create('Error get address procedure cbSearch_getStr in ' + ExtractFilePath(GetDllFileName) + 'dll_callbook_search.dll');
end;

procedure TCallBookMigrateEngine.DeInitialize();
begin
  if FHandle <> 0 then
    FreeLibrary(FHandle);
end;

function TCallBookMigrateEngine.Search(CallSign: string; CallbookFileName: string): boolean;
var
  sOutString: PAnsiChar;
  sCallSign: PAnsiChar;
  sFileName: PAnsiChar;
  sResult: boolean;
  slResult: TStringList;
begin
  sOutString := '';
  sCallSign := PAnsiChar(AnsiString(CallSign));
  sFileName := PAnsiChar(AnsiString(CallbookFileName));
  if @FcbSearch_getStr <> nil then
    sResult := FcbSearch_getStr(sCallSign, sOutString, sFileName);
  if not sResult then
  begin
    Result := False;
    exit;
  end;
  slResult := TStringList.Create;
  try
    slResult.StrictDelimiter := true;
    slResult.Delimiter := ',';
    slResult.DelimitedText := sOutString;
    SetValue('LOG_NAME', Capitalize(slResult.Strings[2]));
    SetValue('LOG_QTH', Capitalize(slResult.Strings[3]));
    SetValue('LOG_GRIDSQUARE', slResult.Strings[4]);
    SetValue('LOG_WEB', slResult.Strings[5]);
    SetValue('LOG_STATE', slResult.Strings[6]);
    SetValue('LOG_EMAIL', slResult.Strings[8]);
    SetValue('LOG_QSL_VIA', slResult.Strings[10]);
    Result := true;
  finally
    slResult.Free;
  end;
end;

procedure TRICEngine.Initialize(DataSet: TDataSet; CallbookFileName: string = '');
begin
  FDataSet := DataSet;
  FDbf := TDbf.Create(nil);
  FDbf.FilePath := ExtractFilePath(CallbookFileName);
  FDbf.TableName := ExtractFileName(CallbookFileName);
  FDbf.Open;
end;

procedure TRICEngine.DeInitialize;
begin
  if Assigned(FDbf) then
    FDbf.Free;
end;

function TRICEngine.Search(CallSign: string; CallbookFileName: string): boolean;
begin
  if not Assigned(FDbf) then
    exit;
  if FDbf.Locate('CALL_', CallSign, []) then
  begin
    SetValue('LOG_NAME', Capitalize(DosToWin(FDbf.FieldByName('IM_').AsString)));
    SetValue('LOG_QTH', Capitalize(DosToWin(FDbf.FieldByName('GOR_').AsString)));
    SetValue('LOG_WEB', FDbf.FieldByName('URL_').AsString);
    SetValue('LOG_CNTY', DosToWin(FDbf.FieldByName('RDA_').AsString));
    SetValue('LOG_EMAIL', FDbf.FieldByName('EMAIL_').AsString);
    Result := true;
  end;
end;

procedure TEQFEngine.Initialize(DataSet: TDataSet; CallbookFileName: string = '');
begin
  FDataSet := DataSet;
  { FDatabase:=TKADaoDatabase.Create(nil);
    FDatabase.Database:=CallbookFileName;
    FDatabase.Connected:=True;
    FTable:=TKADaoTable.Create(nil);
    FTable.Database:=FDatabase;
    FTable.TableName:='Callbook' ;
    FTable.Open; }
end;

procedure TEQFEngine.DeInitialize;
begin
  if Assigned(FTable) then
    FTable.Free;
  if Assigned(FDatabase) then
    FDatabase.Free;
end;

function TEQFEngine.Search(CallSign: string; CallbookFileName: string): boolean;
begin
 if FileExists(CallbookFileName) then
  begin

  FDatabase := TKADaoDatabase.Create(nil);
  FDatabase.Database := CallbookFileName;
  FDatabase.Connected := true;
  FTable := TKADaoTable.Create(nil);
  FTable.Database := FDatabase;
  FTable.SQL.Text := 'SELECT * FROM CallBook Where call=' + #39 + CallSign + #39;
  FTable.Open;
  if not FTable.IsEmpty then
  begin
    SetValue('LOG_NAME', FTable.FieldByName('Name').AsString);
    SetValue('LOG_QTH', FTable.FieldByName('QTH').AsString);
    SetValue('LOG_QSL_VIA', FTable.FieldByName('MANAGER').AsString);
    SetValue('LOG_CNTY', FTable.FieldByName('STATE').AsString);
    SetValue('LOG_GRIDSQUARE', FTable.FieldByName('GRID').AsString);
    Result := true;
  end;
  FTable.Close;
  FDatabase.Close;
  FreeAndNil(FTable);
  FreeAndNil(FDatabase);
  end;
  {

    if not Assigned(FTable) then exit;
    if FTable.Locate('Call',CallSign,[]) then
    begin
    SetValue('LOG_NAME',FTable.FieldByName('Name').asString);
    SetValue('LOG_QTH',FTable.FieldByName('QTH').asString);
    SetValue('LOG_QSL_VIA',FTable.FieldByName('MANAGER').asString);
    SetValue('LOG_CNTY',FTable.FieldByName('STATE').asString);
    SetValue('LOG_GRIDSQUARE',FTable.FieldByName('GRID').asString);
    result:=True;
    end;
    }
end;

{ ---------------------------------------------- END Engine ---------------------- }

function TdmCallBook.NormalizeFileName(FileName:string):string;
begin
 result:=GetAbsolutePathFromOptions(ExtractFilePath(FileName))+ExtractFileName(FileName);
end;

procedure TdmCallBook.FreeEngine(Engine: TCustomCallBookEngine);
begin
  if Assigned(Engine) then
  begin
    Engine.DeInitialize;
    FreeAndNil(Engine);
  end;
end;

procedure TdmCallBook.Initialize;
begin
  CallBookSettingsFrame.cdsCallBook.DisableControls;
  CallBookSettingsFrame.cdsCallBook.First;
  while not CallBookSettingsFrame.cdsCallBook.Eof do
  begin
    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'CallBook Migration' then
      if FCallBookMigrateEngine = nil then
      begin
        FCallBookMigrateEngine := TCallBookMigrateEngine.Create;
        try
          FCallBookMigrateEngine.Initialize(ldsLogEdit.DataSet);
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or MB_ICONHAND or MB_OK or MB_ICONERROR);
        end;
      end;

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'RIC' then
      if FRICEngine = nil then
      begin
        FRICEngine := TRICEngine.Create;
        try
          FRICEngine.Initialize(ldsLogEdit.DataSet, NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString) );
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or MB_ICONHAND or MB_OK or MB_ICONERROR);
        end;
      end;

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'UR5EQF Internal Database' then
      if FEQFEngine = nil then
      begin
        FEQFEngine := TEQFEngine.Create;
        try
          FEQFEngine.Initialize(ldsLogEdit.DataSet, NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));
        except
          on E: Exception do
            MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_SYSTEMMODAL or MB_SETFOREGROUND or MB_TOPMOST or MB_ICONHAND or MB_OK or MB_ICONERROR);
        end;
      end;

    CallBookSettingsFrame.cdsCallBook.Next;
  end;

  CallBookSettingsFrame.cdsCallBook.First;

  if Assigned(FCallBookMigrateEngine) then
    if not CallBookSettingsFrame.cdsCallBook.Locate('CALLBOOK_TYPE', 'CallBook Migration', []) then
    begin
      FCallBookMigrateEngine.DeInitialize;
      FreeAndNil(FCallBookMigrateEngine);
    end;

  if Assigned(FRICEngine) then
    if not CallBookSettingsFrame.cdsCallBook.Locate('CALLBOOK_TYPE', 'RIC', []) then
    begin
      FRICEngine.DeInitialize;
      FreeAndNil(FRICEngine);
    end;

  if Assigned(FEQFEngine) then
    if not CallBookSettingsFrame.cdsCallBook.Locate('CALLBOOK_TYPE', 'UR5EQF Internal Database', []) then
    begin
      FEQFEngine.DeInitialize;
      FreeAndNil(FEQFEngine);
    end;


  CallBookSettingsFrame.cdsCallBook.First;
  CallBookSettingsFrame.cdsCallBook.EnableControls;
end;

procedure TdmCallBook.thrCallBookCancelExecute(CurrentThread: TJvThread);
begin
 if Assigned(FEQFEngine) then
  begin
//   if Assigned(FEQFEngine.FTable) or Assigned(FEQFEngine.FDatabase) then
{      if thrCallBook.Count>0 then
        MsgWaitForSingleObject(thrHandle);}


   if Assigned(FEQFEngine.FTable) then
    begin
      if FEQFEngine.FTable.Active then
      FEQFEngine.FTable.Close;
      FreeAndNil(FEQFEngine.FTable);
    end;
   if Assigned(FEQFEngine.FDatabase) then
    begin
      if FEQFEngine.FDatabase.Connected then
      FEQFEngine.FDatabase.Close;
      FreeAndNil(FEQFEngine.FDatabase);
    end;
  end;
thrCallBook.Terminate;
end;

procedure TdmCallBook.thrCallBookExecute(Sender: TObject; Params: Pointer);
var
  CallSignFound: boolean;
begin
  CallBookSettingsFrame.cdsCallBook.DisableControls;
  CallBookSettingsFrame.cdsCallBook.First;
  while not CallBookSettingsFrame.cdsCallBook.Eof do
  begin
    if not NeedInfo then
      Break;
   if not thrCallBook.Terminated then
   begin
    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'CallBook Migration' then
      if Assigned(FCallBookMigrateEngine) then
        CallSignFound := FCallBookMigrateEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'RIC' then
      if Assigned(FRICEngine) then
        CallSignFound := FRICEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'UR5EQF Internal Database' then
      if Assigned(FEQFEngine) then
        CallSignFound := FEQFEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    { if CallSignFound then
      Break; }
    CallBookSettingsFrame.cdsCallBook.Next;
   end;
  end;
  CallBookSettingsFrame.cdsCallBook.First;
  CallBookSettingsFrame.cdsCallBook.EnableControls;
end;

procedure TdmCallBook.DeInitialize;
begin
  thrCallBook.Terminate;
  FreeEngine(FCallBookMigrateEngine);
  FreeEngine(FRICEngine);
  FreeEngine(FEQFEngine);
end;

procedure TdmCallBook.CallInfo;
var
  CallSignFound: boolean;
begin
  CallBookSettingsFrame.cdsCallBook.DisableControls;
  CallBookSettingsFrame.cdsCallBook.First;
  while not CallBookSettingsFrame.cdsCallBook.Eof do
  begin
    if not NeedInfo then
      Break;
{   if not thrCallBook.Terminated then
   begin}
    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'CallBook Migration' then
      if Assigned(FCallBookMigrateEngine) then
        CallSignFound := FCallBookMigrateEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'RIC' then
      if Assigned(FRICEngine) then
        CallSignFound := FRICEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    if CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString = 'UR5EQF Internal Database' then
      if Assigned(FEQFEngine) then
        CallSignFound := FEQFEngine.Search(GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)), NormalizeFileName(CallBookSettingsFrame.cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString));

    { if CallSignFound then
      Break; }
    CallBookSettingsFrame.cdsCallBook.Next;
//   end;
  end;
  CallBookSettingsFrame.cdsCallBook.First;
  CallBookSettingsFrame.cdsCallBook.EnableControls;

{  thrCallBook.WaitFor;
  thrHandle:=thrCallBook.Execute(nil).Handle;}
end;

function TdmCallBook.NeedInfo: boolean;
begin
  Result := (Trim(ldsLogEdit.DataSet.FieldByName('LOG_NAME').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_QTH').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_GRIDSQUARE').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_STATE').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_CNTY').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_EMAIL').AsString) = '') or (Trim(ldsLogEdit.DataSet.FieldByName('LOG_WEB').AsString) = '') or
    (Trim(ldsLogEdit.DataSet.FieldByName('LOG_IOTA').AsString) = '');
end;

procedure TdmCallBook.Break;
begin
 thrCallBook.CancelExecute;
end;


end.
