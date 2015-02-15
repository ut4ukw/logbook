unit uImportFromADIFDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvMemo, ComCtrls, JvExComCtrls,
  JvProgressBar, WinInet,
  DateUtils, Db, jvDbGrid, Mask, JvExMask, JvToolEdit,
  dblookup, DBCtrls, JvWizard, JvExControls,
  JvWizardRouteMapNodes, JvSpecialProgress, ShellApi, PrefLst,
  uUtils, uPluginHeaders, pngimage, ExtCtrls, DAO_TLB, ComObj,
  KDaoTable, DAOApi, rkVistaProBar, StrUtils, DBGridEhGrouping, GridsEh, DBGridEh,
  JvMemoryDataset, ToolWin, JvCombobox, ImgList, uEditImportRule, JvCsvData;

type
  TImportFromADIFDialog = class(TForm)
    Wizard: TJvWizard;
    wipWelcome: TJvWizardWelcomePage;
    wipImportCheck: TJvWizardInteriorPage;
    feFile: TJvFilenameEdit;
    lbStation: TLabel;
    lbFile: TLabel;
    wizRouteMap: TJvWizardRouteMapNodes;
    dbcStations: TDBLookupComboBox;
    dsStations: TDataSource;
    wipImport: TJvWizardInteriorPage;
    feFileCheck: TJvFilenameEdit;
    lbStationCheck: TLabel;
    lbFileCheck: TLabel;
    dbcStationsCheck: TDBLookupComboBox;
    lbProgress: TLabel;
    cbCheckSendQSL: TCheckBox;
    cbCheckSendQSLCheck: TCheckBox;
    cbRedefineCountryCheck: TCheckBox;
    cbRedefineCountry: TCheckBox;
    Image2: TImage;
    qryStations: TKADaoTable;
    qryBands: TKADaoTable;
    pgImport: TVistaProBar;
    lbFoundErrors: TLabel;
    lbOpendLog: TLabel;
    qryLogImport: TKADaoTable;
    qryTerritory: TKADaoTable;
    qryLogImportLOG_ID: TAutoIncField;
    qryLogImportLOG_GRIDSQUARE: TStringField;
    qryLogImportLOG_QTH: TStringField;
    qryLogImportLOG_OPERATOR: TStringField;
    qryLogImportLOG_CALL: TStringField;
    qryLogImportLOG_FREQ: TFloatField;
    qryLogImportLOG_QSO_DATE: TDateTimeField;
    qryLogImportLOG_RST_RCVD: TStringField;
    qryLogImportLOG_RST_SENT: TStringField;
    qryLogImportLOG_LAT: TFloatField;
    qryLogImportLOG_LON: TFloatField;
    qryLogImportLOG_COMMENT: TStringField;
    qryLogImportLOG_QSLSDATE: TDateTimeField;
    qryLogImportLOG_QSLRDATE: TDateTimeField;
    qryLogImportLOG_ADDRESS: TMemoField;
    qryLogImportLOG_AGE: TSmallintField;
    qryLogImportLOG_ARRL_SECT: TStringField;
    qryLogImportLOG_CNTY: TStringField;
    qryLogImportLOG_CONTEST_ID: TStringField;
    qryLogImportLOG_CQZ: TSmallintField;
    qryLogImportLOG_DXCC: TSmallintField;
    qryLogImportLOG_IOTA: TStringField;
    qryLogImportLOG_ITUZ: TSmallintField;
    qryLogImportLOG_NAME: TStringField;
    qryLogImportLOG_NOTES: TMemoField;
    qryLogImportLOG_PFX: TStringField;
    qryLogImportLOG_PROP_MODE: TStringField;
    qryLogImportLOG_QSLMSG: TStringField;
    qryLogImportLOG_QSL_RCVD: TStringField;
    qryLogImportLOG_QSL_SENT: TStringField;
    qryLogImportLOG_QSL_VIA: TStringField;
    qryLogImportLOG_RX_PWR: TFloatField;
    qryLogImportLOG_EQSL_QSLRDATE: TDateTimeField;
    qryLogImportLOG_EQSL_QSLSDATE: TDateTimeField;
    qryLogImportLOG_EQSL_QSL_RCVD: TStringField;
    qryLogImportLOG_EQSL_QSL_SENT: TStringField;
    qryLogImportLOG_LOTW_QSLRDATE: TDateTimeField;
    qryLogImportLOG_LOTW_QSLSDATE: TDateTimeField;
    qryLogImportLOG_LOTW_QSL_RCVD: TStringField;
    qryLogImportLOG_LOTW_QSL_SENT: TStringField;
    qryLogImportLOG_CONT: TStringField;
    qryLogImportLOG_MY_NAME: TStringField;
    qryLogImportLOG_MY_POSTAL_CODE: TStringField;
    qryLogImportLOG_MY_COUNTRY: TStringField;
    qryLogImportLOG_BAND: TStringField;
    qryLogImportLOG_MODE: TStringField;
    qryLogImportLOG_COUNTRY: TStringField;
    qryLogImportLOG_CONTINENT: TStringField;
    qryLogImportLOG_MY_CITY: TStringField;
    qryLogImportLOG_MY_STREET: TStringField;
    qryLogImportLOG_MY_GRIDSQUARE: TStringField;
    qryLogImportLOG_MY_LAT: TFloatField;
    qryLogImportLOG_MY_LON: TFloatField;
    qryLogImportLOG_QSL_SENT_VIA: TStringField;
    qryLogImportLOG_QSL_RCVD_VIA: TStringField;
    qryLogImportLOG_BAND_MHZ: TFloatField;
    qryLogImportLOG_DQSL_QSL_SENT: TStringField;
    qryLogImportLOG_DQSL_QSL_RCVD: TStringField;
    qryLogImportLOG_DQSL_QSLRDATE: TDateTimeField;
    qryLogImportLOG_DQSL_QSLSDATE: TDateTimeField;
    qryLogImportLOG_EMAIL: TStringField;
    qryLogImportLOG_A_INDEX: TFloatField;
    qryLogImportLOG_ANT_AZ: TFloatField;
    qryLogImportLOG_ANT_EL: TFloatField;
    qryLogImportLOG_ANT_PATH: TStringField;
    qryLogImportLOG_BAND_RX: TStringField;
    qryLogImportLOG_CHECK: TStringField;
    qryLogImportLOG_CLASS: TStringField;
    qryLogImportLOG_CONTACTED_OP: TStringField;
    qryLogImportLOG_CREDIT_SUBMITTED: TStringField;
    qryLogImportLOG_CREDIT_GRANTED: TStringField;
    qryLogImportLOG_DISTANCE: TFloatField;
    qryLogImportLOG_EQ_CALL: TStringField;
    qryLogImportLOG_FORCE_INIT: TStringField;
    qryLogImportLOG_FREQ_RX: TFloatField;
    qryLogImportLOG_GUEST_OP: TStringField;
    qryLogImportLOG_IOTA_ISLAND_ID: TStringField;
    qryLogImportLOG_K_INDEX: TFloatField;
    qryLogImportLOG_MAX_BURSTS: TFloatField;
    qryLogImportLOG_MS_SHOWER: TStringField;
    qryLogImportLOG_MY_CNTY: TStringField;
    qryLogImportLOG_MY_CQ_ZONE: TSmallintField;
    qryLogImportLOG_MY_IOTA: TStringField;
    qryLogImportLOG_MY_IOTA_ISLAND_ID: TStringField;
    qryLogImportLOG_MY_ITU_ZONE: TSmallintField;
    qryLogImportLOG_MY_RIG: TStringField;
    qryLogImportLOG_MY_SIG: TStringField;
    qryLogImportLOG_MY_SIG_INFO: TStringField;
    qryLogImportLOG_MY_STATE: TStringField;
    qryLogImportLOG_NR_BURSTS: TSmallintField;
    qryLogImportLOG_NR_PINGS: TSmallintField;
    qryLogImportLOG_OWNER_CALLSIGN: TStringField;
    qryLogImportLOG_PRECEDENCE: TStringField;
    qryLogImportLOG_PUBLIC_KEY: TStringField;
    qryLogImportLOG_QSO_COMPLETE: TStringField;
    qryLogImportLOG_QSO_DATE_OFF: TDateTimeField;
    qryLogImportLOG_QSO_RANDOM: TStringField;
    qryLogImportLOG_RIG: TStringField;
    qryLogImportLOG_SAT_MODE: TStringField;
    qryLogImportLOG_SAT_NAME: TStringField;
    qryLogImportLOG_SFI: TFloatField;
    qryLogImportLOG_SIG: TStringField;
    qryLogImportLOG_SIG_INFO: TStringField;
    qryLogImportLOG_SRX: TSmallintField;
    qryLogImportLOG_SRX_STRING: TStringField;
    qryLogImportLOG_STATE: TStringField;
    qryLogImportLOG_STX: TSmallintField;
    qryLogImportLOG_STX_STRING: TStringField;
    qryLogImportLOG_SWL: TStringField;
    qryLogImportLOG_TX_PWR: TFloatField;
    qryLogImportLOG_WEB: TStringField;
    qryLogImportLOG_QSO_TIME: TDateTimeField;
    qryLogImportLOG_QSO_DATETIME: TDateTimeField;
    qryLogImportLOG_CALL_ORIGINAL: TStringField;
    qryLogImportLOG_CUSTOM_STAT1: TStringField;
    qryLogImportLOG_CUSTOM_STAT2: TStringField;
    qryLogImportLOG_CUSTOM_STAT3: TStringField;
    qryLogImportLOG_CUSTOM_STAT4: TStringField;
    wipAdditionParams: TJvWizardInteriorPage;
    dbgAddParams: TDBGridEh;
    cdsAddParams: TJvMemoryData;
    cdsAddParamsFIELD_LOG: TStringField;
    cdsAddParamsFIELD_ADIF: TStringField;
    dsAddParams: TDataSource;
    pnlMainToolbar: TPanel;
    tbLogMain: TToolBar;
    tbFilter: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel10: TPanel;
    WindowLog_EditFilterName: TLabel;
    WindowLog_EditFilterbtnOk: TLabel;
    WindowLog_EditFilterbtnCancel: TLabel;
    cbImportRules: TComboBox;
    ToolButton3: TToolButton;
    ilImportAdif: TImageList;
    cbFieldValues: TCheckBox;
    CsvDataSet: TJvCsvDataSet;
    CsvDataSetFIELD_LOG: TStringField;
    CsvDataSetFIELD_ADIF: TStringField;
    procedure wipWelcomeNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure wipImportCheckBackButtonClick(Sender: TObject; var Stop: Boolean);
    procedure wipImportCheckFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure wipImportPage(Sender: TObject);
    procedure WizardActivePageChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbOpendLogClick(Sender: TObject);
    function LocationToCoordinate(Location: string): real;
    procedure tbFilterClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cbImportRulesChange(Sender: TObject);
  private
    Delimeter: string;
    procedure DoImport;
  public
    DateFrom: TDateTime;
    DialogCaption: String;
    Login: string;
    Password: string;
    DbGrid: TjvDbGrid;
    LoadCard: Boolean;
  end;

var
  gs: string;
  ImportFromADIFDialog: TImportFromADIFDialog;

implementation

uses udmMain, uMainWindow, uOptions;
{$R *.dfm}

function GetTempDir: String;
var
  tempFolder: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

procedure TImportFromADIFDialog.FormShow(Sender: TObject);
var
  slFiles: TStringList;
  i: integer;
  sFileName: string;
begin
  Delimeter := GetDelimeter;

  cbImportRules.Items.Clear;
  cbImportRules.Items.Add('-');
  slFiles := TStringList.Create;
  try
    FindFilesByMask(slFiles, ExtractFilePath(Application.ExeName) + 'Data\ImportRules', '*.*');
    for i := 0 to slFiles.Count - 1 do
    begin
      sFileName := ExtractFileName(slFiles.Strings[i]);
      cbImportRules.Items.Add(sFileName);
    end;
  finally
    slFiles.free;
  end;
  cbImportRules.Sorted := True;
  cbImportRules.ItemIndex := 0;
  dbcStations.KeyValue:=MainWindow.CurrentStationId;

  // feFile.FileName := 'd:\!\ua3h-osnovnoj log.ADI';

end;

procedure TImportFromADIFDialog.lbOpendLogClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'notepad.exe', PWideChar(ExtractFilePath(Application.ExeName) + '\Log\Import_' + ExtractFileName(feFile.FileName) + '.log'), nil, SW_SHOWNORMAL);
end;

function TImportFromADIFDialog.LocationToCoordinate(Location: string): real;
begin
try
  if Trim(Location) <> '' then
  begin
    if Location[1] = 'N' then
//      result := StrToFloat(StringReplace(AnsiReplaceStr(Copy(Location, 2, Length(Location) - 1), ' ', ''), '.', Delimeter, [rfReplaceAll, rfIgnoreCase])) / 100;
      result := StrToFloat(AnsiReplaceStr(Copy(Location, 2, Length(Location) - 1), ' ', '')) / 100;
    if Location[1] = 'E' then
//      result := StrToFloat(StringReplace(AnsiReplaceStr(Copy(Location, 2, Length(Location) - 1), ' ', ''), '.', Delimeter, [rfReplaceAll, rfIgnoreCase])) / 100;
      result := StrToFloat(AnsiReplaceStr(Copy(Location, 2, Length(Location) - 1), ' ', '')) / 100;
  end
  else
    result := 0;
except
    result := 0;
end;
end;

procedure TImportFromADIFDialog.tbFilterClick(Sender: TObject);
begin
  cdsAddParams.Append;
end;

procedure TImportFromADIFDialog.ToolButton1Click(Sender: TObject);
begin
  cdsAddParams.Delete;
end;

procedure TImportFromADIFDialog.ToolButton3Click(Sender: TObject);
var
  EditImportRule: TEditImportRule;
begin
  EditImportRule := TEditImportRule.Create(nil);
  try
    MainWindow.Translator.TranslateWindow('EditImportRule', EditImportRule);
    if EditImportRule.ShowModal = mrOk then
    begin
      if cdsAddParams.State in [dsEdit, dsInsert] then
        cdsAddParams.Post;
      cdsAddParams.DisableControls;
      cdsAddParams.First;
      try
        CsvDataSet.Open;
        CsvDataSet.EmptyTable;
        cdsAddParams.SaveToDataSet(CsvDataSet, cdsAddParams.RecordCount);
        CsvDataSet.SaveToFile(ExtractFilePath(Application.ExeName) + 'Data\ImportRules\' + EditImportRule.leImportRule.Text);
        CsvDataSet.Close;
        if cbImportRules.Items.IndexOf(EditImportRule.leImportRule.Text) = -1 then
        begin
          cbImportRules.Items.Add(EditImportRule.leImportRule.Text);
          cbImportRules.Sorted := True;
        end;
        cbImportRules.ItemIndex := cbImportRules.Items.IndexOf(EditImportRule.leImportRule.Text);
      finally
        cdsAddParams.First;
        cdsAddParams.EnableControls;
      end;
    end;
  finally
    EditImportRule.free;
  end;

end;

procedure TImportFromADIFDialog.wipImportCheckBackButtonClick(Sender: TObject; var Stop: Boolean);
begin
  dbcStations.KeyValue := dbcStationsCheck.KeyValue;
  if not cbFieldValues.Checked then
    Wizard.ActivePage := wipAdditionParams;

end;

procedure TImportFromADIFDialog.wipImportCheckFinishButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Wizard.SelectNextPage;
end;

procedure TImportFromADIFDialog.wipImportPage(Sender: TObject);
begin
  wipImport.EnabledButtons := [];
  DoImport;
  wipImport.EnabledButtons := [bkBack, bkCancel];
end;

procedure TImportFromADIFDialog.wipWelcomeNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  if not FileExists(feFile.FileName) then
  begin
    MessageBox(Application.Handle, PWideChar('File not found - ' + feFile.FileName), 'ERROR', MB_OK or MB_ICONERROR);
    Abort;
  end;
  dbcStationsCheck.KeyValue := dbcStations.KeyValue;
  feFileCheck.FileName := feFile.FileName;
  cbCheckSendQSLCheck.Checked := cbCheckSendQSL.Checked;
  cbCheckSendQSLCheck.Caption := cbCheckSendQSL.Caption;
  lbFileCheck.Caption := lbFile.Caption;
  lbStationCheck.Caption := lbStation.Caption;
  cbRedefineCountryCheck.Caption := cbRedefineCountry.Caption;
  cbRedefineCountryCheck.Checked := cbRedefineCountry.Checked;
  if not cbFieldValues.Checked then
    Wizard.ActivePage := wipAdditionParams;
end;

procedure TImportFromADIFDialog.WizardActivePageChanged(Sender: TObject);
begin
  wipWelcome.WaterMark.Visible := Wizard.ActivePage = wipWelcome;
  wizRouteMap.Visible := not wipWelcome.WaterMark.Visible;
end;

procedure TImportFromADIFDialog.cbImportRulesChange(Sender: TObject);
var
  sLabel1, slabel2: string;
begin

  if cbImportRules.Text <> '-' then
  begin
    sLabel1 := cdsAddParams.Fields[0].DisplayLabel;
    slabel2 := cdsAddParams.Fields[1].DisplayLabel;
    cdsAddParams.Cancel;
    cdsAddParams.DisableControls;
    try
      try
        cdsAddParams.EmptyTable;
        CsvDataSet.Open;
        CsvDataSet.EmptyTable;
        CsvDataSet.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\ImportRules\' + cbImportRules.Text);
        cdsAddParams.LoadFromDataSet(CsvDataSet, CsvDataSet.RecordCount, lmCopy);
        CsvDataSet.Close;
      except

      end;
    finally
      cdsAddParams.EnableControls;
    end;
  end;
  cdsAddParams.Fields[0].DisplayLabel := sLabel1;
  cdsAddParams.Fields[1].DisplayLabel := slabel2;

end;

procedure TImportFromADIFDialog.DoImport;
var
  sFile, sLog, sBad, sTmpFile: TStringList;
  i, j, k, l: integer;
  iPosOpenTag, iPosCloseTag: integer;
  sFileBody: String;
  sQSODate, sQSOTime, sCurTag, sCurValue, sTmpStr: string;
  wSecond: word;
  iImportedRowCount: integer;
  iValueCount: integer;
  sCQZone, sITUZone: string;
  bLineErrorFound: Boolean;
  sFrom, sTo: string;

  function GetRecordCount(Str: string): integer;
  var
    lStr: string;
    i: integer;
  begin
    lStr := Str;
    result := 0;
    i := Pos('<EOR>', lStr);
    while i <> 0 do
    begin
      Inc(result);
      Delete(lStr, 1, i + 4);
      i := Pos('<EOR>', lStr);
    end;
  end;

  procedure PostRecord;
  var
    pData: TCallInfo;
  begin
    sQSODate := '';
    sQSOTime := '';

    // Определение диапазона, если отсутствует
    if qryLogImport.FieldByName('LOG_BAND').IsNull then
      if not qryLogImport.FieldByName('LOG_FREQ').IsNull then
      begin
        qryBands.First;
        while not qryBands.Eof do
        begin
          if (qryLogImport.FieldByName('LOG_FREQ').AsFloat >= qryBands.FieldByName('BAND_LOWER_FREQ').AsFloat) and (qryLogImport.FieldByName('LOG_FREQ').AsFloat <= qryBands.FieldByName('BAND_UPPER_FREQ').AsFloat) then
          begin
            qryLogImport.FieldByName('LOG_BAND').asString := qryBands.FieldByName('BAND_ADIF').asString;
            qryLogImport.FieldByName('LOG_BAND_MHZ').AsFloat := qryBands.FieldByName('BAND_MHZ').AsFloat;
          end;
          qryBands.Next;
        end;
      end;

    if qryLogImport.FieldByName('LOG_BAND_MHZ').IsNull and not qryLogImport.FieldByName('LOG_BAND').IsNull then
    begin
      qryBands.First;
      if qryBands.Locate('BAND_ADIF', qryLogImport.FieldByName('LOG_BAND').asString, []) then
        qryLogImport.FieldByName('LOG_BAND_MHZ').AsFloat := qryBands.FieldByName('BAND_MHZ').AsFloat;
    end;

    if cbFieldValues.Checked then
    begin
      try
        cdsAddParams.First;
        while not cdsAddParams.Eof do
        begin
          sTo := Trim(cdsAddParams.Fields[0].asString);
          sFrom := Trim(cdsAddParams.Fields[1].asString);
          if (sTo <> '') and (sFrom <> '') then
          begin
            sTo := StringReplace(StringReplace(sTo, '[', '', [rfReplaceAll, rfIgnoreCase]), ']', '', [rfReplaceAll, rfIgnoreCase]);
            if sFrom[1] = '[' then
            begin
              sFrom := StringReplace(StringReplace(sFrom, '[', '', [rfReplaceAll, rfIgnoreCase]), ']', '', [rfReplaceAll, rfIgnoreCase]);
              qryLogImport.FieldByName('LOG_' + sTo).Value := qryLogImport.FieldByName('LOG_' + sFrom).Value;
              qryLogImport.FieldByName('LOG_' + sFrom).Value := null;
            end
            else
              qryLogImport.FieldByName('LOG_' + sTo).Value := sFrom;

          end;
          cdsAddParams.Next;
        end;
      except
        on E: Exception do
        begin
          sLog.Add('Error in line : ' + IntToStr(pgImport.Position + 1) + ' : ' + E.Message);
          sBad.Add(sFile.Strings[k]);
          exit;

        end;
      end;
    end;

    pData := MainWindow.GetPrefixData(qryLogImport.FieldByName('LOG_CALL').asString, qryLogImport.FieldByName('LOG_QSO_DATETIME').AsDateTime);

    // Определение страны и территории
    if qryLogImport.FieldByName('LOG_DXCC').IsNull then
    begin
      qryLogImport.FieldByName('LOG_DXCC').asString := pData.PrefixData.ADIF;
      qryLogImport.FieldByName('LOG_COUNTRY').asString := pData.PrefixData.Territory;
      qryLogImport.FieldByName('LOG_CONTINENT').asString := dmMain.GetContinentName(pData.PrefixData.Continent);
    end;

    if qryLogImport.FieldByName('LOG_DXCC').IsNull then
      qryLogImport.FieldByName('LOG_DXCC').asString := pData.PrefixData.ADIF;

    if qryLogImport.FieldByName('LOG_COUNTRY').IsNull then
      qryLogImport.FieldByName('LOG_COUNTRY').asString := pData.PrefixData.Territory;

    if qryLogImport.FieldByName('LOG_CONTINENT').IsNull then
      qryLogImport.FieldByName('LOG_CONTINENT').asString := dmMain.GetContinentName(pData.PrefixData.Continent);

    if qryLogImport.FieldByName('LOG_CONT').IsNull then
      qryLogImport.FieldByName('LOG_CONT').asString := pData.PrefixData.Continent;

    // Ekaterenburg
    if (qryLogImport.FieldByName('LOG_DXCC').asString = '54') and (qryLogImport.FieldByName('LOG_CONT').asString <> pData.PrefixData.Continent) then
      qryLogImport.FieldByName('LOG_CONT').asString := pData.PrefixData.Continent;

    if qryLogImport.FieldByName('LOG_GRIDSQUARE').IsNull then
      qryLogImport.FieldByName('LOG_GRIDSQUARE').asString := CoordinateToGrid(pData.PrefixData.Location.y / 180, pData.PrefixData.Location.x / 180);

    if qryLogImport.FieldByName('LOG_LAT').IsNull then
      // qryLogImport.FieldByName('LOG_LAT').asFloat := pData.PrefixData.Location.y/180;
      qryLogImport.FieldByName('LOG_LAT').AsFloat := GridToCoordinate(qryLogImport.FieldByName('LOG_GRIDSQUARE').asString).Lat;

    if qryLogImport.FieldByName('LOG_LON').IsNull then
      // qryLogImport.FieldByName('LOG_LON').asFloat := pData.PrefixData.Location.x/180;
      qryLogImport.FieldByName('LOG_LON').AsFloat := GridToCoordinate(qryLogImport.FieldByName('LOG_GRIDSQUARE').asString).Lon;

    if qryLogImport.FieldByName('LOG_PFX').IsNull then
      qryLogImport.FieldByName('LOG_PFX').asString := pData.PrefixData.Prefix;

    if cbRedefineCountry.Checked then
    begin
      qryLogImport.FieldByName('LOG_CONT').asString := pData.PrefixData.Continent;
      qryLogImport.FieldByName('LOG_DXCC').asString := pData.PrefixData.ADIF;
      qryLogImport.FieldByName('LOG_COUNTRY').asString := pData.PrefixData.Territory;
      qryLogImport.FieldByName('LOG_CONTINENT').asString := dmMain.GetContinentName(pData.PrefixData.Continent);
      qryLogImport.FieldByName('LOG_LAT').AsFloat := pData.PrefixData.Location.y / 180;
      qryLogImport.FieldByName('LOG_LON').AsFloat := pData.PrefixData.Location.x / 180;
      qryLogImport.FieldByName('LOG_PFX').asString := pData.PrefixData.Prefix;
    end;

    if qryLogImport.FieldByName('LOG_QSL_SENT').IsNull then
      if (qryLogImport.FieldByName('LOG_QSLSDATE').IsNull) then
        qryLogImport.FieldByName('LOG_QSL_SENT').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_QSL_SENT').asString := 'Y';

    if qryLogImport.FieldByName('LOG_QSL_RCVD').IsNull then
      if (qryLogImport.FieldByName('LOG_QSLRDATE').IsNull) then
        qryLogImport.FieldByName('LOG_QSL_RCVD').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_QSL_RCVD').asString := 'Y';

    if qryLogImport.FieldByName('LOG_EQSL_QSL_SENT').IsNull then
      if (qryLogImport.FieldByName('LOG_EQSL_QSLSDATE').IsNull) then
        qryLogImport.FieldByName('LOG_EQSL_QSL_SENT').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_EQSL_QSL_SENT').asString := 'Y';

    if qryLogImport.FieldByName('LOG_EQSL_QSL_RCVD').IsNull then
      if (qryLogImport.FieldByName('LOG_EQSL_QSLRDATE').IsNull) then
        qryLogImport.FieldByName('LOG_EQSL_QSL_RCVD').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_EQSL_QSL_RCVD').asString := 'Y';

    if qryLogImport.FieldByName('LOG_LOTW_QSL_SENT').IsNull then
      if (qryLogImport.FieldByName('LOG_LOTW_QSLSDATE').IsNull) then
        qryLogImport.FieldByName('LOG_LOTW_QSL_SENT').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_LOTW_QSL_SENT').asString := 'Y';

    if qryLogImport.FieldByName('LOG_LOTW_QSL_RCVD').IsNull then
      if (qryLogImport.FieldByName('LOG_LOTW_QSLRDATE').IsNull) then
        qryLogImport.FieldByName('LOG_LOTW_QSL_RCVD').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_LOTW_QSL_RCVD').asString := 'Y';

    if qryLogImport.FieldByName('LOG_DQSL_QSL_SENT').IsNull then
      if (qryLogImport.FieldByName('LOG_DQSL_QSLSDATE').IsNull) then
        qryLogImport.FieldByName('LOG_DQSL_QSL_SENT').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_DQSL_QSL_SENT').asString := 'Y';

    if qryLogImport.FieldByName('LOG_DQSL_QSL_RCVD').IsNull then
      if (qryLogImport.FieldByName('LOG_DQSL_QSLRDATE').IsNull) then
        qryLogImport.FieldByName('LOG_DQSL_QSL_RCVD').asString := 'N'
      else
        qryLogImport.FieldByName('LOG_DQSL_QSL_RCVD').asString := 'Y';

    if qryLogImport.FieldByName('LOG_MY_CITY').IsNull then
      qryLogImport.FieldByName('LOG_MY_CITY').asString := dmMain.qryStations.FieldByName('STATION_CITY').asString;
    if qryLogImport.FieldByName('LOG_MY_CNTY').IsNull then
      qryLogImport.FieldByName('LOG_MY_CNTY').asString := dmMain.qryStations.FieldByName('STATION_CNTY').asString;
    if qryLogImport.FieldByName('LOG_MY_COUNTRY').IsNull then
      qryLogImport.FieldByName('LOG_MY_COUNTRY').asString := dmMain.MyCountryName;
    if qryLogImport.FieldByName('LOG_MY_CQ_ZONE').IsNull then
    begin
      sCQZone := dmMain.qryStations.FieldByName('STATION_CQ_ZONE').asString;
      if sCQZone = '' then
        sCQZone := '0';
      qryLogImport.FieldByName('LOG_MY_CQ_ZONE').asString := sCQZone;
    end;
    if qryLogImport.FieldByName('LOG_MY_CQ_ZONE').IsNull then
    begin
      sITUZone := dmMain.qryStations.FieldByName('STATION_ITU_ZONE').asString;
      if sITUZone = '' then
        sITUZone := '0';
      qryLogImport.FieldByName('LOG_MY_ITU_ZONE').asString := sITUZone;
    end;
    if qryLogImport.FieldByName('LOG_MY_GRIDSQUARE').IsNull then
      qryLogImport.FieldByName('LOG_MY_GRIDSQUARE').asString := dmMain.qryStations.FieldByName('STATION_GRIDSQUARE').asString;
    if qryLogImport.FieldByName('LOG_MY_IOTA').IsNull then
      qryLogImport.FieldByName('LOG_MY_IOTA').asString := dmMain.qryStations.FieldByName('STATION_IOTA_ISLAND_ID').asString;
    if qryLogImport.FieldByName('LOG_MY_LAT').IsNull then
      qryLogImport.FieldByName('LOG_MY_LAT').AsFloat := dmMain.qryStations.FieldByName('STATION_LAT').AsFloat;
    if qryLogImport.FieldByName('LOG_MY_LON').IsNull then
      qryLogImport.FieldByName('LOG_MY_LON').AsFloat := dmMain.qryStations.FieldByName('STATION_LON').AsFloat;
    if qryLogImport.FieldByName('LOG_MY_NAME').IsNull then
      qryLogImport.FieldByName('LOG_MY_NAME').asString := dmMain.qryStations.FieldByName('STATION_NAME').asString;
    if qryLogImport.FieldByName('LOG_MY_POSTAL_CODE').IsNull then
      qryLogImport.FieldByName('LOG_MY_POSTAL_CODE').asString := dmMain.qryStations.FieldByName('STATION_POSTAL_CODE').asString;
    if qryLogImport.FieldByName('LOG_MY_RIG').IsNull then
      qryLogImport.FieldByName('LOG_MY_RIG').asString := dmMain.qryStations.FieldByName('STATION_RIG').asString;
    if qryLogImport.FieldByName('LOG_MY_SIG').IsNull then
      qryLogImport.FieldByName('LOG_MY_SIG').asString := dmMain.qryStations.FieldByName('STATION_SIG').asString;
    if qryLogImport.FieldByName('LOG_MY_SIG_INFO').IsNull then
      qryLogImport.FieldByName('LOG_MY_SIG_INFO').asString := dmMain.qryStations.FieldByName('STATION_SIG_INFO').asString;
    if qryLogImport.FieldByName('LOG_MY_STATE').IsNull then
      qryLogImport.FieldByName('LOG_MY_STATE').asString := dmMain.qryStations.FieldByName('STATION_STATE').asString;
    if qryLogImport.FieldByName('LOG_MY_STREET').IsNull then
      qryLogImport.FieldByName('LOG_MY_STREET').asString := dmMain.qryStations.FieldByName('STATION_STREET').asString;

    qryLogImport.FieldByName('LOG_QSO_DATE').AsDateTime := StrToDate(DateToStr(qryLogImport.FieldByName('LOG_QSO_DATETIME').AsDateTime));
    qryLogImport.FieldByName('LOG_QSO_TIME').AsDateTime := StrToTime(FormatDateTime('hh:nn', qryLogImport.FieldByName('LOG_QSO_DATETIME').AsDateTime));

    qryLogImport.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(qryLogImport.FieldByName('LOG_CALL').asString);

    try
      try
        qryLogImport.Post;
        Inc(iImportedRowCount);
      except
        on E: Exception do
        begin
          sLog.Add('Error in line : ' + IntToStr(pgImport.Position + 1) + ' : ' + E.Message);
          sBad.Add(sFile.Strings[k]);
          qryLogImport.Cancel;

        end;
      end;
    finally
      pgImport.Position := pgImport.Position + 1;
      lbProgress.Caption := IntToStr(pgImport.Position) + '/' + IntToStr(pgImport.Max);
      Application.ProcessMessages;
    end;
    qryLogImport.Append;
  end;

begin
  sFile := TStringList.Create;
  sLog := TStringList.Create;
  sBad := TStringList.Create;
  Screen.Cursor := crHourGlass;
  qryLogImport.DisableControls;
  sFile.LoadFromFile(feFile.FileName);
  try

    // Delete header
    for i := 0 to sFile.Count - 1 do
      if Pos('<EOH>', AnsiUpperCase(sFile.Strings[i])) > 0 then
      begin
        for j := 0 to i do
          sFile.Delete(0);
        break;
      end;

    while Trim(sFile.Strings[0]) = '' do
      sFile.Delete(0);

    if Pos('ADIF_VER', AnsiUpperCase(sFile.Strings[0])) > 0 then
      sFile.Delete(0);

    for i := sFile.Count - 1 downto 0 do
      if Length(Trim(sFile.Strings[i])) = 0 then
        sFile.Delete(i);

    if Trim(Copy(sFile.Strings[0], Length(sFile.Strings[0]) - 4, 5)) <> '<EOR>' then
    begin
      sTmpFile := TStringList.Create;
      try
        for i := 0 to sFile.Count - 1 do
          if Pos('<EOR>', UpperCase(sFile.Strings[i])) > 0 then
          begin
            sTmpStr := sTmpStr + sFile.Strings[i];
            sTmpFile.Add(sTmpStr);
            sTmpStr := '';
          end
          else
          begin
            sTmpStr := sTmpStr + sFile.Strings[i];
          end;
        sFile.Text := sTmpFile.Text;
      finally
        FreeAndNil(sTmpFile);
      end;

    end;

    pgImport.Max := sFile.Count;
    pgImport.Position := 0;
    lbProgress.Caption := '0/' + IntToStr(pgImport.Max);
    iPosOpenTag := 0;
    iImportedRowCount := 0;

    qryLogImport.TableName := 'LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').AsInteger);

    qryLogImport.RefreshSorted := False;
    qryLogImport.Open;
    qryLogImport.Append;

    qryBands.Open;


    // sFile.SaveToFile('d:\!\111');

    for k := 0 to sFile.Count - 1 do
    begin
      sFileBody := Trim(sFile.Strings[k]);
      if Length(Trim(sFileBody)) = 0 then
        Continue;
      repeat
        bLineErrorFound := False;
        sFileBody := Trim(sFileBody);
        iPosOpenTag := Pos('<', sFileBody);
        iPosCloseTag := Pos('>', sFileBody);
        if (iPosOpenTag = 0) or (iPosOpenTag = 0) then
        begin
          sLog.Add('Error in line : ' + IntToStr(pgImport.Position + 1) + ' : Bad format');
          sBad.Add(sFile.Strings[k]);
          break;
        end;

        j := Pos(':', sFileBody);
        if j > 0 then
          sCurTag := UpperCase(Trim(Copy(sFileBody, iPosOpenTag + 1, j - 2)))
        else
          sCurTag := UpperCase(Trim(Copy(sFileBody, iPosOpenTag + 1, iPosCloseTag - 2)));

        if UpperCase(sCurTag) = 'EOR' then
          break;

        try
          l := Pos(':', Copy(sFileBody, j + 1, iPosCloseTag - j - 1));
          if l > 0 then
            iValueCount := StrToInt(Trim(Copy(sFileBody, j + 1, l - 1)))
          else
            iValueCount := StrToInt(Trim(Copy(sFileBody, j + 1, iPosCloseTag - j - 1)));

          sCurValue := Trim(Copy(sFileBody, iPosCloseTag + 1, iValueCount));

          if sCurTag='STATE1' then
            sCurTag:='CUSTOM_STAT1';
          if sCurTag='STATE2' then
            sCurTag:='CUSTOM_STAT2';
          if sCurTag='STATE3' then
            sCurTag:='CUSTOM_STAT3';
          if sCurTag='STATE4' then
            sCurTag:='CUSTOM_STAT4';



          if sCurTag = 'QSO_DATE' then
            sQSODate := sCurValue;
          if sCurTag = 'TIME_ON' then
            sQSOTime := sCurValue;

          if ((sCurTag = 'QSO_DATE') or (sCurTag = 'TIME_ON')) and ((sQSODate <> '') and (sQSOTime <> '')) then
          begin

            if sQSOTime = '0000' then
              wSecond := 1
            else
              wSecond := 0;

            qryLogImport.FieldByName('LOG_QSO_DATETIME').Value := EncodeDateTime(StrToInt(Copy(sQSODate, 1, 4)), StrToInt(Copy(sQSODate, 5, 2)), StrToInt(Copy(sQSODate, 7, 2)), StrToInt(Copy(sQSOTime, 1, 2)), StrToInt(Copy(sQSOTime, 3, 2)), wSecond, 0);
          end
          else if sCurTag = 'DXCC_PREF' then
          begin
            qryLogImport.FieldByName('LOG_PFX').Value := sCurValue;
          end
          else
          begin
            if Assigned(qryLogImport.Fields.FindField('LOG_' + sCurTag)) then
            begin
              // Потом убрать ошибки False
              if (sCurTag = 'FORCE_INIT') or (sCurTag = 'QSO_RANDOM') or (sCurTag = 'SWL') then
              begin
                Delete(sFileBody, 1, iPosCloseTag + iValueCount);
                Continue;
              end;

              if (qryLogImport.FieldByName('LOG_' + sCurTag).DataType = ftDateTime) and (sCurTag <> 'QSO_DATE') then
                // Временно затягивание нормальной даты... потом убрать
                if Length(sCurValue) = 10 then
                  qryLogImport.FieldByName('LOG_' + sCurTag).Value := StrToDate(sCurValue)
                else
                  qryLogImport.FieldByName('LOG_' + sCurTag).Value := EncodeDate(StrToInt(Copy(sCurValue, 1, 4)), StrToInt(Copy(sCurValue, 5, 2)), StrToInt(Copy(sCurValue, 7, 2)))
                else if ((sCurTag <> 'QSO_DATE') and (sCurTag <> 'TIME_ON') and (Trim(sCurValue) <> '')) then
                  if sCurTag = 'STX' then
                  begin
                    try
                      qryLogImport.FieldByName('LOG_STX').Value := sCurValue;
                    except
                      qryLogImport.FieldByName('LOG_STX_STRING').Value := sCurValue;
                    end;
                  end
                  else if sCurTag = 'SRX' then
                  begin
                    try
                      qryLogImport.FieldByName('LOG_SRX').Value := sCurValue;
                    except
                      qryLogImport.FieldByName('LOG_SRX_STRING').Value := sCurValue;
                    end;
                  end
                  else if (sCurTag = 'LAT') or (sCurTag = 'LON') or (sCurTag = 'MY_LAT') or (sCurTag = 'MY_LON') then
                  begin
                    qryLogImport.FieldByName('LOG_' + sCurTag).Value := LocationToCoordinate(sCurValue);
                  end
                  else if qryLogImport.FieldByName('LOG_' + sCurTag).DataType = ftFloat then
                    qryLogImport.FieldByName('LOG_' + sCurTag).Value := StringReplace(sCurValue, '.', Delimeter, [rfReplaceAll, rfIgnoreCase])
                  else
                    qryLogImport.FieldByName('LOG_' + sCurTag).Value := sCurValue;
            end
            else if Copy(sCurTag, 1, 4) = 'APP_' then // Обработка пользовательских полей
            begin
              Delete(sCurTag, 1, 4);
              Delete(sCurTag, 1, Pos('_', sCurTag));
              if Assigned(qryLogImport.Fields.FindField('LOG_' + sCurTag)) then
              begin
                if (qryLogImport.FieldByName('LOG_' + sCurTag).DataType = ftDateTime) then
                  qryLogImport.FieldByName('LOG_' + sCurTag).Value := EncodeDate(StrToInt(Copy(sCurValue, 1, 4)), StrToInt(Copy(sCurValue, 5, 2)), StrToInt(Copy(sCurValue, 7, 2)))
                else if qryLogImport.FieldByName('LOG_' + sCurTag).DataType = ftFloat then
                  qryLogImport.FieldByName('LOG_' + sCurTag).Value := StringReplace(sCurValue, '.', Delimeter, [rfReplaceAll, rfIgnoreCase])
                else
                  qryLogImport.FieldByName('LOG_' + sCurTag).Value := sCurValue;
              end;
            end;
          end;

          Delete(sFileBody, 1, iPosCloseTag + iValueCount);
          sFileBody := Trim(sFileBody);
        except
          on E: Exception do
          begin
            sLog.Add('Error in line : ' + IntToStr(pgImport.Position + 1) + ' : ' + E.Message);
            sBad.Add(sFile.Strings[k]);
            bLineErrorFound := True;
            break;
          end;
        end;
      until iPosOpenTag = 0;

      if not bLineErrorFound then
        PostRecord;
    end;
    qryLogImport.RefreshSorted := True;
    sLog.Add('End import. ' + IntToStr(iImportedRowCount) + '/' + IntToStr(pgImport.Max) + ' have been imported.');

    if cbCheckSendQSL.Checked then
    begin
      MainWindow.CoreCommand(MainWindow.aEQSLUploadCheck);
    end;

    sLog.SaveToFile(ExtractFilePath(Application.ExeName) + '\Log\Import_' + ExtractFileName(feFile.FileName) + '.log');
    if sBad.Count > 0 then
    begin
      sBad.Insert(0, '<EOH>');
      sBad.Insert(0, '<ADIF_VER:5>2.2.6');
      sBad.Insert(0, '<PROGRAMVERSION:4>1.00');
      sBad.Insert(0, '<PROGRAMID:10>UT4UKW LOG');
      sBad.Insert(0, '');
      sBad.Insert(0, '# UT4UKW Logbook Ver');
      sBad.SaveToFile(ExtractFilePath(Application.ExeName) + '\Log\BAD_' + ExtractFileName(feFile.FileName) + '.log');
    end;

  finally
    pgImport.Position := pgImport.Max;
    lbProgress.Caption := IntToStr(pgImport.Position) + '/' + IntToStr(pgImport.Max);
    // lbFoundErrors.Caption:=Format(lbFoundErrors.Caption, [IntToStr(pgImport.Max-iImportedRowCount)]);
    lbFoundErrors.Caption := Format(lbFoundErrors.Caption, [IntToStr(sBad.Count)]);

    lbFoundErrors.Visible := True;
    Application.ProcessMessages;
    sFile.free;
    sLog.free;
    sBad.free;
    MainWindow.Plugins.CoreCommand(CA_REFRESH_LOG, nil, 0, 0);
    qryLogImport.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

end.
