unit uWindowSoundRecorder;

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
  uWindowSoundRecorderForm,
  uUtils,
  uWindowSoundRecorderSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowSoundRecorderForm:TWindowSoundRecorderForm;
WindowSoundRecorderSettingsFrame:TWindowSoundRecorderSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
var
 i:integer;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 if not Assigned(WindowSoundRecorderSettingsFrame) then
  begin
   WindowSoundRecorderSettingsFrame:=TWindowSoundRecorderSettingsFrame.Create(aApplication);
   WindowSoundRecorderSettingsFrame.FormStorage.AppStorage :=lAppStorage;
     for i:=0 to WindowSoundRecorderSettingsFrame.AudioIn.DeviceCount-1 do
        WindowSoundRecorderSettingsFrame.cbSoundRecorderDevice.Items.Add(WindowSoundRecorderSettingsFrame.AudioIn.DeviceName[i]);
   SettingsFrame:=WindowSoundRecorderSettingsFrame;
   WindowSoundRecorderSettingsFrame.FormStorage.RestoreFormPlacement;
  end;
 if not Assigned(WindowSoundRecorderForm) then
   begin
     WindowSoundRecorderForm:=TWindowSoundRecorderForm.Create(Application,ldsLogEdit,IMSName);
     WindowSoundRecorderForm.MP3Out.LameFileName:=ExtractFilePath(GetDllFileName)+'lame_enc.dll';
     //WindowSoundRecorderForm.sToolBar1.SkinData.SkinManager
     PluginForm:=WindowSoundRecorderForm;
   end;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowSoundRecorderForm) then
   WindowSoundRecorderForm.Free;
 if Assigned(WindowSoundRecorderSettingsFrame) then
   WindowSoundRecorderSettingsFrame.Free;
 Result:=1;
end;




function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
   CA_SAVE_QSO     : if Assigned(WindowSoundRecorderForm) then
                         if not WindowSoundRecorderSettingsFrame.WindowSoundRecorder_rbManual.Checked then
                          WindowSoundRecorderForm.aSoundRecorderStopExecute(WindowSoundRecorderForm);
   CA_CANCEL_QSO   : if Assigned(WindowSoundRecorderForm) then
                       if not WindowSoundRecorderSettingsFrame.WindowSoundRecorder_rbManual.Checked then
                               WindowSoundRecorderForm.MP3Out.Stop(False);
   CA_NEW_QSO      : if Assigned(WindowSoundRecorderForm) then
                        WindowSoundRecorderForm.NewQSO;
   CC_OPTIONS_CHANGED,CC_LOADED : if Assigned(WindowSoundRecorderForm) then WindowSoundRecorderForm.OptionsChanged;



end;

end;

end.



