unit uWindowClusterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, DB, KDaoTable, ActnList, ImgList, StdCtrls,
  JvComponentBase, JvFormPlacement, JvStrUtils, uPluginHeaders,
  DateUtils, Math, uWindowPluginForm, JvMemoryDataset, JvCsvData, uUtils,
  DBGridEhGrouping, GridsEh, DBGridEh, EhLibMemData, IDGlobal, JvThread,
  KDaoDataBase, JvExControls, OverbyteIcsWndControl, OverbyteIcsTnCnx, uEditClusterSpot;

type
  TBandMode = record
    BandMHZ: real;
    ModeName: string;
  end;

  TWindowClusterForm = class(TWindowPluginForm)
    qryBandGrid: TKADaoTable;
    alCluster: TActionList;
    ilCluster: TImageList;
    aClusterTelnetConnect: TAction;
    pgCluster: TPageControl;
    tsClusterTelnet: TTabSheet;
    pgClusterTelnetBands: TJvPageControl;
    tsClusterTelnetBandsAll: TTabSheet;
    cdsClusterTelnet: TJvMemoryData;
    cdsClusterTelnetCLUSTER_SPOTTER: TStringField;
    cdsClusterTelnetCLUSTER_TIME: TTimeField;
    cdsClusterTelnetCLUSTER_BAND: TFloatField;
    cdsClusterTelnetCLUSTER_FREQ: TFloatField;
    cdsClusterTelnetCLUSTER_CALL: TStringField;
    cdsClusterTelnetCLUSTER_COMMENT: TStringField;
    cdsClusterTelnetCLUSTER_MODE: TStringField;
    cdsClusterTelnetCLUSTER_DATE: TDateTimeField;
    dsClusterTelnet: TDataSource;
    qryBands: TKADaoTable;
    aClusterTelnetClear: TAction;
    qryModes: TKADaoTable;
    aClusterTelnetFilter: TAction;
    tsClusterWWW: TTabSheet;
    pnlToolBarTelnet: TPanel;
    tbLogMain: TToolBar;
    tbClusterTelnetConnect: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    tbClusterTelnetFilter: TToolButton;
    Panel10: TPanel;
    cbClusterTelnetUrl: TComboBox;
    Panel1: TPanel;
    cbClusterTelnetModes: TComboBox;
    pcClusterTelnet: TPageControl;
    tsClusterTelnetBand: TTabSheet;
    tsClusterTelnetTelnet: TTabSheet;
    memTelnet: TMemo;
    FormStorage: TJvFormStorage;
    pnlToolBarWWW: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tbClusterWWWFilter: TToolButton;
    Panel4: TPanel;
    Panel5: TPanel;
    cbClusterWWWModes: TComboBox;
    pgClusterWWWBands: TJvPageControl;
    tsClusterWWWBandsAll: TTabSheet;
    cdsClusterWWW: TJvMemoryData;
    StringField1: TStringField;
    TimeField1: TTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    dsClusterWWW: TDataSource;
    cdsBandGrid: TJvMemoryData;
    qryBandGridBANDGRID_ID: TAutoIncField;
    qryBandGridBANDGRID_BAND_MHZ: TFloatField;
    qryBandGridBANDGRID_MODE_NAME: TStringField;
    qryBandGridBANDGRID_FREQ_BEGIN: TFloatField;
    qryBandGridBANDGRID_FREQ_END: TFloatField;
    cdsBandGridBANDGRID_ID: TAutoIncField;
    cdsBandGridBANDGRID_BAND_MHZ: TFloatField;
    cdsBandGridBANDGRID_MODE_NAME: TStringField;
    cdsBandGridBANDGRID_FREQ_BEGIN: TFloatField;
    cdsBandGridBANDGRID_FREQ_END: TFloatField;
    aClusterWWWClear: TAction;
    aClusterWWWFilter: TAction;
    aClusterWWWDownload: TAction;
    timClusterWWW: TTimer;
    FormStorageOnExit: TJvFormStorage;
    dbgClusterWWW: TDBGridEh;
    dbgClusterTelnet: TDBGridEh;
    thrWWW: TJvThread;
    pnlMainToolBar: TPanel;
    qryDXCC1: TKADaoTable;
    cdsClusterWWWCLUSTER_COLOR: TStringField;
    cdsClusterTelnetCLUSTER_COLOR: TStringField;
    pnlClusterWWW: TPanel;
    pnlLoading: TPanel;
    thrTelnet: TJvThread;
    aClusterCallToQSOEntry: TAction;
    aClusterSendSpot: TAction;
    ToolButton6: TToolButton;
    Telnet: TTnCnx;
    msgClusterSendSpotFreqError: TLabel;
    msgClusterSendError: TLabel;
    btnCancel: TLabel;
    cdsClusterWWWCLUSTER_LOTW: TStringField;
    cdsClusterWWWCLUSTER_EQSL: TStringField;
    cdsClusterWWWCLUSTER_CALL_DESCRIPTION: TStringField;
    cdsClusterTelnetCLUSTER_LOTW: TStringField;
    cdsClusterTelnetCLUSTER_EQSL: TStringField;
    cdsClusterTelnetCLUSTER_CALL_DESCRIPTION: TStringField;
    procedure aClusterTelnetConnectExecute(Sender: TObject);
    procedure pgClusterTelnetBandsChange(Sender: TObject);
    procedure aClusterTelnetClearExecute(Sender: TObject);
    procedure dbgClusterTelnetTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure dbgClusterTelnetDblClick(Sender: TObject);
    procedure cbClusterTelnetModesChange(Sender: TObject);
    procedure aClusterTelnetFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgClusterWWWBandsChange(Sender: TObject);
    procedure aClusterWWWClearExecute(Sender: TObject);
    procedure aClusterWWWFilterExecute(Sender: TObject);
    procedure cbClusterWWWModesChange(Sender: TObject);
    procedure tbClusterWWWFilterClick(Sender: TObject);
    procedure aClusterWWWDownloadExecute(Sender: TObject);
    procedure dbgClusterWWWTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure dbgClusterWWWDblClick(Sender: TObject);
    procedure timClusterWWWTimer(Sender: TObject);
    procedure thrWWWExecute(Sender: TObject; Params: Pointer);
    procedure pgClusterChange(Sender: TObject);
    procedure FormStorageOnExitAfterRestorePlacement(Sender: TObject);
    procedure memTelnetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgClusterWWWGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure thrDXCCExecute(Sender: TObject; Params: Pointer);
    procedure dbgClusterTelnetGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure thrWWWFinish(Sender: TObject);
    procedure thrTelnetExecute(Sender: TObject; Params: Pointer);
    procedure FormActivate(Sender: TObject);
    procedure aClusterCallToQSOEntryExecute(Sender: TObject);
    procedure thrTelnetFinish(Sender: TObject);
    procedure aClusterSendSpotUpdate(Sender: TObject);
    procedure aClusterSendSpotExecute(Sender: TObject);
    procedure TelnetDataAvailable(Sender: TTnCnx; Buffer: Pointer; Len: Integer);
    procedure TelnetSessionConnected(Sender: TTnCnx; Error: Word);
    procedure FormDestroy(Sender: TObject);
    procedure TelnetSessionClosed(Sender: TTnCnx; Error: Word);
    function FindLoTWeQSLCall(Call: String; FileName:String): boolean;
    function FindCallClusterDesc(Call: String; FileName:String): string;
    procedure dbgClusterWWWColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure dbgClusterWWWColWidthsChanged(Sender: TObject);
    procedure dbgClusterTelnetColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure dbgClusterTelnetColWidthsChanged(Sender: TObject);
  private
    Separator: string;
    StationId: Integer;
    bTelnetConnected: boolean;
    DXCCSQL: string;
    bSetRadioSpot: boolean;
    slTelnetSpot: TStringList;
    bLoaded:boolean;
    procedure Connect;
    procedure Disconnect;
    procedure BuildBandTabs;
    procedure PostRecord(sStr: string);
    procedure SetTelnetFilter;
    procedure SetWWWFilter;
    procedure LoadWWW;
    function GetBandModeByFreq(freq: real): TBandMode;
    procedure SendName;
    procedure CheckDXCC(Call: string);
    procedure SendSpot;
    procedure SyncColumns(Sender:TObject);
  public
    StationCall: string;
    TelnetBuffer: string;
    CallDescList: TCallDescList;
    procedure InitData;
    procedure SaveGrid;
    procedure OptionsChanged;
    procedure StationChanged(lParam: variant);
    procedure BandChanged(lParam: variant);
    procedure ModeChanged(lParam: variant);
    procedure Load;

  end;

var
  WindowClusterForm: TWindowClusterForm;
  EditClusterSpot: TEditClusterSpot;
implementation

uses uWindowCluster;
{$R *.dfm}

procedure TWindowClusterForm.Connect;
var
  sUrl: string;
  iPosDelimeter, iPosPort: Integer;
  slMemUrlLine: TStringList;
  sHost, sPort: string;

begin
  // PostRecord('DX de LU7XWC:28340000000.0LU7XWC');

  Screen.Cursor := crHourGlass;

  slMemUrlLine := TStringList.Create;
  slMemUrlLine.QuoteChar := '"';
  slMemUrlLine.Delimiter := ',';
  slMemUrlLine.StrictDelimiter := True;
  try
    slMemUrlLine.DelimitedText := WindowClusterSettingsFrame.memURL.Lines.Strings[cbClusterTelnetUrl.ItemIndex];
    if (slMemUrlLine.Count < 3) then
    begin
      MessageBox(Application.Handle, PWideChar('Error parsing URL '), PWideChar('Error'), MB_OK or MB_ICONERROR);
      tbClusterTelnetConnect.Down := False;
      Screen.Cursor := crDefault;
      bTelnetConnected := False;
      exit;
    end
    else
    begin
      sHost := slMemUrlLine.Strings[1];
      sPort := slMemUrlLine.Strings[2];
    end;
  finally
    slMemUrlLine.Free;
  end;
  try
    Telnet.Host := sHost;
    Telnet.Port := sPort;
    Telnet.Connect;
    bTelnetConnected := True;
    tbClusterTelnetConnect.Down := True;
    Screen.Cursor := crDefault;
  except
    on E: Exception do
    begin
      Screen.Cursor := crDefault;
      MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR);
      bTelnetConnected := False;
      tbClusterTelnetConnect.Down := False;
    end;
  end;
end;

procedure TWindowClusterForm.Disconnect;
begin
  // Telnet.DisconnectNotifyPeer;
  // Telnet.Disconnect();
  Telnet.Close;
  aClusterTelnetConnect.ImageIndex := 4;
  bTelnetConnected := False;
  tbClusterTelnetConnect.Down := False;
end;

procedure TWindowClusterForm.FormActivate(Sender: TObject);
begin
  if not Self.Visible then
    exit;
  if pgCluster.ActivePage = tsClusterWWW then
    if dbgClusterWWW.CanFocus then
      dbgClusterWWW.SetFocus;
  if (pgCluster.ActivePage = tsClusterTelnet) and (pcClusterTelnet.ActivePage = tsClusterTelnetBand) then
    if dbgClusterTelnet.CanFocus then
      dbgClusterTelnet.SetFocus;
end;

procedure TWindowClusterForm.FormCreate(Sender: TObject);
var
  Decimal: PChar;
begin
  slTelnetSpot := TStringList.Create;
end;

procedure TWindowClusterForm.FormDestroy(Sender: TObject);
begin
  slTelnetSpot.Free;
end;

procedure TWindowClusterForm.FormStorageOnExitAfterRestorePlacement(Sender: TObject);
begin
  pnlToolBarWWW.Visible := pgCluster.ActivePage = tsClusterWWW;
  pnlToolBarTelnet.Visible := pgCluster.ActivePage = tsClusterTelnet;
{  pgClusterChange(Self);
  Self.Visible:=False;}
end;

procedure TWindowClusterForm.aClusterCallToQSOEntryExecute(Sender: TObject);
begin
  if pgCluster.ActivePage = tsClusterWWW then
    dbgClusterWWW.OnDblClick(Self);
  if (pgCluster.ActivePage = tsClusterTelnet) and (pcClusterTelnet.ActivePage = tsClusterTelnetBand) then
    dbgClusterTelnet.OnDblClick(Self);
end;

procedure TWindowClusterForm.aClusterSendSpotExecute(Sender: TObject);
begin
  SendSpot;
end;

procedure TWindowClusterForm.aClusterSendSpotUpdate(Sender: TObject);
begin
  aClusterSendSpot.Enabled := tbClusterTelnetConnect.Down;
end;

procedure TWindowClusterForm.aClusterTelnetClearExecute(Sender: TObject);
var
  lParam, wParam: variant;
begin
  cdsClusterTelnet.EmptyTable;
  memTelnet.Clear;
  lDllCommand(DC_CLUSTER_TELNET_CLEAR, Self, lParam, wParam);
end;

procedure TWindowClusterForm.aClusterTelnetConnectExecute(Sender: TObject);
begin
  if not bTelnetConnected then
    Connect
  else
    Disconnect;
end;

procedure TWindowClusterForm.aClusterTelnetFilterExecute(Sender: TObject);
begin
  SetTelnetFilter;
end;

procedure TWindowClusterForm.aClusterWWWClearExecute(Sender: TObject);
var
  lParam, wParam: variant;
begin
  cdsClusterWWW.DisableControls;
  cdsClusterWWW.EmptyTable;
  cdsClusterWWW.EnableControls;
  lDllCommand(DC_CLUSTER_WWW_CLEAR, Self, lParam, wParam);
end;

procedure TWindowClusterForm.aClusterWWWDownloadExecute(Sender: TObject);
begin
  if pnlLoading.Visible then
    exit;

  pnlLoading.Visible := True;
  pnlToolBarWWW.Visible := False;
  aClusterWWWClear.OnExecute(Self);
  Application.ProcessMessages;
  thrWWW.Execute(nil);
end;

procedure TWindowClusterForm.aClusterWWWFilterExecute(Sender: TObject);
begin
  SetWWWFilter;
end;

procedure TWindowClusterForm.BuildBandTabs;
var
  ts, ts1: TTabSheet;
begin
  qryBands.Close;
  while pgClusterTelnetBands.PageCount > 1 do
    pgClusterTelnetBands.Pages[1].Free;
  while pgClusterWWWBands.PageCount > 1 do
    pgClusterWWWBands.Pages[1].Free;

  qryBands.Open;
  while not qryBands.Eof do
  begin
    ts := TTabSheet.Create(Self);
    ts.Caption := FormatFloat('0.##', qryBands.FieldByName('BAND_MHZ').asFloat);
    ts.Tag := -1;
    ts.PageControl := pgClusterTelnetBands;

    ts1 := TTabSheet.Create(Self);
    ts1.Caption := FormatFloat('0.##', qryBands.FieldByName('BAND_MHZ').asFloat);
    ts1.Tag := -1;
    ts1.PageControl := pgClusterWWWBands;
    qryBands.Next;
  end;

  cbClusterTelnetModes.Items.Clear;
  qryModes.Close;
  qryModes.Open;
  while not qryModes.Eof do
  begin
    cbClusterTelnetModes.Items.Add(qryModes.FieldByName('MODE_NAME').AsString);
    cbClusterWWWModes.Items.Add(qryModes.FieldByName('MODE_NAME').AsString);
    qryModes.Next;
  end;

  pgClusterTelnetBands.ActivePageIndex := 0;
  pgClusterWWWBands.ActivePageIndex := 0;
end;

procedure TWindowClusterForm.cbClusterTelnetModesChange(Sender: TObject);
begin
  SetTelnetFilter;
end;

procedure TWindowClusterForm.cbClusterWWWModesChange(Sender: TObject);
begin
  SetWWWFilter;
end;

procedure TWindowClusterForm.InitData;
var
  i: Integer;
  iPos: Integer;
  iOldIndex: Integer;
 // Decimal: PChar;
  slMemUrl: TStringList;
  slMemUrlLine: TStringList;
begin
{  Decimal := StrAlloc(255);
  GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_SDECIMAL, Decimal, 255);   }

  //Separator := Decimal;
  Separator := GetDelimeter;

  cdsBandGrid.EmptyTable;
  qryBandGrid.Open;
  cdsBandGrid.LoadFromDataSet(qryBandGrid, qryBandGrid.RecordCount, lmAppend);
  qryBandGrid.Close;

  cdsClusterTelnet.EmptyTable;
  cdsClusterWWW.EmptyTable;
  BuildBandTabs;
  cbClusterTelnetModes.ItemIndex := cbClusterTelnetModes.Items.IndexOf(lMode);
  cbClusterWWWModes.ItemIndex := cbClusterWWWModes.Items.IndexOf(lMode);
  iOldIndex := cbClusterTelnetUrl.ItemIndex;

  cbClusterTelnetUrl.Items.Clear;

  slMemUrl := TStringList.Create;
  slMemUrlLine := TStringList.Create;
  slMemUrlLine.QuoteChar := '"';
  slMemUrlLine.Delimiter := ',';
  slMemUrlLine.StrictDelimiter := True;
  try
    slMemUrl.Text := WindowClusterSettingsFrame.memURL.Lines.Text;
    for i := 0 to slMemUrl.Count - 1 do
    begin
      slMemUrlLine.DelimitedText := slMemUrl.Strings[i];
      cbClusterTelnetUrl.Items.Add(slMemUrlLine.Strings[0]);
    end;
  finally
    slMemUrlLine.Free;
    slMemUrl.Free;
  end;

  cbClusterTelnetUrl.ItemIndex := iOldIndex;
  dbgClusterTelnet.DefaultApplySorting;
  timClusterWWW.Interval := WindowClusterSettingsFrame.spAutoLoadMinute.Value * 1000 * 60;
  tsClusterTelnetTelnet.TabVisible := WindowClusterSettingsFrame.WindowCluster_cbShowTelnetTab.Checked;

end;

procedure TWindowClusterForm.dbgClusterTelnetColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  SyncColumns(Sender);
end;

procedure TWindowClusterForm.dbgClusterTelnetColWidthsChanged(Sender: TObject);
begin
  SyncColumns(Sender);
end;

procedure TWindowClusterForm.dbgClusterTelnetDblClick(Sender: TObject);
var
  lParam, wParam: variant;
begin
  if ldsLogEdit.DataSet.State in [dsInsert] then
  begin

    bSetRadioSpot := True;

    lParam := cdsClusterTelnet.FieldByName('CLUSTER_FREQ').asFloat * 1000;
    wParam := cdsClusterTelnet.FieldByName('CLUSTER_MODE').AsString;
    lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);

    wParam := 0;
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := cdsClusterTelnet.FieldByName('CLUSTER_CALL').AsString;
    Application.ProcessMessages;
    lParam := cdsClusterTelnet.FieldByName('CLUSTER_MODE').AsString;
    lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
    lParam := cdsClusterTelnet.FieldByName('CLUSTER_BAND').asFloat;
    wParam := cdsClusterTelnet.FieldByName('CLUSTER_FREQ').asFloat * 1000;
    lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
    lParam := 0;
    wParam := 0;
    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
  end;
end;

procedure TWindowClusterForm.dbgClusterTelnetGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'R') then
    AFont.Color := 3947775
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'B') then
    AFont.Color := 16747546
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'M') then
    AFont.Color := 40704;
end;

procedure TWindowClusterForm.dbgClusterTelnetTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  if TJvDBGrid(Sender).Columns[ACol].FieldName = 'CLUSTER_COMMENT' then
    exit;
  TJvDBGrid(Sender).SortedField := TJvDBGrid(Sender).Columns[ACol].FieldName;
  if (TJvDBGrid(Sender).SortMarker = smNone) or (TJvDBGrid(Sender).SortMarker = smDown) then
  begin
    cdsClusterTelnet.SortOnFields(TJvDBGrid(Sender).Columns[ACol].FieldName, False, False);
    TJvDBGrid(Sender).SortMarker := smUp;
  end
  else
  begin
    cdsClusterTelnet.SortOnFields(TJvDBGrid(Sender).Columns[ACol].FieldName, False, True);
    TJvDBGrid(Sender).SortMarker := smDown;
  end;
end;

procedure TWindowClusterForm.dbgClusterWWWColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
 SyncColumns(Sender);
end;

procedure TWindowClusterForm.dbgClusterWWWColWidthsChanged(Sender: TObject);
begin
 SyncColumns(Sender);
end;

procedure TWindowClusterForm.dbgClusterWWWDblClick(Sender: TObject);
var
  lParam, wParam: variant;
begin
  if ldsLogEdit.DataSet.State in [dsInsert] then
  begin
    bSetRadioSpot := True;
    lParam := cdsClusterWWW.FieldByName('CLUSTER_FREQ').asFloat * 1000;
    wParam := cdsClusterWWW.FieldByName('CLUSTER_MODE').AsString;
    lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);

    wParam := 0;
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := cdsClusterWWW.FieldByName('CLUSTER_CALL').AsString;
    Application.ProcessMessages;
    lParam := cdsClusterWWW.FieldByName('CLUSTER_MODE').AsString;
    lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
    lParam := cdsClusterWWW.FieldByName('CLUSTER_BAND').asFloat;
    wParam := cdsClusterWWW.FieldByName('CLUSTER_FREQ').asFloat * 1000;
    lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
    lParam := 0;
    wParam := 0;
    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
  end;

end;

procedure TWindowClusterForm.dbgClusterWWWGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'R') then
    AFont.Color := 3947775
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'B') then
    AFont.Color := 16747546
  else if (TDBGridEh(Sender).DataSource.DataSet.FieldValues['CLUSTER_COLOR'] = 'M') then
    AFont.Color := 40704;
end;

procedure TWindowClusterForm.dbgClusterWWWTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  if TJvDBGrid(Sender).Columns[ACol].FieldName = 'CLUSTER_COMMENT' then
    exit;
  TJvDBGrid(Sender).SortedField := TJvDBGrid(Sender).Columns[ACol].FieldName;
  if (TJvDBGrid(Sender).SortMarker = smNone) or (TJvDBGrid(Sender).SortMarker = smDown) then
  begin
    cdsClusterWWW.SortOnFields(TJvDBGrid(Sender).Columns[ACol].FieldName, False, False);
    TJvDBGrid(Sender).SortMarker := smUp;
  end
  else
  begin
    cdsClusterWWW.SortOnFields(TJvDBGrid(Sender).Columns[ACol].FieldName, False, True);
    TJvDBGrid(Sender).SortMarker := smDown;
  end;
end;

procedure TWindowClusterForm.SetTelnetFilter;
var
  lParam, wParam: variant;
begin
  cdsClusterTelnet.Filter := '';
  cdsClusterTelnet.Filtered := False;
  if (pgClusterTelnetBands.ActivePageIndex > 0) or (tbClusterTelnetFilter.Down) then
  begin
    if pgClusterTelnetBands.ActivePageIndex > 0 then
      cdsClusterTelnet.Filter := '(CLUSTER_BAND=' + QuotedStr(pgClusterTelnetBands.ActivePage.Caption) + ')';
    if tbClusterTelnetFilter.Down then
      if cdsClusterTelnet.Filter = '' then
        cdsClusterTelnet.Filter := '(CLUSTER_MODE=' + QuotedStr(cbClusterTelnetModes.Text) + ')'
      else
        cdsClusterTelnet.Filter := cdsClusterTelnet.Filter + ' AND (CLUSTER_MODE=' + QuotedStr(cbClusterTelnetModes.Text) + ')';
    cdsClusterTelnet.Filtered := True;
  end;
  if pgClusterTelnetBands.ActivePageIndex = 0 then
    lParam := '-1'
  else
    lParam := pgClusterTelnetBands.ActivePage.Caption;
  wParam := Integer(Pointer(cdsClusterTelnet));
  lDllCommand(DC_CLUSTER_TELNET_CHANGED, Self, lParam, wParam);
end;

procedure TWindowClusterForm.SetWWWFilter;
var
  lParam, wParam: variant;
begin
  cdsClusterWWW.Filter := '';
  cdsClusterWWW.Filtered := False;
  if (pgClusterWWWBands.ActivePageIndex > 0) or (tbClusterWWWFilter.Down) then
  begin
    if pgClusterWWWBands.ActivePageIndex > 0 then
      cdsClusterWWW.Filter := '(CLUSTER_BAND=' + QuotedStr(pgClusterWWWBands.ActivePage.Caption) + ')';
    if tbClusterWWWFilter.Down then
      if cdsClusterWWW.Filter = '' then
        cdsClusterWWW.Filter := '(CLUSTER_MODE=' + QuotedStr(cbClusterWWWModes.Text) + ')'
      else
        cdsClusterWWW.Filter := cdsClusterWWW.Filter + ' AND (CLUSTER_MODE=' + QuotedStr(cbClusterWWWModes.Text) + ')';
    cdsClusterWWW.Filtered := True;
  end;
  if pgClusterWWWBands.ActivePageIndex = 0 then
    lParam := '-1'
  else
    lParam := pgClusterWWWBands.ActivePage.Caption;
  wParam := Integer(Pointer(cdsClusterWWW));
  lDllCommand(DC_CLUSTER_WWW_CHANGED, Self, lParam, wParam);
end;

procedure TWindowClusterForm.tbClusterWWWFilterClick(Sender: TObject);
begin
  SetWWWFilter;
end;

procedure TWindowClusterForm.pgClusterChange(Sender: TObject);
begin
  inherited;
  pnlToolBarWWW.Visible := pgCluster.ActivePage = tsClusterWWW;
  pnlToolBarTelnet.Visible := pgCluster.ActivePage = tsClusterTelnet;
end;

procedure TWindowClusterForm.pgClusterTelnetBandsChange(Sender: TObject);
begin
  SetTelnetFilter;
end;

procedure TWindowClusterForm.pgClusterWWWBandsChange(Sender: TObject);
var
  lParam, wParam: variant;
begin
  SetWWWFilter;
end;

procedure TWindowClusterForm.PostRecord(sStr: string);
var
  sOrigStr, sSpotter, sFreq, sCall, sDescription, sTime: string;
  iYear, iMonth, iDay: Word;
  rFreq: real;
  BandMode: TBandMode;
  DAODatabase: TKADaoDatabase;
  qryDXCC: TKADaoTable;
  lParam, wParam: variant;
begin
  sOrigStr := sStr;
  if slTelnetSpot.Count = 0 then
    exit;
  repeat
    sStr := slTelnetSpot[0];
    if Copy(sStr, 1, 2) = 'DX' then
    begin
      Copy2SymbDel(sStr, ' ');
      Copy2SymbDel(sStr, ' ');
      sSpotter := Copy2SymbDel(sStr, ' ');
      if sSpotter[Length(sSpotter)] = ':' then
        Delete(sSpotter, Length(sSpotter), 1);

      sStr := Trim(sStr);
//      sFreq := StringReplace(Copy2SymbDel(sStr, ' '), '.', Separator, [rfReplaceAll, rfIgnoreCase]);
      sFreq := Copy2SymbDel(sStr, ' ');

      sStr := Trim(sStr);
      sCall := Copy2SymbDel(sStr, ' ');

      if (Copy(sStr, 5, 3) <> 'Z') then
      begin
        if (Length(sStr) > 10) then
        begin
          sDescription := Copy(sStr, 1, 31);
          Delete(sStr, 1, 31);
        end;
      end;

      sStr := Trim(sStr);
      sTime := Copy(sStr, 1, 4);
      if sTime = '' then
      begin
        slTelnetSpot.Delete(0);
        exit;
      end;

      Insert(':', sTime, 3);

      rFreq := StrToFloat(sFreq);
      BandMode := (GetBandModeByFreq(rFreq));
      if BandMode.BandMHZ = -1 then
      begin
        slTelnetSpot.Delete(0);
        exit;
      end;

      DAODatabase := TKADaoDatabase.Create(nil);
      qryDXCC := TKADaoTable.Create(nil);
      qryDXCC.Database := DAODatabase;
      DAODatabase.Database := ExtractFilePath(Application.ExeName) + 'Data\Database\LogBook.mdb';
      DAODatabase.Open;
      qryDXCC.SQL.Text := DXCCSQL;

      cdsClusterTelnet.EnableControls;
      cdsClusterTelnet.DisableControls;
      try
        try
          cdsClusterTelnet.Filter := 'CLUSTER_DATE<' + QuotedStr(FormatDateTime('dd.mm.yyyy hh:nn:ss', IncMinute(Now, WindowClusterSettingsFrame.spShowSpotLastMinutes.Value * -1)));
          cdsClusterTelnet.Filtered := True;
          while not cdsClusterTelnet.Eof do
            cdsClusterTelnet.Delete;
          cdsClusterTelnet.Filtered := False;

          DecodeDate(Date, iYear, iMonth, iDay);
          cdsClusterTelnet.Insert;
          cdsClusterTelnet.FieldByName('CLUSTER_SPOTTER').Value := sSpotter;
          cdsClusterTelnet.FieldByName('CLUSTER_CALL').Value := sCall;
          cdsClusterTelnet.FieldByName('CLUSTER_COMMENT').Value := sDescription;
          cdsClusterTelnet.FieldByName('CLUSTER_TIME').Value := StrToTime(sTime);
          cdsClusterTelnet.FieldByName('CLUSTER_FREQ').Value := StrToFloat(sFreq);
          cdsClusterTelnet.FieldByName('CLUSTER_BAND').Value := FloatToStr(BandMode.BandMHZ);
          cdsClusterTelnet.FieldByName('CLUSTER_MODE').Value := BandMode.ModeName;
          cdsClusterTelnet.FieldByName('CLUSTER_DATE').Value := Now;
          if WindowClusterSettingsFrame.WindowCluster_cbShowAddInfoFromFile.Checked then
          begin
          if FindLoTWeQSLCall(sCall,'LoTW.txt') then
            cdsClusterTelnet.FieldByName('CLUSTER_LOTW').Value := 'L';
          if FindLoTWeQSLCall(sCall,'eQSL.txt') then
            cdsClusterTelnet.FieldByName('CLUSTER_EQSL').Value := 'E';
          cdsClusterTelnet.FieldByName('CLUSTER_CALL_DESCRIPTION').Value := FindCallClusterDesc(sCall,'Cluster.txt');
          end;


          qryDXCC.Close;
          lParam := cdsClusterTelnet.FieldByName('CLUSTER_CALL').AsString;
          lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
          qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);
          qryDXCC.Open;
          if qryDXCC.IsEmpty then
          begin
            cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'R';
          end
          else
          begin
            qryDXCC.First;
            if not qryDXCC.Locate('LOG_BAND_MHZ', cdsClusterTelnet.FieldByName('CLUSTER_BAND').Value, []) then
            begin
              cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'B';
            end
            else
            begin
              qryDXCC.First;
              if not qryDXCC.Locate('LOG_MODE', cdsClusterTelnet.FieldByName('CLUSTER_MODE').Value, []) then
              begin
                cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'M';
              end;
            end;
          end;
          cdsClusterTelnet.Post;
        except
          // on E: Exception do
          // MessageBox(Application.Handle, PWideChar(E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR);
        end;
      finally
        DAODatabase.Close;
        DAODatabase.Free;
        qryDXCC.Free;
      end;
    end;
    slTelnetSpot.Delete(0);

  until slTelnetSpot.Count = 0;
end;

procedure TWindowClusterForm.TelnetDataAvailable(Sender: TTnCnx; Buffer: Pointer; Len: Integer);
var
  sBuffer: string;
begin
  sBuffer := String(StrPas(PAnsiChar(Buffer)));
  if Trim(sBuffer) = '' then
    exit;
  memTelnet.Lines.Add(sBuffer);
  SendMessage(memTelnet.Handle, EM_LINESCROLL, 0, memTelnet.Lines.Count - 1);
  TelnetBuffer := sBuffer;

  if (Pos('Please enter your call', TelnetBuffer) > 0) or (Pos('login:', TelnetBuffer) > 0) then
  begin
    Telnet.SendStr(StationCall + #13#10);
    exit;
  end;

  if Pos('Please enter your QTH', TelnetBuffer) > 0 then
  begin
    Telnet.SendStr(#13#10);
    exit;
  end;

  if Pos('Is this correct?', TelnetBuffer) > 0 then
  begin
    Telnet.SendStr('Y');
    Telnet.SendStr(#13);
    exit;
  end;

  if Pos('Please enter your name', TelnetBuffer) > 0 then
  begin
    SendName;
    exit;
  end;

  slTelnetSpot.Add(TelnetBuffer);

  if thrTelnet.Count = 0 then
    thrTelnet.Execute(nil);
end;

procedure TWindowClusterForm.TelnetSessionClosed(Sender: TTnCnx; Error: Word);
begin
  bTelnetConnected := False;
  if not fDeinitialize then
  begin
    aClusterTelnetConnect.ImageIndex := 4;
    tbClusterTelnetConnect.Down := False;
  end;
  cbClusterTelnetUrl.Enabled:=True;
end;

procedure TWindowClusterForm.TelnetSessionConnected(Sender: TTnCnx; Error: Word);
begin
  aClusterTelnetConnect.ImageIndex := 0;
  cbClusterTelnetUrl.Enabled:=False;
end;

procedure TWindowClusterForm.thrDXCCExecute(Sender: TObject; Params: Pointer);
begin
  if Params = nil then
    CheckDXCC('')
  else
    CheckDXCC(StrPas(PChar(Params)));
end;

procedure TWindowClusterForm.thrTelnetExecute(Sender: TObject; Params: Pointer);
begin
  PostRecord(TelnetBuffer);
end;

procedure TWindowClusterForm.thrTelnetFinish(Sender: TObject);
var
  lParam, wParam: variant;
begin
  if not(csDestroying in cdsClusterTelnet.ComponentState) then
  begin
    SetTelnetFilter;
    cdsClusterTelnet.EnableControls;
    lParam := Integer(Pointer(cdsClusterTelnet));
    lDllCommand(DC_CLUSTER_TELNET_LOADED, Self, lParam, wParam);
  end;
end;

procedure TWindowClusterForm.thrWWWExecute(Sender: TObject; Params: Pointer);
begin
  dsClusterWWW.DataSet.DisableControls;
  LoadWWW;
end;

procedure TWindowClusterForm.thrWWWFinish(Sender: TObject);
var
  lParam, wParam: variant;
begin
  pnlLoading.Visible := False;
  pnlToolBarWWW.Visible := True;

  if not(csDestroying in cdsClusterWWW.ComponentState) then
  begin
    SetWWWFilter;
    dbgClusterWWW.DefaultApplySorting;
    cdsClusterWWW.First;
    dbgClusterWWW.Enabled := True;
    timClusterWWW.Enabled := timClusterWWW.Interval > 0;
  end;
  dsClusterWWW.DataSet.EnableControls;
  lParam := Integer(Pointer(cdsClusterWWW));
  lDllCommand(DC_CLUSTER_WWW_LOADED, Self, lParam, wParam);
end;

procedure TWindowClusterForm.timClusterWWWTimer(Sender: TObject);
begin
  if pnlLoading.Visible then
    exit;
  pnlLoading.Visible := True;
  Application.ProcessMessages;
  thrWWW.Execute(nil);
end;

procedure TWindowClusterForm.LoadWWW;
var
  Stream: TMemoryStream;
  sList, sLine: TStringList;
  i: Integer;
  BandMode: TBandMode;
  rFreq: real;
  lParam, wParam: variant;
  DAODatabase: TKADaoDatabase;
  qryDXCC: TKADaoTable;
begin
  timClusterWWW.Enabled := False;
  Stream := TMemoryStream.Create;
  sList := TStringList.Create;
  sLine := TStringList.Create;
  sLine.Delimiter := '^';
  dbgClusterWWW.Enabled := False;

  DAODatabase := TKADaoDatabase.Create(nil);
  qryDXCC := TKADaoTable.Create(nil);
  qryDXCC.Database := DAODatabase;
  DAODatabase.Database := ExtractFilePath(Application.ExeName) + 'Data\Database\LogBook.mdb';
  DAODatabase.Open;
  qryDXCC.SQL.Text := DXCCSQL;

  try
    try
      if WindowClusterSettingsFrame.cbWWWSpotCount.Text <> '' then
        GetInetFile('http://dxcluster.ham-radio.ch/top_' + WindowClusterSettingsFrame.cbWWWSpotCount.Text + '_all.csv', Stream)
      else
        GetInetFile('http://dxcluster.ham-radio.ch/top_50_all.csv', Stream);

      Stream.Position := 0;
      sList.LoadFromStream(Stream);
      // sList.LoadFromFile('D:\!\cluster.csv');
      for i := 0 to sList.Count - 1 do
        if i > 0 then
        begin
          sLine.DelimitedText := sList.Strings[i];
//          SysUtils.DecimalSeparator:=Separator[1];
//          rFreq := StrToFloat(StringReplace(sLine.Strings[1], '.', Separator, [rfReplaceAll, rfIgnoreCase]));
          rFreq := StrToFloat(sLine.Strings[1]);
//          rFreq := StrToFloat(sLine.Strings[1]);
          BandMode := (GetBandModeByFreq(rFreq));
          if BandMode.BandMHZ = -1 then
            continue;
          cdsClusterWWW.Insert;
          cdsClusterWWW.FieldByName('CLUSTER_SPOTTER').Value := sLine.Strings[5];
          cdsClusterWWW.FieldByName('CLUSTER_CALL').Value := sLine.Strings[0];
          cdsClusterWWW.FieldByName('CLUSTER_COMMENT').Value := sLine.Strings[6];
          cdsClusterWWW.FieldByName('CLUSTER_TIME').Value := StrToTime(sLine.Strings[4]);
          cdsClusterWWW.FieldByName('CLUSTER_FREQ').Value := rFreq;
          cdsClusterWWW.FieldByName('CLUSTER_BAND').Value := BandMode.BandMHZ;
          cdsClusterWWW.FieldByName('CLUSTER_MODE').Value := BandMode.ModeName;
          cdsClusterWWW.FieldByName('CLUSTER_DATE').Value := Now;
          if WindowClusterSettingsFrame.WindowCluster_cbShowAddInfoFromFile.Checked then
          begin
          if FindLoTWeQSLCall(sLine.Strings[0],'LoTW.txt') then
            cdsClusterWWW.FieldByName('CLUSTER_LOTW').Value := 'L';
          if FindLoTWeQSLCall(sLine.Strings[0],'eQSL.txt') then
            cdsClusterWWW.FieldByName('CLUSTER_EQSL').Value := 'E';
          cdsClusterWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').Value := FindCallClusterDesc(sLine.Strings[0],'Cluster.txt');
          end;

          qryDXCC.Close;
          lParam := cdsClusterWWW.FieldByName('CLUSTER_CALL').AsString;
          lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
          qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);

          qryDXCC.Open;
          if qryDXCC.IsEmpty then
          begin
            cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'R';
          end
          else
          begin
            qryDXCC.First;
            if not qryDXCC.Locate('LOG_BAND_MHZ', cdsClusterWWW.FieldByName('CLUSTER_BAND').Value, []) then
            begin
              cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'B';
            end
            else
            begin
              qryDXCC.First;
              if not qryDXCC.Locate('LOG_MODE', cdsClusterWWW.FieldByName('CLUSTER_MODE').Value, []) then
              begin
                cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'M';
              end;
            end;
          end;
          cdsClusterWWW.Post;
        end;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    Stream.Free;
    sList.Free;
    sLine.Free;
    DAODatabase.Close;
    DAODatabase.Free;
    qryDXCC.Free;
  end;

end;

procedure TWindowClusterForm.memTelnetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Telnet.Send(@Key, 1);
end;

function TWindowClusterForm.GetBandModeByFreq(freq: real): TBandMode;
begin
  result.BandMHZ := -1;
  cdsBandGrid.First;
  while not cdsBandGrid.Eof do
  begin
    if (cdsBandGrid.FieldByName('BANDGRID_FREQ_BEGIN').asFloat <= freq / 1000) and (cdsBandGrid.FieldByName('BANDGRID_FREQ_END').asFloat >= freq / 1000) then
    begin
      result.BandMHZ := SimpleRoundTo(cdsBandGrid.FieldByName('BANDGRID_BAND_MHZ').asFloat, -3);
      result.ModeName := cdsBandGrid.FieldByName('BANDGRID_MODE_NAME').AsString;
      exit;
    end;
    cdsBandGrid.Next;
  end;
end;

procedure TWindowClusterForm.SaveGrid;
var
  S: string;
  i: Integer;
begin
  with dbgClusterWWW.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker), Integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos,
        Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString('dbgClusterWWW.' + Items[i].FieldName, S);
    end;
  end;
  with dbgClusterTelnet.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker), Integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos,
        Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString('dbgClusterTelnet.' + Items[i].FieldName, S);
    end;
  end;

  FormStorage.WriteString('dbgClusterTelnet.FontName', dbgClusterTelnet.Font.Name);
  FormStorage.WriteInteger('dbgClusterTelnet.FontColor', dbgClusterTelnet.Font.Color);
  FormStorage.WriteInteger('dbgClusterTelnet.FontSize', dbgClusterTelnet.Font.Size);
  FormStorage.WriteInteger('dbgClusterTelnet.FontStyle', FontStyleToInt(dbgClusterTelnet.Font.Style));
  FormStorage.WriteInteger('dbgClusterTelnet.BackgroundColor', dbgClusterTelnet.Color);
  FormStorage.WriteBoolean('dbgClusterTelnet.UseCustomColorFont', dbgClusterTelnet.DrawGraphicData);

  FormStorage.WriteString('dbgClusterWWW.FontName', dbgClusterWWW.Font.Name);
  FormStorage.WriteInteger('dbgClusterWWW.FontColor', dbgClusterWWW.Font.Color);
  FormStorage.WriteInteger('dbgClusterWWW.FontSize', dbgClusterWWW.Font.Size);
  FormStorage.WriteInteger('dbgClusterWWW.FontStyle', FontStyleToInt(dbgClusterWWW.Font.Style));
  FormStorage.WriteInteger('dbgClusterWWW.BackgroundColor', dbgClusterWWW.Color);
  FormStorage.WriteBoolean('dbgClusterWWW.UseCustomColorFont', dbgClusterWWW.DrawGraphicData);
end;

procedure TWindowClusterForm.OptionsChanged;
var
  OldItemIndex: Integer;
  i: Integer;
  iPos: Integer;
  slMemUrl: TStringList;
  slMemUrlLine: TStringList;
begin
  OldItemIndex := cbClusterTelnetUrl.ItemIndex;
  cbClusterTelnetUrl.Items.Clear;

  slMemUrl := TStringList.Create;
  slMemUrlLine := TStringList.Create;
  slMemUrlLine.QuoteChar := '"';
  slMemUrlLine.Delimiter := ',';
  slMemUrlLine.StrictDelimiter := True;
  try
    slMemUrl.Text := WindowClusterSettingsFrame.memURL.Lines.Text;
    for i := 0 to slMemUrl.Count - 1 do
    begin
      slMemUrlLine.DelimitedText := slMemUrl.Strings[i];
      cbClusterTelnetUrl.Items.Add(slMemUrlLine.Strings[0]);
    end;
  finally
    slMemUrlLine.Free;
    slMemUrl.Free;
  end;

  cbClusterTelnetUrl.ItemIndex := OldItemIndex;
  if WindowClusterSettingsFrame.spAutoLoadMinute.Value > 0 then
    timClusterWWW.Interval := WindowClusterSettingsFrame.spAutoLoadMinute.Value * 1000 * 60;
  tsClusterTelnetTelnet.TabVisible := WindowClusterSettingsFrame.WindowCluster_cbShowTelnetTab.Checked;
  StationChanged(StationId);
end;

procedure TWindowClusterForm.SendName;
var
  i: Integer;
  sName: string;
begin
  sName := StationCall;
  Telnet.SendStr(sName);
end;

procedure TWindowClusterForm.StationChanged(lParam: variant);
var
  qryStations: TKADaoTable;
  i: Integer;
  sSQL: string;
begin
  StationId := lParam;

  if bCheckNewOneForAllBook then
  begin
    qryStations := TKADaoTable.Create(nil);
    i := 0;
    try
      qryStations.Database := lDatabase;
      qryStations.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE IS_GROUP=0 ';
      qryStations.Open;
      while not qryStations.Eof do
      begin
        if i = 0 then
          sSQL := ' SELECT  LOG_MODE,LOG_BAND_MHZ, LOG_DXCC FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').asInteger)
        else
          sSQL := sSQL + ' UNION ALL SELECT  LOG_MODE,LOG_BAND_MHZ, LOG_DXCC FROM LOG_' + IntToStr(qryStations.FieldByName('STATION_ID').asInteger);
        Inc(i);
        qryStations.Next;
      end;
      DXCCSQL := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM (' + sSQL + ') WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';
    finally
      qryStations.Free;
    end;
  end
  else
    DXCCSQL := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';
end;

procedure TWindowClusterForm.CheckDXCC(Call: string);
var
  lParam, wParam: variant;
  BookMarkWWW, BookMarkTelnet: TBookMark;
  DAODatabase: TKADaoDatabase;
  qryDXCC: TKADaoTable;

begin

  DAODatabase := TKADaoDatabase.Create(nil);
  qryDXCC := TKADaoTable.Create(nil);
  qryDXCC.Database := DAODatabase;
  DAODatabase.Database := ExtractFilePath(Application.ExeName) + 'Data\Database\LogBook.mdb';
  DAODatabase.Open;
  qryDXCC.SQL.Text := DXCCSQL;

  if Call = '' then
  begin

    cdsClusterWWW.DisableControls;
    dbgClusterWWW.Enabled := False;
    cdsClusterTelnet.DisableControls;
    dbgClusterTelnet.Enabled := False;

    BookMarkWWW := cdsClusterWWW.BookMark;
    BookMarkTelnet := cdsClusterTelnet.BookMark;

    cdsClusterWWW.First;
    while not cdsClusterWWW.Eof do
    begin
      qryDXCC.Close;
      lParam := cdsClusterWWW.FieldByName('CLUSTER_CALL').AsString;
      lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
      qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);
      qryDXCC.Open;
      cdsClusterWWW.Edit;
      if qryDXCC.IsEmpty then
      begin
        cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'R';
      end
      else
      begin
        qryDXCC.First;
        if not qryDXCC.Locate('LOG_BAND_MHZ', lBand, []) then
        begin
          cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'B';
        end
        else
        begin
          qryDXCC.First;
          if not qryDXCC.Locate('LOG_MODE', lMode, []) then
          begin
            cdsClusterWWW.FieldByName('CLUSTER_COLOR').AsString := 'M';
          end;
        end;
        cdsClusterWWW.Post;
      end;
      qryDXCC.Close;
      cdsClusterWWW.Next;
    end;
    if cdsClusterWWW.BookmarkValid(BookMarkWWW) then
    begin
      cdsClusterWWW.GotoBookmark(BookMarkWWW);
      cdsClusterWWW.FreeBookmark(BookMarkWWW);
    end;
    dbgClusterWWW.Enabled := True;
    dbgClusterWWW.Repaint;

    cdsClusterTelnet.First;
    while not cdsClusterTelnet.Eof do
    begin
      qryDXCC.Close;
      lParam := cdsClusterTelnet.FieldByName('CLUSTER_CALL').AsString;
      lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
      qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);
      qryDXCC.Open;
      cdsClusterTelnet.Edit;
      if qryDXCC.IsEmpty then
      begin
        cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'R';
      end
      else
      begin
        qryDXCC.First;
        if not qryDXCC.Locate('LOG_BAND_MHZ', lBand, []) then
        begin
          cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'B';
        end
        else
        begin
          qryDXCC.First;
          if not qryDXCC.Locate('LOG_MODE', lMode, []) then
          begin
            cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'M';
          end;
        end;
        cdsClusterTelnet.Post;
      end;
      qryDXCC.Close;
      cdsClusterTelnet.Next;
    end;
    if cdsClusterTelnet.BookmarkValid(BookMarkTelnet) then
    begin
      cdsClusterTelnet.GotoBookmark(BookMarkTelnet);
      cdsClusterTelnet.FreeBookmark(BookMarkTelnet);
    end;
    dbgClusterTelnet.Enabled := True;
    dbgClusterTelnet.Repaint;

    cdsClusterWWW.EnableControls;
  end
  else
  begin
    qryDXCC.Close;
    lParam := Call;
    lDllCommand(DC_GET_CALL_DXCC_ID, Self, lParam, wParam);
    qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := StrToInt(wParam);
    qryDXCC.Open;
    cdsClusterTelnet.Edit;
    if qryDXCC.IsEmpty then
    begin
      cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'R';
    end
    else
    begin
      qryDXCC.First;
      if not qryDXCC.Locate('LOG_BAND_MHZ', lBand, []) then
      begin
        cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'B';
      end
      else
      begin
        qryDXCC.First;
        if not qryDXCC.Locate('LOG_MODE', lMode, []) then
        begin
          cdsClusterTelnet.FieldByName('CLUSTER_COLOR').AsString := 'M';
        end;
      end;
      cdsClusterTelnet.Post;
    end;
    qryDXCC.Close;
  end;

  DAODatabase.Close;
  DAODatabase.Free;
  qryDXCC.Free;

end;

procedure TWindowClusterForm.BandChanged(lParam: variant);
var
  i: Integer;
begin
  if bSetRadioSpot then
  begin
    bSetRadioSpot := False;
    exit;
  end;
  if WindowClusterSettingsFrame.WindowCluster_cbBandSync.Checked then
  begin
    for i := 0 to pgClusterWWWBands.PageCount - 1 do
      if pgClusterWWWBands.Pages[i].Caption = FormatFloat('0.##', lParam) then
      begin
        pgClusterWWWBands.ActivePage := pgClusterWWWBands.Pages[i];
        if not pnlLoading.Visible then
          SetWWWFilter;
        break;
      end;
  end;
end;

procedure TWindowClusterForm.ModeChanged(lParam: variant);
begin
  cbClusterTelnetModes.ItemIndex := cbClusterTelnetModes.Items.IndexOf(lMode);
  SetTelnetFilter;
end;

procedure TWindowClusterForm.Load;
begin
  bLoaded:=True;
  if WindowClusterSettingsFrame.WindowCluster_cbAutoLoadWWW.Checked then
    aClusterWWWDownloadExecute(aClusterWWWDownload);
  if tbClusterTelnetConnect.Down then
    aClusterTelnetConnectExecute(Self);
  SetWWWFilter;
end;

procedure TWindowClusterForm.SendSpot;
var
  Spot: string;
  sFreq: string;
  i: Integer;
begin
 if WindowClusterSettingsFrame.WindowCluster_cbShowDialogBeforeSpot.Checked then
 begin
   try
     EditClusterSpot:=TEditClusterSpot.Create(nil);
     EditClusterSpot.Caption:=aClusterSendSpot.Caption;
     EditClusterSpot.leClusterSpot.EditLabel.Caption:=dbgClusterTelnet.DataSource.DataSet.FieldByName('CLUSTER_CALL').DisplayName;
     EditClusterSpot.lbDate.Caption:=dbgClusterTelnet.DataSource.DataSet.FieldByName('CLUSTER_TIME').DisplayName;
     EditClusterSpot.lbFreq.Caption:=dbgClusterTelnet.DataSource.DataSet.FieldByName('CLUSTER_FREQ').DisplayName;
     EditClusterSpot.leDescription.EditLabel.Caption:=dbgClusterTelnet.DataSource.DataSet.FieldByName('CLUSTER_COMMENT').DisplayName;
     EditClusterSpot.btnOk.Caption:='Ok';
     EditClusterSpot.btnCancel.Caption:=btnCancel.Caption;
     if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString) <> '' then
     begin
       EditClusterSpot.leClusterSpot.Text:=ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString;
       EditClusterSpot.dtpDateTime.DateTime:=Now;
       EditClusterSpot.ceFreq.Value:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat;
     end
     else
     begin
       EditClusterSpot.leClusterSpot.Text:=ldsLog.DataSet.FieldByName('LOG_CALL').AsString;
       EditClusterSpot.dtpDateTime.DateTime:=ldsLog.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime;
       EditClusterSpot.ceFreq.Value:=ldsLog.DataSet.FieldByName('LOG_FREQ').asFloat;
     end;
     if EditClusterSpot.ShowModal=mrOk then
     begin
//      sFreq := StringReplace(FormatFloat('0.##', EditClusterSpot.ceFreq.Value),
      sFreq := FormatFloat('0.##', EditClusterSpot.ceFreq.Value);
      Spot := 'dx ' + EditClusterSpot.leClusterSpot.Text + ' ' + sFreq + ' ' + EditClusterSpot.leDescription.Text;
      Telnet.SendStr(Spot + #13#10);
      Application.ProcessMessages;
     end;
   finally
     EditClusterSpot.Free;
   end;
   exit;
 end
 else
 begin
  if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString) <> '' then
  begin
    if ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat = 0 then
    begin
      MessageBox(Application.Handle, PWideChar(msgClusterSendSpotFreqError.Caption), PWideChar(msgClusterSendError.Caption), MB_OK or MB_ICONERROR);
      exit;
    end
    else
//      sFreq := StringReplace(FormatFloat('0.##', ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat),
      sFreq := FormatFloat('0.##', ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat);
      Spot := 'dx ' + ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString + ' ' + sFreq + ' ' + ldsLogEdit.DataSet.FieldByName('LOG_COMMENT').AsString;
  end
  else
  begin
    if ldsLog.DataSet.FieldByName('LOG_FREQ').asFloat = 0 then
    begin
      MessageBox(Application.Handle, PWideChar(msgClusterSendSpotFreqError.Caption), PWideChar(msgClusterSendError.Caption), MB_OK or MB_ICONERROR);
      exit;
    end
    else
//      sFreq := StringReplace(FormatFloat('0.##', ldsLog.DataSet.FieldByName('LOG_FREQ').asFloat),
      sFreq := FormatFloat('0.##', ldsLog.DataSet.FieldByName('LOG_FREQ').asFloat);
      Spot := 'dx ' + ldsLog.DataSet.FieldByName('LOG_CALL').AsString + ' ' + sFreq + ' ' + ldsLogEdit.DataSet.FieldByName('LOG_COMMENT').AsString;
  end;

  if MessageBox(Application.Handle, PWideChar(aClusterSendSpot.Caption + ' ' + Spot + ' ?'), PWideChar(''), MB_YESNO or MB_ICONWARNING) <> IDYES then
    exit;
  end;

  Telnet.SendStr(Spot + #13#10);
  Application.ProcessMessages;
end;


procedure TWindowClusterForm.SyncColumns(Sender:TObject);
var
 i:integer;
 col:TColumnEh;

 function GetColByFieldName(Grid:TDBGridEh;FieldName:string):TColumnEh;
 var
 j:integer;
 begin
  for j := 0 to Grid.Columns.Count - 1 do
   if Grid.Columns[j].FieldName=FieldName then
    begin
      result:=Grid.Columns[j];
      exit;
    end;
 end;


begin
  if not bLoaded then Exit;

  if TDbgridEh(Sender).Name='dbgClusterTelnet'  then
  begin
   for i := 0 to dbgClusterTelnet.Columns.Count-1 do
   begin
     col:=GetColByFieldName(dbgClusterWWW,dbgClusterTelnet.Columns[i].FieldName);
     if col<>nil then
      begin
        col.Index:=dbgClusterTelnet.Columns[i].Index;
        col.Visible:=dbgClusterTelnet.Columns[i].Visible;
        col.Width:=dbgClusterTelnet.Columns[i].Width;
      end;
   end;
  end;


  if TDbgridEh(Sender).Name='dbgClusterWWW'  then
  begin
   for i := 0 to dbgClusterWWW.Columns.Count-1 do
   begin
     col:=GetColByFieldName(dbgClusterTelnet,dbgClusterWWW.Columns[i].FieldName);
     if col<>nil then
      begin
        col.Index:=dbgClusterWWW.Columns[i].Index;
        col.Visible:=dbgClusterWWW.Columns[i].Visible;
        col.Width:=dbgClusterWWW.Columns[i].Width;
      end;
   end;
  end;

end;



function TWindowClusterForm.FindLoTWeQSLCall(Call: String; FileName:String): boolean;
var
  i, j: integer;
  CallDesc: TCallDesc;
  sRes:string;
begin
  if  CallDescList=nil then exit;
  for i := 0 to CallDescList.Count - 1 do
  begin
    CallDesc := TCallDesc(CallDescList.Items[i]);
    if (UpperCase(ExtractFileName(CallDesc.FileName))=UpperCase(FileName)) then
     if CallDesc.CallList.IndexOfName(Call)<>-1 then
          begin
            result:=true;
            exit;
          end;

{      for j := 0 to CallDesc.CallList.Count - 1 do
        if UpperCase(CallDesc.CallList.Names[j]) = Call then
          begin
            result:=true;
            exit;
          end;
}
     end;
  result:=false;
end;

function TWindowClusterForm.FindCallClusterDesc(Call: String; FileName:String): string;
var
  i, j: integer;
  CallDesc: TCallDesc;
  sRes:string;
begin
  if  CallDescList=nil then exit;
  for i := 0 to CallDescList.Count - 1 do
  begin
    CallDesc := TCallDesc(CallDescList.Items[i]);
    if (UpperCase(ExtractFileName(CallDesc.FileName))=UpperCase(FileName)) then
     if CallDesc.CallList.IndexOfName(Call)<>-1 then
          begin
            result := Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])));
            exit;
          end;

{      for j := 0 to CallDesc.CallList.Count - 1 do
        if UpperCase(CallDesc.CallList.Names[j]) = Call then
          begin
            result := Trim(Copy(CallDesc.CallList.Strings[j], Pos('=', CallDesc.CallList.Strings[j]) + 1, Length(CallDesc.CallList.Strings[j])));
            exit;
          end;
}
     end;
     result := '';
end;


end.
