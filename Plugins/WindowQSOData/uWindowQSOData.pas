unit uWindowQSOData;

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
  uWindowQSODataForm,
  uWindowQSODataSettingsFrame;



function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;

var
WindowQSODataForm:TWindowQSODataForm;
WindowQSODataSettingsFrame:TWindowQSODataSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
ldsLogEdit:TDataSource;
lActionList:TActionList;
lDllCommand: TDllCommand;
lDatabase:TKADaoDatabase;
lAppStorage:TJvAppIniFileStorage;
StationId:integer;
lMode:string;



implementation



function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lActionList:=ActionList;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 lDatabase:=Database;
 if not Assigned(WindowQSODataSettingsFrame) then
  begin
   WindowQSODataSettingsFrame:=TWindowQSODataSettingsFrame.Create(Application);
   WindowQSODataSettingsFrame.FormStorage.AppStorage :=lAppStorage;
//   WindowQSODataSettingsFrame.FormStorage.RestoreFormPlacement;
   SettingsFrame:=WindowQSODataSettingsFrame;
  end;
 if not Assigned(WindowQSODataForm) then
   begin
    try
     WindowQSODataForm:=TWindowQSODataForm.Create(Application,ldsLogEdit,IMSName);
     WindowQSODataForm.qryNames.Database:=lDatabase;
     WindowQSODataForm.qryQTH.Database:=lDatabase;
     WindowQSODataForm.qryDxcc.Database:=LDatabase;
//     WindowQSODataForm.dbeCall.DataSource:=ldsLogEdit;
//     WindowQSODataForm.DataSource:=ldsLogEdit;
     WindowQSODataForm.ldeCall.DataSource:=ldsLogEdit;
     WindowQSODataForm.ldeReportFrom.DataSource:=ldsLogEdit;
     WindowQSODataForm.ldeReportTo.DataSource:=ldsLogEdit;
     WindowQSODataForm.dbeOperator.DataSource:=ldsLogEdit;
     WindowQSODataForm.dbeQTH.DataSource:=ldsLogEdit;
     WindowQSODataForm.qryNames.Open;
     WindowQSODataForm.qryQTH.Open;
     WindowQSODataForm.BandChanged(lAppStorage.ReadFloat('Options\Band',7));
     WindowQSODataForm.OptionsChanged;
     PluginForm:=WindowQSODataForm;
    except
      on E:Exception do
    raise Exception.Create('Error Message');
//         MessageBox(0, PWideChar(E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR or MB_SYSTEMMODAL);
    end;
   end;
 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowQSODataForm) then
   WindowQSODataForm.Free;

 if Assigned(WindowQSODataSettingsFrame) then
  WindowQSODataSettingsFrame.Free;
 Result:=1;
end;

function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
  case IdCommand of
   CC_BAND_CHANGED    : if Assigned(WindowQSODataForm) then WindowQSODataForm.BandChanged(lParam);
   CC_MODE_CHANGED    : begin
                         lMode:=VarToStr(lParam);
                         if Assigned(WindowQSODataForm) then WindowQSODataForm.ModeChanged;
                        end;
   CA_NEW_QSO         : if Assigned(WindowQSODataForm) then WindowQSODataForm.NewQSO;
   CA_EDIT_QSO        : if Assigned(WindowQSODataForm) then WindowQSODataForm.EditQSO;
   CC_CALL_CHANGED    : if Assigned(WindowQSODataForm) then WindowQSODataForm.CallChanged(wParam);
   CC_LOADED,CC_OPTIONS_CHANGED : begin
                           if  Assigned(WindowQSODataForm) then WindowQSODataForm.OptionsChanged;
                        end;
   CC_STATION_CHANGED : begin
                          if Assigned(WindowQSODataForm) then
                            WindowQSODataForm.StationChanged(lParam);
                          StationId:=lParam;
                        end;
   CC_WINDOW_SHOW     : if Assigned(WindowQSODataForm) then WindowQSODataForm.StationChanged(StationId);
   CA_CALL_MISTAKE    : if Assigned(WindowQSODataForm) then
                         if WindowQSODataForm.Parent.Visible then
                            begin
                              WindowQSODataForm.ldeCall.Color:=16771794;
                              WindowQSODataForm.ldeCall.SetFocus;
                            end;
   CA_SAVE_QSO,
   CA_CANCEL_QSO      : if Assigned(WindowQSODataForm) then
                         if WindowQSODataForm.Parent.Visible then
                              WindowQSODataForm.ldeCall.Color:=clWindow;

  end;
end;





end.
