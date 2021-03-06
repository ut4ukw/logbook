unit uWindowJT65HF;

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
  uUtils,
  KDaoDatabase,
  uWindowJT65HFForm,
  DBGridEh,
  ShellApi,
  Messages,
  uWindowJT65HFSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowJT65HFForm:TWindowJT65HFForm;
WindowJT65HFSettingsFrame:TWindowJT65HFSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
bCheckNewOneForAllBook:boolean;
JTHWND:hwnd;
lBand:real;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;

 if not Assigned(WindowJT65HFSettingsFrame) then
  begin
   WindowJT65HFSettingsFrame:=TWindowJT65HFSettingsFrame.Create(aApplication);
   WindowJT65HFSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   WindowJT65HFSettingsFrame.FormStorage.RestoreFormPlacement;
   SettingsFrame:=WindowJT65HFSettingsFrame;
  end;

 if not Assigned(WindowJT65HFForm) then
   begin
     WindowJT65HFForm:=TWindowJT65HFForm.Create(Application);
     WindowJT65HFForm.FormStorage.AppStorage := lAppStorage;
     WindowJT65HFForm.FormStorage.RestoreFormPlacement;
     WindowJT65HFForm.MainToolBarPanel := WindowJT65HFForm.pnlMainToolBar;

     WindowJT65HFForm.dbgJT65HF.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowJT65HFForm.FormStorage.AppStorage).FileName, 'WindowJT65HFForm',
      [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    WindowJT65HFForm.dbgJT65HF.Font.Name:=lAppStorage.ReadString('WindowJT65HFForm\dbgJT65HF.FontName');
    if lAppStorage.ReadInteger('WindowJT65HFForm\dbgJT65HF.FontSize')<>0 then
      WindowJT65HFForm.dbgJT65HF.Font.Size:=lAppStorage.ReadInteger('WindowJT65HFForm\dbgJT65HF.FontSize');
    if lAppStorage.ReadString('WindowJT65HFForm\dbgJT65HF.FontColor')<>'' then
       WindowJT65HFForm.dbgJT65HF.Font.Color:=lAppStorage.ReadInteger('WindowJT65HFForm\dbgJT65HF.FontColor');
    WindowJT65HFForm.dbgJT65HF.Font.Style:=IntToFontStyle(lAppStorage.ReadInteger('WindowJT65HFForm\dbgJT65HF.FontStyle'));
    WindowJT65HFForm.dbgJT65HF.DrawGraphicData:=lAppStorage.ReadBoolean('WindowJT65HFForm\dbgJT65HF.UseCustomColorFont',False);
    if WindowJT65HFForm.dbgJT65HF.DrawGraphicData then
     begin
      if lAppStorage.ReadString('WindowJT65HFForm\dbgJT65HF.BackgroundColor')<>'' then
        WindowJT65HFForm.dbgJT65HF.Color:=lAppStorage.ReadInteger('WindowJT65HFForm\dbgJT65HF.BackgroundColor');
     end;

//     WindowJT65HFForm.ReloadCSV;
     //WindowJT65HFForm.DirWatcher.DirToWatch:='C:\TEMP\!!!';

     WindowJT65HFForm.Init;

     bCheckNewOneForAllBook := lAppStorage.ReadBoolean('Options\cbCheckNewOneForAllBook_Checked', False);
	 PluginForm:=WindowJT65HFForm;
   end;

 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if (JTHWND<>0) and WindowJT65HFSettingsFrame.WindowJT65HF_cbStartOnLoad.Checked then
       SendMessage(JTHWND,WM_Close,0,0);

 if Assigned(WindowJT65HFSettingsFrame) then
   WindowJT65HFSettingsFrame.Free;

 if Assigned(WindowJT65HFForm) then
 begin
   WindowJT65HFForm.DeInit;
   WindowJT65HFForm.Free;
 end;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of

    CC_LOADED:
      begin
        if Assigned(WindowJT65HFForm) then
         WindowJT65HFForm.Loaded:=True;

        if (WindowJT65HFSettingsFrame.WindowJT65HF_cbStartOnLoad.Checked) and
        (Trim(WindowJT65HFSettingsFrame.WindowJT65HF_feExeFile.FileName)<>'')
         then
            WindowJT65HFForm.RunJT;
      end;


    CC_STATION_CHANGED:
      begin
        if Assigned(WindowJT65HFForm) then
        begin
          WindowJT65HFForm.StationCall := Trim(VarToStr(wParam));
          WindowJT65HFForm.StationChanged(lParam);
        end;
      end;

     CC_OPTIONS_CHANGED:
      begin
        if Assigned(WindowJT65HFForm) then
        begin
          WindowJT65HFForm.OptionChanged;
        end;
      end;

     CC_LOG_EXIT:
     begin
{        if Assigned(WindowJT65HFForm) then
                    WindowJT65HFForm.Deinit;}
     {  if JTHWND<>0 then
       SendMessage(JTHWND,WM_Close,0,0);  }
     end;

     CC_CLIPBOARD_CHANGE:
     begin
        if Assigned(WindowJT65HFForm) then
          WindowJT65HFForm.ClipboardChange;

     end;


    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowJT65HFForm) then
      begin
        WindowJT65HFForm.SaveGrid;
        WindowJT65HFForm.FormStorage.SaveFormPlacement;
      end;
    CA_NEW_QSO:
      if Assigned(WindowJT65HFForm) then
        WindowJT65HFForm.NewQSO;
    CA_SAVE_QSO:
      if Assigned(WindowJT65HFForm) then
        WindowJT65HFForm.SaveQSO;

    CC_BAND_CHANGED:
        lBand := lParam;


 end;
end;

end.



