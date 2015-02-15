unit udmCatOmniRig;

interface

uses
  SysUtils, Classes, DB, KDaoTable, OmniRig_TLB, Windows, uUtils, Variants,
  JvMemoryDataset, uPluginHeaders, Math, ActiveX, Dialogs;

const
  PM_CW_U = $00800000;
  PM_CW_L = $01000000;
  PM_SSB_U = $02000000;
  PM_SSB_L = $04000000;
  PM_DIG_U = $08000000;
  PM_DIG_L = $10000000;
  PM_AM = $20000000;
  PM_FM = $40000000;

type
  TdmCatOmniRig = class(TDataModule)
    qryBandGrid: TKADaoTable;
    qryBandGridFreq: TKADaoTable;
    cdsBandGrid: TJvMemoryData;
    qryBandGridFreqBANDGRID_ID: TAutoIncField;
    qryBandGridFreqBANDGRID_BAND_MHZ: TFloatField;
    qryBandGridFreqBANDGRID_MODE_NAME: TStringField;
    qryBandGridFreqBANDGRID_FREQ_BEGIN: TFloatField;
    qryBandGridFreqBANDGRID_FREQ_END: TFloatField;
    cdsBandGridBANDGRID_ID: TAutoIncField;
    cdsBandGridBANDGRID_BAND_MHZ: TFloatField;
    cdsBandGridBANDGRID_MODE_NAME: TStringField;
    cdsBandGridBANDGRID_FREQ_BEGIN: TFloatField;
    cdsBandGridBANDGRID_FREQ_END: TFloatField;
    dsLogEdit: TDataSource;
    qryBandGridModeFreq: TKADaoTable;
    qryCatMode: TKADaoTable;
    qryBandGridModeCatFreq: TKADaoTable;
    procedure DataModuleDestroy(Sender: TObject);
    procedure dsLogEditDataChange(Sender: TObject; Field: TField);
  private
    iActiveVFO: word;
    initBand: real;
    bSetRadioToSpot:boolean;
    CurrentCATMode:string;
    CurrentMode:string;
    Rx:boolean;
    function SetBandByFreq(freq: integer): boolean;
    function SetMode(Mode: TOleEnum): boolean;
    procedure CheckMode(freq: integer);
    procedure SetActiveVFO;
    procedure SetFreq(aFreq: integer);
    function GetCurrentMode: string;
    function GetCurrentCatMode: string;
    function CheckInstalled:boolean;
  public
    bLoaded: boolean;
    bRadioEventBand: boolean;
    bUserEventBand: boolean;
    bRadioEventMode: boolean;
    bUserEventMode: boolean;
    bInitBand: boolean;
    bConnected: boolean;
    bManualTune:boolean;
    bCatTune:boolean;
    CurrentFreq: integer;
    OldFreq: integer;
    OldBand: real;
    OldMode: TOleEnum;
    CurrentFreqMin, CurrentFreqMax: integer;
    CurrentBand: real;
    OmniRig: TOmniRigX;
    procedure ParamsChangeEvent(Sender: TObject; RigNumber: integer;
      Params: integer);
    procedure Connect;
    procedure BandChange(lParam, wParam: variant);
    procedure ModeChange(lParam, wParam: variant);
    function GetModeByFreq(freq: integer;Mode:string) : integer;
    function GetBandByFreq(freq: integer): real;
    procedure InitData;
    procedure NewQSO;
    procedure SetRadioToSpot(lParam,wParam : variant);
  end;

var
  dmCatOmniRig: TdmCatOmniRig;


implementation

uses uCatOmniRig;
{$R *.dfm}

procedure TdmCatOmniRig.DataModuleDestroy(Sender: TObject);
begin
  if bConnected then
    OmniRig.Disconnect;
end;

procedure TdmCatOmniRig.dsLogEditDataChange(Sender: TObject; Field: TField);
begin
if bSetRadioToSpot then exit;

if bCatTune then
 begin
  bCatTune:=False;
  exit;
 end;
 if Assigned(Field) then
  if Field.FieldName='LOG_FREQ' then
   if (ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat<>0) and (ldsLogEdit.DataSet.State in [dsInsert]) then
   begin
      bManualTune:=True;
      SetFreq(Round(ldsLogEdit.DataSet.FieldByName('LOG_FREQ').asFloat*1000000));
   end;
end;

function TdmCatOmniRig.SetBandByFreq(freq: integer): boolean;
var
  rBand: real;
  lParam, wParam: variant;
begin
  rBand := GetBandByFreq(freq);
  if rBand <> -1 then
  begin
    Result := true;
    if (OldBand <> 0) and (OldFreq <> 0) then
      sFreqList.Values[FloatToStr(SimpleRoundTo(OldBand, -3))] := IntToStr(OldFreq);
    OldBand := rBand;
    lParam := rBand;
    wParam := freq;
    qryBandGrid.Close;
    qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat := rBand;
    qryBandGrid.Open;
    CurrentFreqMin := Round(qryBandGrid.FieldByName('fmin').AsFloat * 1000000);
    CurrentFreqMax := Round(qryBandGrid.FieldByName('fmax').AsFloat * 1000000);
    qryBandGrid.Close;
    if bUserEventBand or not bRadioEventBand then
    begin
      bUserEventBand := False;
      CheckMode(freq);
      exit;
    end;
    // CheckMode;
    lDllCommand(DC_BAND_CHANGED, nil, lParam, wParam);
  end
  else
    Result := False;
end;

function TdmCatOmniRig.SetMode(Mode: TOleEnum): boolean;
var
  lParam, wParam: variant;
begin
  qryBandGridModeCatFreq.Close;
  qryBandGridModeCatFreq.Params.ParamByName('freq').AsFloat := OmniRig.Rig1.freq / 1000000;
  qryBandGridModeCatFreq.Params.ParamByName('mode').AsString := QuotedStr(GetCurrentCatMode);
  qryBandGridModeCatFreq.Open;
  if not qryBandGridModeCatFreq.IsEmpty then
  exit;
{     if CurrentCATMode=qryBandGridModeFreq.FieldByName('BANDGRID_CAT_MODE').asString then exit
  else
    CurrentCATMode:=qryBandGridModeFreq.FieldByName('BANDGRID_CAT_MODE').asString;}









  Result := true;
  OldMode := Mode;
  bRadioEventMode := true;
  wParam:=Mode;

  case Mode of
    PM_CW_U, PM_CW_L:
      begin
        lParam := 'CW';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;
    PM_SSB_U, PM_SSB_L:
      begin
        lParam := 'SSB';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;
    PM_AM:
      begin
        lParam := 'AM';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;
    PM_FM:
      begin
        lParam := 'FM';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;

    PM_DIG_U:
      begin
        lParam := 'RTTY';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;
    PM_DIG_L:
      begin
        lParam := 'RTTY';
        lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
      end;
  else
    Result := False;
  end;
end;

procedure TdmCatOmniRig.CheckMode(freq: integer);
var
 lMode:integer;
begin
  // ShowMessage(IntToStr(freq));
  lMode := GetModeByFreq(freq,GetCurrentMode);
  if lMode<>-1 then
     OmniRig.Rig1.Mode := lMode
  else
  begin
  if (OmniRig.Rig1.Mode = PM_SSB_U) and (freq <= 10000000) then
    OmniRig.Rig1.Mode := PM_SSB_L;

  if (OmniRig.Rig1.Mode = PM_SSB_L) and (freq > 10000000) then
    OmniRig.Rig1.Mode := PM_SSB_U;

  if (OmniRig.Rig1.Mode = PM_DIG_U) and (freq <= 10000000) then
    OmniRig.Rig1.Mode := PM_DIG_L;

  if (OmniRig.Rig1.Mode = PM_DIG_L) and (freq > 10000000) then
    OmniRig.Rig1.Mode := PM_DIG_U;
  end;
end;

procedure TdmCatOmniRig.ParamsChangeEvent(Sender: TObject; RigNumber: integer;
  Params: integer);
var
  rBand: real;
  lParam, wParam: variant;
begin
  if (OmniRig.Rig1.Tx=PM_TX) and (OmniRig.Rig1.freq>0) and Rx then
    begin
      lDllCommand(DC_RADIO_TX, Self, lParam, wParam);
      Rx:=False;
    //  exit;
    end;

  if (OmniRig.Rig1.Tx=PM_RX) and not Rx then
    begin
      lDllCommand(DC_RADIO_RX, Self, lParam, wParam);
      Rx:=True;
     // exit;
    end;

  CurrentFreq := OmniRig.Rig1.freq;
  if bManualTune then
   begin
    OldFreq := OmniRig.Rig1.freq;
    bManualTune:=False;
    Exit;
   end;
  SetActiveVFO;

  if ldsLogEdit.DataSet.State in [dsInsert] then
    if CurrentFreq <> 0 then
    begin
      bCatTune:=True;
      ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat := CurrentFreq / 1000000;
    end;

  if (OldMode <> OmniRig.Rig1.Mode) and (not bUserEventMode) then
    SetMode(OmniRig.Rig1.Mode);

  if bUserEventMode then
  begin
    bUserEventMode := False;
  end;

  if bUserEventBand then
  begin
    bUserEventBand := False;
    CheckMode(OmniRig.Rig1.freq);
    OldFreq := OmniRig.Rig1.freq;
    exit;
  end;
  if (OmniRig.Rig1.freq < CurrentFreqMin) or
    (OmniRig.Rig1.freq > CurrentFreqMax) then
  begin
    bRadioEventBand := true;
    CheckMode(OmniRig.Rig1.freq);
    if SetBandByFreq(OmniRig.Rig1.freq) then
      OldFreq := OmniRig.Rig1.freq;
  end
  else
    OldFreq := OmniRig.Rig1.freq;
end;

procedure TdmCatOmniRig.Connect;
begin
 OmniRig := TOmniRigX.Create(Self);

  bInitBand := False;
 if not CheckInstalled then
  begin
   {   MessageBox(aApplication.Handle, PWideChar('Can''t connect to OmniRig.'),
        PWideChar('Error'), MB_OK or MB_ICONERROR or MB_TOPMOST);
 }
      bConnected := False;
      exit;
  end;

  try
    OmniRig.Connect;
    CurrentFreq := OmniRig.Rig1.freq;
    OmniRig.OnParamsChange := dmCatOmniRig.ParamsChangeEvent;
    bConnected := true;
    bRadioEventBand := False;
    bUserEventBand := False;
    OldBand := 0;
  except
    on E: Exception do
    begin
{      MessageBox(aApplication.Handle, PWideChar('Can''t connect to OmniRig.'),
        PWideChar('Error'), MB_OK or MB_ICONERROR or MB_TOPMOST);}
      bConnected := False;
    end;
  end;
end;

procedure TdmCatOmniRig.BandChange(lParam, wParam: variant);
var
  sFreq: string;
  freq: integer;
begin
  if not bConnected then
    exit;

  if not bLoaded then
  begin
    initBand := lParam;
    exit;
  end;
  if bRadioEventBand then
  begin
    bRadioEventBand := False;
    exit;
  end;

  if bSetRadioToSpot then
   begin
    bSetRadioToSpot:=false;
  if (OldBand <> 0) and (OldFreq <> 0) then
    sFreqList.Values[FloatToStr(SimpleRoundTo(OldBand, -3))] := IntToStr(OldFreq);
      OldBand:=lParam;
    exit;
   end;

  if (OldBand <> 0) and (OldFreq <> 0) then
    sFreqList.Values[FloatToStr(SimpleRoundTo(OldBand, -3))] := IntToStr(OldFreq);
  bUserEventBand := true;
  if wParam = 0 then // Click on button
  begin
    sFreq := sFreqList.Values[VarToStr(lParam)];
    if sFreq <> '' then
    begin
      // bUserEventBand:=True;
      SetBandByFreq(StrToInt(sFreq));
      SetFreq(StrToInt(sFreq));
      // OmniRig.Rig1.freq := StrToInt(sFreq);
      // CheckMode(StrToInt(sFreq));
    end
    else
    begin
      qryBandGrid.Close;
      qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat := lParam;
      try
        qryBandGrid.Open;
        freq := Round(qryBandGrid.FieldByName('fmin').AsFloat * 1000000);
        // bUserEventBand:=True;
        SetBandByFreq(Round(freq));
        SetFreq(Round(freq));
        // OmniRig.Rig1.freq := Round(freq);
        // CheckMode(Round(freq));
      except
      end;
    end;
  end
  else
  begin
    OldFreq := CurrentFreq;
    CurrentFreq := wParam;
    SetBandByFreq(wParam);
    SetFreq(wParam);
    // OmniRig.Rig1.freq := wParam;
    // CheckMode(wParam);
  end;
end;

procedure TdmCatOmniRig.ModeChange(lParam, wParam: variant);
var
  lFreq: integer;
  lMode:integer;
begin
  if not bConnected or not bLoaded then
    exit;

  if bRadioEventMode then
  begin
    bRadioEventMode := False;
    exit;
  end;

  if bSetRadioToSpot then exit;

  bUserEventMode := true;

  lFreq := OmniRig.Rig1.freq;
  lMode := GetModeByFreq(lFreq,lParam);

  if lMode<>-1 then
     OmniRig.Rig1.Mode := lMode
  else
  begin
   if lParam = 'CW' then
      OmniRig.Rig1.Mode := PM_CW_U;

   if lParam = 'SSB' then
     if CurrentFreq <= 10000000 then
       OmniRig.Rig1.Mode := PM_SSB_L
     else
       OmniRig.Rig1.Mode := PM_SSB_U;

   if lParam = 'PSK31' then
     if CurrentFreq <= 10000000 then
       OmniRig.Rig1.Mode := PM_DIG_L
     else
       OmniRig.Rig1.Mode := PM_DIG_U;

   if lParam = 'AM' then
      OmniRig.Rig1.Mode := PM_AM;

   if lParam = 'FM' then
      OmniRig.Rig1.Mode := PM_FM;
  end;

  bUserEventBand := true;
  // SetFreq(CurrentFreq);
  // OmniRig.Rig1.Freq:=CurrentFreq;
end;


function TdmCatOmniRig.GetModeByFreq(freq: integer;Mode:string) : integer;
begin
 CurrentMode:=Mode;
  Result := -1;
  qryBandGridModeFreq.Close;
  qryBandGridModeFreq.Params.ParamByName('freq').AsFloat := freq / 1000000;
  qryBandGridModeFreq.Params.ParamByName('mode').AsString := QuotedStr(Mode);
  qryBandGridModeFreq.Open;
  if qryBandGridModeFreq.IsEmpty then
    Result := -1
  else
  begin
    CurrentCatMode := qryBandGridModeFreq.FieldByName('BANDGRID_CAT_MODE').AsString;
    if CurrentCatMode='CW_U' then result:=PM_CW_U;
    if CurrentCatMode='CW_L' then result:=PM_CW_L;
    if CurrentCatMode='SSB_U' then result:=PM_SSB_U;
    if CurrentCatMode='SSB_L' then result:=PM_SSB_L;
    if CurrentCatMode='DIG_U' then result:=PM_DIG_U;
    if CurrentCatMode='DIG_L' then result:=PM_DIG_L;
    if CurrentCatMode='AM' then result:=PM_AM;
    if CurrentCatMode='FM' then result:=PM_FM;
  end;
end;

function TdmCatOmniRig.GetBandByFreq(freq: integer): real;
begin
  qryBandGridFreq.Close;
  qryBandGridFreq.Params.ParamByName('freq').AsFloat := freq / 1000000;
  qryBandGridFreq.Open;
  if qryBandGridFreq.IsEmpty then
    Result := -1
  else
    Result := qryBandGridFreq.FieldByName('BANDGRID_BAND_MHZ').AsFloat;
end;

procedure TdmCatOmniRig.InitData;
var
  rBand: real;
  lParam, wParam: variant;
  freq: integer;
begin
  bLoaded := true;
  Rx:=true;
  if not bConnected then
    exit;
  if OmniRig.Rig1.freq <> 0 then
  begin
    bRadioEventBand := true;
    SetActiveVFO;
    OldFreq := OmniRig.Rig1.freq;
    SetBandByFreq(OmniRig.Rig1.freq);
    if OldBand = 0 then // wrong freq
    begin
      qryBandGrid.Close;
      qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat := initBand;
      try
        qryBandGrid.Open;
        freq := Round(qryBandGrid.FieldByName('fmin').AsFloat * 1000000);
        // bUserEventBand:=True;
        // OmniRig.Rig1.freq := Round(freq);
        SetFreq(Round(freq));
        SetBandByFreq(Round(freq));
      except
      end;
    end;

    SetMode(OmniRig.Rig1.Mode);
    CheckMode(OmniRig.Rig1.freq);
  end;

end;

procedure TdmCatOmniRig.NewQSO;
begin
  if ldsLogEdit.DataSet.State in [dsEdit, dsInsert] then
  begin
    bCatTune:=True;
    if bConnected then
       ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat := OmniRig.Rig1.GetRxFrequency / 1000000;
  end;
end;

procedure TdmCatOmniRig.SetActiveVFO;
begin
  case OmniRig.Rig1.Vfo of
    PM_VFOAA, PM_VFOAB, PM_VFOA:
      iActiveVFO := 1;
    PM_VFOBA, PM_VFOBB, PM_VFOB:
      iActiveVFO := 2;
  else
    iActiveVFO := 0;
  end;
end;

procedure TdmCatOmniRig.SetFreq(aFreq: integer);
begin
  case iActiveVFO of
    0:
      OmniRig.Rig1.freq := aFreq;
    1:
      OmniRig.Rig1.FreqA := aFreq;
    2:
      OmniRig.Rig1.FreqB := aFreq;
  end;
end;

function TdmCatOmniRig.GetCurrentMode: string;
begin
 case OmniRig.Rig1.Mode of
  PM_CW_U : result:='CW';
  PM_CW_L : result:='CW';
  PM_SSB_U : result:='SSB';
  PM_SSB_L : result:='SSB';
  PM_DIG_U : result:='DIG';
  PM_DIG_L : result:='DIG';
  PM_AM: result:='AM';
  PM_FM: result:='FM';
 end;
end;


function TdmCatOmniRig.GetCurrentCatMode: string;
begin
 case OmniRig.Rig1.Mode of
  PM_CW_U : result:='CW_U';
  PM_CW_L : result:='CW_L';
  PM_SSB_U : result:='SSB_U';
  PM_SSB_L : result:='SSB_L';
  PM_DIG_U : result:='DIG_U';
  PM_DIG_L : result:='DIG_L';
  PM_AM: result:='AM';
  PM_FM: result:='FM';
 end;
end;



procedure TdmCatOmniRig.SetRadioToSpot(lParam,wParam : variant);
var
 lMode : integer;
begin
  if not bConnected or not bLoaded then
    exit;

  if bRadioEventMode then
  begin
    bRadioEventMode := False;
    exit;
  end;
  bUserEventMode := true;

  bSetRadioToSpot:=True;

  if (ldsLogEdit.DataSet.State in [dsInsert]) then
   if ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat<>0 then
     ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat:=lParam/1000000;


  lMode := GetModeByFreq(lParam,wParam);

  if (lMode<>-1) then
  begin
   if lMode<> OmniRig.Rig1.Mode then
     OmniRig.Rig1.Mode := lMode
  end
  else
  begin
//  lFreq := OmniRig.Rig1.freq;
  if wParam = '' then
     OmniRig.Rig1.Mode := OmniRig.Rig1.Mode;

  if wParam = 'CW' then
    OmniRig.Rig1.Mode := PM_CW_U;

  if wParam = 'SSB' then
    if lParam <= 10000000 then
      OmniRig.Rig1.Mode := PM_SSB_L
    else
      OmniRig.Rig1.Mode := PM_SSB_U;

  if wParam = 'PSK31' then
    if lParam <= 10000000 then
      OmniRig.Rig1.Mode := PM_DIG_L
    else
      OmniRig.Rig1.Mode := PM_DIG_U;

  if wParam = 'AM' then
    OmniRig.Rig1.Mode := PM_AM;

  if wParam = 'FM' then
    OmniRig.Rig1.Mode := PM_FM;
  end;
  SetFreq(lParam);

  bUserEventBand := true;

end;



function TdmCatOmniRig.CheckInstalled:boolean;
var
   ClassID: TCLSID;
   strOLEObject: string;
begin
  strOLEObject := 'OmniRig.OmniRigX';
  if (CLSIDFromProgID(PWideChar(WideString(strOLEObject)), ClassID) = S_OK) then
    result:=True
  else
    result:=False;
end;



end.
