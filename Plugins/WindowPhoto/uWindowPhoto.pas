unit uWindowPhoto;

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
  uWindowPhotoForm,
  uWindowPhotoSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowPhotoForm:TWindowPhotoForm;
WindowPhotoSettingsFrame:TWindowPhotoSettingsFrame;
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

 if not Assigned(WindowPhotoSettingsFrame) then
 begin
   WindowPhotoSettingsFrame:=TWindowPhotoSettingsFrame.Create(aApplication);
   WindowPhotoSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   SettingsFrame:=WindowPhotoSettingsFrame;
 end;

 if not Assigned(WindowPhotoForm) then
   begin
     WindowPhotoForm:=TWindowPhotoForm.Create(Application,ldsLogEdit,IMSName);
     PluginForm:=WindowPhotoForm;
   end;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
   WindowPhotoForm.thrPhoto.Terminate;
 if Assigned(WindowPhotoSettingsFrame) then
   WindowPhotoSettingsFrame.Free;

 if Assigned(WindowPhotoForm) then
   WindowPhotoForm.Free;
 Result:=1;
end;


procedure DoWindowShow;
begin
end;



function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
   CA_CALL_INFO : if Assigned(WindowPhotoForm) then WindowPhotoForm.CallInfo;
   CA_CANCEL_QSO : if Assigned(WindowPhotoForm) then WindowPhotoForm.CancelQSO;
   CA_NEW_QSO : if Assigned(WindowPhotoForm) then WindowPhotoForm.CancelQSO;
   CC_OPTIONS_CHANGED,CC_LOADED : if Assigned(WindowPhotoForm) then WindowPhotoForm.OptionsChanged;
 end;
end;

end.



