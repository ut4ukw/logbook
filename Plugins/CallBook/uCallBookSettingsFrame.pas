unit uCallBookSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ACS_Classes, ACS_DXAudio,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit, ImgList, ComCtrls, ToolWin, Grids,
  DBGrids, DB, JvMemoryDataset, ActnList, uEditCallBook, DBGridEhGrouping,
  GridsEh, DBGridEh, JvAppIniStorage;

type
  TCallBookSettingsFrame = class(TFrame)
    cdsCallBook: TJvMemoryData;
    cdsCallBookNAME: TStringField;
    cdsCallBookFILED_NAME: TStringField;
    cdsCallBookTYPE: TStringField;
    dsCallBook: TDataSource;
    alCallBook: TActionList;
    CallBook_aCallBookAdd: TAction;
    ilCallBook: TImageList;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    cdsCallBookCALLBOOK_SORT_ORDER: TIntegerField;
    FormStorage: TJvFormStorage;
    CallBook_aCallBookEdit: TAction;
    CallBook_aCallBookDelete: TAction;
    CallBook_aCallBookUp: TAction;
    CallBook_aCallBookDown: TAction;
    CallBook_btnOk: TLabel;
    CallBook_btnCancel: TLabel;
    CallBook_msgConfirmation: TLabel;
    CallBook_msgDeleteCallBook: TLabel;
    dbgCalbook: TDBGridEh;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    procedure CallBook_aCallBookAddExecute(Sender: TObject);
    procedure FormStorageSavePlacement(Sender: TObject);
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure CallBook_aCallBookEditExecute(Sender: TObject);
    procedure CallBook_aCallBookDeleteExecute(Sender: TObject);
    procedure CallBook_aCallBookUpExecute(Sender: TObject);
    procedure CallBook_aCallBookDownExecute(Sender: TObject);
    procedure cdsCallBookAfterScroll(DataSet: TDataSet);
    procedure CallBook_aCallBookEditUpdate(Sender: TObject);
    procedure CallBook_aCallBookDeleteUpdate(Sender: TObject);
    procedure CallBook_aCallBookUpUpdate(Sender: TObject);
    procedure CallBook_aCallBookDownUpdate(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure dbgCalbookDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCallBookSettingsFrame.CallBook_aCallBookAddExecute(Sender: TObject);
var
 EditCallBook:TEditCallBook;
begin
  EditCallBook:=TEditCallBook.Create(nil);
  EditCallBook.Caption:=CallBook_aCallBookAdd.Caption;
  EditCallBook.leCallBookName.EditLabel.Caption:=cdsCallBook.FieldByName('CALLBOOK_NAME').DisplayLabel;
  EditCallBook.lbCallBookType.Caption:=cdsCallBook.FieldByName('CALLBOOK_TYPE').DisplayLabel;
  EditCallBook.lbCallBookFileName.Caption:=cdsCallBook.FieldByName('CALLBOOK_FILENAME').DisplayLabel;
  EditCallBook.btnOk.Caption:=CallBook_btnOk.Caption;
  EditCallBook.btnCancel.Caption:=CallBook_btnCancel.Caption;
  if EditCallBook.ShowModal=mrOk then
   begin
     cdsCallBook.Append;
     cdsCallBook.FieldByName('CALLBOOK_NAME').AsString:=EditCallBook.leCallBookName.Text;
     cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString:=EditCallBook.feCallBook.FileName;
     cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString:=EditCallBook.cbTypeCallBook.Text;
     cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=cdsCallBook.RecordCount+1;
   end;
  EditCallBook.Free;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookDeleteExecute(Sender: TObject);
var
 OldSortOrder:integer;
begin
if MessageBox(Application.Handle,PWideChar(CallBook_msgDeleteCallBook.Caption), PWideChar(CallBook_msgConfirmation.Caption),  MB_YESNO or MB_ICONWARNING)<>IDYES then exit;
 cdsCallBook.DisableControls;
 try
  OldSortOrder:=cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger;
  cdsCallBook.Delete;
  cdsCallBook.First;
  if cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder+1,[]) then
   begin
     while not cdsCallBook.Eof do
       begin
        cdsCallBook.Edit;
        cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger-1;
        cdsCallBook.Post;
        cdsCallBook.Next;
       end;
   end;
 finally
  cdsCallBook.EnableControls;
 end;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookDeleteUpdate(Sender: TObject);
begin
  CallBook_aCallBookDelete.Enabled:=not cdsCallBook.IsEmpty;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookDownExecute(Sender: TObject);
var
 OldSortOrder:integer;
begin
 cdsCallBook.DisableControls;
 try
  OldSortOrder:=cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger;
  if OldSortOrder<cdsCallBook.RecordCount then
   begin
    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder+1,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=-1;
    cdsCallBook.Post;

    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=OldSortOrder+1;
    cdsCallBook.Post;

    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',-1,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=OldSortOrder;
    cdsCallBook.Post;
    cdsCallBook.SortOnFields('CALLBOOK_SORT_ORDER',False,False);
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder+1,[]);
   end;
 finally
  cdsCallBook.EnableControls;
 end;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookDownUpdate(Sender: TObject);
begin
  CallBook_aCallBookDown.Enabled:=not cdsCallBook.IsEmpty;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookEditExecute(Sender: TObject);
var
 EditCallBook:TEditCallBook;
begin
  EditCallBook:=TEditCallBook.Create(nil);
  EditCallBook.Caption:=CallBook_aCallBookEdit.Caption;
  EditCallBook.leCallBookName.EditLabel.Caption:=cdsCallBook.FieldByName('CALLBOOK_NAME').DisplayLabel;
  EditCallBook.lbCallBookType.Caption:=cdsCallBook.FieldByName('CALLBOOK_TYPE').DisplayLabel;
  EditCallBook.lbCallBookFileName.Caption:=cdsCallBook.FieldByName('CALLBOOK_FILENAME').DisplayLabel;
  EditCallBook.btnOk.Caption:=CallBook_btnOk.Caption;
  EditCallBook.btnCancel.Caption:=CallBook_btnCancel.Caption;

  EditCallBook.leCallBookName.Text:=cdsCallBook.FieldByName('CALLBOOK_NAME').AsString;
  EditCallBook.cbTypeCallBook.ItemIndex:=EditCallBook.cbTypeCallBook.Items.IndexOf(cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString);
  EditCallBook.feCallBook.FileName:=cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString;
  if EditCallBook.ShowModal=mrOk then
   begin
     cdsCallBook.Edit;
     cdsCallBook.FieldByName('CALLBOOK_NAME').AsString:=EditCallBook.leCallBookName.Text;
     cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString:=EditCallBook.cbTypeCallBook.Text;
     cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString:=EditCallBook.feCallBook.FileName;
   end;
  EditCallBook.Free;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookEditUpdate(Sender: TObject);
begin
  CallBook_aCallBookEdit.Enabled:=not cdsCallBook.IsEmpty;
end;

procedure TCallBookSettingsFrame.CallBook_aCallBookUpExecute(Sender: TObject);
var
 OldSortOrder:integer;
begin
 cdsCallBook.DisableControls;
 try
  OldSortOrder:=cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger;
  if OldSortOrder>1 then
   begin
    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder-1,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=-1;
    cdsCallBook.Post;

    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=OldSortOrder-1;
    cdsCallBook.Post;

    cdsCallBook.First;
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',-1,[]);

    cdsCallBook.Edit;
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=OldSortOrder;
    cdsCallBook.Post;
    cdsCallBook.SortOnFields('CALLBOOK_SORT_ORDER',False,False);
    cdsCallBook.Locate('CALLBOOK_SORT_ORDER',OldSortOrder-1,[]);
   end;
 finally
  cdsCallBook.EnableControls;
 end;

end;

procedure TCallBookSettingsFrame.CallBook_aCallBookUpUpdate(Sender: TObject);
begin
  CallBook_aCallBookUp.Enabled:=not cdsCallBook.IsEmpty;
end;

procedure TCallBookSettingsFrame.cdsCallBookAfterScroll(DataSet: TDataSet);
begin
 //dbgCallbook.Hint:=cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString;
end;

procedure TCallBookSettingsFrame.dbgCalbookDblClick(Sender: TObject);
begin
 if CallBook_aCallBookEdit.Enabled then
  CallBook_aCallBookEdit.OnExecute(Self);
end;

procedure TCallBookSettingsFrame.FormStorageAfterRestorePlacement(
  Sender: TObject);
var
 slCallBook:TStringList;
 slCallBookLine:TStringList;
 i:integer;
 S: string;
begin
cdsCallBook.DisableControls;
cdsCallBook.Open;
cdsCallBook.EmptyTable;
slCallBook:=TStringList.Create;
slCallBookLine:=TStringList.Create;
slCallBookLine.Delimiter:='|';
slCallBookLine.StrictDelimiter:=True;
try
 FormStorage.AppStorage.ReadStringList('CallBook\CallBook',slCallBook);
 for i:=0 to slCallBook.Count - 1 do
  begin
    slCallBookLine.DelimitedText:=slCallBook.Strings[i];
    cdsCallBook.Append;
    cdsCallBook.FieldByName('CALLBOOK_NAME').AsString:=slCallBookLine.Strings[0];
    cdsCallBook.FieldByName('CALLBOOK_TYPE').AsString:=slCallBookLine.Strings[1];
    cdsCallBook.FieldByName('CALLBOOK_FILENAME').AsString:=slCallBookLine.Strings[2];
    cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').AsInteger:=StrToInt(slCallBookLine.Strings[3]);
    cdsCallBook.Post;
  end;
finally
 cdsCallBook.First;
 cdsCallBook.EnableControls;
 slCallBookLine.Free;
 slCallBook.Free;

  with dbgCalbook.Columns do
  begin
    for i := 0 to Count - 1 do
    begin
      S := Format('%d,%d,%d,%d,%d,%d,%d,%d,%d', [Items[i].Index, Items[i].Width, Integer(Items[i].Title.SortMarker), Integer(Items[i].Visible), Items[i].Title.SortIndex, Items[i].DropDownRows, Items[i].DropDownWidth, Items[i].InRowLinePos,
        Items[i].InRowLineHeight]);
      if S <> '' then
      begin
        if ((S[1] = '"') and (S[Length(S)] = '"')) or ((S[1] = '''') and (S[Length(S)] = '''')) then
          S := '"' + S + '"';
      end;
      FormStorage.WriteString(dbgCalbook.Name + '.' + Items[i].FieldName, S);
    end;
  end;

end;


end;

procedure TCallBookSettingsFrame.FormStorageRestorePlacement(Sender: TObject);
begin
  dbgCalbook.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName, 'CallBookSettingsFrame', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh, crpRowPanelColPlacementEh]);
end;

procedure TCallBookSettingsFrame.FormStorageSavePlacement(Sender: TObject);
var
 slCallBook:TStringList;
begin
 slCallBook:=TStringList.Create;
 cdsCallBook.DisableControls;
 try
  cdsCallBook.First;
  while not cdsCallBook.Eof do
   begin
    slCallBook.Add(cdsCallBook.FieldByName('CALLBOOK_NAME').asString+'|'+cdsCallBook.FieldByName('CALLBOOK_TYPE').asString+'|'+cdsCallBook.FieldByName('CALLBOOK_FILENAME').asString+'|'+IntToStr(cdsCallBook.FieldByName('CALLBOOK_SORT_ORDER').asInteger));
    cdsCallBook.Next;
   end;
   FormStorage.AppStorage.WriteStringList('CallBook\CallBook',slCallBook);
 finally
  cdsCallBook.EnableControls;
  slCallBook.Free;
 end;
end;

end.
