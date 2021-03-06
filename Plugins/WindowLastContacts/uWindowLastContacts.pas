unit uWindowLastContacts;

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
  KDaoTable,
  ActnList,
  DB,
  Variants,
  KDaoDataBase,
  EhLibConsts,
  DBGridEh,
  Contnrs,
  uUtils,
  uWindowLastContactsForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;

var
  WindowLastContactsForm: TWindowLastContactsForm;
  aHandle: THandle;
  aApplication: TApplication;
  lAppStorage: TJvAppIniFileStorage;
  ldsLogEdit: TDataSource;
  ldsLog: TDataSource;
  lDatabase: TKADaoDatabase;
  lDllCommand: TDllCommand;
  StationId: Integer;
  GridColorList: TObjectList;
  lActionList:TActionList;


implementation

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
begin
  Application := App;
  ldsLogEdit := dsLogEdit;
  ldsLog := dsLog;
  lDatabase := Database;
  lActionList:=ActionList;
  lAppStorage := AppStorage;
  @lDllCommand := DllCommand;

  if not Assigned(WindowLastContactsForm) then
  begin
    WindowLastContactsForm := TWindowLastContactsForm.Create(Application, ldsLogEdit, IMSName);

    WindowLastContactsForm.qryLastContacts.Database := lDatabase;
{    WindowLastContactsForm.OriginalAfterScroll:=ldsLog.Dataset.AfterScroll;
    ldsLog.Dataset.AfterScroll:=WindowLastContactsForm.AfterScroll;}
    WindowLastContactsForm.qryStations.Database:=lDatabase;
    WindowLastContactsForm.dsLog.DataSet:=ldsLog.Dataset;

    WindowLastContactsForm.BandMhz := lAppStorage.ReadFloat('Options\Band', 7);
    WindowLastContactsForm.FormStorage.AppStorage := lAppStorage;
    WindowLastContactsForm.FormStorage.RestoreFormPlacement;
    WindowLastContactsForm.FormStorageOnExit.AppStorage:=lAppStorage;
    WindowLastContactsForm.FormStorageOnExit.RestoreFormPlacement;
    WindowLastContactsForm.MainToolBarPanel:=WindowLastContactsForm.pnlMainToolbar;


//    WindowLastContactsForm.pmLog.Items[0].Items[0].Action := lActionList.Actions[CA_QSL_QUEUE];
    WindowLastContactsForm.pmLog.Items[0].Items[0].Action := WindowLastContactsForm.aLastContactsQSLQueue;
    WindowLastContactsForm.pmLog.Items[0].Items[1].Action := WindowLastContactsForm.aLastContactsQSLRcvd;
    WindowLastContactsForm.pmLog.Items[0].Items[3].Action := WindowLastContactsForm.aLastContactsQSLSent;
    WindowLastContactsForm.pmLog.Items[0].Items[4].Action := WindowLastContactsForm.aLastContactsQSLIgnore;
    WindowLastContactsForm.pmLog.Items[0].Items[6].Action := WindowLastContactsForm.aLastContactsQSLPrint;
//    WindowLastContactsForm.pmLog.Items[1].Action := lActionList.Actions[CA_EDIT_QSO];


    WindowLastContactsForm.dbgLastContacts.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowLastContactsForm.FormStorage.AppStorage).FileName, 'WindowLastContactsForm', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);
    WindowLastContactsForm.dbgLastContacts.Font.Name:=lAppStorage.ReadString('WindowLastContactsForm\dbgLastContacts.FontName');
    if lAppStorage.ReadInteger('WindowLastContactsForm\dbgLastContacts.FontSize')<>0 then
      WindowLastContactsForm.dbgLastContacts.Font.Size:=lAppStorage.ReadInteger('WindowLastContactsForm\dbgLastContacts.FontSize');
    if lAppStorage.ReadString('WindowLastContactsForm\dbgLastContacts.FontColor')<>'' then
       WindowLastContactsForm.dbgLastContacts.Font.Color:=lAppStorage.ReadInteger('WindowLastContactsForm\dbgLastContacts.FontColor');
    WindowLastContactsForm.dbgLastContacts.Font.Style:=IntToFontStyle(lAppStorage.ReadInteger('WindowLastContactsForm\dbgLastContacts.FontStyle'));
    WindowLastContactsForm.dbgLastContacts.DrawGraphicData:=lAppStorage.ReadBoolean('WindowLastContactsForm\dbgLastContacts.UseCustomColorFont',False);
    if WindowLastContactsForm.dbgLastContacts.DrawGraphicData then
     begin
      if lAppStorage.ReadString('WindowLastContactsForm\dbgLastContacts.BackgroundColor')<>'' then
        WindowLastContactsForm.dbgLastContacts.Color:=lAppStorage.ReadInteger('WindowLastContactsForm\dbgLastContacts.BackgroundColor');
     end;

    GridColorList := TObjectList.Create;
    WindowLastContactsForm.InitGridColors;
    WindowLastContactsForm.qryLastContactsLOG_QSO_DATE.DisplayFormat:=ShortDateFormat;
    WindowLastContactsForm.qryLastContactsLOG_QSO_TIME.DisplayFormat:=ShortTimeFormat;
    WindowLastContactsForm.cdsLastContactsLOG_QSO_DATE.DisplayFormat:=ShortDateFormat;
    WindowLastContactsForm.cdsLastContactsLOG_QSO_TIME.DisplayFormat:=ShortTimeFormat;
    PluginForm := WindowLastContactsForm;
  end;
  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  if Assigned(WindowLastContactsForm) then
  begin
{    if Assigned(WindowLastContactsForm.OriginalAfterScroll) then
       ldsLog.Dataset.AfterScroll:=WindowLastContactsForm.OriginalAfterScroll
    else
       ldsLog.Dataset.AfterScroll:=nil;}
    WindowLastContactsForm.Free;
    GridColorList.Free;
  end;
  Result := 1;
end;

procedure DoWindowShow;
begin
 { if Assigned(WindowLastContactsForm) then
  begin
//    WindowLastContactsForm.StationId := StationId;
    WindowLastContactsForm.CallChanged;
  end;   }
end;

function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_WINDOW_SHOW:
      DoWindowShow;
    CC_BAND_CHANGED:
      if Assigned(WindowLastContactsForm) then
      begin
        WindowLastContactsForm.BandMhz := lParam;
        WindowLastContactsForm.dbgLastContacts.Refresh;
      end;
    CC_CALL_CHANGED:
      if Assigned(WindowLastContactsForm) then
      begin
        WindowLastContactsForm.CallChanged;
      end;

    CA_CALL_INFO :
      if Assigned(WindowLastContactsForm) then
      begin
//        WindowLastContactsForm.gsCall := GetOriginalCall(VarToStr(lParam));
        WindowLastContactsForm.gsCall := GetOriginalCall(Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').asString));
        WindowLastContactsForm.CallInfo;
      end;
    CC_STATION_CHANGED:
      begin
       if Assigned(WindowLastContactsForm) then
       begin
          WindowLastContactsForm.StationParentId:=Integer(Sender);
          WindowLastContactsForm.StationId := lParam;
       end;
      end;
    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowLastContactsForm) then
      begin
        WindowLastContactsForm.SaveGrid;
        WindowLastContactsForm.FormStorage.SaveFormPlacement;
      end;
    CA_NEW_QSO, CA_CANCEL_QSO: begin
      if Assigned(WindowLastContactsForm) then
       WindowLastContactsForm.dsLogDataChange(nil,nil);
    end;

      //  WindowLastContactsForm.dbgLastContacts.DataSource.DataSet.Close;

    CC_OPTIONS_CHANGED:
      if Assigned(WindowLastContactsForm) then
        WindowLastContactsForm.InitGridColors;

    CC_CHANGE_BOOK_LIST:
      if Assigned(WindowLastContactsForm) then
          WindowLastContactsForm.SelectFromClauseAllBooks:=VarToSTr(lParam);

    CC_LOADED:
      if Assigned(WindowLastContactsForm) then
          WindowLastContactsForm.Loaded;


  end;
end;

end.
