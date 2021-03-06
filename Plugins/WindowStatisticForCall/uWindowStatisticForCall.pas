unit uWindowStatisticForCall;

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
  uColors,
  uWindowStatisticForCallForm;

function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
function DeInitialize(): Integer; stdcall;
function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;


var
WindowStatisticForCallForm:TWindowStatisticForCallForm;
aHandle:THandle;
aApplication:TApplication;
lAppStorage:TJvAppIniFileStorage;
ldsLogEdit:TDataSource;
lDatabase:TKADaoDatabase;
lDllCommand: TDllCommand;
lMode:string;
bNeedRenew:boolean;
GridColorList : TGridColorList;


implementation






function Initialize(App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource; IMSName:string; var PluginForm:TForm; var SettingsFrame:TFrame): Integer; stdcall;
begin
 Application:=App;
 ldsLogEdit:=dsLogEdit;
 lDatabase:=Database;
 lAppStorage:=AppStorage;
 @lDllCommand := DllCommand;
 if not Assigned(WindowStatisticForCallForm) then
   begin
     WindowStatisticForCallForm:=TWindowStatisticForCallForm.Create(Application);
     WindowStatisticForCallForm.qryBands.Database:=lDatabase;
     WindowStatisticForCallForm.slBands:=TStringList.Create;
     GridColorList := TGridColorList.Create;
//     WindowStatisticForCallForm.InitGridColors;

	 PluginForm:=WindowStatisticForCallForm;
   end;

 Result:=1;
end;

function DeInitialize():integer; stdcall;
begin
 FreeAndNil(GridColorList);
 if Assigned(WindowStatisticForCallForm) then
 begin
   FreeAndNil(WindowStatisticForCallForm.slBands);
   WindowStatisticForCallForm.DeInit;
   WindowStatisticForCallForm.Free;
 end;
 Result:=1;
end;


function CoreCommand(IdCommand:integer;Sender:TObject; lParam, wParam:variant):integer; stdcall;
begin
 case IdCommand of
{   CA_CALL_INFO : if Assigned(WindowStatisticForCallForm) then WindowStatisticForCallForm.CallInfo;
   CA_CANCEL_QSO : if Assigned(WindowStatisticForCallForm) then WindowStatisticForCallForm.CancelQSO;
   CA_NEW_QSO : if Assigned(WindowStatisticForCallForm) then WindowStatisticForCallForm.CancelQSO;}
    CC_OPTIONS_CHANGED:
      begin
       if Assigned(WindowStatisticForCallForm) then
         WindowStatisticForCallForm.OptionsChanged;
      end;

    CC_STATION_CHANGED:
      begin
       if Assigned(WindowStatisticForCallForm) then
       begin
          WindowStatisticForCallForm.StationParentId:=Integer(Sender);
          WindowStatisticForCallForm.StationId := lParam;
          WindowStatisticForCallForm.OptionsChanged;
       end;
      end;

   CA_CALL_INFO : if Assigned(WindowStatisticForCallForm) then WindowStatisticForCallForm.CallInfo;


    CA_NEW_QSO:
       begin
          WindowStatisticForCallForm.NewQSO;
       end;
    CC_CALL_CHANGED:
       begin
         if Assigned(WindowStatisticForCallForm) then
            WindowStatisticForCallForm.CallChanged;
       end;

 end;

end;

end.



