unit uWindowJT65HFForm;

interface

uses
  Windows, Messages, uWindowPluginForm, DBGridEhGrouping, GridsEh, DBGridEh,
  Controls, ComCtrls, ToolWin, Classes, ExtCtrls, DB, JvCsvData, uUtils,
  JvMemoryDataset, SysUtils, DateUtils, Graphics, uPluginHeaders, KDaoTable, EhLibMemData,
  JvComponentBase, JvFormPlacement, TlHelp32, Forms, Dialogs, ActnList, ImgList,
  ATFileNotification,Clipbrd;

const
  cmdNone = -1;
  cmdSetGenedatedText = 73;
  cmdClickTXEnable = 65;
  cmdClickTXHalt = 66;
  cmdCheckMiltiDecod = 16;
  cmdSetDF = 77;
  cmdSetEven = 15;
  cmdSetOdd = 14;

  csIdle = 0;
  csSearchWaitingAnswer = 1;
  csSearchWaitingRRR = 2;

type
  TWindowJT65HFForm = class(TWindowPluginForm)
    pnlMainToolbar: TPanel;
    ToolBar1: TToolBar;
    tbSyncBrowse: TToolButton;
    bEnableTX: TToolButton;
    dbgJT65HF: TDBGridEh;
    cdsCSV: TJvMemoryData;
    cdsCSVDateTime: TDateTimeField;
    cdsCSVQRG: TFloatField;
    cdsCSVDB: TStringField;
    cdsCSVDT: TStringField;
    cdsCSVDF: TStringField;
    cdsCSVExchange: TStringField;
    DataSource1: TDataSource;
    cdsCSVJT65HF_CALL: TStringField;
    cdsCSVJT65HF_COLOR: TStringField;
    cdsCSVJT65HF_ACTION: TStringField;
    bHaltTX: TToolButton;
    FormStorage: TJvFormStorage;
    alJt65HF: TActionList;
    aJT65HFRefresh: TAction;
    ToolButton3: TToolButton;
    ilJT65HF: TImageList;
    aJT65HFEnableTX: TAction;
    aJT65HFHaltTX: TAction;
    ToolButton1: TToolButton;
    ATFileNotification1: TATFileNotification;
    timSave: TTimer;
    procedure DirWatcher11Change(Sender: TObject);
    procedure tbSyncBrowseClick(Sender: TObject);
    procedure dbgJT65HFGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure dbgJT65HFDblClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ChangeNotifyNotifications0Change(Sender: TObject);
    procedure tbSearchAllBookClick(Sender: TObject);
    procedure dbgJT65HFCellClick(Column: TColumnEh);
    procedure aJT65HFRefreshExecute(Sender: TObject);
    procedure aJT65HFEnableTXExecute(Sender: TObject);
    procedure aJT65HFHaltTXExecute(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ATFileNotification1Changed(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure timSaveTimer(Sender: TObject);
  private
    qryDXCC: TKaDaoTable;
    DXCCSQL: string;
    StationId: Integer;
    bCQMode: boolean;
    sCurrentReport: string;
    iCurrentStatus: Integer;
    ClipboardViewer: HWND;
    FNextViewerHandle: THandle;
    procedure SetTextTXGenegater(Str: string);
    procedure SetCommand(Command: Integer; Str: string; CheckBox: boolean = false; bReturnFocus: boolean = true);
    function NormalizeReport(Report:string):string;
  public
    StationCall: string;
    Loaded:boolean;
    procedure Init;
    procedure Deinit;
    procedure ReloadCSV;
    procedure StationChanged(lParam: variant);
    procedure BuildQuery;
    procedure OptionChanged;
    procedure SaveGrid;
    procedure RunJT;
    procedure NewQSO;
    procedure SaveQSO;
    procedure ClipboardChange;
  end;

var
  WindowJT65HFForm: TWindowJT65HFForm;
  iControlCount: Integer;
  CurrentCommand: Integer;
  CurrentText: string;
  CurrentCheckBox: boolean;
  CurrentGlobalBreak: boolean;

implementation

uses uWindowJT65HF, uWindowJT65HFSettingsFrame;
{$R *.dfm}

function GetText(WindowHandle: hwnd): string;
var
  txtLength: Integer;
  buffer: string;
begin
  txtLength := SendMessage(WindowHandle, WM_GETTEXTLENGTH, 0, 0);
  txtLength := txtLength + 1;
  setlength(buffer, txtLength);
  SendMessage(WindowHandle, wm_gettext, txtLength, longint(@buffer[1]));
  result := buffer;
end;

function EnumChildWindowsProc(Wnd: hwnd; lp: lParam): Bool; export;
{$IFDEF Win32} stdcall; {$ENDIF}
var
  buffer: array [0 .. 99] of Char;
  Str: string;
begin
  Inc(iControlCount);
//   SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar(IntToStr(iControlCount))));

  // if iControlCount=72 then
  // SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar('TEST')));

  // if iControlCount>50 then
  // SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar('TEST')));
  // SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar(IntToStr(iControlCount))));
  { GetClassName(Wnd, Buffer, MAXCHAR);
    if StrPas(Buffer)='Edit' then
    SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar(IntToStr(iControlCount))));
    }
  // if StrPas(Buffer)='Button' then
  // SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar(IntToStr(iControlCount))));
  // SendMessage(Wnd,WM_SETTEXT,0,Longint(PChar(StrPas(Buffer))));

  if iControlCount = CurrentCommand then
  begin
    GetClassName(Wnd, buffer, MAXCHAR);
    if StrPas(buffer) = 'Button' then
    begin
      SetForegroundWindow(Wnd);
      SendMessage(Wnd, WM_ACTIVATE, 1, 0);
      SendMessage(Wnd, WM_ENABLE, 1, 0);
      SendMessage(Wnd, WM_SETFOCUS, 1, 0);

      // ��������� ����� �� ������ ����, ����� �������������� ���� IE
      // Application.ProcessMessages;
      // SetForegroundWindow(Wnd);
      // SendMessage(Wnd, WM_SETFOCUS, 1, 0);
      Sleep(300); // ������ ������������ �����, ����� ���� ������ �������������

      // �������� Enter ������
      if not CurrentCheckBox then
      begin
        keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY, 0);
        keybd_event(VK_RETURN, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      end
      else
      begin
        keybd_event(VK_SPACE, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
        keybd_event(VK_SPACE, 0, KEYEVENTF_EXTENDEDKEY, 0);
        keybd_event(VK_SPACE, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      end;
    end
    else
      SendMessage(Wnd, WM_SETTEXT, 0, longint(PChar(CurrentText)));
    CurrentGlobalBreak := true;
  end;
  // if not CurrentGlobalBreak then
  if CurrentGlobalBreak then
    exit;
  Enumchildwindows(Wnd, @EnumChildWindowsProc, 0);
  result := true;
end;

(* function EnumWindowsProc(Wnd: HWND): Bool; export; {$IFDEF Win32} stdcall; {$ENDIF}
  var
  Buffer: array [0 .. 99] of Char;
  Str:string;

  begin
  Enumchildwindows(JTHWND, @EnumChildWindowsProc, 0);
  Result := True;
  end;

*)

function EnumWindowsProcHandle(Wnd: hwnd): Bool; export; {$IFDEF Win32} stdcall; {$ENDIF}
var
  buffer: array [0 .. 99] of Char;
  Str: string;

begin
  GetWindowText(Wnd, buffer, 100);
  Str := StrPas(buffer);
  if Pos('JT65-HF Version', Str) > 0 then
  begin
    JTHWND := Wnd;
  end;
  result := true;
end;

// --------------------------------------------------------------------------
procedure TWindowJT65HFForm.ReloadCSV;
var
  slList, slRow, slRowParse: TStringList;
  i, j: Integer;
  lParam, wParam: variant;
  dDate: TDateTime;


  function GetDateTime: TDateTime;
  var
    sDate, sTime: string;
    iYear, iMonth, iDay, iHours, iMin: Integer;
  begin
    sDate := slRow[0];
    sTime := slRow[1];
    iYear := StrToInt(Copy(sDate, 1, 4));
    iMonth := StrToInt(Copy(sDate, 6, 2));
    iDay := StrToInt(Copy(sDate, 9, 2));
    iHours := StrToInt(Copy(sTime, 1, 2));
    iMin := StrToInt(Copy(sTime, 4, 2));
    result := EncodeDateTime(iYear, iMonth, iDay, iHours, iMin, 0, 0);
  end;

  function GetCall: string;
  var
    sCall: string;
  begin
    result := '';
    sCall := cdsCSV.FieldByName('JT65HF_Exchange').AsString;
    if Copy(sCall, 1, 2) = 'CQ' then
    begin
      Delete(sCall, 1, 3);
      result := Copy(sCall, 1, Pos(' ', sCall));
      cdsCSV.FieldByName('JT65HF_ACTION').AsString := 'CQ';
    end;
  end;

begin
  cdsCSV.DisableControls;

  cdsCSV.EmptyTable;

  slList := TStringList.Create;
  slRow := TStringList.Create;
  slRowParse := TStringList.Create;
  slRowParse.Delimiter := ' ';
  try
    try
      slList.LoadFromFile(IncludeTrailingPathDelimiter(WindowJT65HFSettingsFrame.WindowJT65HF_deCsvFiles.Directory) + 'JT65hf-log.csv');
      // ShowMessage('Loaded');
    except
    end;

    qryDXCC.SQL.Text := DXCCSQL;

    for i := 0 to slList.Count - 1 do
    begin
      if i = 0 then
        continue;

      if Trim(slList[i]) = '' then
        continue;

      try
        slRow.CommaText := slList[i];

        dDate := GetDateTime;
        // ShowMessage(DateToStr(dDate)+' '+DateToStr(IncMinute(Date,WindowJT65HFSettingsFrame.WindowJT65HF_spTimeShowHstory.Value*-1)));

        if dDate < IncMinute(Date, WindowJT65HFSettingsFrame.WindowJT65HF_spTimeShowHstory.Value * -1) then
          continue;
        // ShowMessage('Date');

        if slRow[2] = '-' then
          continue;
        cdsCSV.Insert;

        cdsCSV.FieldByName('JT65HF_DateTime').AsDateTime := dDate;
        cdsCSV.FieldByName('JT65HF_Qrg').AsFloat := StrToFloat(StringReplace(Trim(slRow[2]), ',', '.', [rfReplaceAll]));
        cdsCSV.FieldByName('JT65HF_DB').AsString := NormalizeReport(slRow[4]);
        cdsCSV.FieldByName('JT65HF_DT').AsString := slRow[5];
        cdsCSV.FieldByName('JT65HF_DF').AsString := slRow[6];
        cdsCSV.FieldByName('JT65HF_Exchange').AsString := slRow[8];
        cdsCSV.FieldByName('JT65HF_Call').AsString := GetCall;
        if Copy(slRow[8], 1, Length(StationCall)) = StationCall then
          cdsCSV.FieldByName('JT65HF_ACTION').AsString := 'ANSWER';

        if bEnableTX.Down and (slRow[2] <> '-') and (cdsCSV.FieldByName('JT65HF_ACTION').AsString = 'ANSWER') then
        begin
          slRowParse.DelimitedText := cdsCSV.FieldByName('JT65HF_Exchange').AsString;

          if slRowParse.Count > 0 then
            if (Trim(slRowParse[0]) = StationCall) and (Trim(slRowParse[1]) = Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)) then
            begin
              case iCurrentStatus of
                csSearchWaitingRRR:
                  begin
                    if slRowParse.Count > 1 then
                      if (Trim(slRowParse[2]) = 'RRR') or (Trim(slRowParse[2]) = '73') then
                      begin
                        SetCommand(cmdSetGenedatedText, Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString) + ' ' + StationCall + ' 73');
                        iCurrentStatus := csIdle;

                        if (WindowJT65HFSettingsFrame.WindowJT65HF_cbSaveAfterEnd.Checked) then
                            timSave.Enabled:=true;
                      end;
                  end;
                csSearchWaitingAnswer:
                  begin
                    if slRowParse.Count > 1 then
                      // ldsLogEdit.DataSet.FieldByName('LOG_RST_RCVD').AsString := Copy(slRowParse[2], 2, Length(slRowParse[2]));
                      if Length(slRowParse[2]) > 0 then
                        if slRowParse[2][1] = 'R' then
                          ldsLogEdit.DataSet.FieldByName('LOG_RST_RCVD').AsString := NormalizeReport(Copy(slRowParse[2], 2, Length(slRowParse[2])))
                        else
                          ldsLogEdit.DataSet.FieldByName('LOG_RST_RCVD').AsString := NormalizeReport(slRowParse[2]);
                    cdsCSV.FieldByName('JT65HF_DB').AsString := NormalizeReport(slRow[4]);
                    ldsLogEdit.DataSet.FieldByName('LOG_RST_SENT').AsString:=cdsCSV.FieldByName('JT65HF_DB').AsString;
                    iCurrentStatus := csSearchWaitingRRR;
                    SetCommand(cmdSetGenedatedText, Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)
                        + ' ' + StationCall + ' R' + cdsCSV.FieldByName('JT65HF_DB').AsString);
                  end;
              end;
            end;
        end;

        if cdsCSV.FieldByName('JT65HF_Call').AsString <> '' then
        begin
          lParam := cdsCSV.FieldByName('JT65HF_Call').AsString;
          lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
          qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);
//          qryDXCC.SQL.savetofile('d:\1.sql');
          qryDXCC.Open;
          if qryDXCC.IsEmpty then
          begin
            cdsCSV.FieldByName('JT65HF_COLOR').AsString := 'R';
          end
          else
          begin
            qryDXCC.First;
            if not qryDXCC.Locate('LOG_BAND_MHZ', lBand, []) then
            begin
              cdsCSV.FieldByName('JT65HF_COLOR').AsString := 'B';
            end
            else
            begin
              if not WindowJT65HFSettingsFrame.WindowJT65HF_cbNewOneOnlyJT65HF.Checked then
              begin
                qryDXCC.First;
                if not qryDXCC.Locate('LOG_MODE', 'JT65', []) then
                begin
                  cdsCSV.FieldByName('JT65HF_COLOR').AsString := 'M';
                end;
              end;
            end;
          end;
          qryDXCC.Close;
        end;
      except
        on E: Exception do
          MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR);
      end;
      // cdsCSV.FieldByName('DateTime').AsDateTime:=
      cdsCSV.Post;
    end;
  finally
    FreeAndNil(slRowParse);
    FreeAndNil(slList);
    FreeAndNil(slRow);
  end;
  // cdsCSV.Refresh;
  cdsCSV.EnableControls;
end;

procedure TWindowJT65HFForm.tbSearchAllBookClick(Sender: TObject);
begin
  // SetTextTXGenegater('1');
  SetCommand(cmdSetGenedatedText, 'UT3UU UT4UKW KO50');
  SetCommand(cmdClickTXEnable, '');
end;

procedure TWindowJT65HFForm.tbSyncBrowseClick(Sender: TObject);
begin
  ReloadCSV;
end;

procedure TWindowJT65HFForm.timSaveTimer(Sender: TObject);
var
lParam, wParam:variant;
begin
 lDllCommand(DC_SAVE_QSO, Self, lParam, wParam);
 timSave.Enabled:=False;
end;

procedure TWindowJT65HFForm.ToolButton1Click(Sender: TObject);
begin
  iControlCount := 0;
  Enumchildwindows(JTHWND, @EnumChildWindowsProc, 0);
  // SetCommand(cmdCheckMiltiDecod,'');
end;

procedure TWindowJT65HFForm.ToolButton2Click(Sender: TObject);
begin
  SetCommand(cmdClickTXHalt, '');
end;

procedure TWindowJT65HFForm.dbgJT65HFCellClick(Column: TColumnEh);
var
  s: string;
  lParam, wParam: variant;
begin
 if iCurrentStatus <> csIdle then exit;
  if cdsCSV.FieldByName('JT65HF_ACTION').AsString = 'CQ' then
  begin
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := cdsCSV.FieldByName('JT65HF_CALL').AsString;
    lParam := 0;
    wParam := 0;
    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
    // SetTextTXGenegater(cdsCSV.FieldByName('JT65HF_CALL').AsString);
  end;
end;

procedure TWindowJT65HFForm.dbgJT65HFDblClick(Sender: TObject);
var
  s: string;
  lParam, wParam: variant;
   myHour, myMin, mySec, myMilli : Word;
begin
 if iCurrentStatus <> csIdle then exit;
  if cdsCSV.FieldByName('JT65HF_ACTION').AsString = 'CQ' then
  begin
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := cdsCSV.FieldByName('JT65HF_CALL').AsString;
    lParam := 0;
    wParam := 0;
    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
    Application.ProcessMessages;
    SetCommand(cmdSetGenedatedText, Trim(cdsCSV.FieldByName('JT65HF_CALL').AsString) + ' ' + StationCall + ' ' + Copy
        (ldsLogEdit.DataSet.FieldByName('LOG_MY_GRIDSQUARE').AsString, 1, 4), false, false);
    sCurrentReport := cdsCSV.FieldByName('JT65HF_DB').AsString;
    ldsLogEdit.DataSet.FieldByName('LOG_RST_SENT').AsString := NormalizeReport(sCurrentReport);
    SetCommand(cmdSetDF, cdsCSV.FieldByName('JT65HF_DF').AsString, false, false);
    DecodeTime(cdsCSV.FieldByName('JT65HF_DateTime').AsDateTime, myHour, myMin, mySec, myMilli);
    if (myMin mod 2)=0 then
       SetCommand(cmdSetOdd, '', false, false)
    else
       SetCommand(cmdSetEven, '', false, false);
    SetCommand(cmdCheckMiltiDecod, '', true, false);
    aJT65HFEnableTX.OnExecute(Self);
    dbgJT65HF.SetFocus;
    iCurrentStatus := csSearchWaitingAnswer;
  end;
end;

procedure TWindowJT65HFForm.dbgJT65HFGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin

  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['JT65HF_COLOR'] = 'R') then
    AFont.Color := 3947775
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['JT65HF_COLOR'] = 'B') then
    AFont.Color := 16747546
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['JT65HF_COLOR'] = 'M') then
    AFont.Color := 40704;

  if (Column.FieldName = 'JT65HF_ACTION') and (Copy(cdsCSV.FieldByName('JT65HF_ACTION').AsString, 1, 2) = 'CQ') then
  begin
    Background := 15007667;
    AFont.Color := 0;
  end;

  if (Column.FieldName = 'JT65HF_ACTION') and (Copy(cdsCSV.FieldByName('JT65HF_ACTION').AsString, 1, 6) = 'ANSWER') then
  begin
    Background := clRed;
    AFont.Color := 0;
  end;

end;

procedure TWindowJT65HFForm.DirWatcher11Change(Sender: TObject);
begin
  Sleep(500);
  ReloadCSV;
end;

procedure TWindowJT65HFForm.FormCreate(Sender: TObject);
begin
// FNextViewerHandle := SetClipboardViewer(Handle);
end;

procedure TWindowJT65HFForm.FormDestroy(Sender: TObject);
begin
// ChangeClipboardChain(Handle, FNextViewerHandle);
end;

procedure TWindowJT65HFForm.Init;
begin
  qryDXCC := TKaDaoTable.Create(nil);
  qryDXCC.Database := lDatabase;
  { DirWatcher.DirToWatch := IncludeTrailingPathDelimiter(WindowJT65HFSettingsFrame.WindowJT65HF_deCsvFiles.Directory);
    DirWatcher.Active:=True; }
  // JvChangeNotify1.Active:=True;
  OptionChanged;
end;


procedure TWindowJT65HFForm.ChangeNotifyNotifications0Change(Sender: TObject);
begin
  // ReloadCSV;
end;

procedure TWindowJT65HFForm.Deinit;
begin
  // DirWatcher.Active := false;
   ATFileNotification1.Stop;
  // JvChangeNotify1.Active:=False;

  // sleep(100);

  // ChangeNotify.Active:=False;
  qryDXCC.Close;
  FreeAndNil(qryDXCC);
end;

procedure TWindowJT65HFForm.aJT65HFEnableTXExecute(Sender: TObject);
begin
  SetCommand(cmdClickTXEnable, '');
  bEnableTX.Down := true;
end;

procedure TWindowJT65HFForm.aJT65HFHaltTXExecute(Sender: TObject);
begin
  timSave.Enabled:=False;
  SetCommand(cmdClickTXHalt, '');
  bHaltTX.Down := true;
  // SetCommand(cmdCheckMiltiDecod, '', true);
  iCurrentStatus := csIdle;
end;

procedure TWindowJT65HFForm.aJT65HFRefreshExecute(Sender: TObject);
begin
  ReloadCSV;
end;

procedure TWindowJT65HFForm.ATFileNotification1Changed(Sender: TObject);
begin
  ReloadCSV;
end;

procedure TWindowJT65HFForm.BuildQuery;
var
  qryStations: TKaDaoTable;
  i: Integer;
  sSQL: string;
  sWhere: string;
begin
  if WindowJT65HFSettingsFrame.WindowJT65HF_cbNewOneOnlyJT65HF.Checked then
    sWhere := ' WHERE LOG_MODE=' + #39 + 'JT65' + #39;
  if bCheckNewOneForAllBook then
  begin
    qryStations := TKaDaoTable.Create(nil);
    i := 0;
    try
      qryStations.Database := lDatabase;
      qryStations.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE IS_GROUP=0';
      qryStations.Open;
      while not qryStations.Eof do
      begin
        if i = 0 then
          sSQL := ' SELECT  LOG_MODE,LOG_BAND_MHZ, LOG_DXCC FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').asInteger) + sWhere
        else
          sSQL := sSQL + ' UNION ALL SELECT  LOG_MODE,LOG_BAND_MHZ, LOG_DXCC FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').asInteger)
            + sWhere;
        Inc(i);
        qryStations.Next;
      end;
      DXCCSQL := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM (' + sSQL + ') WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';
    finally
      qryStations.Free;
    end;
  end
  else if WindowJT65HFSettingsFrame.WindowJT65HF_cbNewOneOnlyJT65HF.Checked then
    DXCCSQL := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_DXCC=:LOG_DXCC AND LOG_MODE=' + #39 + 'JT65' + #39 +
      ' GROUP BY LOG_MODE,LOG_BAND_MHZ'
  else
    DXCCSQL := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ'

end;

procedure TWindowJT65HFForm.OptionChanged;
begin
  BuildQuery;
  ATFileNotification1.Stop;
  ATFileNotification1.FileName := IncludeTrailingPathDelimiter(WindowJT65HFSettingsFrame.WindowJT65HF_deCsvFiles.Directory) + 'JT65hf-log.csv';
  ATFileNotification1.Start;

  { JvChangeNotify1.Active:=False;
    JvChangeNotify1.Notifications[0].Directory:=IncludeTrailingPathDelimiter(WindowJT65HFSettingsFrame.WindowJT65HF_deCsvFiles.Directory);
    JvChangeNotify1.Active:=True;; }
end;

procedure TWindowJT65HFForm.StationChanged(lParam: variant);
begin
  StationId := lParam;
  BuildQuery;
end;

procedure TWindowJT65HFForm.SaveGrid;
var
  s: string;
  i: Integer;
begin
  with dbgJT65HF.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      s := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker), Integer(Items[i].Visible),
        Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos, Items[i].InRowLineHeight]);
      if s <> '' then
      begin
        if ((s[1] = '"') and (s[Length(s)] = '"')) or ((s[1] = '''') and (s[Length(s)] = '''')) then
          s := '"' + s + '"';
      end;
      FormStorage.WriteString('dbgJT65HF.' + Items[i].FieldName, s);
    end;
  end;
  FormStorage.WriteString('dbgJT65HF.FontName', dbgJT65HF.Font.Name);
  FormStorage.WriteInteger('dbgJT65HF.FontColor', dbgJT65HF.Font.Color);
  FormStorage.WriteInteger('dbgJT65HF.FontSize', dbgJT65HF.Font.Size);
  FormStorage.WriteInteger('dbgJT65HF.FontStyle', FontStyleToInt(dbgJT65HF.Font.Style));
  FormStorage.WriteInteger('dbgJT65HF.BackgroundColor', dbgJT65HF.Color);
  FormStorage.WriteBoolean('dbgJT65HF.UseCustomColorFont', dbgJT65HF.DrawGraphicData);
end;

procedure TWindowJT65HFForm.SetTextTXGenegater(Str: string);
begin
  iControlCount := 0;
  CurrentGlobalBreak := false;
  Enumchildwindows(JTHWND, @EnumChildWindowsProc, 0);
end;

procedure TWindowJT65HFForm.SetCommand(Command: Integer; Str: string; CheckBox: boolean = false; bReturnFocus: boolean = true);
begin
  iControlCount := 0;
  CurrentGlobalBreak := false;
  CurrentCommand := Command;
  CurrentText := Str;
  CurrentCheckBox := CheckBox;

  if JTHWND=0 then
    EnumWindows(@EnumWindowsProcHandle, longint(Self));

  Enumchildwindows(JTHWND, @EnumChildWindowsProc, 0);

  if bReturnFocus then
  begin
    SetForegroundWindow(Application.Handle);
    SendMessage(Parent.Parent.Handle, WM_ACTIVATE, 1, 0);
    SendMessage(Parent.Parent.Handle, WM_ENABLE, 1, 0);
    SendMessage(Parent.Parent.Handle, WM_SETFOCUS, 1, 0);
    SetForegroundWindow(Parent.Parent.Handle);
  end;
end;

function TWindowJT65HFForm.NormalizeReport(Report:string):string;
begin
  if Report<>'' then
   if Report[1]='-' then
     if Length(Report)=2 then
       result:='-0'+Report[2]
     else
       result:=Report
    else
     if Length(Report)=1 then
       result:='0'+Report[1]
     else
       result:=Report;
end;


procedure TWindowJT65HFForm.RunJT;
var
  si: STARTUPINFO;
  pi: PROCESS_INFORMATION;
  buf: array [1 .. 100] of Char;
begin
  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  CreateProcess(nil, PWideChar(Trim(WindowJT65HFSettingsFrame.WindowJT65HF_feExeFile.FileName)), nil, nil, false, 0, nil, nil, si, pi);
  JTHWND := 0;
  While JTHWND = 0 do
  begin
    EnumWindows(@EnumWindowsProcHandle, longint(Self));
    Application.ProcessMessages;
  end;
end;

procedure TWindowJT65HFForm.NewQSO;
begin
  iCurrentStatus := cmdNone;
  iControlCount := 0;
  aJT65HFHaltTX.OnExecute(Self);
end;

procedure TWindowJT65HFForm.SaveQSO;
begin
  if bEnableTX.Down then
  begin
    aJT65HFHaltTX.OnExecute(Self);
  end;
end;

function GetStringFromClipboard: WideString;
var
 Data: THandle;
begin
 if not IsClipboardFormatAvailable(CF_UNICODETEXT) then
   Result := Clipboard.AsText
 else
 begin
   Clipboard.Open;
   Data := GetClipboardData(CF_UNICODETEXT);
   try
     if Data <> 0 then
       Result := PWideChar(GlobalLock(Data))
     else
       Result := '';
   finally
     if Data <> 0 then
       GlobalUnlock(Data);
     Clipboard.Close;
   end;
 end;
end;

procedure TWindowJT65HFForm.ClipboardChange;
var
 Str:string;
 lParam, wParam :variant;

begin
  if WindowJT65HFSettingsFrame.WindowJT65HF_cbCaptureClipboard.Checked and Loaded and (iCurrentStatus = csIdle) then
   begin
    Str:=GetStringFromClipboard;
    Delete(Str,1,30);
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := Trim(Copy(Str,1,Pos(' ',Str)));
    lParam := 0;
    wParam := 0;
    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
   end;
end;


end.
