unit uWindowQSOEntrySettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, ImgList, Mask, JvExMask, JvToolEdit, DBGridEhGrouping, GridsEh,
  DBGridEh, DB, JvMemoryDataset;

type
  TWindowQSOEntrySettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowQSOEntry_cbNextOnEnter: TCheckBox;
    WindowQSOEntry_cbShowRightPanel: TCheckBox;
    WindowQSOEntry_cbShowBottomPanel: TCheckBox;
    WindowQSOEntry_gbMain: TGroupBox;
    WindowQSOEntry_gbFocus: TGroupBox;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ilQSOEntry: TImageList;
    WindowQSOEntry_lvControlFocus: TListView;
    WindowQSOEntry_cbSaveRecordOnEnter: TCheckBox;
    WindowQSOEntry_lbNameQTHDirectory: TLabel;
    deNameQTHDirectory: TJvDirectoryEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbAddFields: TListBox;
    lbAddFieldsAvaible: TListBox;
    cdsFieldsAdd: TJvMemoryData;
    cdsFieldsAddFIELD_NAME: TStringField;
    cdsFieldsAddFIELD_VISIBLE: TBooleanField;
    cdsFieldsAddFIELD_ENABLED: TBooleanField;
    dsFieldsAdd: TDataSource;
    dbgCWEngineMacros: TDBGridEh;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    procedure FormStorageSavePlacement(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure WindowQSOEntry_lvControlFocusDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure WindowQSOEntry_lvControlFocusDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbAddFieldsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbAddFieldsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbAddFieldsAvaibleDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
  public
  end;

implementation

{$R *.dfm}


procedure TWindowQSOEntrySettingsFrame.FormStorageSavePlacement(
  Sender: TObject);
var
 slControls:TStringList;
 i:integer;
begin
 slControls:=TStringList.Create;
 try
  for i := 0 to WindowQSOEntry_lvControlFocus.Items.Count - 1 do
    slControls.Add(TComponent(WindowQSOEntry_lvControlFocus.Items[i].Data).Name+'|'+BoolToStr(WindowQSOEntry_lvControlFocus.Items[i].Checked));
   FormStorage.AppStorage.WriteStringList('WindowQSOEntry\Controls',slControls);
 finally
  slControls.Free;
 end;
end;


function MoveListViewItem(listView: TListView; ItemFrom, ItemTo: Word): Boolean;
 var
   Source, Target: TListItem;
 begin
   Result := False;
   listview.Items.BeginUpdate;
   try
     Source := listview.Items[ItemFrom];
     Target := listview.Items.Insert(ItemTo);
     Target.Assign(Source);
     Source.Free;
     Target.Selected:=True;
     Target.Focused:=True;
     Result := True;
   finally
     listview.Items.EndUpdate;
   end;
 end;


procedure TWindowQSOEntrySettingsFrame.lbAddFieldsAvaibleDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := Source = lbAddFields;
end;

procedure TWindowQSOEntrySettingsFrame.lbAddFieldsDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  s: string;
begin
  if Source = lbAddFieldsAvaible then
  begin
    lbAddFields.Items.Add(lbAddFieldsAvaible.Items[lbAddFieldsAvaible.ItemIndex]);
    lbAddFieldsAvaible.Items.Delete(lbAddFieldsAvaible.ItemIndex);
  //������� ������������ �������
  end
  else          //���������� ������������
  begin
    s := lbAddFields.Items[lbAddFields.ItemIndex];
    lbAddFields.Items.Delete(lbAddFields.ItemIndex);
    lbAddFields.Items.Insert(lbAddFields.ItemAtPos(Point(X, Y), False), s);
  //�������, � ����� ������� ���������� � ���������
  end;
end;
procedure TWindowQSOEntrySettingsFrame.lbAddFieldsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := Source = lbAddFieldsAvaible;
end;

procedure TWindowQSOEntrySettingsFrame.ToolButton11Click(Sender: TObject);
var
 i:word;
begin
 if WindowQSOEntry_lvControlFocus.Items.Count>0 then
   if WindowQSOEntry_lvControlFocus.ItemIndex<WindowQSOEntry_lvControlFocus.Items.Count-1 then
      MoveListViewItem(WindowQSOEntry_lvControlFocus,WindowQSOEntry_lvControlFocus.Selected.Index,WindowQSOEntry_lvControlFocus.Selected.Index+2);
end;



procedure TWindowQSOEntrySettingsFrame.ToolButton12Click(Sender: TObject);
var
 i:word;
begin
 if WindowQSOEntry_lvControlFocus.Items.Count>0 then
   if WindowQSOEntry_lvControlFocus.ItemIndex>0 then
      MoveListViewItem(WindowQSOEntry_lvControlFocus,WindowQSOEntry_lvControlFocus.Selected.Index,WindowQSOEntry_lvControlFocus.Selected.Index-1);
end;

procedure TWindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocusDragDrop(
  Sender, Source: TObject; X, Y: Integer);
var
DropItem,
CurrentItem,
NextItem,
DragItem: TListItem;
begin
if Sender = Source then
    with TListView(Sender) do
    begin
      DropItem    := GetItemAt(X, Y);
      CurrentItem := Selected;
      while CurrentItem <> nil do
      begin
        NextItem := GetNextItem(CurrentItem, SdAll, [IsSelected]);
        if DropItem = nil then DragItem := Items.Add
        else
          DragItem := Items.Insert(DropItem.Index);
        DragItem.Assign(CurrentItem);
        CurrentItem.Free;
        CurrentItem := NextItem;
      end;
    end;
end;

procedure TWindowQSOEntrySettingsFrame.WindowQSOEntry_lvControlFocusDragOver(
  Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
 Accept := Sender = WindowQSOEntry_lvControlFocus;
end;

end.
