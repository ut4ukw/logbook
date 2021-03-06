unit uWindowAwardsStatistics;

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
  EhLibConsts,
  DBGridEh,
  uColors,
  uWindowAwardsStatisticsForm,
  uWindowAwardsStatisticsSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowAwardsStatisticsForm:TWindowAwardsStatisticsForm;
WindowAwardsStatisticsSettingsFrame:TWindowAwardsStatisticsSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
ldsLog:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;
GridColorList: TGridColorList;



implementation




function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 ldsLog:=dsLog;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;

 if not Assigned(WindowAwardsStatisticsSettingsFrame) then
  begin
   WindowAwardsStatisticsSettingsFrame:=TWindowAwardsStatisticsSettingsFrame.Create(aApplication);
   WindowAwardsStatisticsSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   WindowAwardsStatisticsSettingsFrame.FormStorage.RestoreFormPlacement;
   WindowAwardsStatisticsSettingsFrame.qryAwards.Database:=lDatabase;
   WindowAwardsStatisticsSettingsFrame.qryAwards.Open;
   WindowAwardsStatisticsSettingsFrame.qryAwardsData.Database:=lDatabase;
   SettingsFrame:=WindowAwardsStatisticsSettingsFrame;
  end;


 if not Assigned(WindowAwardsStatisticsForm) then
   begin
     WindowAwardsStatisticsForm:=TWindowAwardsStatisticsForm.Create(Application);
     WindowAwardsStatisticsForm.qryAwardsList.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryAwards.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryAwardsTotalByBand.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryAwardsTotal.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryBands.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryModes.Database:=lDatabase;
     WindowAwardsStatisticsForm.qryStations.Database:=lDatabase;
     WindowAwardsStatisticsForm.FormStorage.AppStorage := lAppStorage;
     WindowAwardsStatisticsForm.FormStorage.RestoreFormPlacement;
     WindowAwardsStatisticsForm.FormStorageOnExit.AppStorage:=lAppStorage;
     WindowAwardsStatisticsForm.FormStorageOnExit.RestoreFormPlacement;
     WindowAwardsStatisticsForm.MainToolBarPanel:=WindowAwardsStatisticsForm.pnlMainToolbar;
     GridColorList := TGridColorList.Create;
     WindowAwardsStatisticsForm.dbgAwards.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowAwardsStatisticsForm.FormStorage.AppStorage).FileName, 'WindowAwardsStatisticsForm', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);
//     WindowAwardsStatisticsForm.InitGridColors;

	 PluginForm:=WindowAwardsStatisticsForm;
   end;

 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowAwardsStatisticsForm) then
 begin
   WindowAwardsStatisticsForm.SumList.Free;
   WindowAwardsStatisticsForm.Free;
 end;
 if Assigned(WindowAwardsStatisticsSettingsFrame) then
 begin
   FreeAndNil(GridColorList);
   WindowAwardsStatisticsSettingsFrame.Free;
 end;

 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
    CC_LOADED:
      begin
       if Assigned(WindowAwardsStatisticsForm) then
         WindowAwardsStatisticsForm.Loaded;
      end;

    CC_OPTIONS_CHANGED:
      begin
       if Assigned(WindowAwardsStatisticsForm) then
         WindowAwardsStatisticsForm.OptionsChanged;
      end;
    CC_STATION_CHANGED:
      begin
       if Assigned(WindowAwardsStatisticsForm) then
       begin
          WindowAwardsStatisticsForm.StationParentId:=Integer(Sender);
          WindowAwardsStatisticsForm.StationId := lParam;
          WindowAwardsStatisticsForm.qryAwardsList.Close;
          WindowAwardsStatisticsForm.qryAwardsList.Open;
          WindowAwardsStatisticsForm.qryAwards.Close;
          WindowAwardsStatisticsForm.OptionsChanged;
       end;
      end;
    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowAwardsStatisticsForm) then
      begin
        WindowAwardsStatisticsForm.SaveGrid;
        WindowAwardsStatisticsForm.FormStorage.SaveFormPlacement;
      end;

 end;

end;

end.



