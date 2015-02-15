unit uCallBook;

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
  KDaoTable,
  uUtils,
  uCallBookSettingsFrame,
  udmCallBook;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;




var
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;
CallBookSettingsFrame:TCallBookSettingsFrame;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 aApplication:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;


 if not Assigned(CallBookSettingsFrame) then
  begin
   CallBookSettingsFrame:=TCallBookSettingsFrame.Create(aApplication);
   CallBookSettingsFrame.FormStorage.AppStorage :=lAppStorage;
   CallBookSettingsFrame.cdsCallBook.Open;
   CallBookSettingsFrame.cdsCallBook.SortOnFields('CALLBOOK_SORT_ORDER',False,False);
   CallBookSettingsFrame.FormStorage.RestoreFormPlacement;

   SettingsFrame:=CallBookSettingsFrame;
{   WindowSoundRecorderSettingsFrame.FormStorage.AppStorage :=lAppStorage;
     for i:=0 to WindowSoundRecorderSettingsFrame.AudioIn.DeviceCount-1 do
        WindowSoundRecorderSettingsFrame.cbSoundRecorderDevice.Items.Add(WindowSoundRecorderSettingsFrame.AudioIn.DeviceName[i]);
   SettingsFrame:=WindowSoundRecorderSettingsFrame;
   WindowSoundRecorderSettingsFrame.FormStorage.RestoreFormPlacement;}
  end;

 dmCallBook:=TdmCallBook.Create(dmCallBook);
 dmCallBook.Initialize;


{ sFreqList:=TStringList.Create;
 if FileExists(ExtractFilePath(GetDllFileName)+'CallBook.freq') then
   sFreqList.LoadFromFile(ExtractFilePath(GetDllFileName)+'CallBook.freq');
 dmCallBook:=TdmCallBook.Create(dmCallBook);
 dmCallBook.dsLogEdit.DataSet:=ldsLogEdit.DataSet;
 dmCallBook.qryBandGrid.Database:=lDatabase;
 dmCallBook.qryBandGridModeFreq.Database:=lDatabase;
 dmCallBook.qryBandGridFreq.Database:=lDatabase;
 dmCallBook.Connect;
 Result:=1;}
end;

function DeInitialize():integer; stdcall;
begin
 dmCallBook.DeInitialize;
 dmCallBook.Free;
 if Assigned(CallBookSettingsFrame) then
  CallBookSettingsFrame.Free;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
    CA_CANCEL_QSO,
    CA_SAVE_QSO  :
      if Assigned(dmCallBook) then
        dmCallBook.Break;
    CA_CALL_INFO :
      if Assigned(dmCallBook) then
        dmCallBook.CallInfo;
    CC_OPTIONS_CHANGED:
      if Assigned(dmCallBook) then
        dmCallBook.Initialize;
 end;
end;

end.



