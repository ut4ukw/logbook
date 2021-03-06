unit uWindowGoogleMapForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, OleCtrls,
  ComCtrls, ToolWin, ExtCtrls, Dialogs, uUtils, ImgList, ActnList, uPluginHeaders, DB, KDaoTable, ActiveX,
  Jpeg, JvDialogs, EwbCore, EmbeddedWB, IdMultipartFormData, shdocvw, uEditMapDescription,
  ClipBrd, SHDocVw_EWB, JvComponentBase, JvFormPlacement;

type
  TWindowGoogleMapForm = class(TWindowPluginForm)
    pnlMainToolBar: TPanel;
    tbLogMain: TToolBar;
    tbFilter: TToolButton;
    ToolButton1: TToolButton;
    Panel10: TPanel;
    BrowserMap1: TEmbeddedWB;
    alGoogleMap: TActionList;
    aGoogleMapShowMap: TAction;
    ilGoogleMap: TImageList;
    qryMap: TKADaoTable;
    aGoogleMapClear: TAction;
    aGoogleMapSave: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GoogleMapSaveDialog: TSaveDialog;
    ToolButton4: TToolButton;
    aGoogleMapSentToWeb: TAction;
    WindowGoogleMap_EditMapDescriptionText: TLabel;
    WindowGoogleMap_EditMapDescriptionDate: TLabel;
    WindowGoogleMap_EditMapCopyClipboard: TLabel;
    WindowGoogleMap_EditMapbtnOk: TLabel;
    WindowGoogleMap_EditMapbtnCancel: TLabel;
    FormStorageOnExit: TJvFormStorage;
    BrowserMap: TEmbeddedWB;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure BrowserMap1DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure tbFilterClick(Sender: TObject);
    procedure aGoogleMapShowMapExecute(Sender: TObject);
    procedure aGoogleMapClearExecute(Sender: TObject);
    procedure aGoogleMapSaveExecute(Sender: TObject);
    procedure WebBrowserScreenShot(const wb: TEmbeddedWB; const fileName: TFileName);
    procedure ToolButton4Click(Sender: TObject);
    procedure aGoogleMapSentToWebExecute(Sender: TObject);
    procedure UploadFilesHttpPost(const wb: TEmbeddedWB; const URLstring: string; names, values, nFiles, vFiles: array of string);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    DocumentLoaded: boolean;
    MyLat: real;
    MyLon: real;
  public
    bInfoSet: boolean;
    procedure CallInfo;
    procedure CancelQSO;
  end;

var
  WindowGoogleMapForm: TWindowGoogleMapForm;

implementation

uses uWindowGoogleMap;
{$R *.dfm}

procedure TWindowGoogleMapForm.FormShow(Sender: TObject);
begin
  BrowserMap.Navigate(ConvertToURL(ExtractFilePath(GetDllFileName) + 'gmap.html'));
//  EmbeddedWB1.Navigate(ConvertToURL(ExtractFilePath(GetDllFileName) + 'gmap1.html'));
end;

procedure TWindowGoogleMapForm.tbFilterClick(Sender: TObject);
begin
  BrowserMap.Refresh;
end;

procedure TWindowGoogleMapForm.ToolButton4Click(Sender: TObject);
begin
  BrowserMap.ExecScript('turnDaylight(''sss'');', 'JavaScript');
end;

procedure TWindowGoogleMapForm.ToolButton5Click(Sender: TObject);
begin
  DocumentLoaded := true;
  if MyLat = 0 then
    MyLat := ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').asFloat;
  if MyLon = 0 then
    MyLon := ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').asFloat;
  BrowserMap.ExecScript('initialize(' + StringReplace(FloatToStr(MyLat), ',', '.', []) + ',' + StringReplace(FloatToStr(MyLon), ',', '.', []) + ')', 'JavaScript');

end;

procedure TWindowGoogleMapForm.ToolButton6Click(Sender: TObject);
begin
 BrowserMap.Refresh;
end;

procedure TWindowGoogleMapForm.aGoogleMapClearExecute(Sender: TObject);
begin
  CancelQSO;
end;

procedure TWindowGoogleMapForm.aGoogleMapShowMapExecute(Sender: TObject);
var
  lParam, wParam: variant;
  i, HighBound: integer;
  Bookmark: TBookMark;
begin
  Screen.Cursor := crHourGlass;
  try
    CancelQSO;
    lDllCommand(DC_GET_SELECTED_RECORDS, Self, lParam, wParam);
    if wParam = 1 then
    begin
      ldsLog.DataSet.DisableControls;
      Bookmark := ldsLog.DataSet.GetBookmark;
      try
        ldsLog.DataSet.First;
        while not ldsLog.DataSet.Eof do
        begin
          qryMap.Close;
          qryMap.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_ID=:LOG_ID';
          qryMap.Params.ParamByName('LOG_ID').AsInteger := ldsLog.DataSet.FieldByName('LOG_ID').AsInteger;
          qryMap.Open;
          BrowserMap.ExecScript('addMarkerMap(' + StringReplace(FloatToStr(qryMap.FieldByName('LOG_LAT').asFloat), ',', '.', []) + ',' + StringReplace(FloatToStr(qryMap.FieldByName('LOG_LON').asFloat), ',', '.',
              []) + ',' + QuotedStr('red') + ',' + QuotedStr(qryMap.FieldByName('LOG_CALL').asString) + ')', 'JavaScript');
          ldsLog.DataSet.Next;
        end;
      finally
        if ldsLog.DataSet.BookmarkValid(Bookmark) then
          ldsLog.DataSet.GotoBookmark(Bookmark);
        ldsLog.DataSet.FreeBookmark(Bookmark);
        ldsLog.DataSet.EnableControls;
      end;
    end
    else
    begin
      i := VarArrayLowBound(lParam, 1);
      HighBound := VarArrayHighBound(lParam, 1);
      while i <= HighBound do
      begin
        qryMap.Close;
        qryMap.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_ID=:LOG_ID';
        qryMap.Params.ParamByName('LOG_ID').AsInteger := lParam[i];
        qryMap.Open;
        BrowserMap.ExecScript('addMarkerMap(' + StringReplace(FloatToStr(qryMap.FieldByName('LOG_LAT').asFloat), ',', '.', []) + ',' + StringReplace(FloatToStr(qryMap.FieldByName('LOG_LON').asFloat), ',', '.',
            []) + ',' + QuotedStr('red') + ',' + QuotedStr(qryMap.FieldByName('LOG_CALL').asString) + ')', 'JavaScript');
        Inc(i);
      end;
    end;
    BrowserMap.ExecScript('drawDistance(1)', 'JavaScript');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TWindowGoogleMapForm.WebBrowserScreenShot(const wb: TEmbeddedWB; const fileName: TFileName);
var
  viewObject: IViewObject;
  r: TRect;
  bitmap: TBitmap;
begin
  if wb.Document <> nil then
  begin
    wb.Document.QueryInterface(IViewObject, viewObject);
    if Assigned(viewObject) then
      try
        bitmap := TBitmap.Create;
        try

          r := Rect(0, 0, wb.Width, wb.Height);

          bitmap.Height := wb.Height - GetSystemMetrics(SM_CYHSCROLL);
          bitmap.Width := wb.Width - GetSystemMetrics(SM_CXVSCROLL);

          viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, bitmap.Canvas.Handle, @r, nil, nil, 0);

          with TJPEGImage.Create do
            try
              Assign(bitmap);
              SaveToFile(fileName);
            finally
              Free;
            end;
        finally
          bitmap.Free;
        end;
      finally
        viewObject._Release;
      end;
  end;
end;

procedure TWindowGoogleMapForm.aGoogleMapSaveExecute(Sender: TObject);
begin
  GoogleMapSaveDialog.DefaultExt := 'jpg';
  if GoogleMapSaveDialog.Execute(Self.Handle) then
  begin
    WebBrowserScreenShot(BrowserMap, GoogleMapSaveDialog.fileName);
  end;
end;

procedure TWindowGoogleMapForm.aGoogleMapSentToWebExecute(Sender: TObject);
var
  tmpWB: TEmbeddedWB;
  EditMapDescription: TEditMapDescription;
  i, HighBound: integer;
  slXML: TStringList;
  sMyCall: string;
  lParam, wParam: variant;
  sFileName: string;
  Bookmark: TBookMark;
begin
  EditMapDescription := TEditMapDescription.Create(Self);
  EditMapDescription.Caption := aGoogleMapSentToWeb.Caption;

  EditMapDescription.leMapDescription.EditLabel.Caption := WindowGoogleMap_EditMapDescriptionText.Caption;
  EditMapDescription.lbDate.Caption := WindowGoogleMap_EditMapDescriptionDate.Caption;
  EditMapDescription.cbCopyToClipboard.Caption := WindowGoogleMap_EditMapCopyClipboard.Caption;
  EditMapDescription.btnOk.Caption := WindowGoogleMap_EditMapbtnOk.Caption;
  EditMapDescription.btnCancel.Caption := WindowGoogleMap_EditMapbtnCancel.Caption;

  if EditMapDescription.ShowModal = mrOk then
  begin
    CancelQSO;

    Screen.Cursor := crHourGlass;
    slXML := TStringList.Create;
    slXML.Add('<markers>');
    try
      lDllCommand(DC_GET_SELECTED_RECORDS, Self, lParam, wParam);
      if wParam = 1 then
      begin
        ldsLog.DataSet.DisableControls;
        Bookmark := ldsLog.DataSet.GetBookmark;
        try
          ldsLog.DataSet.First;
          slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_MY_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_OPERATOR').asString + '" comment="' + EditMapDescription.leMapDescription.Text + '" date="' + DateToStr
                (EditMapDescription.dtpDate.Date) + '" />');
          sMyCall := qryMap.FieldByName('LOG_OPERATOR').asString;
          slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_CALL').asString + '"/>');
          while not ldsLog.DataSet.Eof do
          begin

            qryMap.Close;
            qryMap.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_ID=:LOG_ID';
            qryMap.Params.ParamByName('LOG_ID').AsInteger := ldsLog.DataSet.FieldByName('LOG_ID').AsInteger;
            qryMap.Open;
            if i = 0 then
            begin
              slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_MY_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_OPERATOR').asString + '" comment="' + EditMapDescription.leMapDescription.Text + '" date="' + DateToStr
                  (EditMapDescription.dtpDate.Date) + '" />');
              sMyCall := qryMap.FieldByName('LOG_OPERATOR').asString;
              slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_CALL').asString + '"/>');
            end
            else
              slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_CALL').asString + '"/>');
            ldsLog.DataSet.Next;
          end;
        finally
          if ldsLog.DataSet.BookmarkValid(Bookmark) then
            ldsLog.DataSet.GotoBookmark(Bookmark);
          ldsLog.DataSet.FreeBookmark(Bookmark);
          ldsLog.DataSet.EnableControls;
        end;

      end
      else

      begin
        i := VarArrayLowBound(lParam, 1);
        HighBound := VarArrayHighBound(lParam, 1);
        while i <= HighBound do
        begin
          qryMap.Close;
          qryMap.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_ID=:LOG_ID';
          qryMap.Params.ParamByName('LOG_ID').AsInteger := lParam[i];
          qryMap.Open;
          if i = 0 then
          begin
            slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_MY_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_OPERATOR').asString + '" comment="' + EditMapDescription.leMapDescription.Text + '" date="' + DateToStr
                (EditMapDescription.dtpDate.Date) + '" />');
            sMyCall := qryMap.FieldByName('LOG_OPERATOR').asString;
            slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_CALL').asString + '"/>');
          end
          else
            slXML.Add('<marker loc="' + qryMap.FieldByName('LOG_GRIDSQUARE').asString + '" call="' + qryMap.FieldByName('LOG_CALL').asString + '"/>');

          { BrowserMap.ExecScript('addMarkerMap(' + StringReplace
            (FloatToStr(qryMap.FieldByName('LOG_LAT').asFloat), ',',
            '.', []) + ',' + StringReplace(FloatToStr(qryMap.FieldByName
            ('LOG_LON').asFloat), ',', '.', []) + ','+QuotedStr('red')+ ',' +QuotedStr(qryMap.FieldByName('LOG_CALL').asString)+')',
            'JavaScript'); }
          Inc(i);
        end;
        // BrowserMap.ExecScript('drawDistance(1)','JavaScript');
      end;

      slXML.Add('</markers>');
      sFileName := ExtractFilePath(Application.ExeName) + 'Data\Temp\' + StringReplace(sMyCall, '/', '!', [rfReplaceAll]) + '_' + FormatDateTime('yyyymmdd', EditMapDescription.dtpDate.Date) + '.xml';
      slXML.SaveToFile(sFileName, TEncoding.UTF8);
    finally
      slXML.Free;
    end;
    tmpWB := TEmbeddedWB.Create(nil);
    try
      tmpWB.Visible := False;
      UploadFilesHttpPost(tmpWB, 'http://www.ut4ukw.com/myqsomap/upload.php', [], [], ['userfile'], [sFileName]);
      if EditMapDescription.cbCopyToClipboard.Checked then
        Clipboard.AsText := 'http://www.ut4ukw.com/myqsomap/map.html?map=' + StringReplace(sMyCall, '/', '!', [rfReplaceAll]) + '_' + FormatDateTime('yyyymmdd', EditMapDescription.dtpDate.Date);
      ShellExecute(Self.WindowHandle, 'open', PWideChar('http://www.ut4ukw.com/myqsomap/map.html?map=' + StringReplace(sMyCall, '/', '!', [rfReplaceAll]) + '_' + FormatDateTime('yyyymmdd', EditMapDescription.dtpDate.Date)), nil, nil, SW_SHOWNORMAL);
    finally
      tmpWB.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  EditMapDescription.Free;
end;

procedure TWindowGoogleMapForm.BrowserMap1DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
begin
  DocumentLoaded := true;
  if MyLat = 0 then
    MyLat := ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').asFloat;
  if MyLon = 0 then
    MyLon := ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').asFloat;
  BrowserMap.ExecScript('initialize(' + StringReplace(FloatToStr(MyLat), ',', '.', []) + ',' + StringReplace(FloatToStr(MyLon), ',', '.', []) + ')', 'JavaScript');
end;

procedure TWindowGoogleMapForm.CallInfo;
var
  Call: string;
begin
  if not BrowserMap.DocumentLoaded then
    exit;
  Call := ldsLogEdit.DataSet.FieldByName('LOG_CALL').asString;
  if Trim(Call) <> '' then
  begin
    if bInfoSet then
      CancelQSO;

    CancelQSO;
    BrowserMap.ExecScript('setMarker(' + StringReplace(FloatToStr(ldsLogEdit.DataSet.FieldByName('LOG_LAT').asFloat), ',', '.', []) + ',' + StringReplace(FloatToStr(ldsLogEdit.DataSet.FieldByName('LOG_LON').asFloat), ',', '.',
        []) + ',' + QuotedStr('red') + ')', 'JavaScript');
    bInfoSet := true;
    exit;
  end;
end;

procedure TWindowGoogleMapForm.CancelQSO;
begin
  MyLat := ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').asFloat;
  MyLon := ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').asFloat;
  if DocumentLoaded then
  begin
    BrowserMap.ExecScript('clear()', 'JavaScript');
    BrowserMap.ExecScript('setMarkerHome(' + StringReplace(FloatToStr(MyLat), ',', '.', []) + ',' + StringReplace(FloatToStr(MyLon), ',', '.', []) + ')', 'JavaScript');
  end;
  bInfoSet := False;
end;

(*
  procedure TWindowGoogleMapForm.UploadFilesHttpPost(const wb:TEmbeddedWB; const URLstring: string; names, values, nFiles, vFiles: array of string);
  var
  n, v, boundary, ext: string;
  URL: OleVariant;
  Flags: OleVariant;
  PostData: OleVariant;
  Headers: OleVariant;
  lEmptyParam: OleVariant;
  idx: Integer;

  ms: TMemoryStream;
  msData: TMemoryStream;


  function MemoryStreamToOleVariant(const Strm: TMemoryStream): OleVariant;
  var
  Data: PByteArray;
  begin
  Result := VarArrayCreate ([0, Strm.Size - 1], varByte);
  Data := VarArrayLock(Result);
  try
  Strm.Position := 0;
  Strm.ReadBuffer(Data^, Strm.Size);
  finally
  VarArrayUnlock(Result);
  end;
  end;

  procedure WriteAnsiStringToData(const S: AnsiString);
  begin
  msData.WriteBuffer(S[1], Length(S));
  end;

  begin
  if Length(names) <> Length(values) then
  raise Exception.Create('UploadFilesHttpPost: Names and Values must have the same length.') ;
  if Length(nFiles) <> Length(vFiles) then
  raise Exception.Create('UploadFilesHttpPost: FileNames and FileValues must have the same length.') ;

  URL := 'about:blank';
  Flags := NavNoHistory or NavNoReadFromCache or NavNoWriteToCache or
  NavAllowAutosearch;
  wb.Navigate2(URL, Flags) ;
  while wb.ReadyState < READYSTATE_INTERACTIVE do
  Application.ProcessMessages;

  // anything random that WILL NOT occur in the data.
  boundary := '---------------------------123456789';

  msData := TMemoryStream.Create;
  try
  for idx := Low(names) to High(names) do
  begin
  n := names[idx];
  v := values[idx];
  WriteAnsiStringToData('--' + boundary + #13#10 + 'Content-Disposition: form-data;' + #13#10#9 + 'name="' + n + '"' + #13#10#13#10 + v + #13#10);
  end;

  for idx := Low(nFiles) to High(nFiles) do
  begin
  n := nFiles[idx];
  v := vFiles[idx];

  WriteAnsiStringToData('--' + boundary + #13#10 + 'Content-Disposition: form-data;' + #13#10#9 + 'name="' + n + '";' + #13#10#9 + 'filename="' + ExtractFileName(v) + '"');

  ext := ExtractFileExt(v);
  if AnsiSameText(ext, '.JPG') or AnsiSameText(ext, '.JPEG') then
  begin
  WriteAnsiStringToData('Content-Type: image/pjpeg'#13#10);
  end
  else if AnsiSameText(ext, '.PNG') then
  begin
  WriteAnsiStringToData('Content-Type: image/x-png'#13#10);
  end
  else if AnsiSameText(ext, '.PDF') then
  begin
  WriteAnsiStringToData('Content-Type: application/pdf'#13#10);
  end
  else if AnsiSameText(ext, '.HTML') then
  begin
  WriteAnsiStringToData('Content-Type: text/html'#13#10);
  end
  else
  begin
  WriteAnsiStringToData('Content-Type: text/html; charset=UTF-8'#13#10#13#10);
  //        WriteAnsiStringToData('Content-Type: application/octet-stream'#13#10);
  end;
  //Content-Type: text/html; charset=UTF-8'#13#10#13#10
  WriteAnsiStringToData('Content-Transfer-Encoding: binary'#13#10#13#10);


  if v <> '' then
  begin
  ms := TMemoryStream.Create;
  try
  ms.LoadFromFile(v);
  msData.CopyFrom(ms, 0);
  finally
  ms.Free;
  end;
  end;

  WriteAnsiStringToData(#13#10);
  end;

  WriteAnsiStringToData('--' + boundary + '--'#13#10);

  //PostData := VarArrayCreate([0, msData.Size - 1], varWord);
  //    Move(msData.Memory^, PostData[0], msData.Size);
  PostData:=MemoryStreamToOleVariant(msData);

  {   for idx := 1 to Length(strData) do
  PostData[idx-1] := Ord(strData[idx]) ;}

  //    Move(msData.Memory^, PostData, msData.Size);
  finally
  msData.Free;
  end;

  Headers := 'Content-Type: multipart/form-data;' + #13#10#9 + 'boundary=' + boundary + #13#10;

  URL := URLstring;
  wb.DefaultInterface.Navigate2(URL, Flags, lEmptyParam, PostData, Headers) ;
  while wb.ReadyState < READYSTATE_INTERACTIVE do
  Application.ProcessMessages;
  end;

*)

procedure TWindowGoogleMapForm.UploadFilesHttpPost(const wb: TEmbeddedWB; const URLstring: string; names, values, nFiles, vFiles: array of string);
var
  strData: ansistring;
  n, v, boundary: string;
  URL: OleVariant;
  Flags: OleVariant;
  PostData: OleVariant;
  Headers: OleVariant;
  lEmptyParam: OleVariant;
  idx: integer;

  ms: TMemoryStream;
  ss: TStringStream;

  function MemoryStreamToOleVariant(const Strm: TMemoryStream): OleVariant;
  var
    Data: PByteArray;
  begin
    Result := VarArrayCreate([0, Strm.Size - 1], varByte);
    Data := VarArrayLock(Result);
    try
      Strm.Position := 0;
      Strm.ReadBuffer(Data^, Strm.Size);
    finally
      VarArrayUnlock(Result);
    end;
  end;

begin
  if Length(names) <> Length(values) then
    raise Exception.Create('UploadFilesHttpPost: Names and Values must have the same length.');
  if Length(nFiles) <> Length(vFiles) then
    raise Exception.Create('UploadFilesHttpPost: FileNames and FileValues must have the same length.');

  URL := 'about:blank';
  Flags := NavNoHistory or NavNoReadFromCache or NavNoWriteToCache or NavAllowAutosearch;
  wb.Navigate2(URL, Flags);
  while wb.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  // anything random that WILL NOT occur in the data.
  boundary := '---------------------------123456789';

  strData := '';
  for idx := Low(names) to High(names) do
  begin
    n := names[idx];
    v := values[idx];

    strData := strData + '--' + boundary + #13#10 + 'Content-Disposition: form-data; name="' + n + '"' + #13#10#13#10 + v + #13#10;
  end;

  for idx := Low(nFiles) to High(nFiles) do
  begin
    n := nFiles[idx];
    v := vFiles[idx];

    strData := strData + '--' + boundary + #13#10 + 'Content-Disposition: form-data; name="' + n + '"; filename="' + v + '"' + #13#10;

    if v = '' then
    begin
      strData := strData + 'Content-Transfer-Encoding: binary' + '#13#10#13#10';
    end
    else
    begin
      if (CompareText(ExtractFileExt(v), '.JPG') = 0) or (CompareText(ExtractFileExt(v), '.JPEG') = 0) then
      begin
        strData := strData + 'Content-Type: image/pjpeg'#13#10#13#10;
      end
      else if (CompareText(ExtractFileExt(v), '.PNG') = 0) then
      begin
        strData := strData + 'Content-Type: image/x-png'#13#10#13#10;
      end
      else if (CompareText(ExtractFileExt(v), '.PDF') = 0) then
      begin
        strData := strData + 'Content-Type: application/pdf'#13#10#13#10;
      end
      else if (CompareText(ExtractFileExt(v), '.HTML') = 0) then
      begin
      end;

      strData := strData + 'Content-Type: text/html; charset=UTF-8'#13#10#13#10;

      ms := TMemoryStream.Create;
      try
        ms.LoadFromFile(v);
        ss := TStringStream.Create('');
        try
          ss.CopyFrom(ms, ms.Size);

          strData := strData + ss.DataString + #13#10;
        finally
          ss.Free;
        end;
      finally
        ms.Free;
      end;
    end;

    strData := strData + '--' + boundary + '--'#13#10; // FOOTER
  end;

  strData := strData + #0;

  { 2. you must convert a string into variant array of bytes and every character from string is a value in array }

  PostData := VarArrayCreate([0, Length(strData) - 1], varByte);

  { copy the ordinal value of the character into the PostData array }
  for idx := 1 to Length(strData) do
    PostData[idx - 1] := Ord(strData[idx]);
  // PostData:=MemoryStreamToOleVariant(msData);

  { 3. prepare headers which will be sent to remote web-server }
  Headers := 'Content-Type: multipart/form-data; boundary=' + boundary + #13#10;

  { 4. you must navigate to the URL with your script and send as parameters your array with POST-data and headers }
  URL := URLstring;
  wb.DefaultInterface.Navigate2(URL, Flags, lEmptyParam, PostData, Headers);
  while wb.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;
end;

end.
