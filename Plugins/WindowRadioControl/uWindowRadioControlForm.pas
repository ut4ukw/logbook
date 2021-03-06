unit uWindowRadioControlForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, LPComponent,
  SLComponentCollection, LPDrawLayers, LPTransparentControl, ULBasicControl,
  ILSegmentIndicator, ILSegmentText, ExtCtrls, DB, KDaoTable, DBCtrls, Buttons,
  uPluginHeaders, Math, JvComponentBase, JvFormPlacement, JvFormPlacementSelectList, uWindowRadioControlSettingsFrame,
  IGDIPlus, Dialogs, StrUtils, LabeledControls, LPControl, SLControlCollection,
  LPControlDrawLayers, ILLed, ILMultiLed, ILSegmentClock;


type
  TWindowRadioControlForm = class(TWindowPluginForm)
    pnlScale: TPanel;
    FreqDisplay: TILSegmentText;
    pnlBandMode: TPanel;
    pnlBands: TPanel;
    pnlModes: TPanel;
    Bevel1: TBevel;
    qryModes: TKADaoTable;
    qryBands: TKADaoTable;
    Splitter1: TSplitter;
    FormStorage: TJvFormStorage;
    timFreq: TTimer;
    qryBandsBAND_ID: TAutoIncField;
    qryBandsBAND_MHZ: TFloatField;
    qryBandsBAND_METER: TFloatField;
    qryBandsBAND_ADIF: TStringField;
    qryBandsBAND_LOWER_FREQ: TFloatField;
    qryBandsBAND_UPPER_FREQ: TFloatField;
    qryBandsBAND_ACTIVE: TIntegerField;
    pnlMainToolbar: TPanel;
    cbBand: TComboBox;
    cbMode: TComboBox;
    lbBand: TLabel;
    lbMode: TLabel;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure timFreqTimer(Sender: TObject);
    procedure FreqDisplayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FreqDisplayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbBandClick(Sender: TObject);
    procedure cbBandChange(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure cbModeClick(Sender: TObject);
  private
    FDataLink: TFieldDataLink;
    bMouseLeftButton,bMouseRightButton : boolean;
    procedure ButtonBandClick(Sender:TObject);
    procedure ButtonModeClick(Sender:TObject);
    procedure SwitchBand(aBand:real);
    procedure SwitchMode(aMode:string);
    procedure FreqChange(Sender:TObject);
    procedure SetFreqDisplayConfig;
  public
    Band:Real;
    Mode:string;
    procedure NewQSO;
    procedure InitData;
    procedure DeInitData;
    procedure BandChanged(lParam:variant);
    procedure ModeChanged(lParam:variant);
    procedure AfterEdit(DataSet: TDataSet);
    procedure OptionsChanged;
  end;

var
  WindowRadioControlForm: TWindowRadioControlForm;

implementation

uses uWindowRadioControl;
{$R *.dfm}



procedure TWindowRadioControlForm.ButtonBandClick(Sender:TObject);
var
 lParam,wParam:variant;
begin
 lParam:=StrToFloat(TSpeedButton(Sender).Caption);
 wParam:=0;
 lDllCommand(DC_BAND_CHANGED,nil,lParam,wParam);
end;

procedure TWindowRadioControlForm.ButtonModeClick(Sender:TObject);
var
 lParam,wParam:variant;
begin
 qryModes.First;
 if qryModes.Locate('MODE_ID',TSpeedButton(Sender).Tag,[]) then
  begin
   lParam:=qryModes.FieldByName('MODE_NAME').asString;
   wParam:=qryModes.FieldByName('MODE_NAME').asString;
   lDllCommand(DC_MODE_CHANGED,nil,lParam,wParam);
  end;
end;

procedure TWindowRadioControlForm.ComboBox1Click(Sender: TObject);
var
 lParam,wParam:variant;
begin
 lParam:=StrToFloat(TSpeedButton(Sender).Caption);
 wParam:=0;
 lDllCommand(DC_BAND_CHANGED,nil,lParam,wParam);
end;

procedure TWindowRadioControlForm.SwitchBand(aBand:real);
var
 i:integer;
begin
  for i := 0 to Self.ComponentCount-1 do
    if Self.Components[i] is TSpeedButton then
      if (TSpeedButton(Self.Components[i]).Caption=FloatToStr(aBand)) and  (TSpeedButton(Self.Components[i]).Parent=pnlBands) then
        begin
         TSpeedButton(Self.Components[i]).Down:=True;
         cbBand.ItemIndex:=cbBand.Items.IndexOf(FloatToStr(aBand));
         exit;
        end;
end;

procedure TWindowRadioControlForm.SwitchMode(aMode:string);
var
 i,j:integer;
begin
  qryModes.First;
  if qryModes.Locate('MODE_NAME',aMode,[]) then
    begin
     for i := 0 to Self.ComponentCount-1 do
       if Self.Components[i] is TSpeedButton then
         if (TSpeedButton(Self.Components[i]).Tag=qryModes.FieldByName('MODE_ID').AsInteger) and (TSpeedButton(Self.Components[i]).Parent=pnlModes) then
            begin
              TSpeedButton(Self.Components[i]).Down:=True;
              for j:=0 to cbMode.Items.Count-1 do
                if Integer(cbMode.Items.Objects[j])=qryModes.FieldByName('MODE_ID').AsInteger then
                begin
                  cbMode.ItemIndex:=j;
                  break;
                end;
              exit;
            end;

    end;
end;

procedure TWindowRadioControlForm.timFreqTimer(Sender: TObject);
begin
 if (ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat<>0) and (ldsLogEdit.DataSet.State in [dsInsert]) then
  if bMouseLeftButton then
     ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat-WindowRadioControlSettingsFrame.seTuneCoarse.Value/1000000
  else
     ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat+WindowRadioControlSettingsFrame.seTuneCoarse.Value/1000000;
end;

procedure TWindowRadioControlForm.FormMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
 if (ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat<>0) and (ldsLogEdit.DataSet.State in [dsInsert]) then
 begin
   if WheelDelta<0 then
     ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat-WindowRadioControlSettingsFrame.seTuneFine.Value/1000000
   else
     ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat+WindowRadioControlSettingsFrame.seTuneFine.Value/1000000;
 end;




 Handled := true;  // ����������!!!
end;

procedure TWindowRadioControlForm.FreqChange(Sender:TObject);
var
 sFreq:string;
begin
 if (ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat<>0) and (ldsLogEdit.DataSet.State in [dsInsert]) then
 begin
  sFreq:=FormatFloat('0.00',(ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat*1000));
  sFreq:=DupeString(' ',FreqDisplay.Cols-Length(sFreq))+sFreq;
  FreqDisplay.Text:=sFreq;
 end
 else
  FreqDisplay.Text:='';
end;



procedure TWindowRadioControlForm.FreqDisplayMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 bMouseLeftButton:=Button=mbLeft;
 bMouseRightButton:=Button=mbRight;
 timFreq.Enabled:=True;
end;

procedure TWindowRadioControlForm.FreqDisplayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 bMouseLeftButton:=False;
 bMouseRightButton:=False;
 timFreq.Enabled:=False;
end;

procedure TWindowRadioControlForm.NewQSO;
begin
 if not qryModes.Active then
  qryModes.Open;
 if not qryBands.Active then
  qryBands.Open;
  BandChanged(Band);
  ModeChanged(Mode);
end;


procedure TWindowRadioControlForm.InitData;
var
  iLeft, iTop: integer;
  Button: TSpeedButton;
  bVHFBands, bHFExists:boolean;
begin
  FDataLink:=TFieldDataLink.Create;
  FDataLink.DataSource:=ldsLogEdit;
  FDataLink.FieldName:='LOG_FREQ';
  FDataLink.OnDataChange:=FreqChange;

  cbBand.Items.Clear;
  cbMode.Items.Clear;
  iLeft := 8;
  iTop := 10;
  bVHFBands:=false;
  bHFExists:=false;
  qryBands.Open;

  while not qryBands.Eof do
  begin
    cbBand.Items.Add(FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').AsFloat,-3)));
    if qryBands.FieldByName('BAND_MHZ').AsFloat <= 50 then
      bHFExists:=true;
    if (qryBands.FieldByName('BAND_MHZ').AsFloat > 50) and not bVHFBands and bHFExists then
    begin
      if iLeft <> 8 then
       Inc(iTop,32);
      iLeft := 8;
      iTop := iTop + 12;
      bVHFBands:=True;
    end;
    Button := TSpeedButton.Create(Self);
    Button.Parent := pnlBands;
    Button.Left := iLeft;
    Button.Top := iTop;
    Button.Caption:=FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').AsFloat,-3));
    Button.Width := 32;
    Button.Height := 32;
    Button.OnClick:=ButtonBandClick;
    Button.GroupIndex := 1;
    Button.Tag := qryBands.FieldByName('BAND_ID').asInteger;
    iLeft := iLeft + 32;
    if iLeft = 104 then
    begin
      iLeft := 8;
      iTop := iTop + 32;
    end;
    qryBands.Next;
  end;

  iLeft := 8;
  iTop := 10;

  qryModes.Open;
  while not qryModes.Eof do
  begin
    Button := TSpeedButton.Create(Self);
    Button.Parent := pnlModes;
    Button.Left := iLeft;
    Button.Top := iTop;
    if Trim(qryModes.FieldByName('MODE_TITLE').asString)<>'' then
       Button.Caption:=qryModes.FieldByName('MODE_TITLE').asString
    else
       Button.Caption:=qryModes.FieldByName('MODE_NAME').asString;
    Button.Width := 32;
    Button.Height := 32;
    Button.OnClick:=ButtonModeClick;
    Button.GroupIndex := 2;
    Button.Tag := qryModes.FieldByName('MODE_ID').asInteger;
    cbMode.Items.AddObject(Button.Caption,Pointer(Button.Tag));
    iLeft := iLeft + 32;
    if iLeft = 104 then
    begin
      iLeft := 8;
      iTop := iTop + 32;
    end;
    qryModes.Next;
  end;
 SetFreqDisplayConfig;
end;

procedure TWindowRadioControlForm.cbBandChange(Sender: TObject);
var
wParam:variant;
begin
 wParam:=0;
end;

procedure TWindowRadioControlForm.cbBandClick(Sender: TObject);
var
 lParam,wParam:variant;
begin
 lParam:=StrToFloat(cbBand.Text);
 wParam:=0;
 lDllCommand(DC_BAND_CHANGED,nil,lParam,wParam);
end;

procedure TWindowRadioControlForm.cbModeClick(Sender: TObject);
var
 lParam,wParam:variant;
begin
 qryModes.First;
 if qryModes.Locate('MODE_ID',Integer(cbMode.Items.Objects[cbMode.ItemIndex]),[]) then
  begin
   lParam:=qryModes.FieldByName('MODE_NAME').asString;
   wParam:=qryModes.FieldByName('MODE_NAME').asString;
   lDllCommand(DC_MODE_CHANGED,nil,lParam,wParam);
  end;
end;

procedure TWindowRadioControlForm.DeInitData;
begin
 if Assigned(FDataLink) then
 begin
   FDataLink.DataSource:=nil;
   FDataLink.OnDataChange:=nil;
   FDataLink.Free;
 end;
end;


procedure TWindowRadioControlForm.BandChanged(lParam:variant);
begin
  Band:=lParam;
  SwitchBand(Band);
end;

procedure TWindowRadioControlForm.ModeChanged(lParam:variant);
begin
  Mode:=VarToStr(lParam);
  SwitchMode(Mode);
end;

procedure TWindowRadioControlForm.AfterEdit(DataSet: TDataSet);
begin
  SwitchMode(ldsLogEdit.Dataset.FieldByName('LOG_MODE').asString);
  SwitchBand(ldsLogEdit.Dataset.FieldByName('LOG_BAND_MHZ').asFloat);
end;

procedure TWindowRadioControlForm.SetFreqDisplayConfig;
begin
 case WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.ColorValue of
   clMaroon : begin
                FreqDisplay.Segments.CenterColor:=aclMaroon;
                FreqDisplay.Segments.Color:=aclDarkRed;
              end;
   clGreen :  begin
                FreqDisplay.Segments.CenterColor:=aclLightGreen;
                FreqDisplay.Segments.Color:=aclDarkGreen;
              end;
   clOlive :  begin
                FreqDisplay.Segments.CenterColor:=aclLightGoldenrodYellow;
                FreqDisplay.Segments.Color:=aclDarkGoldenrod;
              end;
   clNavy  :  begin
                FreqDisplay.Segments.CenterColor:=aclMediumBlue;
                FreqDisplay.Segments.Color:=aclNavy;
              end;
   clPurple:  begin
                FreqDisplay.Segments.CenterColor:=aclBlueViolet;
                FreqDisplay.Segments.Color:=aclPurple;
              end;
   clTeal  :  begin
                FreqDisplay.Segments.CenterColor:=aclLightBlue;
                FreqDisplay.Segments.Color:=aclTeal;
              end;
   clRed   :  begin
                FreqDisplay.Segments.CenterColor:=aclRed;
                FreqDisplay.Segments.Color:=aclDarkRed;
              end;
   clLime  :  begin
                FreqDisplay.Segments.CenterColor:=aclLime;
                FreqDisplay.Segments.Color:=aclLimeGreen;
              end;
   clYellow:  begin
                FreqDisplay.Segments.CenterColor:=aclLightYellow;
                FreqDisplay.Segments.Color:=aclGoldenrod;
              end;
   clBlue  :  begin
                FreqDisplay.Segments.CenterColor:=aclLightBlue;
                FreqDisplay.Segments.Color:=aclCornflowerBlue;
              end;
  clFuchsia:  begin
                FreqDisplay.Segments.CenterColor:=aclFuchsia;
                FreqDisplay.Segments.Color:=aclDarkOrchid;
              end;
  clAqua   :  begin
                FreqDisplay.Segments.CenterColor:=aclAqua;
                FreqDisplay.Segments.Color:=aclDodgerBlue;
              end;

 end;
 FreqDisplay.Cols:=WindowRadioControlSettingsFrame.WindowRadioControl_spFreqDisplayDigits.Value;
end;

procedure TWindowRadioControlForm.OptionsChanged;
begin
  SetFreqDisplayConfig;
end;



end.
