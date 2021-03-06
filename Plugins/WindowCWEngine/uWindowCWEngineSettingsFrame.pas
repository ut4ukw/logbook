unit uWindowCWEngineSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ACS_Classes, ACS_DXAudio,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit, uUtils, Registry, ComCtrls, ToolWin,
  DB, JvMemoryDataset, Grids, ImgList, ActnList, uEditCWEngineMacros, Menus,
  DBGridEhGrouping, GridsEh, DBGridEh, JvAppIniStorage, DBGrids;

type
  TWindowCWEngineSettingsFrame = class(TFrame)
    WindowCWEngine_gbDeviceSettings: TGroupBox;
    cbComPort: TComboBox;
    WindowCWEngine_lbComPort: TLabel;
    cbPTT: TComboBox;
    cbKey: TComboBox;
    FormStorage: TJvFormStorage;
    WindowCWEngine_lbPTT: TLabel;
    WindowCWEngine_lbKey: TLabel;
    WindowCWEngine_gbMacros: TGroupBox;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    cdsCWEngineMacros: TJvMemoryData;
    cdsCWEngineMacrosMACROS_CAPTION: TStringField;
    cdsCWEngineMacrosMACROS_SHORTCUT: TStringField;
    cdsCWEngineMacrosMACROS_TEXT: TStringField;
    dsCWEngineMacros: TDataSource;
    alCWEngine: TActionList;
    CWEngine_aAddMacros: TAction;
    CWEngine_aEditMacros: TAction;
    CWEngine_aDeleteMacros: TAction;
    ilCWEngine: TImageList;
    CWEngine_btnOk: TLabel;
    CWEngine_btnCancel: TLabel;
    cdsCWEngineMacrosCWENGINE_MACROS_BTNCOLOR: TStringField;
    dbgCWEngineMacros: TDBGridEh;
    lbSSTFilterListItem_All: TLabel;
    lbSSTFilterListItem_ClearFilter: TLabel;
    lbSSTFilterListItem_ApplyFilter: TLabel;
    lbSSTFilterListItem_CustomFilter: TLabel;
    lbFilterCaption: TLabel;
    lbShowRecordsWhere: TLabel;
    lbAnd: TLabel;
    lbOr: TLabel;
    procedure CWEngine_aAddMacrosExecute(Sender: TObject);
    procedure FormStorageSavePlacement(Sender: TObject);
    procedure FormStorageAfterRestorePlacement(Sender: TObject);
    procedure CWEngine_aEditMacrosExecute(Sender: TObject);
    procedure CWEngine_aDeleteMacrosExecute(Sender: TObject);
    procedure CWEngine_aEditMacrosUpdate(Sender: TObject);
    procedure CWEngine_aDeleteMacrosUpdate(Sender: TObject);
    procedure dbgCWEngineMacrosDblClick(Sender: TObject);
    procedure dbgCWEngineMacrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);

  private
    procedure MacrosExecute(Sender: TObject);
  public
    // WindowCWEngineForm:TWindowCWEngineForm;
    procedure Init;
  end;

implementation

uses uWindowCWEngineForm;
{$R *.dfm}

procedure TWindowCWEngineSettingsFrame.MacrosExecute(Sender: TObject);
begin
  { WindowCWEngineForm.bIsMacros:=True;
    WindowCWEngineForm.CurrMacros:='CQ CQ';
    WindowCWEngineForm.thrCWSent.Execute(nil); }
  //
end;

procedure TWindowCWEngineSettingsFrame.CWEngine_aAddMacrosExecute(Sender: TObject);
var
  EditCWEngineMacros: TEditCWEngineMacros;
begin
  EditCWEngineMacros := TEditCWEngineMacros.Create(nil);
  EditCWEngineMacros.Caption := CWEngine_aAddMacros.Caption;
  EditCWEngineMacros.leCWEngineMacrosCaption.EditLabel.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').DisplayLabel;
  EditCWEngineMacros.lbCWEngineShortCut.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').DisplayLabel;
  EditCWEngineMacros.lbCWEngineMacros.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').DisplayLabel;
  EditCWEngineMacros.btnOk.Caption := CWEngine_btnOk.Caption;
  EditCWEngineMacros.btnCancel.Caption := CWEngine_btnCancel.Caption;
  EditCWEngineMacros.cbBtnColor.ColorValue:=clSilver;
  if EditCWEngineMacros.ShowModal = mrOk then
  begin
    cdsCWEngineMacros.Append;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').AsString := EditCWEngineMacros.leCWEngineMacrosCaption.Text;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').AsString := ShortCutToText(EditCWEngineMacros.edCWEngineMacrosShortCut.HotKey);
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').AsString := EditCWEngineMacros.meCWEngineMacrosText.Lines.Text;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString := ColorToHex(EditCWEngineMacros.cbBtnColor.ColorValue);
    cdsCWEngineMacros.Post;
  end;
  EditCWEngineMacros.Free;
end;

procedure TWindowCWEngineSettingsFrame.CWEngine_aDeleteMacrosExecute(Sender: TObject);
begin
  cdsCWEngineMacros.Delete;
end;

procedure TWindowCWEngineSettingsFrame.CWEngine_aDeleteMacrosUpdate(Sender: TObject);
begin
  CWEngine_aDeleteMacros.Enabled := not cdsCWEngineMacros.IsEmpty;
end;

procedure TWindowCWEngineSettingsFrame.CWEngine_aEditMacrosExecute(Sender: TObject);
var
  EditCWEngineMacros: TEditCWEngineMacros;
begin
  EditCWEngineMacros := TEditCWEngineMacros.Create(nil);
  EditCWEngineMacros.Caption := CWEngine_aEditMacros.Caption;
  EditCWEngineMacros.leCWEngineMacrosCaption.EditLabel.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').DisplayLabel;
  EditCWEngineMacros.lbCWEngineShortCut.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').DisplayLabel;
  EditCWEngineMacros.lbCWEngineMacros.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').DisplayLabel;
  EditCWEngineMacros.lbModeBackgroundColor.Caption := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').DisplayLabel;
  EditCWEngineMacros.btnOk.Caption := CWEngine_btnOk.Caption;
  EditCWEngineMacros.btnCancel.Caption := CWEngine_btnCancel.Caption;

  EditCWEngineMacros.leCWEngineMacrosCaption.Text := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').AsString;
  EditCWEngineMacros.edCWEngineMacrosShortCut.HotKey := TextToShortCut(cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').AsString);
  EditCWEngineMacros.meCWEngineMacrosText.Lines.Text := cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').AsString;
  if cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString <> '' then
    EditCWEngineMacros.cbBtnColor.ColorValue := HexToColor(cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString);

  if EditCWEngineMacros.ShowModal = mrOk then
  begin
    cdsCWEngineMacros.Edit;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').AsString := EditCWEngineMacros.leCWEngineMacrosCaption.Text;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').AsString := ShortCutToText(EditCWEngineMacros.edCWEngineMacrosShortCut.HotKey);
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').AsString := EditCWEngineMacros.meCWEngineMacrosText.Lines.Text;
    cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString := ColorToHex(EditCWEngineMacros.cbBtnColor.ColorValue);
    cdsCWEngineMacros.Post;
  end;
  EditCWEngineMacros.Free;
end;

procedure TWindowCWEngineSettingsFrame.CWEngine_aEditMacrosUpdate(Sender: TObject);
begin
  CWEngine_aEditMacros.Enabled := not cdsCWEngineMacros.IsEmpty;
end;

procedure TWindowCWEngineSettingsFrame.dbgCWEngineMacrosDblClick(Sender: TObject);
begin
  if CWEngine_aEditMacros.Enabled then
    CWEngine_aEditMacros.OnExecute(Self);
end;

procedure TWindowCWEngineSettingsFrame.dbgCWEngineMacrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if Column.FieldName = 'CWENGINE_MACROS_BTNCOLOR' then
  begin
    if TDBGridEh(Sender).DataSource.DataSet.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString <> '' then
    begin
      // TDBGridEh(Sender).Canvas.Brush.Style := bsSolid;
      TDBGridEh(Sender).Canvas.Brush.Color := HexToColor(TDBGridEh(Sender).DataSource.DataSet.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString);
      TDBGridEh(Sender).Canvas.Font.Color := TDBGridEh(Sender).Canvas.Brush.Color;
      TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TWindowCWEngineSettingsFrame.FormStorageAfterRestorePlacement(Sender: TObject);
var
  slCWEngineMacros: TStringList;
  slCWEngineMacrosLine: TStringList;
  i: Integer;
  Action: TAction;
  S: string;
begin
  cdsCWEngineMacros.DisableControls;
  cdsCWEngineMacros.Open;
  cdsCWEngineMacros.EmptyTable;
  slCWEngineMacros := TStringList.Create;
  slCWEngineMacrosLine := TStringList.Create;
  slCWEngineMacrosLine.Delimiter := '|';
  slCWEngineMacrosLine.StrictDelimiter := True;
  try
    FormStorage.AppStorage.ReadStringList('CWEngine\Macros', slCWEngineMacros);
    for i := 0 to slCWEngineMacros.Count - 1 do
    begin
      slCWEngineMacrosLine.DelimitedText := slCWEngineMacros.Strings[i];
      { Action:=TAction.Create(Self);
        Action.Name:='CWEngineMacros'+IntToStr(alCWEngineMacros.ActionCount+1);
        Action.Caption:=slCWEngineMacrosLine.Strings[0];
        Action.ShortCut:=TextToShortCut(slCWEngineMacrosLine.Strings[1]);
        Action.OnExecute:=MacrosExecute;
        Action.Tag:=-1;
        Action.ActionList:=alCWEngineMacros; }

      cdsCWEngineMacros.Append;
      cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').AsString := slCWEngineMacrosLine.Strings[0];
      cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').AsString := slCWEngineMacrosLine.Strings[1];
      cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT').AsString := slCWEngineMacrosLine.Strings[2];
      if slCWEngineMacrosLine.Count > 3 then
        cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString := slCWEngineMacrosLine.Strings[3];
      cdsCWEngineMacros.Post;
    end;
  finally
    cdsCWEngineMacros.First;
    cdsCWEngineMacros.EnableControls;
    slCWEngineMacrosLine.Free;
    slCWEngineMacros.Free;
  end;

  dbgCWEngineMacros.RestoreColumnsLayoutIni(ExtractFilePath(Application.ExeName) + TJvAppIniFileStorage(FormStorage.AppStorage).FileName, 'WindowCWEngineSettingsFrame', [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh,
    crpDropDownWidthEh, crpRowPanelColPlacementEh]);

end;

procedure TWindowCWEngineSettingsFrame.FormStorageSavePlacement(Sender: TObject);
var
  slCWEngine: TStringList;
  S: string;
  i: Integer;
begin
  slCWEngine := TStringList.Create;
  slCWEngine.StrictDelimiter := True;
  cdsCWEngineMacros.DisableControls;
  try
    cdsCWEngineMacros.First;
    while not cdsCWEngineMacros.Eof do
    begin
      slCWEngine.Add(cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_CAPTION').AsString + '|' + cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_SHORTCUT').AsString + '|' + cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_TEXT')
          .AsString + '|' + cdsCWEngineMacros.FieldByName('CWENGINE_MACROS_BTNCOLOR').AsString);
      cdsCWEngineMacros.Next;
    end;
    FormStorage.AppStorage.WriteStringList('CWEngine\Macros', slCWEngine);
  finally
    cdsCWEngineMacros.EnableControls;
    slCWEngine.Free;
  end;
  with dbgCWEngineMacros.Columns do
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
      FormStorage.WriteString(dbgCWEngineMacros.Name + '.' + Items[i].FieldName, S);
    end;
  end;

end;

procedure TWindowCWEngineSettingsFrame.Init;
var
  reg: TRegistry;
  st: Tstrings;
  i: Integer;
begin
  { reg := TRegistry.Create;
    try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('hardware\devicemap\serialcomm', False);
    st := TstringList.Create;
    try
    reg.GetValueNames(st);
    for i := 0 to st.Count - 1 do
    cbComPort.Items.Add(reg.Readstring(st.strings[i]));
    finally
    st.Free;
    end;
    reg.CloseKey;
    finally
    reg.Free;
    end; }
end;

end.
