unit uWindowCluster;

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
  Variants,
  KDaoDatabase,
  DBGridEh,
  Graphics,
  uUtils,
  uWindowClusterForm,
  uWindowClusterSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string;
  var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
function CoreGetData(IdCommand: Integer; var lParam, wParam: variant): Integer; stdcall;

var
  WindowClusterForm: TWindowClusterForm;
  WindowClusterSettingsFrame: TWindowClusterSettingsFrame;
  aHandle: THandle;
  aApplication: TApplication;
  lAppStorage: TJvAppIniFileStorage;
  lActionList: TActionList;
  ldsLogEdit: TDataSource;
  ldsLog: TDataSource;
  lDatabase: TKADaoDatabase;
  lDllCommand: TDllCommand;
  lMode: string;
  bCheckNewOneForAllBook: boolean;
  lBand: real;
  fDeinitialize:boolean;

implementation

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string;
  var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
procedure RestoreFontColor(Grid:TDBGridEh);
begin
    Grid.Font.Name:=lAppStorage.ReadString('WindowClusterForm\'+Grid.Name+'.FontName');
    if lAppStorage.ReadInteger('WindowClusterForm\'+Grid.Name+'.FontSize')<>0 then
      Grid.Font.Size:=lAppStorage.ReadInteger('WindowClusterForm\'+Grid.Name+'.FontSize');
    if lAppStorage.ReadString('WindowClusterForm\'+Grid.Name+'.FontColor')<>'' then
       Grid.Font.Color:=lAppStorage.ReadInteger('WindowClusterForm\'+Grid.Name+'.FontColor')
    else
       Grid.Font.Color:=clWindowText;
    Grid.Font.Style:=IntToFontStyle(lAppStorage.ReadInteger('WindowClusterForm\'+Grid.Name+'.FontStyle'));
    Grid.DrawGraphicData:=lAppStorage.ReadBoolean('WindowClusterForm\'+Grid.Name+'.UseCustomColorFont',False);
    if Grid.DrawGraphicData then
     begin
      if lAppStorage.ReadString('WindowClusterForm\'+Grid.Name+'.BackgroundColor')<>'' then
        Grid.Color:=lAppStorage.ReadInteger('WindowClusterForm\'+Grid.Name+'.BackgroundColor');
     end;

end;
begin
  aApplication := App;
  ldsLogEdit := dsLogEdit;
  ldsLog := dsLog;
  lActionList := ActionList;
  lDatabase := Database;
  lAppStorage := AppStorage;
  @lDllCommand := DllCommand;
  if not Assigned(WindowClusterSettingsFrame) then
  begin
    WindowClusterSettingsFrame := TWindowClusterSettingsFrame.Create(aApplication);
    WindowClusterSettingsFrame.FormStorage.AppStorage := lAppStorage;
    WindowClusterSettingsFrame.FormStorage.RestoreFormPlacement;
    SettingsFrame := WindowClusterSettingsFrame;
  end;
  if not Assigned(WindowClusterForm) then
  begin
    WindowClusterForm := TWindowClusterForm.Create(aApplication, ldsLogEdit, IMSName);
    WindowClusterForm.FormStorage.AppStorage := lAppStorage;
    WindowClusterForm.FormStorageOnExit.AppStorage := lAppStorage;
//    WindowClusterForm.FormStorageOnExit.RestoreFormPlacement;
    WindowClusterForm.qryBands.Database := lDatabase;
    // WindowClusterForm.qryDXCC.Database:=lDataBase;
    WindowClusterForm.qryModes.Database := lDatabase;
    WindowClusterForm.qryBandGrid.Database := lDatabase;
    WindowClusterForm.MainToolBarPanel := WindowClusterForm.pnlMainToolBar;
    WindowClusterForm.FormStorage.RestoreFormPlacement;
    WindowClusterForm.dbgClusterWWW.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowClusterForm.FormStorage.AppStorage).FileName, 'WindowClusterForm',
      [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);
    WindowClusterForm.dbgClusterTelnet.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowClusterForm.FormStorage.AppStorage).FileName, 'WindowClusterForm',
      [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    RestoreFontColor(WindowClusterForm.dbgClusterTelnet);
    RestoreFontColor(WindowClusterForm.dbgClusterWWW);

    WindowClusterForm.InitData;
    lMode := lAppStorage.ReadString('Options\Mode', '');
    WindowClusterForm.ModeChanged(lMode);
    bCheckNewOneForAllBook := lAppStorage.ReadBoolean('Options\cbCheckNewOneForAllBook_Checked', False);
    WindowClusterForm.pnlToolBarWWW.Visible := WindowClusterForm.pgCluster.ActivePage = WindowClusterForm.tsClusterWWW;
    WindowClusterForm.pnlToolBarTelnet.Visible := WindowClusterForm.pgCluster.ActivePage = WindowClusterForm.tsClusterTelnet;
    WindowClusterForm.FormStorageOnExit.RestoreFormPlacement;

    PluginForm := WindowClusterForm;
    { WindowClusterForm.qryLastContacts.Database:=lDataBase;
      WindowClusterForm.FormStorage.AppStorage:=lAppStorage; }
  end;
  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  fDeinitialize:=true;
  if Assigned(WindowClusterForm) then
  begin
    WindowClusterForm.Telnet.Close;
//    WindowClusterForm.Telnet.Disconnect();
    WindowClusterForm.thrTelnet.Terminate;
    WindowClusterForm.thrWWW.Terminate;
    WindowClusterForm.Free;
  end;
  if Assigned(WindowClusterSettingsFrame) then
    WindowClusterSettingsFrame.Free;
  Result := 1;
end;

procedure DoWindowShow;
begin
  { if Assigned(WindowClusterForm) then
    WindowClusterForm.CallChanged; }
end;

function Settings(): TFrame; stdcall;
begin
  { if not Assigned(WindowClusterSettingsFrame) then
    begin
    WindowClusterSettingsFrame:=TWindowClusterSettingsFrame.Create(aApplication);
    WindowClusterSettingsFrame.FormStorage.AppStorage :=lAppStorage;
    end; }
  Result := WindowClusterSettingsFrame;
end;

function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_WINDOW_SHOW:
      DoWindowShow;
    CC_LOADED:
      if Assigned(WindowClusterForm) then
      WindowClusterForm.Load;

    CC_MODE_CHANGED:
      begin
        lMode := VarToStr(lParam);
        { if Assigned(WindowClusterForm) then
          WindowClusterForm.ModeChanged(lParam); }
      end;
    CC_BAND_CHANGED:
      begin
        lBand := lParam;
         if Assigned(WindowClusterForm) then
            WindowClusterForm.BandChanged(lParam);
      end;
    CC_STATION_CHANGED:
      begin
        if Assigned(WindowClusterForm) then
        begin
        if WindowClusterForm.StationCall= VarToStr(wParam) then exit;

          WindowClusterForm.StationCall := VarToStr(wParam);
          WindowClusterForm.ModeChanged(lParam);
          WindowClusterForm.StationChanged(lParam);
        end;
      end;
    CC_OPTIONS_CHANGED:
      begin
        bCheckNewOneForAllBook := lAppStorage.ReadBoolean('Options\cbCheckNewOneForAllBook_Checked', False);
        if Assigned(WindowClusterForm) then
          WindowClusterForm.OptionsChanged;
      end;
    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowClusterForm) then
      begin
        WindowClusterForm.SaveGrid;
        WindowClusterForm.FormStorage.SaveFormPlacement;
      end;
    CC_CALLDESCRIPTION_LOADED:
      if Assigned(WindowClusterForm) then
      begin
       WindowClusterForm.CallDescList:=Pointer(Integer(lParam));
      end;


  end;
end;

function CoreGetData(IdCommand: Integer; var lParam, wParam: variant): Integer; stdcall;
begin
 { case IdCommand of
    CC_GET_CLUSTER_SPOT_WWW:
      if Assigned(WindowClusterForm) then
        lParam:=Integer(Pointer(WindowClusterForm.cdsClusterWWW));
  end;       }
end;




end.
