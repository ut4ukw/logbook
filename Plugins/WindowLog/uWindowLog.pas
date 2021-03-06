unit uWindowLog;

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
  Db,
  KDaoDataBase,
  JVFormPlacement,
  uWindowLogForm,
  EhLibConsts,
  Types,
  Contnrs,
  KDaoTable,
  ShellApi,
  DBGridEh;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
function CoreGetData(IdCommand: Integer; var lParam, wParam: variant): Integer; stdcall;

var
  WindowLogForm: TWindowLogForm;
  aHandle: THandle;
  lDatabase: TKADaoDatabase;
  lAppStorage: TJvAppIniFileStorage;
  lActionList: TActionList;
  lImageList: TImageList;
  lDllCommand: TDllCommand;
  ldsLogEdit: TDataSource;
  ldsLog: TDataSource;
  iStationId: Integer;
  GridColorList:TObjectList;
  lbLoaded:boolean;

implementation
uses uUtils;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
begin
  Application := App;
  lAppStorage := AppStorage;
  lActionList := ActionList;
  lImageList := ImageList;
  lDatabase := Database;
  ldsLogEdit := dsLogEdit;
  ldsLog := dsLog;
  @lDllCommand := DllCommand;

  if not Assigned(WindowLogForm) then
  begin
    WindowLogForm := TWindowLogForm.Create(Application, ldsLogEdit, IMSName);
    WindowLogForm.FormStorage.AppStorage := lAppStorage;
    WindowLogForm.FormStorage.RestoreFormPlacement;
    WindowLogForm.FormStorageOnExit.AppStorage:=lAppStorage;
    WindowLogForm.FormStorageOnExit.RestoreFormPlacement;
    WindowLogForm.qryQSLImageFiles.Database:=lDatabase;
    WindowLogForm.dsLog.DataSet:=ldsLog.DataSet;
    WindowLogForm.MainToolBarPanel:=WindowLogForm.pnlMainToolbar;

    WindowLogForm.dbgLog.DataSource := ldsLog;
    WindowLogForm.dbgLog.Center.IndicatorTitleMenus := [itmVisibleColumnsEh, itmSelectAll];
    lActionList.Actions[CA_EDIT_QSO].OnUpdate := WindowLogForm.ActionRefreshUpdate;
    lActionList.Actions[CA_DELETE_QSO].OnUpdate := WindowLogForm.ActionRefreshUpdate;
    lActionList.Actions[CA_QSL_SENT].OnUpdate := WindowLogForm.ActionRefreshUpdate;
    lActionList.Actions[CA_QSL_IGNORE].OnUpdate := WindowLogForm.ActionRefreshUpdate;
    lActionList.Actions[CA_PRINT_QSL_QUEUE_ADD_QSQ].OnUpdate := WindowLogForm.ActionRefreshUpdate;

    lActionList.Actions[CA_EDIT_QSO].OnExecute := WindowLogForm.EditQSO;
    lActionList.Actions[CA_QSL_QUEUE].OnExecute := WindowLogForm.RcvdQSLQueue;
    lActionList.Actions[CA_QSL_RCVD].OnExecute := WindowLogForm.RcvdQSL;

    lActionList.Actions[CA_QSL_SENT].OnExecute := WindowLogForm.SentQSL;
    lActionList.Actions[CA_QSL_IGNORE].OnExecute := WindowLogForm.IgnoreQSL;
    lActionList.Actions[CA_PRINT_QSL_QUEUE_ADD_QSQ].OnExecute := WindowLogForm.PrintQueueAddQSO;

    WindowLogForm.pmLog.Items[0].Items[0].Action := lActionList.Actions[CA_QSL_QUEUE];
    WindowLogForm.pmLog.Items[0].Items[1].Action := lActionList.Actions[CA_QSL_RCVD];
    WindowLogForm.pmLog.Items[0].Items[3].Action := lActionList.Actions[CA_QSL_SENT];
    WindowLogForm.pmLog.Items[0].Items[4].Action := lActionList.Actions[CA_QSL_IGNORE];
    WindowLogForm.pmLog.Items[0].Items[6].Action := lActionList.Actions[CA_PRINT_QSL_QUEUE_ADD_QSQ];


    WindowLogForm.pmLog.Items[1].Items[0].Action := lActionList.Actions[CA_EQSL_UPLOAD_DOWNLOAD];
    WindowLogForm.pmLog.Items[1].Items[2].Action := lActionList.Actions[CA_EQSL_UPLOAD_SELECTED];
    WindowLogForm.pmLog.Items[1].Items[3].Action := lActionList.Actions[CA_EQSL_UPLOAD_UNEXPORTED];
    WindowLogForm.pmLog.Items[1].Items[5].Action := lActionList.Actions[CA_EQSL_DOWNLOAD];

    WindowLogForm.pmLog.Items[2].Items[0].Action := lActionList.Actions[CA_DQSL_UPLOAD_DOWNLOAD];
    WindowLogForm.pmLog.Items[2].Items[2].Action := lActionList.Actions[CA_DQSL_UPLOAD_SELECTED];
    WindowLogForm.pmLog.Items[2].Items[3].Action := lActionList.Actions[CA_DQSL_UPLOAD_UNEXPORTED];
    WindowLogForm.pmLog.Items[2].Items[5].Action := lActionList.Actions[CA_DQSL_DOWNLOAD];
    WindowLogForm.pmLog.Items[2].Items[6].Action := lActionList.Actions[CA_DQSL_MANUAL_CONFIRM];

    WindowLogForm.pmLog.Items[3].Items[0].Action := lActionList.Actions[CA_LOTW_UPLOAD_DOWNLOAD];
    WindowLogForm.pmLog.Items[3].Items[2].Action := lActionList.Actions[CA_LOTW_UPLOAD_SELECTED];
    WindowLogForm.pmLog.Items[3].Items[3].Action := lActionList.Actions[CA_LOTW_UPLOAD_UNEXPORTED];
    WindowLogForm.pmLog.Items[3].Items[5].Action := lActionList.Actions[CA_LOTW_DOWNLOAD];


    WindowLogForm.pmLog.Items[5].Items[0].Action := lActionList.Actions[CA_IMPORT_FROM_ADIF];
    WindowLogForm.pmLog.Items[6].Items[0].Action := lActionList.Actions[CA_EXPORT_TO_ADIF];

    WindowLogForm.pmLog.Items[8].Action := lActionList.Actions[CA_EDIT_QSO];
    WindowLogForm.pmLog.Items[9].Action := lActionList.Actions[CA_DELETE_QSO];


    WindowLogForm.pmLog.Items[11].Action := lActionList.Actions[CA_OPEN_QRZCOM];

    WindowLogForm.pmLog.Items[13].Action := lActionList.Actions[27];
    WindowLogForm.pmLog.Items[13].Items[0].Action := lActionList.Actions[CA_GROUP_FIELD_VALUE_REPLACE];
    WindowLogForm.pmLog.Items[13].Items[1].Action := lActionList.Actions[CA_REDEFINE_MY_DATA];
    WindowLogForm.pmLog.Items[13].Items[2].Action := lActionList.Actions[CA_REDEFINE_GEO_DATA];
    WindowLogForm.pmLog.Items[13].Items[3].Action := lActionList.Actions[CA_RECORD_REMOVE];

    GridColorList := TObjectList.Create;
    WindowLogForm.dbgLog.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowLogForm.FormStorage.AppStorage).FileName, 'WindowLogForm', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    WindowLogForm.dbgLog.Font.Name:=lAppStorage.ReadString('WindowLogForm\dbgLog.FontName');
    if lAppStorage.ReadInteger('WindowLogForm\dbgLog.FontSize')<>0 then
      WindowLogForm.dbgLog.Font.Size:=lAppStorage.ReadInteger('WindowLogForm\dbgLog.FontSize');
    if lAppStorage.ReadString('WindowLogForm\dbgLog.FontColor')<>'' then
       WindowLogForm.dbgLog.Font.Color:=lAppStorage.ReadInteger('WindowLogForm\dbgLog.FontColor');
    WindowLogForm.dbgLog.Font.Style:=IntToFontStyle(lAppStorage.ReadInteger('WindowLogForm\dbgLog.FontStyle'));
    WindowLogForm.dbgLog.DrawGraphicData:=lAppStorage.ReadBoolean('WindowLogForm\dbgLog.UseCustomColorFont',False);
    if WindowLogForm.dbgLog.DrawGraphicData then
     begin
      if lAppStorage.ReadString('WindowLogForm\dbgLog.BackgroundColor')<>'' then
        WindowLogForm.dbgLog.Color:=lAppStorage.ReadInteger('WindowLogForm\dbgLog.BackgroundColor');
     end;

    WindowLogForm.InitGridColors;
    WindowLogForm.InitData;
    WindowLogForm.SetImagesPath;
    dsLog.DataSet.AfterInsert:=WindowLogForm.LogAfterInsert;
    dsLog.DataSet.BeforePost:=WindowLogForm.LogBeforepost;
    PluginForm := WindowLogForm;
  end;

  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  if Assigned(WindowLogForm) then
  begin
    lActionList.Actions[CA_EDIT_QSO].OnUpdate := nil;
    lActionList.Actions[CA_DELETE_QSO].OnUpdate := nil;
    lActionList.Actions[CA_QSL_SENT].OnUpdate := nil;
    lActionList.Actions[CA_QSL_IGNORE].OnUpdate := nil;
    lActionList.Actions[CA_EDIT_QSO].OnExecute := nil;
    lActionList.Actions[CA_QSL_SENT].OnExecute := nil;
    lActionList.Actions[CA_QSL_IGNORE].OnExecute := nil;
    lActionList.Actions[CA_PRINT_QSL_QUEUE_ADD_QSQ].OnExecute := nil;

{    WindowLogForm.pmLog.Items[0].Items[0].Action := nil;
    WindowLogForm.pmLog.Items[0].Items[1].Action := nil;
    WindowLogForm.pmLog.Items[0].Items[3].Action := nil;
    WindowLogForm.pmLog.Items[1].Items[0].Action := nil;
    WindowLogForm.pmLog.Items[1].Items[2].Action := nil;
    WindowLogForm.pmLog.Items[1].Items[3].Action := nil;
    WindowLogForm.pmLog.Items[1].Items[5].Action := nil;

    WindowLogForm.pmLog.Items[2].Items[0].Action := lActionList.Actions[CA_DQSL_UPLOAD_DOWNLOAD];
    WindowLogForm.pmLog.Items[2].Items[2].Action := lActionList.Actions[CA_DQSL_UPLOAD_SELECTED];
    WindowLogForm.pmLog.Items[2].Items[3].Action := lActionList.Actions[CA_DQSL_UPLOAD_UNEXPORTED];
    WindowLogForm.pmLog.Items[2].Items[5].Action := lActionList.Actions[CA_DQSL_DOWNLOAD];

    WindowLogForm.pmLog.Items[5].Items[0].Action := lActionList.Actions[CA_IMPORT_FROM_ADIF];
    WindowLogForm.pmLog.Items[6].Items[0].Action := lActionList.Actions[CA_EXPORT_TO_ADIF];}

    // WindowLogForm.SaveGrid;
    WindowLogForm.Free;
    GridColorList.Free;

  end;
  Result := 1;
end;

procedure DoWindowShow;
begin
{  vSVisibleColumnsEh := WindowLogForm.lbVisibleColumns.Caption;
  vSSelectAllEh := WindowLogForm.lbSelectAll.Caption;}
  TAction(lActionList.Actions[CA_REFRESH_LOG]).Enabled := True;
//  WindowLogForm.dbgLog.DefaultApplySorting;
end;

procedure DoWindowHide;
begin
  TAction(lActionList.Actions[CA_REFRESH_LOG]).Enabled := False;
end;

function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_WINDOW_SHOW:
      DoWindowShow;
    CC_WINDOW_HIDE:
      DoWindowHide;
    CA_CANCEL_QSO:
      if Assigned(WindowLogForm) then
        WindowLogForm.CancelQSO;
    CA_SAVE_QSO:
      if Assigned(WindowLogForm) then
        WindowLogForm.SaveQSO;
    CA_DELETE_QSO:
      if Assigned(WindowLogForm) then
        if not(Sender is TWindowLogForm) then
          WindowLogForm.DeleteQSO;
    CA_REFRESH_LOG:
      if Assigned(WindowLogForm) then
        WindowLogForm.RefreshLog(lParam, wParam);
    CC_STATION_CHANGED:
      begin
        iStationId := lParam;
        if Assigned(WindowLogForm) then
          WindowLogForm.ChangeStation(iStationId);
      end;
    CC_SHOW_NEW_EQSL:
      if Assigned(WindowLogForm) then
        WindowLogForm.ShowNeqEQSL;
    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowLogForm) then
      begin
        WindowLogForm.SaveGrid;
        WindowLogForm.FormStorage.SaveFormPlacement;
      end;
    CC_OPTIONS_CHANGED:
      if Assigned(WindowLogForm) then
      begin
        WindowLogForm.InitGridColors;
        WindowLogForm.SetImagesPath;
      end;
    CC_LOADED,
    CA_DATABASE_COMPACT_AND_RESTORE,
    CA_DATABASE_MAKE_BACKUP,
    CA_DATABASE_RESTORE_BACKUP:
      if Assigned(WindowLogForm) then
      begin
        lbLoaded:=true;
        WindowLogForm.Loaded;
      end;
    CC_GOTO_RECORD_BY_ID:
      if Assigned(WindowLogForm) then
          WindowLogForm.GotoRecord(lParam);

    CA_OPEN_QRZCOM:
      if Assigned(WindowLogForm) then
      begin
        if WindowLogForm.dbgLog.Focused and (Trim(WindowLogForm.dbgLog.DataSource.DataSet.FieldByName('LOG_CALL').AsString)<>'') then
          ShellExecute(Application.Handle, PChar('open'),PChar('http://www.qrz.com/db/' + WindowLogForm.dbgLog.DataSource.DataSet.FieldByName('LOG_CALL').AsString), Nil, Nil,SW_SHOW);
      end;

    CC_SET_LOG_FILTER:
      if Assigned(WindowLogForm) then
      begin
       WindowLogForm.SetLogFilter(lParam);
      end;


  end;
end;

function CoreGetData(IdCommand: Integer; var lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_GET_SELECTED_RECORDS:
      if Assigned(WindowLogForm) then
        WindowLogForm.GetSelectedRecords(lParam, wParam);
  end;
end;

end.
