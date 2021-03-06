unit uCatOmniRig;

interface

uses
  SysUtils,
  Forms,
  uPluginHeaders,
  JvAppIniStorage,
  Classes,
  Windows,
  Controls,
  ActnList,
  DB,
  Variants,
  KDaoDatabase,
  KDaoTable,
  Math,
  uUtils,
  udmCatOmniRig;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;




var
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;
qryBandGrid: TKADaoTable;
sFreqList:TStringList;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 aApplication:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 sFreqList:=TStringList.Create;
 if FileExists(ExtractFilePath(GetDllFileName)+'CatOmniRig.freq') then
   sFreqList.LoadFromFile(ExtractFilePath(GetDllFileName)+'CatOmniRig.freq');
 dmCatOmniRig:=TdmCatOmniRig.Create(dmCatOmniRig);
 dmCatOmniRig.dsLogEdit.DataSet:=ldsLogEdit.DataSet;
 dmCatOmniRig.qryBandGrid.Database:=lDatabase;
 dmCatOmniRig.qryBandGridModeFreq.Database:=lDatabase;
 dmCatOmniRig.qryBandGridFreq.Database:=lDatabase;
 dmCatOmniRig.qryBandGridModeCatFreq.Database:=lDatabase;
 dmCatOmniRig.qryCatMode.Database:=lDatabase;
 dmCatOmniRig.Connect;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if (dmCatOmniRig.OldBand<>0) and (dmCatOmniRig.OldFreq<>0) then
   sFreqList.Values[FloatToStr(SimpleRoundTo(dmCatOmniRig.OldBand,-3))]:=IntToStr(dmCatOmniRig.OldFreq);
 sFreqList.SaveToFile(ExtractFilePath(GetDllFileName)+'CatOmniRig.freq');
 dmCatOmniRig.Free;
 sFreqList.Free;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
   CA_NEW_QSO : dmCatOmniRig.NewQSO;
   CC_BAND_CHANGED : dmCatOmniRig.BandChange(lParam,wParam);
   CC_MODE_CHANGED : dmCatOmniRig.ModeChange(lParam,wParam);
   CC_LOADED : dmCatOmniRig.InitData;
   CC_SET_RADIO_TO_SPOT : begin
                            dmCatOmniRig.bRadioEventMode:=false;
                            dmCatOmniRig.SetRadioToSpot(lParam,wParam);
                           end;
 end;
end;

end.



