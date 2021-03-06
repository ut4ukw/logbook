unit uWindowQSLInfo;

interface

uses
  ShareMem,
  SysUtils,
  Forms,
  uPluginHeaders,
  JvAppIniStorage,
  Classes,
  Windows,
  Controls,
  ActnList,
  DB,
  KDaoDataBase,
  uWindowQSLInfoForm;



function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowQSLInfoForm:TWindowQSLInfoForm;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lInitBand,lInitMode:integer;
LangId:integer;



implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 if not Assigned(WindowQSLInfoForm) then
   begin
     WindowQSLInfoForm:=TWindowQSLInfoForm.Create(Application,ldsLogEdit,IMSName);
     WindowQSLInfoForm.dbQSLSentType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbQSLSentVia.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbQSLSentViaRoute.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdQSLSentDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbQSLRcvType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbQSLRcvVia.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdQSLRcvDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbEQSLSentType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdEQSLSentDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbEQSLRcvType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdEQSLRcvDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbDQSLSentType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdDQSLSentDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbDQSLRcvType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdDQSLRcvDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbLQSLSentType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdLQSLSentDate.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbLQSLRcvType.DataSource:=ldsLogEdit;
     WindowQSLInfoForm.dbdLQSLRcvDate.DataSource:=ldsLogEdit;
     PluginForm:=WindowQSLInfoForm;
   end;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowQSLInfoForm) then
   WindowQSLInfoForm.Free;
 Result:=1;
end;


procedure DoWindowShow;
begin
  WindowQSLInfoForm.InitData;
end;



function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
   CC_WINDOW_SHOW     : DoWindowShow;
 end;
end;




end.



