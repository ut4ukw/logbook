unit uWindowBandMapForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, ExtCtrls,
  BandMap, ComCtrls, DB, KDaoTable, JvMemoryDataset, uPluginHeaders, ToolWin,
  ActnList, ImgList, JvComponentBase, JvFormPlacement, Math, JvExComCtrls,
  JvComCtrls, Dialogs, JvgPage, DBCtrls, uUtils, ButtonGroup, JvSpeedButton;

const
  ButtonLeftOffset = 2;
  ButtonTopOffset = 2;

type
  TWindowBandMapForm = class(TWindowPluginForm)
    pnlMainToolbar: TPanel;
    sbBandMap: TStatusBar;
    qryBands: TKADaoTable;
    cdsBandMapWWW: TJvMemoryData;
    StringField1: TStringField;
    TimeField1: TTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    cdsBandMapWWWCLUSTER_COLOR: TStringField;
    ToolBar1: TToolBar;
    tbSourceTelnet: TToolButton;
    tbSourceWWW: TToolButton;
    alBandMap: TActionList;
    ilBandMap: TImageList;
    aBandMapSourceTelnet: TAction;
    aBandMapSourceWWW: TAction;
    FormStorageOnExit: TJvFormStorage;
    ToolButton1: TToolButton;
    tbClusterSync: TToolButton;
    aBandMapClusterSync: TAction;
    BandMap: TBandMap;
    qryBandGrid: TKADaoTable;
    BandMapActiveBandIndex: TLabel;
    pnlButtons: TPanel;
    cdsBandMapWWWCLUSTER_LOTW: TStringField;
    cdsBandMapWWWCLUSTER_EQSL: TStringField;
    cdsBandMapWWWCLUSTER_CALL_DESCRIPTION: TStringField;
    procedure aBandMapSourceTelnetExecute(Sender: TObject);
    procedure aBandMapSourceWWWExecute(Sender: TObject);
    procedure BandMapClick(Sender: TObject);
    procedure aBandMapClusterSyncExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BandMapRuleClick(Sender: TObject; Band: real; Freq: Integer);
    procedure BandMapCallSignClick(Sender: TObject; CallSign: string; Freq: Integer; Band: real; Mode: string);
    procedure BandMapGetFreq(Sender: TObject; Freq: Integer; SpotCallSign: string;Description:string);
    procedure ButtonClick(Sender: TObject);
  private
    tsHeight: Integer;
    FDataLink: TFieldDataLink;
    CurrentRadioFrequency: Integer;
    ButtonCount: Integer;
    CurrentBand: string;
    procedure FreqChange(Sender: TObject);
    procedure SetBand(aBand: real);
    procedure SetSpotsByBand;
  public
    procedure InitData;
    procedure DeInitData;
    procedure ClusterWWWChanged(lParam, wParam: variant);
    procedure ClusterTelnetChanged(lParam, wParam: variant);
    procedure OptionsChanged;
    procedure Loaded;
    procedure ClusterWWWClear;
    procedure ClusterTelnetClear;
    procedure ClusterWWWLoaded(lParam: variant);
    procedure ClusterTelnetLoaded(lParam: variant);
    procedure RealignButtons;
    procedure RebuildButtons;
  end;

var
  WindowBandMapForm: TWindowBandMapForm;

implementation

uses uWindowBandMap;
{$R *.dfm}

procedure TWindowBandMapForm.aBandMapSourceTelnetExecute(Sender: TObject);
begin
  //
end;

procedure TWindowBandMapForm.aBandMapSourceWWWExecute(Sender: TObject);
begin
  BandMap.Clear;
end;

procedure TWindowBandMapForm.aBandMapClusterSyncExecute(Sender: TObject);
begin
{  if not pcBandMap.Visible then
  begin
    tbClusterSync.Down := False;
    pcBandMap.Visible := True;
    pcBandMap.Height := pcBandMap.RowCount * tsHeight - (10 * pcBandMap.RowCount);
    pcBandMapChange(pcBandMap);
  end
  else
  begin
    tbClusterSync.Down := True;
    pcBandMap.Visible := False;
    SetBand(lBand);
  end;}
  cdsBandMapWWW.EmptyTable;
  BandMap.Clear;
end;

procedure TWindowBandMapForm.BandMapCallSignClick(Sender: TObject; CallSign: string; Freq: Integer; Band: real; Mode: string);
var
  lParam, wParam: variant;
begin
  lParam := Freq * 1000;
  wParam := Mode;
  lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);

  wParam := 0;
  ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := CallSign;
  Application.ProcessMessages;
  lParam := Mode;
  lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
  lParam := Band;
  wParam := Freq * 1000;
  lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
  lParam := 0;
  wParam := 0;
  lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
end;

procedure TWindowBandMapForm.BandMapClick(Sender: TObject);
begin
  Self.BringToFront;
  Self.SetFocus;

end;

procedure TWindowBandMapForm.BandMapGetFreq(Sender: TObject; Freq: Integer; SpotCallSign: string;Description:string);
begin
  sbBandMap.Panels[0].Text := FormatFloat('0.000', Freq / 1000) + ' Mhz' + ' ' + SpotCallSign+ ' '+Description;
end;

procedure TWindowBandMapForm.BandMapRuleClick(Sender: TObject; Band: real; Freq: Integer);
var
  lParam, wParam: variant;
begin
  lParam := Freq * 1000;
  lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);
  lParam := Band;
  wParam := Freq * 1000;
  lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
end;

procedure TWindowBandMapForm.FreqChange(Sender: TObject);
begin
  if (ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat <> 0) and (ldsLogEdit.DataSet.State in [dsInsert]) then
  begin
    CurrentRadioFrequency := Round(ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat * 1000);
    BandMap.SetRadioFrequency(CurrentRadioFrequency);
  end
  else
  begin
    CurrentRadioFrequency := 0;
    BandMap.SetRadioFrequency(0);
  end;
end;

procedure TWindowBandMapForm.SetBand(aBand: real);
var
  AreaColor: TAreaColor;
begin
if not qryBands.Active then
 qryBands.Open;

  qryBands.First;
  if qryBands.Locate('BAND_MHZ', aBand, []) then
  begin
    qryBandGrid.Close;
    qryBandGrid.Params.ParamByName('BANDGRID_BAND_MHZ').asFloat := aBand;
    qryBandGrid.Open;
    while not qryBandGrid.Eof do
    begin
      AreaColor := TAreaColor.Create;
      AreaColor.FreqBegin := Round(qryBandGrid.FieldByName('BANDGRID_FREQ_BEGIN').asFloat * 1000);
      AreaColor.FreqEnd := Round(qryBandGrid.FieldByName('BANDGRID_FREQ_END').asFloat * 1000);
      AreaColor.Color := HexToColor(qryBandGrid.FieldByName('MODE_BACKGROUND_COLOR').AsString);
      BandMap.AreaColorList.Add(AreaColor);
      qryBandGrid.Next;
    end;
    qryBandGrid.Close;
    BandMap.SetBand(aBand, Round(qryBands.FieldByName('BAND_LOWER_FREQ').asFloat * 1000), Round(qryBands.FieldByName('BAND_UPPER_FREQ').asFloat * 1000));
  end;
end;

procedure TWindowBandMapForm.SetSpotsByBand;
var
  SpotColor: TColor;
  sAddInfo:string;
begin
  BandMap.Clear;
  BandMap.BeginUpdate;
  cdsBandMapWWW.Filtered := False;
  cdsBandMapWWW.Filter := '(CLUSTER_BAND=' + QuotedStr(CurrentBand) + ')';
  cdsBandMapWWW.Filtered := True;
  while not cdsBandMapWWW.Eof do
  begin
    if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'R' then
      SpotColor := 3947775
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'B' then
      SpotColor := 16747546
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'M' then
      SpotColor := 40704
    else
      SpotColor := clBlack;
    sAddInfo:='';
    if (cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'')  then
     if cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'' then
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+' '+cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString+'] '
     else
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+'] ';
    BandMap.AddCallsign(cdsBandMapWWW.FieldByName('CLUSTER_CALL').AsString, sAddInfo+cdsBandMapWWW.FieldByName('CLUSTER_COMMENT').AsString, Round(cdsBandMapWWW.FieldByName('CLUSTER_FREQ').asFloat), cdsBandMapWWW.FieldByName('CLUSTER_BAND').asFloat,
      cdsBandMapWWW.FieldByName('CLUSTER_MODE').AsString, SpotColor);
    cdsBandMapWWW.Next;
  end;
  BandMap.EndUpdate;
  BandMap.SetRadioFrequency(CurrentRadioFrequency);
end;


procedure TWindowBandMapForm.ButtonClick(Sender: TObject);
begin
  TjvSpeedButton(Sender).Down := True;
  SetBand(StrToFloat(TjvSpeedButton(Sender).HelpKeyword));
  BandMapActiveBandIndex.Tag:=TjvSpeedButton(Sender).Tag;
  CurrentBand := TjvSpeedButton(Sender).Caption;
  SetSpotsByBand;

end;


procedure TWindowBandMapForm.FormResize(Sender: TObject);
begin
  RealignButtons;
end;

procedure TWindowBandMapForm.InitData;
begin
  FDataLink := TFieldDataLink.Create;
  FDataLink.DataSource := ldsLogEdit;
  FDataLink.FieldName := 'LOG_FREQ';
  FDataLink.OnDataChange := FreqChange;

  RebuildButtons;
end;

procedure TWindowBandMapForm.ClusterWWWChanged(lParam, wParam: variant);
var
  ptr: Integer;
  cdsCluster: TJvMemoryData;
  Color: Integer;
  Filtered: boolean;
  AreaColor: TAreaColor;
  ii: Integer;
  sAddInfo:string;
begin
  if (not tbSourceWWW.Down) then
    exit;

  if tbClusterSync.Down and (lParam = '-1') then
  begin
    BandMap.SetBandMapVisible(False);
    exit;
  end;
  BandMap.SetBandMapVisible(True);
  SetBand(lParam);

  ptr := wParam;
  cdsCluster := Pointer(ptr);
  cdsBandMapWWW.EmptyTable;

  BandMap.Clear;
  cdsBandMapWWW.LoadFromDataSet(cdsCluster, cdsCluster.RecordCount, lmAppend);
  BandMap.BeginUpdate;
  while not cdsBandMapWWW.Eof do
  begin

    if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'R' then
      Color := 3947775
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'B' then
      Color := 16747546
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'M' then
      Color := 40704
    else
      Color := clBlack;
    sAddInfo:='';
    if (cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'')  then
     if cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'' then
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+' '+cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString+'] '
     else
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+'] ';

    BandMap.AddCallsign(cdsBandMapWWW.FieldByName('CLUSTER_CALL').AsString, sAddInfo+cdsBandMapWWW.FieldByName('CLUSTER_COMMENT').AsString, Round(cdsBandMapWWW.FieldByName('CLUSTER_FREQ').asFloat), cdsBandMapWWW.FieldByName('CLUSTER_BAND').asFloat,
      cdsBandMapWWW.FieldByName('CLUSTER_MODE').AsString, Color);
    cdsBandMapWWW.Next;
  end;
  BandMap.EndUpdate;
  BandMap.SetRadioFrequency(CurrentRadioFrequency);
end;

procedure TWindowBandMapForm.ClusterTelnetChanged(lParam, wParam: variant);
var
  ptr: Integer;
  cdsCluster: TJvMemoryData;
  Color: Integer;
  Filtered: boolean;
  sAddInfo:string;
begin
  if (not tbSourceTelnet.Down) then
    exit;

  if tbClusterSync.Down and (lParam = '-1') then
  begin
    BandMap.SetBandMapVisible(False);
    exit;
  end;
  BandMap.SetBandMapVisible(True);

  SetBand(lParam);
  { qryBands.First;
    if qryBands.Locate('BAND_MHZ', lParam, []) then
    begin
    BandMap.SetBand(lParam, Round(qryBands.FieldByName('BAND_LOWER_FREQ').asFloat * 1000), Round(qryBands.FieldByName('BAND_UPPER_FREQ').asFloat * 1000));

    end; }

  ptr := wParam;
  cdsCluster := Pointer(ptr);
  cdsBandMapWWW.EmptyTable;

  BandMap.Clear;
  cdsBandMapWWW.LoadFromDataSet(cdsCluster, cdsCluster.RecordCount, lmAppend);
  BandMap.BeginUpdate;
  while not cdsBandMapWWW.Eof do
  begin

    if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'R' then
      Color := 3947775
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'B' then
      Color := 16747546
    else if cdsBandMapWWW.FieldByName('CLUSTER_COLOR').AsString = 'M' then
      Color := 40704
    else
      Color := clBlack;
    sAddInfo:='';
    if (cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString<>'') or (cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'')  then
     if cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString<>'' then
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+' '+cdsBandMapWWW.FieldByName('CLUSTER_CALL_DESCRIPTION').AsString+'] '
     else
        sAddInfo:='['+cdsBandMapWWW.FieldByName('CLUSTER_LOTW').AsString+cdsBandMapWWW.FieldByName('CLUSTER_EQSL').AsString+'] ';

    BandMap.AddCallsign(cdsBandMapWWW.FieldByName('CLUSTER_CALL').AsString, sAddInfo+cdsBandMapWWW.FieldByName('CLUSTER_COMMENT').AsString, Round(cdsBandMapWWW.FieldByName('CLUSTER_FREQ').asFloat), cdsBandMapWWW.FieldByName('CLUSTER_BAND').asFloat,
      cdsBandMapWWW.FieldByName('CLUSTER_MODE').AsString, Color);
    cdsBandMapWWW.Next;
  end;
  BandMap.EndUpdate;
  BandMap.SetRadioFrequency(CurrentRadioFrequency);
end;

procedure TWindowBandMapForm.DeInitData;
begin
  if Assigned(FDataLink) then
  begin
    FDataLink.DataSource := nil;
    FDataLink.OnDataChange := nil;
    FDataLink.Free;
  end;
end;

procedure TWindowBandMapForm.OptionsChanged;
begin
end;

procedure TWindowBandMapForm.Loaded;
var
 i:integer;
 bFound:boolean;
begin
 bFound:=false;
 for i:=0 to  pnlButtons.ComponentCount - 1 do
  if TjvSpeedButton(pnlButtons.Components[i]).Tag=BandMapActiveBandIndex.Tag then
   begin
    TjvSpeedButton(pnlButtons.Components[i]).OnClick(TjvSpeedButton(pnlButtons.Components[i]));
//    BandMap.SetBandMapVisible(True);
    bFound:=True;
   end;

   if not bFound and (pnlButtons.ComponentCount>0) then
      TjvSpeedButton(pnlButtons.Components[0]).OnClick(TjvSpeedButton(pnlButtons.Components[0]));
end;

procedure TWindowBandMapForm.ClusterWWWClear;
begin
  BandMap.Clear;
end;

procedure TWindowBandMapForm.ClusterTelnetClear;
begin
  BandMap.Clear;
end;

procedure TWindowBandMapForm.ClusterWWWLoaded(lParam: variant);
var
  cdsCluster: TJvMemoryData;
  ptr: Integer;
  Filtered: boolean;
begin

  ptr := lParam;
  cdsCluster := Pointer(ptr);
  cdsBandMapWWW.EmptyTable;

  cdsCluster.DisableControls;
  Filtered := cdsCluster.Filtered;
  if Filtered then
    cdsCluster.Filtered := False;

  BandMap.Clear;
  cdsBandMapWWW.LoadFromDataSet(cdsCluster, cdsCluster.RecordCount, lmAppend);
  if Filtered then
    cdsCluster.Filtered := True;
  cdsCluster.EnableControls;
  // SetBand(StrToFloat(pcBandMap.ActivePage.HelpKeyword));
  SetSpotsByBand;
end;

procedure TWindowBandMapForm.ClusterTelnetLoaded(lParam: variant);
begin

end;

procedure TWindowBandMapForm.RealignButtons;
var
  i: Integer;
  TotalWidth: Integer;
  CurrentTop, CurrentLeft: Integer;
  Button: TjvSpeedButton;
  CountInLine: Integer;
begin
  TotalWidth := ButtonLeftOffset;
  CurrentTop := ButtonTopOffset;
  CurrentLeft := ButtonLeftOffset;
  CountInLine := 0;
  for i := 0 to pnlButtons.ComponentCount - 1 do
  begin
    Button := TjvSpeedButton(pnlButtons.Components[i]);
    CurrentLeft := ButtonLeftOffset + (CountInLine * (Button.Width + 1));
    inc(CountInLine);
    TotalWidth := TotalWidth + Button.Width + 1;

    if TotalWidth + 1 > pnlButtons.Width then
    begin
      CurrentTop := CurrentTop + Button.Height + 1;
      CountInLine := 0;
      TotalWidth := 0;
      CurrentLeft := ButtonLeftOffset + (CountInLine * (Button.Width + 1));
      CountInLine := 1;
      TotalWidth := TotalWidth + Button.Width + 1;
    end;
    Button.Left := CurrentLeft;
    Button.Top := CurrentTop;
  end;
  pnlButtons.Height := CurrentTop + Button.Height + 2;
end;

procedure TWindowBandMapForm.RebuildButtons;
var
  Button: TjvSpeedButton;
  i: Integer;
begin
  ButtonCount := 0;
  for i := 0 to pnlButtons.ComponentCount - 1 do
    pnlButtons.Components[0].Free;
  qryBands.Close;
  qryBands.Open;
  while not qryBands.Eof do
  begin
  if qryBands.FieldByName('BAND_MHZ').asFloat<500 then
   begin

    Button := TjvSpeedButton.Create(pnlButtons);
    Button.Parent := pnlButtons;
    Button.Width := 32;
    Button.Height := 32;
    Button.Flat := False;
    Button.GroupIndex := 1;
    Button.OnClick := ButtonClick;
    Inc(ButtonCount);
    Button.Tag:=ButtonCount;
    // Button.OnMouseDown:=ButtonMouseDown;
    Button.Caption := FormatFloat('0.##', qryBands.FieldByName('BAND_MHZ').asFloat);
    Button.HelpKeyword := FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').asFloat, -1));
   end;
    qryBands.Next;
  end;
  RealignButtons;
end;

end.

