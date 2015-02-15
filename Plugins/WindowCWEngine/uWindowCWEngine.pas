unit uWindowCWEngine;

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
  uWindowCWEngineForm,
  uWindowCWEngineSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowCWEngineForm:TWindowCWEngineForm;
WindowCWEngineSettingsFrame:TWindowCWEngineSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;
lActionList:TActionList;

implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 lActionList:=ActionList;
 @lDllCommand := DllCommand;

 if not Assigned(WindowCWEngineSettingsFrame) then
  begin
   WindowCWEngineSettingsFrame:=TWindowCWEngineSettingsFrame.Create(aApplication);
   WindowCWEngineSettingsFrame.Init;
   WindowCWEngineSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   WindowCWEngineSettingsFrame.FormStorage.RestoreFormPlacement;

   SettingsFrame:=WindowCWEngineSettingsFrame;
  end;

 if not Assigned(WindowCWEngineForm) then
   begin
     WindowCWEngineForm:=TWindowCWEngineForm.Create(Application);
     WindowCWEngineForm.Init;
     WindowCWEngineForm.FormStorageOnExit.AppStorage:=lAppStorage;
     WindowCWEngineForm.FormStorageOnExit.RestoreFormPlacement;

	 PluginForm:=WindowCWEngineForm;
   end;

 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowCWEngineForm) then
 begin
  // WindowCWEngineForm.ComPort.Close;
   WindowCWEngineForm.DeInit;
   WindowCWEngineForm.Free;
 end;
 if Assigned(WindowCWEngineSettingsFrame) then
   WindowCWEngineSettingsFrame.Free;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
    CC_OPTIONS_CHANGED,CC_LOADED:
      begin
        if Assigned(WindowCWEngineForm) then
          WindowCWEngineForm.OptionsChanged;
      end;
    CC_SENT_CW:
        if Assigned(WindowCWEngineForm) then
          WindowCWEngineForm.SentCW(lParam);
    CA_CANCEL_QSO:
        if Assigned(WindowCWEngineForm) then
          WindowCWEngineForm.CancelQSO;

 end;
end;

end.



