unit uWindowGeoData;


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
  uWindowGeoDataForm;



function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;

var
WindowGeoDataForm:TWindowGeoDataForm;
aHandle:THandle;
aApplication:TApplication;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lInitBand,lInitMode:integer;
lAppStorage:TJvAppIniFileStorage;
bAutoGetCallPrimaryData:boolean;
bCallMistake:boolean;



implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 if not Assigned(WindowGeoDataForm) then
   begin
     WindowGeoDataForm:=TWindowGeoDataForm.Create(Application,ldsLogEdit,IMSName);
     with WindowGeoDataForm do
      begin
        qryTerritory.Database:=lDatabase;
        qryContinents.Database:=lDatabase;
        dbeLocator.DataSource:=ldsLogEdit;
        dblContinents.DataSource:=ldsLogEdit;
        dblTerritory.DataSource:=ldsLogEdit;
        dbceLatitude.DataSource:=ldsLogEdit;
        dbceLongitude.DataSource:=ldsLogEdit;
        dbePrefix.DataSource:=ldsLogEdit;
        dbceDxccId.DataSource:=ldsLogEdit;
        qryContinents.Open;
      end;
     PluginForm:=WindowGeoDataForm;
   end;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowGeoDataForm) then
 begin
   WindowGeoDataForm.qryContinents.Close;
   WindowGeoDataForm.qryTerritory.Close;
   WindowGeoDataForm.Free;
 end;
 Result:=1;
end;

function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
  case IdCommand of
   CC_CALL_CHANGED    : if Assigned(WindowGeoDataForm) then WindowGeoDataForm.CallChanged(wParam);
   CC_LOADED,
   CC_OPTIONS_CHANGED : begin
                           bAutoGetCallPrimaryData:=lAppStorage.ReadBoolean('Options\cbAutoGetCallPrimaryData_Checked',False);
                        end;
   CA_CALL_MISTAKE    : bCallMistake:=True;
   CA_SAVE_QSO,
   CA_CANCEL_QSO      : bCallMistake:=False;

   CA_DATABASE_COMPACT_AND_RESTORE,
   CA_DATABASE_MAKE_BACKUP,
   CA_DATABASE_RESTORE_BACKUP
                      : if Assigned(WindowGeoDataForm) then WindowGeoDataForm.qryContinents.Open;


  end;
end;





end.



