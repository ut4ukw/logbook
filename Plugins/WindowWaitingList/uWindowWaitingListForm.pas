unit uWindowWaitingListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, Mask, DBCtrls,
  LabeledControls, ExtCtrls, DBGridEhGrouping, DB, JvMemoryDataset, GridsEh, uUtils,
  DBGridEh, ActnList, JvComponentBase, JvFormPlacement, uPluginHeaders, Dialogs, Menus;

type
  TWindowWaitingListForm = class(TWindowPluginForm)
    dbgWaitingList: TDBGridEh;
    cdsWaitingList: TJvMemoryData;
    dsWaitingList: TDataSource;
    alWaitingList: TActionList;
    aWaitingListCallAdd: TAction;
    aWaitingListCallDelete: TAction;
    cdsWaitingListWAITINGLIST_CALL: TStringField;
    cdsWaitingListWAITINGLIST_FREQ: TFloatField;
    FormStorage: TJvFormStorage;
    alWaitingListItems: TActionList;
    cdsWaitingListWAITINGLIST_MODE: TStringField;
    cdsWaitingListWAITINGLIST_BAND: TFloatField;
    cdsWaitingListWAITINGLIST_DATE: TDateTimeField;
    cdsWaitingListWAITINGLIST_QTH: TStringField;
    cdsWaitingListWAITINGLIST_STATE: TStringField;
    cdsWaitingListWAITINGLIST_IOTA: TStringField;
    cdsWaitingListWAITINGLIST_COMMENT: TStringField;
    aWaitingListSetCall: TAction;
    cdsWaitingListWAITINGLIST_NAME: TStringField;
    procedure aWaitingListCallAddExecute(Sender: TObject);
    procedure aWaitingListCallDeleteExecute(Sender: TObject);
    procedure aWaitingListSetCallExecute(Sender: TObject);
  private
    bIsWaitingList:boolean;
    sMode:string;
    rBand:real;
    procedure SetCall(Sender:TObject);
    procedure DeleteCall;
  public
    procedure SaveGrid;
    procedure SaveQSO;
    procedure NewQSO;
    procedure CancelQSO;
  end;

var
  WindowWaitingListForm: TWindowWaitingListForm;

implementation

uses uWindowWaitingList;
{$R *.dfm}


procedure TWindowWaitingListForm.SetCall(Sender:TObject);
var
 lParam, wParam :variant;
begin
  if ldsLogEdit.DataSet.State in [dsInsert] then
  begin
   if Sender<>nil then
    cdsWaitingList.RecNo:=StrToInt(TAction(Sender).HelpKeyword);

   if cdsWaitingList.FieldByName('WAITINGLIST_FREQ').asFloat<>ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat then
   begin
    lParam := cdsWaitingList.FieldByName('WAITINGLIST_FREQ').asFloat * 1000;
    wParam := cdsWaitingList.FieldByName('WAITINGLIST_MODE').AsString;
    lDllCommand(DC_SET_RADIO_TO_SPOT, Self, lParam, wParam);
   end;

    wParam := 0;
    ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString := cdsWaitingList.FieldByName('WAITINGLIST_CALL').AsString;

    ldsLogEdit.DataSet.FieldByName('LOG_QTH').AsString:=cdsWaitingList.FieldByName('WAITINGLIST_QTH').asString;
    ldsLogEdit.DataSet.FieldByName('LOG_IOTA').AsString:=cdsWaitingList.FieldByName('WAITINGLIST_IOTA').asString;
    ldsLogEdit.DataSet.FieldByName('LOG_COMMENT').AsString:=cdsWaitingList.FieldByName('WAITINGLIST_COMMENT').asString;
    ldsLogEdit.DataSet.FieldByName('LOG_NAME').AsString:=cdsWaitingList.FieldByName('WAITINGLIST_NAME').asString;

   if cdsWaitingList.FieldByName('WAITINGLIST_MODE').asString<>ldsLogEdit.DataSet.FieldByName('LOG_MODE').AsString then
    begin
    lParam := cdsWaitingList.FieldByName('WAITINGLIST_MODE').AsString;
    lDllCommand(DC_MODE_CHANGED, Self, lParam, wParam);
    end;

   if cdsWaitingList.FieldByName('WAITINGLIST_BAND').AsFloat<>ldsLogEdit.DataSet.FieldByName('LOG_BAND_MHZ').AsFloat then
   begin
    lParam := cdsWaitingList.FieldByName('WAITINGLIST_BAND').asFloat;
    wParam := cdsWaitingList.FieldByName('WAITINGLIST_FREQ').asFloat * 1000;
    lDllCommand(DC_BAND_CHANGED, Self, lParam, wParam);
    lParam := 0;
    wParam := 0;
   end;

  if Trim(WindowWaitingListSettingsFrame.WindowWaitingList_leSetCallMacros.Text)<>'' then
  begin
   lParam:=Trim(WindowWaitingListSettingsFrame.WindowWaitingList_leSetCallMacros.Text);
   lDllCommand(DC_SENT_CW, Self, lParam, wParam);
  end;

//    lDllCommand(DC_CALL_INFO, Self, lParam, wParam);
    bIsWaitingList:=True;
  end;
end;


procedure TWindowWaitingListForm.aWaitingListCallAddExecute(Sender: TObject);
var
Action : TAction;
lParam,wParam :variant;

begin
 if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)<>'' then
  begin
   cdsWaitingList.Append;
   cdsWaitingList.FieldByName('WAITINGLIST_CALL').asString:=ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_FREQ').AsFloat:=ldsLogEdit.DataSet.FieldByName('LOG_FREQ').AsFloat;
   cdsWaitingList.FieldByName('WAITINGLIST_MODE').asString:=ldsLogEdit.DataSet.FieldByName('LOG_MODE').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_BAND').AsFloat:=ldsLogEdit.DataSet.FieldByName('LOG_BAND_MHZ').AsFloat;
   cdsWaitingList.FieldByName('WAITINGLIST_DATE').AsDateTime:=Now;
   cdsWaitingList.FieldByName('WAITINGLIST_QTH').asString:=ldsLogEdit.DataSet.FieldByName('LOG_QTH').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_IOTA').asString:=ldsLogEdit.DataSet.FieldByName('LOG_IOTA').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_STATE').asString:=ldsLogEdit.DataSet.FieldByName('LOG_STATE').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_NAME').asString:=ldsLogEdit.DataSet.FieldByName('LOG_NAME').AsString;
   cdsWaitingList.FieldByName('WAITINGLIST_COMMENT').asString:=ldsLogEdit.DataSet.FieldByName('LOG_COMMENT').AsString;
   cdsWaitingList.Post;
   Action := TAction.Create(Self);
   Action.HelpKeyword:=IntToStr(cdsWaitingList.RecordCount);
   Action.OnExecute := SetCall;
   Action.Tag := -3;
   Action.ShortCut:=TextToShortCut('CTRL+'+IntToStr(cdsWaitingList.RecordCount));
   Action.ActionList:=alWaitingListItems;
   lDllCommand(DC_CANCEL_QSO, Self, lParam, wParam);
  end;
end;

procedure TWindowWaitingListForm.SaveGrid;
var
  S: string;
  I: Integer;
begin
  with dbgWaitingList.Columns do
  begin
    for I := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[I].Index, Items[I].Width, Integer(Items[I].Title.SortMarker), Integer(Items[I].Visible), Items[I].Title.SortIndex, Items[I].DropDownRows, Items[I].DropDownWidth, Items[I].InRowLinePos, Items[I].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString('dbgWaitingList.' + Items[I].FieldName, S);
    end;
  end;
  FormStorage.WriteString('dbgWaitingList.FontName', dbgWaitingList.Font.Name);
  FormStorage.WriteInteger('dbgWaitingList.FontColor', dbgWaitingList.Font.Color);
  FormStorage.WriteInteger('dbgWaitingList.FontSize', dbgWaitingList.Font.Size);
  FormStorage.WriteInteger('dbgWaitingList.FontStyle', FontStyleToInt(dbgWaitingList.Font.Style));
  FormStorage.WriteInteger('dbgWaitingList.BackgroundColor', dbgWaitingList.Color);
  FormStorage.WriteBoolean('dbgWaitingList.UseCustomColorFont', dbgWaitingList.DrawGraphicData);
end;


procedure TWindowWaitingListForm.SaveQSO;
begin
 if bIsWaitingList then
  DeleteCall;
end;

procedure TWindowWaitingListForm.CancelQSO;
begin
 bIsWaitingList:=False;
end;

procedure TWindowWaitingListForm.DeleteCall;
var
Action:TAction;
aIndex:integer;
i:integer;

 function FindActionByNo(Number:integer):TAction;
 var
  i:integer;
 begin
   for i := 0 to alWaitingListItems.ActionCount-1 do
    if StrToInt(TAction(alWaitingListItems.Actions[i]).HelpKeyword)=Number then
     begin
       result:=TAction(alWaitingListItems.Actions[i]);
       exit;
     end;
 end;
begin
  Action:=FindActionByNo(cdsWaitingList.RecNo);
  aIndex:=StrToInt(Action.HelpKeyword);
  if Action<>nil then
   Action.Free;
  for i:=aIndex-1 to alWaitingListItems.ActionCount-1 do
    begin
      TAction(alWaitingListItems.Actions[i]).HelpKeyword:=IntToStr(i+1);
      TAction(alWaitingListItems.Actions[i]).ShortCut:=TextToShortCut('CTRL+'+IntToStr(i+1));
    end;
  cdsWaitingList.Delete;
end;


procedure TWindowWaitingListForm.aWaitingListCallDeleteExecute(Sender: TObject);
begin
 DeleteCall;
end;


procedure TWindowWaitingListForm.aWaitingListSetCallExecute(Sender: TObject);
begin
 SetCall(nil);
end;

procedure TWindowWaitingListForm.NewQSO;
var
 lParam, wParam :variant;
begin
 if bIsWaitingList and WindowWaitingListSettingsFrame.WindowWaitingList_cbSetNextCall.Checked  and (alWaitingListItems.ActionCount>0) then
 begin
  SetCall(alWaitingListItems.Actions[0]);
 end
 else
  bIsWaitingList:=False;
end;






end.
