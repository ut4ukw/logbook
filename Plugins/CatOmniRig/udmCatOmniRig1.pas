unit udmCatOmniRig;

interface

uses
  SysUtils, Classes, DB, KDaoTable, OmniRig_TLB, Windows, uUtils, Variants,
  JvMemoryDataset, uPluginHeaders, Math;

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
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
     Loaded:boolean;
     bInitBand:boolean;
     Connected:boolean;
     CurrentFreq:integer;
     OldFreq:integer;
     CurrentFreqMin,CurrentFreqMax:integer;
     CurrentBand:real;
     OmniRig:TOmniRigX;
     procedure StatusChangeEvent(Sender: TObject; RigNumber: Integer);
     procedure ParamsChangeEvent(Sender: TObject; RigNumber: Integer; Params: Integer);
     procedure Connect;
     procedure BandChange(lParam,wParam : variant);
     procedure ModeChange(lParam,wParam : variant);
     function GetBandByFreq(freq:integer):real;
     procedure SetFreqBand(Band:real);
     procedure InitData;
  end;

var
  dmCatOmniRig: TdmCatOmniRig;

implementation

uses uCatOmniRig;

{$R *.dfm}

procedure TdmCatOmniRig.DataModuleDestroy(Sender: TObject);
begin
if Connected then
   OmniRig.Disconnect;
end;

procedure TdmCatOmniRig.ParamsChangeEvent(Sender: TObject; RigNumber: Integer; Params: Integer);
var
rBand:real;
lParam,wParam:variant;
begin
//  CurrentFreq:=OmniRig.Rig1.Freq;
  if (OmniRig.Rig1.Freq<CurrentFreqMin) or (OmniRig.Rig1.Freq>CurrentFreqMax) then
   begin
    rBand:=GetBandByFreq(OmniRig.Rig1.Freq);
    if rBand<>-1 then
     begin
      lParam:=rBand;
//      sFreqList.Values[FloatToStr(SimpleRoundTo(CurrentBand, -1))]:=IntToStr(CurrentFreq);
      CurrentFreq:=OmniRig.Rig1.Freq;
      wParam:=CurrentFreq;
      lDllCommand(DC_BAND_CHANGED,nil,lParam,wParam);
     end;
   end;
OldFreq:=CurrentFreq;
end;


procedure TdmCatOmniRig.StatusChangeEvent(Sender: TObject; RigNumber: Integer);
var
rBand:real;
begin
{  CurrentFreq:=OmniRig.Rig1.Freq;
  if (CurrentFreq<CurrentFreqMin) or (CurrentFreq>CurrentFreqMax) then
   begin
    rBand:=GetBandByFreq(CurrentFreq);
    if rBand<>-1 then
      BandChange(rBand,CurrentFreq);
   end;}
end;

procedure TdmCatOmniRig.Connect;
begin
 OmniRig:=TOmniRigX.Create(Self);
 bInitBand:=False;
 try
   OmniRig.Connect;
   CurrentFreq:=OmniRig.Rig1.Freq;
   OmniRig.OnStatusChange:=dmCatOmniRig.StatusChangeEvent;
   OmniRig.OnParamsChange:=dmCatOmniRig.ParamsChangeEvent;
   Connected:=true;
 except
   on E:Exception do
   begin
      MessageBox(aApplication.Handle,
        PWideChar('Can''t connect to OmniRig.'),
        PWideChar('Error'), MB_OK or MB_ICONERROR or  MB_TOPMOST);
     Connected:=false;
   end;
 end;
end;

procedure TdmCatOmniRig.BandChange(lParam,wParam : variant);
var
 i :integer;
 Freq:integer;
 sFreq,sOldFreq:string;
 rBand:real;
begin
if not Connected then exit;
if not Loaded then exit;

Freq:=0;
if OldFreq<>0 then
  sFreqList.Values[FloatToStr(SimpleRoundTo(CurrentBand,-1))]:=IntToStr(OldFreq);
if wParam<>0 then
  begin
     OmniRig.Rig1.Freq:=wParam;
//     rBand:=GetBandByFreq(wParam);
  end
  else
  begin
    sFreq:=sFreqList.Values[StringReplace(VarToStr(lParam),'.',GetDelimeter,[rfReplaceAll, rfIgnoreCase])];
    if sFreq<>'' then
    begin
      Freq:=StrToInt(sFreq);
      OmniRig.Rig1.Freq:=Freq;
    end
    else
    begin
      qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat:=lParam;
      try
       qryBandGrid.Open;
       Freq:=Round(qryBandGrid.FieldByName('fmin').AsFloat*1000000);
       sFreqList.Add(VarToStr(lParam)+'='+IntToStr(Freq));
       OmniRig.Rig1.Freq:=Round(Freq);
      except
      end;
    end;
  end;

if CurrentBand<>lParam then
 begin
  SetFreqBand(lParam);
 end;

CurrentBand:=lParam;
qryBandGrid.Close;


{
Freq:=0;
if CurrentFreq<>0 then
  sFreqList.Values[FloatToStr(CurrentBand)]:=IntToStr(CurrentFreq);
  if wParam<>0 then
   begin
     OmniRig.Rig1.Freq:=wParam;
     exit;
   end;
sFreq:=sFreqList.Values[StringReplace(VarToStr(lParam),'.',GetDelimeter,[rfReplaceAll, rfIgnoreCase])];
if sFreq<>'' then
begin
  Freq:=StrToInt(sFreq);
  OmniRig.Rig1.Freq:=Freq;
end
else
begin
 qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat:=lParam;
 try
  qryBandGrid.Open;
  Freq:=Round(qryBandGrid.FieldByName('fmin').AsFloat*1000000);
  qryBandGrid.Close;
  sFreqList.Add(VarToStr(lParam)+'='+IntToStr(Freq));
  OmniRig.Rig1.Freq:=Round(Freq);
 except
 end;
end;
CurrentBand:=lParam;
}


end;

procedure TdmCatOmniRig.ModeChange(lParam,wParam : variant);
begin
if not Connected then exit;
 if lParam='CW' then
 { if CurrentFreq<10000000 then
      OmniRig.Rig1.Mode:=PM_CW_L
  else           }
      OmniRig.Rig1.Mode:=PM_CW_U;

 if lParam='SSB' then
  if CurrentFreq<10000000 then
     OmniRig.Rig1.Mode:=PM_SSB_L
  else
     OmniRig.Rig1.Mode:=PM_SSB_U;

 if lParam='PSK31' then
  if CurrentFreq<10000000 then
     OmniRig.Rig1.Mode:=PM_DIG_L
  else
     OmniRig.Rig1.Mode:=PM_DIG_U;

 if lParam='AM' then
     OmniRig.Rig1.Mode:=PM_AM;

 if lParam='FM' then
     OmniRig.Rig1.Mode:=PM_FM;
end;

function TdmCatOmniRig.GetBandByFreq(freq:integer):real;
begin
 qryBandGridFreq.Close;
 qryBandGridFreq.Params.ParamByName('freq').AsFloat:=freq/1000000;
 qryBandGridFreq.Open;
 if qryBandGridFreq.IsEmpty then
  Result:=-1
 else
  Result:=qryBandGridFreq.FieldByName('BANDGRID_BAND_MHZ').AsFloat;
end;

procedure TdmCatOmniRig.SetFreqBand(Band:real);
begin
 if not qryBandGrid.Active then
  begin
   qryBandGrid.Params.ParamByName('bandgrid_band_mhz').AsFloat:=Band;
   qryBandGrid.Open;
  end;
 CurrentFreqMin:=Round(qryBandGrid.FieldByName('fmin').AsFloat*1000000);
 CurrentFreqMax:=Round(qryBandGrid.FieldByName('fmax').AsFloat*1000000);
end;

procedure TdmCatOmniRig.InitData;
var
 rBand:real;
 lParam,wParam:variant;
begin
  Loaded:=true;
  if CurrentFreq<>0 then
   begin
    rBand:=GetBandByFreq(CurrentFreq);
    if rBand<>-1 then
    begin
      lParam:=rBand;
      wParam:=CurrentFreq;
      CurrentBand:=lParam;
      SetFreqBand(CurrentBand);
      OldFreq:=CurrentFreq;
      lDllCommand(DC_BAND_CHANGED,nil,lParam,wParam);
    end;
   end;
end;







end.
