unit uWindowQSOEntry;

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
  Variants,
  Graphics,
  uWindowQSOEntryForm,
  ShellApi,
  uColors,
  uWindowQSOEntrySettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;

var
  WindowQSOEntryForm: TWindowQSOEntryForm;
  WindowQSOEntrySettingsFrame: TWindowQSOEntrySettingsFrame;
  aHandle: THandle;
  aApplication: TApplication;
  ldsLogEdit: TDataSource;
  lActionList: TActionList;
  lDllCommand: TDllCommand;
  lDatabase: TKADaoDatabase;
  lAppStorage: TJvAppIniFileStorage;
  StationGroupId: Integer;
  StationId: Integer;
  lMode: string;
  bAutoGetCallPrimaryData: boolean;
  bCheckNewOneForAllBook: boolean;
  bCallMistake: boolean;
  ldsLog: TDataSource;
  GridColorList : TGridColorList;

implementation

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName: string; var PluginForm: TForm; var SettingsFrame: TFrame): Integer; stdcall;
var
  i: Integer;
begin
  Application := App;
  Application.Handle := App.Handle;
  ldsLogEdit := dsLogEdit;
  lActionList := ActionList;
  lAppStorage := AppStorage;
  @lDllCommand := DllCommand;
  lDatabase := Database;
  ldsLog := dsLog;

  if not Assigned(WindowQSOEntrySettingsFrame) then
  begin
    WindowQSOEntrySettingsFrame := TWindowQSOEntrySettingsFrame.Create(Application);
    WindowQSOEntrySettingsFrame.FormStorage.AppStorage := lAppStorage;
    // WindowQSOEntrySettingsFrame.FormStorage.RestoreFormPlacement;
    SettingsFrame := WindowQSOEntrySettingsFrame;
  end;
  if not Assigned(WindowQSOEntryForm) then
  begin
    try
      WindowQSOEntryForm := TWindowQSOEntryForm.Create(Application, ldsLogEdit, IMSName);
      WindowQSOEntryForm.qryDxcc.Database := lDatabase;
      WindowQSOEntryForm.qryBandGridFreq.Database:=lDatabase;
      WindowQSOEntryForm.qryModes.Database:=lDatabase;
      WindowQSOEntryForm.FormStorage.AppStorage := lAppStorage;
      WindowQSOEntryForm.FormStorageOnExit.AppStorage := lAppStorage;
      WindowQSOEntryForm.FormStorageOnExit.RestoreFormPlacement;
      WindowQSOEntryForm.ldeCall.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeReportFrom.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeReportTo.DataSource := ldsLogEdit;
      WindowQSOEntryForm.dbeOperator.DataSource := ldsLogEdit;
      WindowQSOEntryForm.dbeQTH.DataSource := ldsLogEdit;
      WindowQSOEntryForm.dbeQSLVia.DataSource := ldsLogEdit;

      WindowQSOEntryForm.ldeField2.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeQSLMessage.DataSource := ldsLogEdit;
      WindowQSOEntryForm.dbmComment.DataSource := ldsLogEdit;
      WindowQSOEntryForm.dsLog.DataSet:=ldsLog.Dataset;
      WindowQSOEntryForm.ldeField2.Database:=lDatabase;
      WindowQSOEntryForm.ldeField3.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField3.Database:=lDatabase;
      WindowQSOEntryForm.ldeField4.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField4.Database:=lDatabase;
      WindowQSOEntryForm.ldeField1.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField1.Database:=lDatabase;
      WindowQSOEntryForm.ldeField5.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField5.Database:=lDatabase;

      WindowQSOEntryForm.ldeField6.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField6.Database:=lDatabase;
      WindowQSOEntryForm.ldeField7.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField7.Database:=lDatabase;
      WindowQSOEntryForm.ldeField8.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField8.Database:=lDatabase;
      WindowQSOEntryForm.ldeField9.DataSource := ldsLogEdit;
      WindowQSOEntryForm.ldeField9.Database:=lDatabase;


      WindowQSOEntryForm.pmInternetInfo.Items[0].Action := lActionList.Actions[CA_II_QRZCOM];
      WindowQSOEntryForm.pmInternetInfo.Items[1].Action := lActionList.Actions[CA_II_HAMQTH];
      WindowQSOEntryForm.BandChanged(lAppStorage.ReadFloat('Options\Band', 7));
      WindowQSOEntryForm.qryModes.Open;

      bAutoGetCallPrimaryData := lAppStorage.ReadBoolean('Options\cbAutoGetCallPrimaryData_Checked', False);
      bCheckNewOneForAllBook := lAppStorage.ReadBoolean('Options\cbCheckNewOneForAllBook_Checked', False);
      GridColorList :=TGridColorList.Create;
//      WindowQSOEntryForm.InitGridColors;

      WindowQSOEntryForm.Init;
      WindowQSOEntryForm.ActiveControl:=WindowQSOEntryForm.ldeCall;
      PluginForm := WindowQSOEntryForm;
    except
      on E: Exception do
        raise Exception.Create('Error Message - '+PWideChar(E.Message));
      // MessageBox(0, PWideChar(E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR or MB_SYSTEMMODAL);
    end;
  end;
  Result := 1;
end;

function DeInitialize(): Integer; stdcall;
begin
  if Assigned(WindowQSOEntryForm) then
  begin
    WindowQSOEntryForm.qryModes.Close;
    FreeAndNil(GridColorList);
    WindowQSOEntryForm.DeInit;
    WindowQSOEntryForm.Free;
  end;

  if Assigned(WindowQSOEntrySettingsFrame) then
    WindowQSOEntrySettingsFrame.Free;
  Result := 1;
end;

function CoreCommand(IdCommand: Integer; Sender: TObject; lParam, wParam: variant): Integer; stdcall;
begin
  case IdCommand of
    CC_BAND_CHANGED:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.BandChanged(lParam);
    CC_MODE_CHANGED:
      begin
        lMode := VarToStr(lParam);
        if Assigned(WindowQSOEntryForm) then
          WindowQSOEntryForm.ModeChanged;
      end;
    CA_NEW_QSO:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.NewQSO;
    CA_EDIT_QSO:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.EditQSO(lParam, wParam);
    CC_CALL_CHANGED:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.CallChanged(wParam);
    CC_LOADED:
      begin
        if Assigned(WindowQSOEntryForm) then
        begin
          WindowQSOEntryForm.OptionsChanged;
          WindowQSOEntryForm.ReadSettingsFocus;
        end;
      end;
    CC_OPTIONS_CHANGED:
      begin
        bAutoGetCallPrimaryData := lAppStorage.ReadBoolean('Options\cbAutoGetCallPrimaryData_Checked', False);
        bCheckNewOneForAllBook := lAppStorage.ReadBoolean('Options\cbCheckNewOneForAllBook_Checked', False);

        if Assigned(WindowQSOEntryForm) then
          WindowQSOEntryForm.OptionsChanged;
      end;
    CC_STATION_CHANGED:
      begin
        if Assigned(WindowQSOEntryForm) then
          WindowQSOEntryForm.StationChanged(Integer(Sender),lParam);
        StationId := lParam;
        StationGroupId:=Integer(Sender);
      end;
    CC_WINDOW_SHOW:
      if Assigned(WindowQSOEntryForm) then
      begin
        if WindowQSOEntryForm.cbRealTime.Caption <> '' then
        begin
          WindowQSOEntryForm.cbRealTime.Hint := WindowQSOEntryForm.cbRealTime.Caption;
          WindowQSOEntryForm.cbRealTime.ShowHint := True;
          WindowQSOEntryForm.cbRealTime.Caption := '';
        end;
        WindowQSOEntryForm.StationChanged(StationGroupId,StationId);
      end;
    CA_CALL_MISTAKE:
      begin
        bCallMistake := True;
        if Assigned(WindowQSOEntryForm) then
          if WindowQSOEntryForm.Parent.Visible then
          begin
            WindowQSOEntryForm.ldeCall.Color := 16771794;
            WindowQSOEntryForm.ldeCall.SetFocus;
          end;
      end;
    CA_SAVE_QSO, CA_CANCEL_QSO:
      begin
        bCallMistake := False;
        if Assigned(WindowQSOEntryForm) then
          if WindowQSOEntryForm.Parent.Visible then
          begin
            WindowQSOEntryForm.ldeCall.Color := clWindow;
            WindowQSOEntryForm.dbeOperator.Close;
            WindowQSOEntryForm.dbeQTH.Close;
          end;
      end;
    CA_CALL_INFO:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.CallInfo(lParam);

    CA_OPEN_QRZCOM:
      if Assigned(WindowQSOEntryForm) then
      begin
        if WindowQSOEntryForm.ldeCall.Focused and (Trim(WindowQSOEntryForm.ldeCall.Text)<>'') then
          ShellExecute(Application.Handle, PChar('open'),PChar('http://www.qrz.com/db/' + WindowQSOEntryForm.ldeCall.Text), Nil, Nil,SW_SHOW);
      end;


    { CC_SET_RADIO_TO_SPOT:
      if Assigned(WindowQSOEntryForm) then
        WindowQSOEntryForm.SetFocus; }

  end;
end;

end.


