unit uWindowGoogleMap;

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
  uWindowGoogleMapForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject;lParam, wParam: variant): Integer; stdcall;

var
  WindowGoogleMapForm: TWindowGoogleMapForm;
  aHandle: THandle;
  aApplication: TApplication;
  lAppStorage: TJvAppIniFileStorage;
  ldsLogEdit: TDataSource;
  ldsLog: TDataSource;
  lDatabase: TKADaoDatabase;
  lDllCommand: TDllCommand;
  lMode: string;
  StationId: Integer;

implementation

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
  Application := App;
  ldsLogEdit := dsLogEdit;
  ldsLog := dsLog;
  lDatabase := Database;
  lAppStorage := AppStorage;
  @lDllCommand := DllCommand;
  if not Assigned(WindowGoogleMapForm) then
  begin
    WindowGoogleMapForm := TWindowGoogleMapForm.Create(Application,ldsLogEdit,IMSName);
    WindowGoogleMapForm.qryMap.Database := lDatabase;
    WindowGoogleMapForm.FormStorageOnExit.AppStorage:=lAppStorage;
    WindowGoogleMapForm.FormStorageOnExit.RestoreFormPlacement;
    WindowGoogleMapForm.MainToolBarPanel:=WindowGoogleMapForm.pnlMainToolBar;
    PluginForm:=WindowGoogleMapForm;
  end;
  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  if Assigned(WindowGoogleMapForm) then
    WindowGoogleMapForm.Free;
  Result := 1;
end;

function CoreCommand(IdCommand: Integer; Sender: TObject;
  lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CA_CALL_INFO:
      if Assigned(WindowGoogleMapForm) then
        WindowGoogleMapForm.CallInfo;
    CA_CANCEL_QSO:
      if Assigned(WindowGoogleMapForm) then
        WindowGoogleMapForm.CancelQSO;
    CA_NEW_QSO:
      if Assigned(WindowGoogleMapForm) then
        WindowGoogleMapForm.CancelQSO;
    CC_STATION_CHANGED:
      begin
        StationId := lParam;
        if Assigned(WindowGoogleMapForm) then
          WindowGoogleMapForm.CancelQSO;
      end;
    CC_OPTIONS_CHANGED:
      begin
        if Assigned(WindowGoogleMapForm) then
          WindowGoogleMapForm.CancelQSO;
      end;

  end;

end;

end.
