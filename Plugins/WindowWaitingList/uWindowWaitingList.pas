unit uWindowWaitingList;

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
  DBGrideh,
  uUtils,
  uWindowWaitingListForm,
  uWindowWaitingListSettingsFrame;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowWaitingListForm:TWindowWaitingListForm;
WindowWaitingListSettingsFrame:TWindowWaitingListSettingsFrame;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;


 if not Assigned(WindowWaitingListSettingsFrame) then
  begin
   WindowWaitingListSettingsFrame:=TWindowWaitingListSettingsFrame.Create(aApplication);
   WindowWaitingListSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   WindowWaitingListSettingsFrame.FormStorage.RestoreFormPlacement;
   SettingsFrame:=WindowWaitingListSettingsFrame;
  end;

 if not Assigned(WindowWaitingListForm) then
   begin
     WindowWaitingListForm:=TWindowWaitingListForm.Create(Application);
     WindowWaitingListForm.FormStorage.AppStorage := lAppStorage;
     WindowWaitingListForm.FormStorage.RestoreFormPlacement;
     WindowWaitingListForm.dbgWaitingList.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(WindowWaitingListForm.FormStorage.AppStorage).FileName, 'WindowWaitingListForm', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);

    WindowWaitingListForm.dbgWaitingList.Font.Name:=lAppStorage.ReadString('WindowWaitingListForm\dbgWaitingList.FontName');
    if lAppStorage.ReadInteger('WindowWaitingListForm\dbgWaitingList.FontSize')<>0 then
      WindowWaitingListForm.dbgWaitingList.Font.Size:=lAppStorage.ReadInteger('WindowWaitingListForm\dbgWaitingList.FontSize');
    if lAppStorage.ReadString('WindowWaitingListForm\dbgWaitingList.FontColor')<>'' then
       WindowWaitingListForm.dbgWaitingList.Font.Color:=lAppStorage.ReadInteger('WindowWaitingListForm\dbgWaitingList.FontColor');
    WindowWaitingListForm.dbgWaitingList.Font.Style:=IntToFontStyle(lAppStorage.ReadInteger('WindowWaitingListForm\dbgWaitingList.FontStyle'));
    WindowWaitingListForm.dbgWaitingList.DrawGraphicData:=lAppStorage.ReadBoolean('WindowWaitingListForm\dbgWaitingList.UseCustomColorFont',False);
    if WindowWaitingListForm.dbgWaitingList.DrawGraphicData then
     begin
      if lAppStorage.ReadString('WindowWaitingListForm\dbgWaitingList.BackgroundColor')<>'' then
        WindowWaitingListForm.dbgWaitingList.Color:=lAppStorage.ReadInteger('WindowWaitingListForm\dbgWaitingList.BackgroundColor');
     end;

  	 PluginForm:=WindowWaitingListForm;
   end;

 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 if Assigned(WindowWaitingListForm) then
   WindowWaitingListForm.Free;
 if Assigned(WindowWaitingListSettingsFrame) then
   WindowWaitingListSettingsFrame.Free;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
    CA_PROFILE_SAVE, CA_PROFILE_SAVE_AS:
      if Assigned(WindowWaitingListForm) then
      begin
        WindowWaitingListForm.SaveGrid;
        WindowWaitingListForm.FormStorage.SaveFormPlacement;
      end;
    CA_SAVE_QSO:
      if Assigned(WindowWaitingListForm) then
       WindowWaitingListForm.SaveQSO;
    CA_CANCEL_QSO:
      if Assigned(WindowWaitingListForm) then
       WindowWaitingListForm.CancelQSO;
    CA_NEW_QSO:
      if Assigned(WindowWaitingListForm) then
       WindowWaitingListForm.NewQSO;
   { CC_BAND_CHANGED:
      if Assigned(WindowWaitingListForm) then
        WindowWaitingListForm.BandChanged(lParam);
    CC_MODE_CHANGED:
      begin
        if Assigned(WindowWaitingListForm) then
          WindowWaitingListForm.ModeChanged(lParam);
      end;   }

 end;
end;

end.



