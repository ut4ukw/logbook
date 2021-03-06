unit uWindowRadioControl;

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
  Graphics,
  uWindowRadioControlSettingsFrame,
  uWindowRadioControlForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowRadioControlForm:TWindowRadioControlForm;
WindowRadioControlSettingsFrame:TWindowRadioControlSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;

 if not Assigned(WindowRadioControlSettingsFrame) then
 begin
   WindowRadioControlSettingsFrame:=TWindowRadioControlSettingsFrame.Create(aApplication);
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clAqua,'Aqua');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clFuchsia,'Fuchsia');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clBlue,'Blue');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clYellow,'Yellow');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clLime,'Lime');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clRed,'Red');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clNavy,'Navy');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clTeal,'Teal');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clPurple,'Purple');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clOlive,'Olive');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clGreen,'Green');
   WindowRadioControlSettingsFrame.WindowRadioControl_cbFreqDisplayColor.InsertColor(0,clMaroon,'Maroon');
   WindowRadioControlSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   SettingsFrame:=WindowRadioControlSettingsFrame;
 end;


 if not Assigned(WindowRadioControlForm) then
   begin
     WindowRadioControlForm:=TWindowRadioControlForm.Create(Application,ldsLogEdit,IMSName);
     WindowRadioControlForm.FormStorage.AppStorage:=lAppStorage;
     WindowRadioControlForm.qryBands.Database:=lDatabase;
     WindowRadioControlForm.qryModes.Database:=lDatabase;
     WindowRadioControlForm.Band:=lAppStorage.ReadFloat('Options\Band',7);
     WindowRadioControlForm.Mode:=lAppStorage.ReadString('Options\Mode','');
     WindowRadioControlForm.MainToolBarPanel:=WindowRadioControlForm.pnlMainToolbar;
     ldsLogEdit.Dataset.AfterEdit:=WindowRadioControlForm.AfterEdit;
     WindowRadioControlForm.InitData;
//     WindowRadioControlForm.OptionsChanged;
  	 PluginForm:=WindowRadioControlForm;
   end;
 
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 ldsLogEdit.Dataset.AfterEdit:=nil;

 if Assigned(WindowRadioControlSettingsFrame) then
   WindowRadioControlSettingsFrame.Free;

 if Assigned(WindowRadioControlForm) then
  begin
   WindowRadioControlForm.DeInitData;
   WindowRadioControlForm.Free;
  end;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
   CC_BAND_CHANGED    : if Assigned(WindowRadioControlForm) then WindowRadioControlForm.BandChanged(lParam) ;
   CC_MODE_CHANGED    : if Assigned(WindowRadioControlForm) then WindowRadioControlForm.ModeChanged(lParam) ;
   CA_NEW_QSO         : if Assigned(WindowRadioControlForm) then WindowRadioControlForm.NewQSO;
   CC_LOADED,
   CC_OPTIONS_CHANGED : if Assigned(WindowRadioControlForm) then WindowRadioControlForm.OptionsChanged;
 end;
end;

end.



