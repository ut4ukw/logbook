unit uWindowBandMap;

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
  uWindowBandMapForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string;
  var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;

var
  WindowBandMapForm: TWindowBandMapForm;
  aHandle: THandle;
  aApplication: TApplication;
  lAppStorage: TJvAppIniFileStorage;
  ldsLogEdit: TDataSource;
  lDatabase: TKADaoDatabase;
  lDllCommand: TDllCommand;
  lMode: string;
  lBand:real;

implementation

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string;
  var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
begin
  Application := App;
  ldsLogEdit := dsLogEdit;
  lDatabase := Database;
  lAppStorage := AppStorage;
  @lDllCommand := DllCommand;
  if not Assigned(WindowBandMapForm) then
  begin
    WindowBandMapForm := TWindowBandMapForm.Create(Application);
    WindowBandMapForm.MainToolBarPanel := WindowBandMapForm.pnlMainToolbar;
    WindowBandMapForm.FormStorageOnExit.AppStorage := lAppStorage;
    WindowBandMapForm.FormStorageOnExit.RestoreFormPlacement;
    WindowBandMapForm.qryBands.Database := lDatabase;
    WindowBandMapForm.qryBandGrid.Database := lDatabase;
    WindowBandMapForm.InitData;
    PluginForm := WindowBandMapForm;
  end;

  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  if Assigned(WindowBandMapForm) then
  begin
    WindowBandMapForm.DeInitData;
    WindowBandMapForm.Free;
  end;
  Result := 1;
end;

function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_CLUSTER_WWW_CHANGED:
      if Assigned(WindowBandMapForm) then
        WindowBandMapForm.ClusterWWWChanged(lParam,wParam);
    CC_CLUSTER_TELNET_CHANGED:
      if Assigned(WindowBandMapForm) then
        WindowBandMapForm.ClusterTelnetChanged(lParam,wParam);
    CC_OPTIONS_CHANGED:
      begin
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.OptionsChanged;
      end;
    CC_LOADED:
      begin
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.Loaded;
      end;

  CC_CLUSTER_WWW_CLEAR:
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.ClusterWWWClear;

  CC_CLUSTER_TELNET_CLEAR:
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.ClusterTelnetClear;

  CC_CLUSTER_WWW_LOADED:
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.ClusterWWWLoaded(lParam);

  CC_CLUSTER_TELNET_LOADED:
        if Assigned(WindowBandMapForm) then
          WindowBandMapForm.ClusterTelnetLoaded(lParam);

    CC_BAND_CHANGED:
        lBand := lParam;


  end;
end;

end.
