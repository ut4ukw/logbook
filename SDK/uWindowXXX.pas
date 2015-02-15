unit uWindowXXX;

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
  uWindowXXXForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowXXXForm:TWindowXXXForm;
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
 if not Assigned(WindowXXXForm) then
   begin
     WindowXXXForm:=TWindowXXXForm.Create(Application);
	 PluginForm:=WindowXXXForm;
   end;
 
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowXXXForm) then
   WindowXXXForm.Free;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
{ case IdCommand of
   CA_CALL_INFO : if Assigned(WindowXXXForm) then WindowXXXForm.CallInfo;
   CA_CANCEL_QSO : if Assigned(WindowXXXForm) then WindowXXXForm.CancelQSO;
   CA_NEW_QSO : if Assigned(WindowXXXForm) then WindowXXXForm.CancelQSO;
 end;
 }
end;

end.



