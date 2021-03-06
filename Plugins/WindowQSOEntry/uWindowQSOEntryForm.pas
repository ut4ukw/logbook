unit uWindowQSOEntryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExComCtrls, JvDateTimePicker, DBCtrls, Mask,
  JvExControls, JvgLabel, ExtCtrls, ActnList, DB, uPluginHeaders, pngimage,
  ImgList, TZDB, DateUtils, uUtils, JvDBLookup,
  JvExMask, JvToolEdit, JvDBLookupComboEdit, JvAutoComplete, vlDBEdit,
  JvExStdCtrls, JvCombobox, JvDBCombobox, KDaoTable, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit, uWindowPluginForm,
  LabeledControls, DTPEx, JvComponentBase, JvFormPlacement, Character, Contnrs,
  JvMemoryDataset, Menus, JvMenus, JvDBControls, vlDBEditCombo, uColors, Buttons,
  ToolWin, JvArrowButton, StrUtils, JvAppIniStorage;

type

  TWindowQSOEntryForm = class(TWindowPluginForm)
    lbOperator: TLabel;
    lbQTH: TLabel;
    lbDate: TLabel;
    cbRealTime: TCheckBox;
    timTime: TTimer;
    pnlCallInfo: TPanel;
    imgTime: TImage;
    ilTime: TImageList;
    lbsTime: TLabel;
    lbDXCC: TLabel;
    lbDXCCBand: TLabel;
    lbDXCCMode: TLabel;
    dsNames: TDataSource;
    dsQTH: TDataSource;
    dbeOperator: TvlDBEdit;
    dbeQTH: TvlDBEdit;
    qryDXCC: TKADaoTable;
    ldeCall: TLabeledDBEdit;
    ldeReportFrom: TLabeledDBComboBox;
    ldeReportTo: TLabeledDBComboBox;
    dtpDateTime: TDateTimePickerEx;
    pnlMainData: TPanel;
    pnlBottomData: TPanel;
    pnlCenter: TPanel;
    pnlLeftData: TPanel;
    FormStorage: TJvFormStorage;
    ldeField1: TvlDBEditCombo;
    ldeField3: TvlDBEditCombo;
    ldeField4: TvlDBEditCombo;
    pcBottomData: TPageControl;
    tsQSOComments: TTabSheet;
    tsQSL: TTabSheet;
    tsUserDefined: TTabSheet;
    dbmComment: TLabeledDBMemo;
    ldeField5: TvlDBEditCombo;
    ldeField2: TvlDBEditCombo;
    cbRequestQSL: TCheckBox;
    ldeQSLMessage: TLabeledDBEdit;
    alQSOEntry: TActionList;
    aQSOEntryCommentsPage: TAction;
    aQSOEntryQSLPage: TAction;
    aQSOEntryUserDefinedPage: TAction;
    aQSOEntrySetFocus: TAction;
    FormStorageOnExit: TJvFormStorage;
    imgManagerMore: TImage;
    dbeQSLVia: TLabeledDBEdit;
    cbQSLVia: TComboBox;
    lbQSLVia: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lbTerritory: TLabel;
    lbDistance: TLabel;
    Image2: TImage;
    lbBearing: TLabel;
    Label5: TLabel;
    tsQSOInformation: TTabSheet;
    memQSOInformation: TMemo;
    aQSOEntryInformationPage: TAction;
    dsLog: TDataSource;
    cdsNames: TJvMemoryData;
    cdsQTH: TJvMemoryData;
    cdsNamesOPERATOR_NAME: TStringField;
    cdsQTHQTH_NAME: TStringField;
    pmInternetInfo: TJvPopupMenu;
    N1111: TMenuItem;
    N2221: TMenuItem;
    aQSOEntryGetInternetInfo: TAction;
    Splitter1: TSplitter;
    qryBandGridFreq: TKADaoTable;
    qryBandGridFreqBANDGRID_ID: TAutoIncField;
    qryBandGridFreqBANDGRID_BAND_MHZ: TFloatField;
    qryBandGridFreqBANDGRID_MODE_NAME: TStringField;
    qryBandGridFreqBANDGRID_FREQ_BEGIN: TFloatField;
    qryBandGridFreqBANDGRID_FREQ_END: TFloatField;
    qryModes: TKADaoTable;
    tsStatistics: TTabSheet;
    ldeField6: TvlDBEditCombo;
    ldeField7: TvlDBEditCombo;
    ldeField8: TvlDBEditCombo;
    ldeField9: TvlDBEditCombo;
    aQSOEntryStatisticsPage: TAction;
    procedure timTimeTimer(Sender: TObject);
    procedure cbRealTimeClick(Sender: TObject);
    procedure dtpQSODateChange(Sender: TObject);
    procedure ldeCallChange(Sender: TObject);
    procedure ldeReportFromKeyPress(Sender: TObject; var Key: Char);
    procedure ldeReportToKeyPress(Sender: TObject; var Key: Char);
    procedure dtpQSOTimeKeyPress(Sender: TObject; var Key: Char);
    procedure dbeOperatorCloseUp(Sender: TObject);
    procedure dbeQTHCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure cbRequestQSLClick(Sender: TObject);
    procedure aQSOEntryCommentsPageExecute(Sender: TObject);
    procedure aQSOEntryQSLPageExecute(Sender: TObject);
    procedure aQSOEntryUserDefinedPageExecute(Sender: TObject);
    procedure tsQSOCommentsShow(Sender: TObject);
    procedure tsQSLShow(Sender: TObject);
    procedure aQSOEntrySetFocusExecute(Sender: TObject);
    procedure cbQSLViaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbQSLViaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ldeField1Change(Sender: TObject);
    procedure aQSOEntryInformationPageExecute(Sender: TObject);
    procedure dsLogDataChange(Sender: TObject; Field: TField);
    procedure cdsNamesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cdsQTHFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbeOperatorShowList(Sender: TObject);
    procedure dbmCommentChange(Sender: TObject);
    procedure aQSOEntryGetInternetInfoExecute(Sender: TObject);
    procedure pmInternetInfo1Popup(Sender: TObject);
    procedure pmInternetInfoPopup(Sender: TObject);
    procedure dbeOperatorExit(Sender: TObject);
    procedure dbeOperatorHideList(Sender: TObject);
    procedure dbeQTHHideList(Sender: TObject);
    function isCallsign:boolean;
    procedure ldeCallKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aQSOEntryStatisticsPageExecute(Sender: TObject);
    procedure tsStatisticsShow(Sender: TObject);
    procedure FieldChange(Sender:TObject);
    procedure ldeField1ChangeDataField(Sender: TObject);
    procedure ldeField2ChangeDataField(Sender: TObject);
    procedure ldeField3ChangeDataField(Sender: TObject);
    procedure ldeField4ChangeDataField(Sender: TObject);
    procedure ldeField5ChangeDataField(Sender: TObject);
    procedure ldeField6ChangeDataField(Sender: TObject);
    procedure ldeField7ChangeDataField(Sender: TObject);
    procedure ldeField8ChangeDataField(Sender: TObject);
    procedure ldeField9ChangeDataField(Sender: TObject);
  private
    vKey: Char;
    sOldKeyboardLayout: string;
    CurrMode: string;
    CurrBand: real;
    sCurrentCallAdif: string;
    StationId: Integer;
    function GetNowDateUTCTime: TDateTime;
    function GetFocusedComponent: TComponent;
    procedure CNKeydown(var Message: TWMKey); message CM_CHILDKEY;
    procedure FindCallDesc(aCallSign: string = '');
  public
    sLangList: TStringList;
    EscAction: TAction;
    procedure ModeChanged;
    procedure BandChanged(Band: real);
    procedure NewQSO;
    procedure EditQSO(lParam, wParam: variant);
    procedure aSaveQSOUpdate(Sender: TObject);
    procedure CallChanged(vCallInfo: variant);
    procedure OptionsChanged;
    procedure StationChanged(StationGroupId: Integer; lParam: variant);
    procedure CallInfo(vManages: variant);
    procedure ReadSettingsFocus;
    procedure Init;
    procedure DeInit;
    procedure InitGridColors;
  end;

var
  WindowQSOEntryForm: TWindowQSOEntryForm;

implementation

uses uWindowQSOEntry;
{$R *.dfm}

procedure TWindowQSOEntryForm.FormActivate(Sender: TObject);
begin
  if Self.Visible and ldeCall.CanFocus then
    ldeCall.SetFocus;
end;

procedure TWindowQSOEntryForm.FormCreate(Sender: TObject);
begin
  inherited;
  sLangList := TStringList.Create;
  sLangList.Delimiter := ';';
  sCurrentCallAdif := '-1';
end;

procedure TWindowQSOEntryForm.FormDestroy(Sender: TObject);
begin
  sLangList.Free;
end;

procedure TWindowQSOEntryForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vParam: variant;
begin
  // vParam := 0;
  { if (Key = 13) and WindowQSOEntrySettingsFrame.WindowQSOEntry_cbSaveRecordOnEnter.Checked and (Trim(ldeCall.Text) <> '') and (Trim(ldeReportFrom.Text) <> '') and (Trim(ldeReportTo.Text) <> '') and (Trim(dbeOperator.Text) <> '') and (Trim(dbeQTH.Text) <> '') then
    lDllCommand(DC_SAVE_QSO, Self, vParam, vParam); }
end;

procedure TWindowQSOEntryForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TWinControl then
      TWinControl(Self.Components[i]).TabStop := False;
end;

function TWindowQSOEntryForm.GetNowDateUTCTime: TDateTime;
var
  UTC: TSystemTime;
begin
  GetSystemTime(UTC);
  Result := SystemTimeToDateTime(UTC);
end;

procedure TWindowQSOEntryForm.ldeCallChange(Sender: TObject);
var
  lParam, wParam: variant;
begin
//  if     ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString = ldeCall.Text then exit;
  
  if ldsLogEdit.DataSet.State in [dsInsert, dsEdit] then
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := ldeCall.Text;
  lParam := ldeCall.Text;
  wParam := 0;

  lDllCommand(DC_CALL_CHANGED, nil, lParam, wParam);

  lbDXCC.Font.Color := clSilver;
  lbDXCCBand.Font.Color := clSilver;
  lbDXCCMode.Font.Color := clSilver;
  lbTerritory.Caption := ldsLogEdit.DataSet.FieldByName('LOG_COUNTRY').AsString;
  lbTerritory.Font.Style := [];
  lbTerritory.Font.Color := clWindowText;
  // FindCallDesc;
  if (ldsLogEdit.DataSet.FieldByName('LOG_DXCC').asInteger <> -1) and (ldeCall.Text <> '') and (ldsLogEdit.DataSet.State = dsInsert) then
  begin
    qryDXCC.Params.ParamByName('LOG_DXCC').asInteger := ldsLogEdit.DataSet.FieldByName('LOG_DXCC').asInteger;
    qryDXCC.Open;
    if qryDXCC.IsEmpty then
    begin
      // lbDXCC.Font.Color := clRed
      lbTerritory.Font.Color := 3947775;
      lbTerritory.Font.Style := [fsBold];
    end
    else
    begin
      qryDXCC.First;
      if not qryDXCC.Locate('LOG_BAND_MHZ', CurrBand, []) then
      begin
        // lbDXCCBand.Font.Color := clRed
        lbTerritory.Font.Color := 16747546;
        lbTerritory.Font.Style := [fsBold];
      end

      else
      begin
        qryDXCC.First;
        if not qryDXCC.Locate('LOG_MODE', CurrMode, []) then
        begin
          // lbDXCCMode.Font.Color := clRed;
          lbTerritory.Font.Color := 40704;
          lbTerritory.Font.Style := [fsBold];
        end;
      end;
    end;
    qryDXCC.Close;
  end;
end;

procedure TWindowQSOEntryForm.ldeCallKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then
  isCallSign();

end;

function TWindowQSOEntryForm.isCallsign:boolean;
var
 i:integer;
 str,sMode:string;
 Freq:real;
 lParam,wParam:variant;
begin
 str:=ldeCall.Text;
  try
   Freq:=StrToFloat(str);
//   DupeString('0',Length(str)-)
//   if True then
   qryBandGridFreq.Close;
   qryBandGridFreq.Params.ParamByName('freq').asFloat:=Freq/1000;
   qryBandGridFreq.Open;
   if qryBandGridFreq.IsEmpty then
    sMode:='SSB'
   else
    sMode:=qryBandGridFreq.FieldByName('BANDGRID_MODE_NAME').AsString;

   lParam:=Freq * 1000;
   wParam:=sMode;
   lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);

   lParam := sMode;
   lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
   lParam := qryBandGridFreq.FieldByName('BANDGRID_BAND_MHZ').AsFloat;
   wParam := Freq * 1000;
   lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
   ldeCall.Text:='';
   result:=false;
   exit;
  except

  end;

  if not qryModes.Active then
  qryModes.Open;
  qryModes.First;
  if qryModes.Locate('MODE_NAME',str,[]) then
   begin
     lParam:=str;
     lDllCommand(DC_MODE_CHANGED, nil, lParam, wParam);
     ldeCall.Text:='';
     result:=false;
     exit;
   end;

  result:=true;
end;


procedure TWindowQSOEntryForm.ldeField1Change(Sender: TObject);
var
  Distance, Bearing: Double;
  Coord: TCoordinate;
begin
  if not(ldsLogEdit.DataSet.State in [dsInsert, dsEdit]) then
    exit;
{  Coord := GridToCoordinate(ldeLocator.Text);
  ldsLogEdit.DataSet.FieldByName('LOG_LAT').AsString := FloatToStr(Coord.Lat);
  ldsLogEdit.DataSet.FieldByName('LOG_LON').AsString := FloatToStr(Coord.Lon);

  getBearing(ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').AsFloat, ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').AsFloat, Coord.Lat, Coord.Lon,
    Distance, Bearing);
  ldsLogEdit.DataSet.FieldByName('LOG_DISTANCE').AsFloat:=Round(Distance / 1000);
  lbDistance.Caption := FormatFloat('0.00', ldsLogEdit.DataSet.FieldByName('LOG_DISTANCE').AsFloat) + 'km';

  ldsLogEdit.DataSet.FieldByName('LOG_ANT_AZ').AsFloat := Bearing;
  lbBearing.Caption := FormatFloat('0.00', Bearing) + '�';}
end;

procedure TWindowQSOEntryForm.ldeField1ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField2ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField3ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField4ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField5ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField6ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField7ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField8ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure TWindowQSOEntryForm.ldeField9ChangeDataField(Sender: TObject);
begin
 FieldChange(Sender);
end;

procedure PressKey(Key: Word);
begin
  keybd_event(Key, 0, 0, 0);
end;

procedure ReleaseKey(Key: Word);
begin
  keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TWindowQSOEntryForm.NewQSO;
var
  NowDate: TDateTime;
begin
  ldeCall.Color := clWindow;
  Color:=clBtnFace;
  ldeReportTo.DataSource.DataSet.FieldByName(ldeReportTo.DataField).AsString := ldeReportTo.Items.Strings[0];
  ldeReportFrom.DataSource.DataSet.FieldByName(ldeReportFrom.DataField).AsString := ldeReportFrom.Items.Strings[0];
  cbRealTime.Checked := True;
  timTime.Enabled := True;
  NowDate := GetNowDateUTCTime;
  dtpDateTime.DateTime := NowDate;
  cbRequestQSL.Checked := False;
  cbQSLVia.Items.Clear;
  dbeQSLVia.Color := clWindow;
  dbeQSLVia.Text := '';
  lbDistance.Caption := '';
  lbBearing.Caption := '';
  lbTerritory.Caption:='';
  memQSOInformation.Lines.Clear;
  { dtpQSODate.Date := NowDate;
    dtpQSOTime.Time := NowDate;
    dtpQSODate.Time := dtpQSOTime.Time; }
  ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime := dtpDateTime.DateTime;
  { ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime :=dtpDateTime.Date;
    ldsLogEdit.DataSet.FieldByName('LOG_QSO_TIME').AsDateTime :=dtpDateTime.Time; }
  ModeChanged;
  // pcBottomData.ActivePage:=tsQSOComments;
  if Self.Visible and ldeCall.CanFocus then
    ldeCall.SetFocus;
end;

procedure TWindowQSOEntryForm.EditQSO(lParam, wParam: variant);
var
  qryTemp: TKADaoTable;
  i: Integer;
begin
  // parent.caption:=Caption+TAction(lActionList.Actions[CA_EDIT_QSO]).Caption;
  // Panel1.Visible:=True;
{  if wParam <> 0 then
  begin
    qryTemp := TKADaoTable.Create(nil);
    try
      qryTemp.Database := lDatabase;
      qryTemp.SQL.Text := 'SELECT * FROM LOG_' + IntToStr(wParam) + ' WHERE LOG_ID=' + IntToStr(lParam);
      qryTemp.Open;
      ldsLogEdit.DataSet.Cancel;
      ldsLogEdit.DataSet.Edit;
      for i := 0 to ldsLogEdit.DataSet.FieldCount - 1 do
        if ldsLogEdit.DataSet.Fields[i].FieldName = 'STATION_ID' then
          ldsLogEdit.DataSet.Fields[i].asInteger := wParam
        else
          ldsLogEdit.DataSet.Fields[i].Value := qryTemp.FieldByName(ldsLogEdit.DataSet.Fields[i].FieldName).Value;
    finally
      FreeAndNil(qryTemp);
    end;
  end;}

  pcBottomData.ActivePage := tsQSOComments;
//  ldeCall.Color := clYellow;
  Color := clSilver;
  cbQSLVia.Items.Clear;
  dbeQSLVia.Color := clWindow;
  timTime.Enabled := False;
  cbRealTime.Checked := False;
  dtpDateTime.DateTime := ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime;
  { dtpQSODate.Date := ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime;
    dtpQSOTime.Time := ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime; }
  if Self.Visible and ldeCall.CanFocus then
    ldeCall.SetFocus;
end;

procedure TWindowQSOEntryForm.ModeChanged;
var
  qrtTmp: TKADaoTable;
begin
  CurrMode := lMode;
  qrtTmp := TKADaoTable.Create(nil);
  qrtTmp.Database := lDatabase;
  try
    qrtTmp.SQL.Text := 'SELECT * FROM MODES WHERE MODE_NAME=' + QuotedStr(CurrMode);
    qrtTmp.Open;
    ldeReportFrom.Items.Clear;
    ldeReportTo.Items.Clear;
    if (CurrMode <> 'SSB') and (CurrMode <> 'AM') and (CurrMode <> 'FM') then
    begin
      ldeReportFrom.Items.Add('599');
      ldeReportFrom.Items.Add('589');
      ldeReportFrom.Items.Add('579');
      ldeReportFrom.Items.Add('569');
      ldeReportFrom.Items.Add('559');
      ldeReportTo.Items.Add('599');
      ldeReportTo.Items.Add('589');
      ldeReportTo.Items.Add('579');
      ldeReportTo.Items.Add('569');
      ldeReportTo.Items.Add('559');
    end
    else
    begin
      ldeReportFrom.Items.Add('59');
      ldeReportFrom.Items.Add('58');
      ldeReportFrom.Items.Add('57');
      ldeReportFrom.Items.Add('56');
      ldeReportFrom.Items.Add('55');
      ldeReportTo.Items.Add('59');
      ldeReportTo.Items.Add('58');
      ldeReportTo.Items.Add('57');
      ldeReportTo.Items.Add('56');
      ldeReportTo.Items.Add('55');
    end;
    if ldeReportFrom.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString) <> -1 then
      ldeReportFrom.ItemIndex := ldeReportFrom.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)
    else
    begin
      ldeReportFrom.Items.Insert(0, qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString);
      ldeReportFrom.ItemIndex := 0;
    end;

    if ldeReportTo.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString) <> -1 then
      ldeReportTo.ItemIndex := ldeReportTo.Items.IndexOf(qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString)
    else
    begin
      ldeReportTo.Items.Insert(0, qrtTmp.FieldByName('MODE_DEFAULT_REPORT').AsString);
      ldeReportTo.ItemIndex := 0;
    end;
  finally
    qrtTmp.Free;
  end;
  if ldeReportTo.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    ldeReportTo.DataSource.DataSet.FieldByName(ldeReportTo.DataField).AsString := ldeReportTo.Items.Strings[ldeReportTo.ItemIndex];
    ldeReportFrom.DataSource.DataSet.FieldByName(ldeReportFrom.DataField).AsString := ldeReportFrom.Items.Strings[ldeReportFrom.ItemIndex];
  end;
end;

procedure TWindowQSOEntryForm.BandChanged(Band: real);
begin
  CurrBand := Band;
end;

procedure TWindowQSOEntryForm.Button1Click(Sender: TObject);
begin
  inherited;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataSource;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataField;
  TLabeledDBEdit(Self.FindComponent('ldeIota')).DataField;
end;

procedure TWindowQSOEntryForm.timTimeTimer(Sender: TObject);
var
  NowDate: TDateTime;
  Hour, Min, Sec, Milli: Word;
begin
  NowDate := GetNowDateUTCTime;
  DecodeTime(NowDate, Hour, Min, Sec, Milli);
  if Sec = 0 then
  begin
    dtpDateTime.DateTime := NowDate;
    { dtpQSODate.Date := NowDate;
      dtpQSOTime.Time := NowDate;
      dtpQSODate.Time := dtpQSOTime.Time; }
  end;

  if ldsLogEdit.DataSet.State in [dsInsert, dsEdit] then
    ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime := dtpDateTime.DateTime;
end;

procedure TWindowQSOEntryForm.tsQSLShow(Sender: TObject);
begin
  if cbRequestQSL.Visible and Self.Visible and cbRequestQSL.CanFocus then
    cbRequestQSL.SetFocus;
end;

procedure TWindowQSOEntryForm.tsQSOCommentsShow(Sender: TObject);
begin
  if dbmComment.Visible and Self.Visible and dbmComment.CanFocus then
    dbmComment.SetFocus;
end;

procedure TWindowQSOEntryForm.tsStatisticsShow(Sender: TObject);
begin
  if ldeField6.Visible and Self.Visible and ldeField6.CanFocus then
    ldeField6.SetFocus;
end;

procedure TWindowQSOEntryForm.cbQSLViaClick(Sender: TObject);
var
  iPos: Integer;
begin
  if cbQSLVia.Items.Count > 0 then
  begin
    iPos := Pos(';', cbQSLVia.Items.Strings[cbQSLVia.ItemIndex]);
    // if iPos>0 then
    dbeQSLVia.Text := Copy(cbQSLVia.Items.Strings[cbQSLVia.ItemIndex], 1, iPos - 1);
    dbeQSLVia.DataSource.DataSet.FieldByName(dbeQSLVia.DataField).AsString := dbeQSLVia.Text;
    // ldcbQSLVia.DataSource.DataSet.FieldByName(ldcbQSLVia.DataField).AsString:=dbeQSLVia.Text;
  end;
end;

procedure TWindowQSOEntryForm.cbQSLViaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  strVal, strAll: string;
  pos1, pos2: Integer;
  rc: TRect;
  arrWidth: array [0 .. 2] of Integer;
begin
  cbQSLVia.Canvas.Brush.Style := bsSolid;
  cbQSLVia.Canvas.FillRect(Rect);
  strAll := cbQSLVia.Items[Index];

  arrWidth[0] := 0;
  arrWidth[1] := 100; // Width of column 1
  arrWidth[2] := 200; // Width of column 2

  rc.Left := Rect.Left + arrWidth[0] + 2;
  rc.Right := Rect.Left + arrWidth[1] - 2;
  rc.Top := Rect.Top;
  rc.Bottom := Rect.Bottom;

  pos1 := Pos(';', strAll);
  strVal := Copy(strAll, 1, pos1 - 1);
  cbQSLVia.Canvas.TextRect(rc, rc.Left, rc.Top, strVal);
  cbQSLVia.Canvas.MoveTo(rc.Right, rc.Top);
  cbQSLVia.Canvas.LineTo(rc.Right, rc.Bottom);

  rc.Left := Rect.Left + arrWidth[1] + 2;
  rc.Right := Rect.Left + arrWidth[2] - 2;

  strAll := Copy(strAll, pos1 + 1, Length(strAll) - pos1);
  pos1 := Pos(';', strAll);
  strVal := Copy(strAll, 1, pos1 - 1);

  cbQSLVia.Canvas.TextRect(rc, rc.Left, rc.Top, strVal);
  cbQSLVia.Canvas.MoveTo(rc.Right, rc.Top);
  cbQSLVia.Canvas.LineTo(rc.Right, rc.Bottom);
  rc.Left := Rect.Left + arrWidth[2] + 2;
  strAll := Copy(strAll, pos1 + 1, Length(strAll) - pos1);
  pos1 := Pos(';', strAll);
  strVal := Copy(strAll, 1, pos1 - 1);
  cbQSLVia.Canvas.TextRect(rc, rc.Left, rc.Top, strVal);
end;

procedure TWindowQSOEntryForm.cbRealTimeClick(Sender: TObject);
begin
  timTime.Enabled := cbRealTime.Checked;
end;

procedure TWindowQSOEntryForm.cbRequestQSLClick(Sender: TObject);
begin
  if ldsLogEdit.DataSet.State in [dsInsert] then
    if cbRequestQSL.Checked then
      ldsLogEdit.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'R'
    else
      ldsLogEdit.DataSet.FieldByName('LOG_QSL_SENT').AsString := 'N';
end;

procedure TWindowQSOEntryForm.cdsNamesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  s: string;
begin
  s := Trim(dbeOperator.FilterStr);
  if s = '' then
    Accept := True
  else
    Accept := Pos(AnsiUpperCase(s), AnsiUpperCase(Trim(cdsNames.FieldByName('OPERATOR_NAME').AsString))) = 1;
end;

procedure TWindowQSOEntryForm.cdsQTHFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  s: string;
begin
  s := Trim(dbeQTH.FilterStr);
  if s = '' then
    Accept := True
  else
    Accept := Pos(AnsiUpperCase(s), AnsiUpperCase(Trim(cdsQTH.FieldByName('QTH_NAME').AsString))) = 1;
end;

procedure TWindowQSOEntryForm.ldeReportFromKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Self.Visible then
      ldeReportTo.SetFocus;
    Key := #0;
  end;
end;

procedure TWindowQSOEntryForm.ldeReportToKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Self.Visible then
      dbeOperator.SetFocus;
    Key := #0;
  end;
end;

procedure TWindowQSOEntryForm.dbeOperatorCloseUp(Sender: TObject);
begin
  if Self.Visible then
    dbeQTH.SetFocus;

  if EscAction <> nil then
    EscAction.ShortCut := TextToShortCut('Esc');
end;

procedure TWindowQSOEntryForm.dbeOperatorExit(Sender: TObject);
begin
  if EscAction <> nil then
    EscAction.ShortCut := TextToShortCut('Esc');
end;

procedure TWindowQSOEntryForm.dbeOperatorHideList(Sender: TObject);
begin
  if EscAction <> nil then
    EscAction.ShortCut := TextToShortCut('Esc');
end;

procedure TWindowQSOEntryForm.dbeOperatorShowList(Sender: TObject);
var
  i: Integer;
begin

  for i := 0 to lActionList.ActionCount - 1 do
  begin
    if ShortCutToText(TAction(lActionList.Actions[i]).ShortCut) = 'Esc' then
    begin
      EscAction := TAction(lActionList.Actions[i]);
      TAction(lActionList.Actions[i]).ShortCut := TextToShortCut('');
    end;
  end;
end;

procedure TWindowQSOEntryForm.dbeQTHCloseUp(Sender: TObject);
begin
  if Self.Visible then
    ldeCall.SetFocus;
end;

procedure TWindowQSOEntryForm.dbeQTHHideList(Sender: TObject);
begin
  if EscAction <> nil then
    EscAction.ShortCut := TextToShortCut('Esc');
end;

procedure TWindowQSOEntryForm.dbmCommentChange(Sender: TObject);
begin
  if dbmComment.DataSource.DataSet.State in [dsEdit, dsInsert] then
    dbmComment.DataSource.DataSet.FieldByName(dbmComment.DataField).AsString := dbmComment.Lines.Text;
end;

procedure TWindowQSOEntryForm.dsLogDataChange(Sender: TObject; Field: TField);
begin
  { if not bLoaded or not bSyncBrowse then
    exit; }
end;

procedure TWindowQSOEntryForm.dtpQSODateChange(Sender: TObject);
begin
  ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATETIME').AsDateTime := dtpDateTime.DateTime;
end;

procedure TWindowQSOEntryForm.dtpQSOTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 32 then
  begin
    if Self.Visible then
      ldeCall.SetFocus;
    Key := #0;
  end;
end;

procedure TWindowQSOEntryForm.aQSOEntryCommentsPageExecute(Sender: TObject);
begin
  pcBottomData.ActivePage := tsQSOComments;
  tsQSOCommentsShow(Self);
end;

procedure TWindowQSOEntryForm.aQSOEntryGetInternetInfoExecute(Sender: TObject);
var
  aPoint, vPoint: TPoint;

begin
  aPoint.X := ldeCall.Left + ldeCall.Width;
  aPoint.Y := ldeCall.Top;
  vPoint := ClientToScreen(aPoint);
  pmInternetInfo.Popup(vPoint.X, vPoint.Y);
  PostMessage(pmInternetInfo.Handle, WM_KEYDOWN, VK_DOWN, 0);
  PostMessage(pmInternetInfo.Handle, WM_KEYUP, VK_DOWN, 0);
end;

procedure TWindowQSOEntryForm.aQSOEntryInformationPageExecute(Sender: TObject);
begin
  pcBottomData.ActivePage := tsQSOInformation;
  tsQSOCommentsShow(Self);
end;

procedure TWindowQSOEntryForm.aQSOEntryQSLPageExecute(Sender: TObject);
begin
  pcBottomData.ActivePage := tsQSL;
  tsQSLShow(Self);
end;

procedure TWindowQSOEntryForm.aQSOEntrySetFocusExecute(Sender: TObject);
begin
  if Self.Visible and ldeCall.CanFocus and ldeCall.Visible then
    ldeCall.SetFocus;
end;

procedure TWindowQSOEntryForm.aQSOEntryStatisticsPageExecute(Sender: TObject);
begin
  pcBottomData.ActivePage := tsStatistics;
  tsStatisticsShow(Self);
end;

procedure TWindowQSOEntryForm.aQSOEntryUserDefinedPageExecute(Sender: TObject);
begin
  pcBottomData.ActivePage := tsUserDefined;
end;

procedure TWindowQSOEntryForm.aSaveQSOUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ldeCall.Text <> '';
end;

procedure TWindowQSOEntryForm.CallChanged(vCallInfo: variant);
Var
  CallTime: TTimeZone;
  Hour, Min, Sec, Milli: Word;
  TZ: String;
  pCall: PCallInfo;
  Distance, Bearing: Double;
begin
  TZ := '';
  imgManagerMore.Visible := False;
  sCurrentCallAdif := '-1';
  pCall := TVarData(vCallInfo).VPointer;
  if pCall <> nil then
  begin
    TZ := pCall.PrefixData.TZ;
    sCurrentCallAdif := pCall.PrefixData.ADIF;

    Distance := 0;
    Bearing := 0;
    if (pCall <> nil) and bAutoGetCallPrimaryData and not bCallMistake then
    begin
      ldsLogEdit.DataSet.FieldByName('LOG_LAT').AsString := FloatToStr(pCall.PrefixData.Location.Y / 180);
      ldsLogEdit.DataSet.FieldByName('LOG_LON').AsString := FloatToStr(pCall.PrefixData.Location.X / 180);
      getBearing(ldsLogEdit.DataSet.FieldByName('LOG_MY_LAT').AsFloat, ldsLogEdit.DataSet.FieldByName('LOG_MY_LON').AsFloat,
        pCall.PrefixData.Location.Y / 180, pCall.PrefixData.Location.X / 180, Distance, Bearing);
      ldsLogEdit.DataSet.FieldByName('LOG_GRIDSQUARE').AsString := CoordinateToGrid(pCall.PrefixData.Location.Y / 180,
        pCall.PrefixData.Location.X / 180)
    end;

    lbDistance.Caption := FormatFloat('0.00', Distance / 1000) + 'km';
    lbBearing.Caption := FormatFloat('0.00', Bearing) + '�';
    // ShowMessage(pCall.ManagersList[0]);
  end;

  try
    if TZ <> '' then
    begin
      if Pos('>', TZ) > 0 then
        CallTime := TBundledTimeZone.Create(Copy(TZ, 1, Pos('>', TZ) - 1))
      else if Pos(',', TZ) > 0 then
        CallTime := TBundledTimeZone.Create(Copy(TZ, 1, Pos(',', TZ) - 1))
      else
        CallTime := TBundledTimeZone.Create(TZ);
      CallTime.ToLocalTime(GetNowDateUTCTime);
      DecodeTime(CallTime.ToLocalTime(GetNowDateUTCTime), Hour, Min, Sec, Milli);
      if (Hour >= 0) and (Hour <= 6) then
      begin
        ilTime.GetIcon(0, imgTime.Picture.Icon);
        lbsTime.Caption := 'GN';
      end;
      if (Hour > 6) and (Hour <= 11) then
      begin
        ilTime.GetIcon(1, imgTime.Picture.Icon);
        lbsTime.Caption := 'GM';
      end;
      if (Hour > 11) and (Hour <= 18) then
      begin
        ilTime.GetIcon(2, imgTime.Picture.Icon);
        lbsTime.Caption := 'GD';
      end;
      if (Hour > 18) and (Hour <= 24) then
      begin
        ilTime.GetIcon(3, imgTime.Picture.Icon);
        lbsTime.Caption := 'GE';
      end;
    end
    else
    begin
      imgTime.Picture := nil;
      lbsTime.Caption := '';
    end;
  except
    imgTime.Picture := nil;
    lbsTime.Caption := '';
  end;
end;

procedure TWindowQSOEntryForm.OptionsChanged;
var
  i: Integer;
  ListItem: TListItem;
  lParam,wParam:variant;
begin
  pnlLeftData.Visible := WindowQSOEntrySettingsFrame.WindowQSOEntry_cbShowRightPanel.Checked;
  pnlBottomData.Visible := WindowQSOEntrySettingsFrame.WindowQSOEntry_cbShowBottomPanel.Checked;
  StationChanged(StationGroupId, StationId);
  for i := 0 to ldsLog.DataSet.FieldCount - 1 do
  begin
    WindowQSOEntrySettingsFrame.cdsFieldsAdd.Append;
    WindowQSOEntrySettingsFrame.cdsFieldsAdd.FieldByName('FIELD_NAME').AsString := ldsLog.DataSet.Fields[i].DisplayLabel;
    WindowQSOEntrySettingsFrame.cdsFieldsAdd.FieldByName('FIELD_VISIBLE').AsBoolean := False;
    WindowQSOEntrySettingsFrame.cdsFieldsAdd.FieldByName('FIELD_ENABLED').AsBoolean := False;
    WindowQSOEntrySettingsFrame.cdsFieldsAdd.Post;

    WindowQSOEntrySettingsFrame.lbAddFieldsAvaible.Items.AddObject(ldsLog.DataSet.Fields[i].DisplayLabel, TField(ldsLog.DataSet.Fields[i]));

    { ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvAddControls.Items.Add;
      ListItem.Caption:=ldsLog.DataSet.Fields[i].DisplayLabel;
      ListItem.Data := TField(ldsLog.DataSet.Fields[i]); }
  end;
  WindowQSOEntrySettingsFrame.lbAddFieldsAvaible.Sorted := True;
  { for i:=0 to ComponentCount-1 do
    if Components[i] is TWinControl then
    begin
    if Components[i] is TLabeledDBEdit then
    if Components[i].Name='dbeQSLVia' then
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(lbQSLVia.Caption,TObject(Components[i]))
    else
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(TLabeledDBEdit(Components[i]).EditLabel.Caption,TObject(Components[i]));
    if Components[i] is TLabeledDBComboBox then
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(TLabeledDBComboBox(Components[i]).EditLabel.Caption,TObject(Components[i]));
    if Components[i] is TCheckBox then
    if TCheckBox(Components[i]).Caption<>'' then
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(TCheckBox(Components[i]).Caption,TObject(Components[i]));
    if Components[i] is TLabeledDBMemo then
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(TLabeledDBMemo(Components[i]).EditLabel.Caption,TObject(Components[i]));
    if Components[i] is TDateTimePickerEx then
    WindowQSOEntrySettingsFrame.WindowQSOEntry_lbControlFocus.Items.AddObject(lbDate.Caption,TObject(Components[i]));
    end; }
  lDllCommand(DC_GET_TRANSLATE_FILE, Self, lParam, wParam);


  InitGridColors;
  ldeField1.GridColorList := GridColorList;
  ldeField1.Init(VarToStr(lParam));

  ldeField2.GridColorList := GridColorList;
  ldeField2.Init(VarToStr(lParam));

  ldeField3.GridColorList := GridColorList;
  ldeField3.Init(VarToStr(lParam));

  ldeField4.GridColorList := GridColorList;
  ldeField4.Init(VarToStr(lParam));

  ldeField5.GridColorList := GridColorList;
  ldeField5.Init(VarToStr(lParam));

  ldeField6.GridColorList := GridColorList;
  ldeField6.Init(VarToStr(lParam));
  ldeField7.GridColorList := GridColorList;
  ldeField7.Init(VarToStr(lParam));
  ldeField8.GridColorList := GridColorList;
  ldeField8.Init(VarToStr(lParam));
  ldeField9.GridColorList := GridColorList;
  ldeField9.Init(VarToStr(lParam));


end;

procedure TWindowQSOEntryForm.pmInternetInfo1Popup(Sender: TObject);
begin
  HiliteMenuItem(Handle, { Identifies the window that contains the menu }
    pmInternetInfo.WindowHandle, 1, { menu item to highlight }
    MF_BYPOSITION or MF_HILITE);
end;

procedure TWindowQSOEntryForm.pmInternetInfoPopup(Sender: TObject);
begin
  HiliteMenuItem(pmInternetInfo.WindowHandle, { Identifies the window that contains the menu }
    Handle, 1, { menu item to highlight }
    MF_BYPOSITION or MF_HILITE);

end;

procedure TWindowQSOEntryForm.StationChanged(StationGroupId: Integer; lParam: variant);
var
  qryStations: TKADaoTable;
  i: Integer;
  sSQL: string;
begin
  StationId := lParam;
  qryDXCC.Close;
  if bCheckNewOneForAllBook then
  begin
    qryStations := TKADaoTable.Create(nil);
    i := 0;
    try
      qryStations.Database := lDatabase;
      qryStations.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE STATION_PARENT_ID=' + IntToStr(StationGroupId);
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
      qryDXCC.SQL.Text := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM (' + sSQL + ') WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';
    finally
      qryStations.Free;
    end;
  end
  else
    qryDXCC.SQL.Text := 'SELECT LOG_MODE,LOG_BAND_MHZ FROM LOG_' + IntToStr(StationId) + ' WHERE LOG_DXCC=:LOG_DXCC GROUP BY LOG_MODE,LOG_BAND_MHZ';

  ldeField1.StationId := StationId;
  ldeField1.StationGroupId := StationGroupId;

  ldeField2.StationId := StationId;
  ldeField2.StationGroupId := StationGroupId;

  ldeField3.StationId := StationId;
  ldeField3.StationGroupId := StationGroupId;

  ldeField4.StationId := StationId;
  ldeField4.StationGroupId := StationGroupId;

  ldeField5.StationId := StationId;
  ldeField5.StationGroupId := StationGroupId;

  ldeField6.StationId := StationId;
  ldeField6.StationGroupId := StationGroupId;
  ldeField7.StationId := StationId;
  ldeField7.StationGroupId := StationGroupId;
  ldeField8.StationId := StationId;
  ldeField8.StationGroupId := StationGroupId;
  ldeField9.StationId := StationId;
  ldeField9.StationGroupId := StationGroupId;

end;

procedure TWindowQSOEntryForm.CallInfo(vManages: variant);
var
  i, HighBound: Integer;
begin
  if not isCallSign() then exit;
  FindCallDesc;
  cbQSLVia.Items.Clear;
  dbeQSLVia.Color := clWindow;
  dbeQSLVia.Text := '';
  HighBound := VarArrayHighBound(vManages, 1);
  cbQSLVia.Items.Clear;
  if HighBound > -1 then
  begin
    for i := 0 to HighBound do
      cbQSLVia.Items.Add(vManages[i]);
    if cbQSLVia.Items.Count > 1 then
    begin
      imgManagerMore.Visible := True;
      // dbeQSLVia.Color:=12976029;
      dbeQSLVia.Color := 9161843;
    end
    else
    begin
      imgManagerMore.Visible := False;
      dbeQSLVia.Color := clWindow;
    end;
  end;
  if cbQSLVia.Items.Count = 1 then
  begin
    dbeQSLVia.Text := Copy(cbQSLVia.Items.Strings[0], 1, Pos(';', cbQSLVia.Items.Strings[0]) - 1);
    dbeQSLVia.DataSource.DataSet.FieldByName(dbeQSLVia.DataField).AsString := dbeQSLVia.Text;
  end;
end;

function TWindowQSOEntryForm.GetFocusedComponent: TComponent;
var
  i: Word;
begin
  Result := nil;
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TWinControl then
      if TWinControl(Self.Components[i]).Focused then
      begin
        Result := Self.Components[i];
        exit;
      end;
end;

procedure TWindowQSOEntryForm.CNKeydown(var Message: TWMKey);
var
  CurrentControl: TComponent;
  NextControl, PrevControl: TComponent;
  vParam: variant;

  function GetNextComponent: TComponent;
  var
    i, j: Word;
  begin
    Result := nil;
    if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count = 0 then
      exit;
    for i := 0 to WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count - 1 do
      if CurrentControl = WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[i].Data then
      begin
        for j := i + 1 to WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count - 1 do
          if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[j].Checked then
          begin
            Result := TComponent(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[j].Data);
            exit;
          end;
      end;
  end;

  function GetPrevComponent: TComponent;
  var
    i, j: Word;
  begin
    Result := nil;
    if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count = 0 then
      exit;
    for i := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count - 1 downto 0 do
      if CurrentControl = WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[i].Data then
      begin
        if i > 0 then
          for j := i - 1 downto 0 do
            if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[j].Checked then
            begin
              Result := TComponent(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[j].Data);
              exit;
            end;
      end;
  end;

  function ShiftKeyDown: Boolean;
  begin
    Result := (Word(GetKeyState(VK_SHIFT)) and $8000) <> 0;
  end;

  function CtrlKeyDown: Boolean;
  begin
    Result := (Word(GetKeyState(VK_CONTROL)) and $8000) <> 0;
  end;

begin

  inherited;
  if ((Message.CharCode = VK_UP) or (Message.CharCode = VK_DOWN)) and (dbeOperator.ListVisible or dbeQTH.ListVisible) then
    exit;

  if ((Message.CharCode = VK_UP) or (Message.CharCode = VK_DOWN)) and CtrlKeyDown then
    exit;

  if (Message.CharCode = VK_RETURN) and (dbeOperator.ListVisible or dbeQTH.ListVisible) then
    exit;

  // dbeOperator.

  ldeCall.TabStop := False;
  if ((Message.CharCode = VK_TAB) and ShiftKeyDown) or (Message.CharCode = VK_UP) then
  begin
    CurrentControl := GetFocusedComponent;
    if Assigned(CurrentControl) then
    begin
      PrevControl := GetPrevComponent;
      if not Assigned(PrevControl) then
      begin

        PrevControl := TComponent(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items
            [WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count - 1].Data);

        { inherited;
          ldeCall.TabStop := True;
          exit; }
      end;

      if PrevControl is TWinControl then
      begin
        if Assigned(TWinControl(PrevControl).Parent) then
          if TWinControl(PrevControl).Parent is TTabSheet then
            if not TTabSheet(TWinControl(PrevControl).Parent).Visible then
            begin
              pcBottomData.ActivePage := TTabSheet(TWinControl(PrevControl).Parent);
              TTabSheet(TWinControl(PrevControl).Parent).SetFocus;
            end;

        if TWinControl(PrevControl).CanFocus then
        begin
          TWinControl(PrevControl).SetFocus;
        end
      end;
    end;
    Message.Msg := 0;
    Message.CharCode := 0;
    Message.Result := 1;
  end
  else if ((Message.CharCode = VK_TAB) and not ShiftKeyDown) or (Message.CharCode = VK_DOWN) or
    (WindowQSOEntrySettingsFrame.WindowQSOEntry_cbSaveRecordOnEnter.Checked and (Message.CharCode = VK_RETURN)) or
    ((WindowQSOEntrySettingsFrame.WindowQSOEntry_cbNextOnEnter.Checked) and (Message.CharCode = VK_RETURN)) then
  begin
    if not isCallsign() then exit;
    CurrentControl := GetFocusedComponent;
    if (WindowQSOEntrySettingsFrame.WindowQSOEntry_cbSaveRecordOnEnter.Checked and (Message.CharCode = VK_RETURN)) and (CurrentControl = ldeCall) then
      if Trim(ldeCall.Text) = '' then
      begin
        inherited;
        ldeCall.TabStop := True;
        exit;
      end;

    if Assigned(CurrentControl) then
    begin
      NextControl := GetNextComponent;
      if not Assigned(NextControl) then
      begin
        if (WindowQSOEntrySettingsFrame.WindowQSOEntry_cbSaveRecordOnEnter.Checked and (Message.CharCode = VK_RETURN)) and (Trim(ldeCall.Text) <> '')
          then
          lDllCommand(DC_SAVE_QSO, Self, vParam, vParam);
        NextControl := TComponent(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[0].Data);
        // inherited;
        // ldeCall.TabStop := True;
        // exit;
      end;

      if NextControl is TWinControl then
      begin
        if Assigned(TWinControl(NextControl).Parent) then
          if TWinControl(NextControl).Parent is TTabSheet then
            if not TTabSheet(TWinControl(NextControl).Parent).Visible then
            begin
              pcBottomData.ActivePage := TTabSheet(TWinControl(NextControl).Parent);
              TTabSheet(TWinControl(NextControl).Parent).SetFocus;
            end;

        if TWinControl(NextControl).CanFocus then
        begin
          TWinControl(NextControl).SetFocus;
        end
      end;
    end;
    Message.Msg := 0;
    Message.CharCode := 0;
    Message.Result := 1;
  end
  else
    inherited;
end;

procedure TWindowQSOEntryForm.ReadSettingsFocus;
var
  slControls: TStringList;
  slControlLine: TStringList;
  i: Integer;
  Comp: TComponent;
  ListItem: TListItem;

  function FindControlByCaption(Caption: string): Boolean;
  var
    j: Integer;
  begin
    for j := 0 to WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count - 1 do
      if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[j].Caption = Caption then
      begin
        Result := True;
        exit;
      end;

    Result := False;
  end;

begin
  slControls := TStringList.Create;
  slControlLine := TStringList.Create;
  try
    slControlLine.Delimiter := '|';
    slControlLine.StrictDelimiter := True;
    WindowQSOEntrySettingsFrame.FormStorage.AppStorage.ReadStringList('WindowQSOEntry\Controls', slControls);
    for i := 0 to slControls.Count - 1 do
    begin
      slControlLine.DelimitedText := slControls.Strings[i];
      Comp := Self.FindComponent(slControlLine.Strings[0]);
      if Comp <> nil then
      begin
        ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
        ListItem.Data := Comp;
        ListItem.Checked := StrToBool(slControlLine.Strings[1]);
        if Comp is TLabeledDBEdit then
          if Comp.Name = 'dbeQSLVia' then
            ListItem.Caption := lbQSLVia.Caption
          else
          begin
            ListItem.Caption := TLabeledDBEdit(Comp).EditLabel.Caption;
          end;
        if Comp is TLabeledDBComboBox then
          ListItem.Caption := TLabeledDBComboBox(Comp).EditLabel.Caption;

        if Comp is TvlDBEditCombo then
          ListItem.Caption := TvlDBEditCombo(Comp).EditLabel.Caption;

        if Comp is TCheckBox then
          if TCheckBox(Comp).Caption <> '' then
            ListItem.Caption := TCheckBox(Comp).Caption
          else
            ListItem.Caption := TCheckBox(Comp).Hint;

        if Comp is TLabeledDBMemo then
          ListItem.Caption := TLabeledDBMemo(Comp).EditLabel.Caption;
        if Comp is TDateTimePickerEx then
          ListItem.Caption := lbDate.Caption;
        if Comp is TvlDBEdit then
          if TvlDBEdit(Comp).Name = 'dbeOperator' then
            ListItem.Caption := lbOperator.Caption;
        if TvlDBEdit(Comp).Name = 'dbeQTH' then
          ListItem.Caption := lbQTH.Caption;
        { if Comp.Name = 'cbReakTime' then
          ListItem.Caption := lbQSLVia.Caption }

      end;
    end;

    { for i := 0 to ComponentCount - 1 do
      if Components[i] is TWinControl then
      begin
      if Components[i] is TLabeledDBEdit then
      if Components[i].Name = 'dbeQSLVia' then
      begin
      if not FindControlByCaption(lbQSLVia.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := lbQSLVia.Caption
      end
      end
      else
      begin
      if not FindControlByCaption(TLabeledDBEdit(Components[i]).EditLabel.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := TLabeledDBEdit(Components[i]).EditLabel.Caption;
      end
      end;

      if Components[i] is TLabeledDBComboBox then
      if not FindControlByCaption(TLabeledDBComboBox(Components[i]).EditLabel.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := TLabeledDBComboBox(Components[i]).EditLabel.Caption;
      end;

      if Components[i] is TCheckBox then
      if TCheckBox(Components[i]).Caption <> '' then
      if not FindControlByCaption(TCheckBox(Components[i]).Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := TCheckBox(Components[i]).Caption;
      end;

      if Components[i] is TLabeledDBMemo then
      if not FindControlByCaption(TLabeledDBMemo(Components[i]).EditLabel.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := TLabeledDBMemo(Components[i]).EditLabel.Caption;
      end;

      if Components[i] is TDateTimePickerEx then
      if not FindControlByCaption(lbDate.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := lbDate.Caption;
      end;

      if Components[i] is TvlDBEdit then
      begin
      if TvlDBEdit(Components[i]).Name = 'dbeOperator' then
      if not FindControlByCaption(lbOperator.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := lbOperator.Caption;
      end;
      if TvlDBEdit(Components[i]).Name = 'dbeQTH' then
      if not FindControlByCaption(lbQTH.Caption) then
      begin
      ListItem := WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Add;
      ListItem.Data := Components[i];
      ListItem.Checked := True;
      ListItem.Caption := lbQTH.Caption;
      end;
      end;
      end;    }

    if WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count > 0 then
      WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[0].Selected := True;
  finally
    slControlLine.Free;
    slControls.Free;
  end;
end;

procedure TWindowQSOEntryForm.Init;
var
  slNamesQTH: TStringList;
  FileName: string;
  i: Integer;
  qryTmp: TKADaoTable;
  ListItem: TListItem;
begin
  slNamesQTH := TStringList.Create;
  try
    FileName := GetAbsolutePathFromOptions(lAppStorage.ReadString('WindowQSOEntrySettingsFrame\deNameQTHDirectory_Text', '')) + 'Operators.txt';
    if FileExists(FileName) then
    begin
      slNamesQTH.LoadFromFile(FileName);
      for i := 0 to slNamesQTH.Count - 1 do
      begin
        cdsNames.Append;
        cdsNames.FieldByName('OPERATOR_NAME').AsString := slNamesQTH[i];
        cdsNames.Post;
      end;
    end;
    slNamesQTH.Clear;
    FileName := GetAbsolutePathFromOptions(lAppStorage.ReadString('WindowQSOEntrySettingsFrame\deNameQTHDirectory_Text', '')) + 'QTH.txt';
    if FileExists(FileName) then
    begin
      slNamesQTH.LoadFromFile(FileName);
      for i := 0 to slNamesQTH.Count - 1 do
      begin
        cdsQTH.Append;
        cdsQTH.FieldByName('QTH_NAME').AsString := slNamesQTH[i];
        cdsQTH.Post;
      end;
    end;

  finally
    slNamesQTH.Free;
  end;

end;

procedure TWindowQSOEntryForm.DeInit;
begin
end;

procedure TWindowQSOEntryForm.FindCallDesc(aCallSign: string = '');
var
  ValueStr: string;
  i: Integer;
  CallSign: string;
  lParam, wParam: variant;
begin

  if aCallSign = '' then
    CallSign := Trim(ldeCall.Text)
  else
    CallSign := Trim(aCallSign);

  if CallSign = '' then
    exit;

  lParam := CallSign;
  lDllCommand(DC_CALL_ADDITION_INFO, Self, lParam, wParam);
  ValueStr := wParam;
  if ValueStr <> '' then
    memQSOInformation.Lines.Text := ValueStr
  else
    memQSOInformation.Lines.Clear;
end;

procedure TWindowQSOEntryForm.InitGridColors;
var
  slColors: TStringList;
  slColorLine: TStringList;
  GridColor: TGridColor;
  i: Integer;
begin
  GridColorList.Clear;
  slColors := TStringList.Create;
  slColorLine := TStringList.Create;
  slColorLine.Delimiter := '|';
  try
    lAppStorage.ReadStringList('Options\GridColorsStatistics', slColors);
    for i := 0 to slColors.Count - 1 do
    begin
      slColorLine.DelimitedText := slColors.Strings[i];
      GridColor := TGridColor.Create;
      GridColor.ColorBackground := StrToInt2(slColorLine.Strings[0]);
      GridColor.ColorForeground := StrToInt2(slColorLine.Strings[1]);
      GridColorList.Add(GridColor);
    end;
    // dbgAwards.Repaint;
  finally
    slColors.Free;
    slColorLine.Free;
  end;
end;

procedure TWindowQSOEntryForm.FieldChange(Sender:TObject);
var
 i:integer;
begin
  for i:=0 to WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items.Count -1 do
   begin
    if TComponent(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[i].Data) is TvlDBEditCombo then
     if TvlDBEditCombo(WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[i].Data).DataField=TvlDBEditCombo(Sender).DataField then
     begin
       WindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocus.Items[i].Caption:=TvlDBEditCombo(Sender).EditLabel.Caption;
       exit;
     end;
   end;
end;


end.
