unit uTranslator;

interface

uses SysUtils, Classes, Forms, IniFiles, ActnList, Menus, DBGrids, StdCtrls, ComCtrls,
  JvWizard, DB, ExtCtrls, JvPageListTreeView, KDaoTable, LabeledControls, Ribbon,
  ActnMan,RibbonActnMenus, DbCtrls,NLDSideBar, JvXPContainer ,JvXPBar, vlDBEditCombo;

type
  TTranslator = class(TPersistent)
  private
    FSection: TStringList;
    FLangId: integer;
    procedure FindComponent(aOwner: TComponent);
    procedure TranslateComponent(aComponent: TComponent);
    function GetValue(aName: string): string;
    function GetLangId: integer;
  public
    FileName: string;
    constructor Create(aFileName: string);
    destructor Destroy; override;
    procedure TranslateWindow(Section: string; Window: TComponent);
    property LangId: integer read GetLangId;
    function GetCaption(Section,Name:string):string;
  end;

implementation

constructor TTranslator.Create(aFileName: string);
begin
  inherited Create;
  FileName := aFileName;
  FSection := TStringList.Create;
  FLangId := 0;
end;

destructor TTranslator.Destroy;
begin
  FSection.Free;
  inherited;
end;

function TTranslator.GetLangId: integer;
var
  IniFile: TIniFile;
begin
  if FLangId <> 0 then
  begin
    result := FLangId;
    exit;
  end;

  IniFile := TIniFile.Create(FileName);
  try
    FLangId := IniFile.ReadInteger('Lang', 'Id', 0);
    result := FLangId;
  finally
    IniFile.Free;
  end;
end;

function TTranslator.GetValue(aName: string): string;
begin
  result := StringReplace(FSection.Values[aName],'~',#13#10,[rfReplaceAll, rfIgnoreCase]);
  if result = '' then
    // result:='ERROR get value from '+aName;
    result := aName;
end;

procedure TTranslator.TranslateComponent(aComponent: TComponent);
var
  c: integer;
  i,j,k: integer;
  Item:TActionClientItem;
begin

  if aComponent is TRibbonGroup then
    with aComponent as TRibbonGroup do
    begin
      TRibbonGroup(aComponent).Caption := GetValue(aComponent.Name);
    end;

  if aComponent is TRibbonPage then
    with aComponent as TRibbonPage do
    begin
      TRibbonPage(aComponent).Caption := GetValue(aComponent.Name);
    end;

  if aComponent is TAction then
    with aComponent as TAction do
    begin
      if aComponent.Tag=-3  then Exit;
      Caption := GetValue(aComponent.Name);
      Hint := Caption;
      // Hint:=Caption+' '+ShortCutToText(TAction(aComponent).ShortCut);
    end;




  if aComponent is TActionManager then
   begin
   for i:=0 to TActionManager(aComponent).ActionBars.Count - 1 do
    if TActionClientItem(TActionManager(aComponent).ActionBars.Items[i]).ActionBar is TRibbonApplicationMenuBar then
       begin
        Item:=TActionClientItem(TActionClientItem(TActionManager(aComponent).ActionBars.Items[i]).Items[0]);
        for j := 0 to Item.Items.Count - 1 do
        begin
          if TActionClientItem(Item.Items[j]).Items.Count>1 then
           begin
            if (TActionClientItem(Item.Items[j]).CommandStyle=csMenu)  or
               (TActionClientItem(Item.Items[j]).CommandStyle=csSeparator)   then
                 TActionClientItem(Item.Items[j]).Caption:=GetValue(TActionClientItem(Item.Items[j]).Caption);
            for k := 0 to TActionClientItem(Item.Items[j]).Items.Count - 1 do
             if (TActionClientItem(Item.Items[j]).Items[k].CommandStyle=csMenu)  or
                (TActionClientItem(Item.Items[j]).Items[k].CommandStyle=csSeparator)   then
               TActionClientItem(Item.Items[j]).Items[k].Caption:=GetValue(TActionClientItem(Item.Items[j]).Items[k].Caption);
           end
           else
           begin
            if (TActionClientItem(Item.Items[j]).CommandStyle=csMenu)  or
               (TActionClientItem(Item.Items[j]).CommandStyle=csSeparator)   then
                TActionClientItem(Item.Items[j]).Caption:=GetValue(TActionClientItem(Item.Items[j]).Caption);
           end;
        end;
       end
       else
        if TActionClientItem(TActionManager(aComponent).ActionBars.Items[i]).ActionBar<>nil then
         begin
           Item:=TActionClientItem(TActionClientItem(TActionManager(aComponent).ActionBars.Items[i]).Items[0]);
           for j := 0 to Item.Items.Count - 1 do
             begin
               if (TActionClientItem(Item.Items[j]).CommandStyle=csMenu)  or
                  (TActionClientItem(Item.Items[j]).CommandStyle=csSeparator)   then
               TActionClientItem(Item.Items[j]).Caption:=GetValue(TActionClientItem(Item.Items[j]).Caption);
             end;
         end;
   end;

  if aComponent is TMenuItem then
    with aComponent as TMenuItem do
    begin
      if (Caption <> '-') and (not Assigned(Action)) then
        Caption := GetValue(aComponent.Name);
    end;

  if aComponent is TKADaoTable then
    with aComponent as TKADaoTable do
    begin
      for c := 0 to TKADaoTable(aComponent).FieldCount - 1 do
        TKADaoTable(aComponent).Fields[c].DisplayLabel := GetValue(TDataSet(aComponent).Fields[c].DisplayLabel);
    end;

  if aComponent is TDataSet then
    with aComponent as TDataSet do
    begin
      for c := 0 to TDataSet(aComponent).FieldCount - 1 do
        TDataSet(aComponent).Fields[c].DisplayLabel := GetValue(TDataSet(aComponent).Fields[c].DisplayLabel);
    end;

  if aComponent is TDBGrid then
    with aComponent as TDBGrid do
    begin
      for c := 0 to TDBGrid(aComponent).Columns.Count - 1 do
        TDBGrid(aComponent).Columns[c].Title.Caption := GetValue(TDBGrid(aComponent).Columns[c].FieldName);
    end;

  if aComponent is TJvSettingsTreeView then
  begin
    with aComponent as TJvSettingsTreeView do
    begin
      for c := 0 to TJvSettingsTreeView(aComponent).Items.Count - 1 do
        TJvSettingsTreeView(aComponent).Items[c].Text := GetValue(TJvSettingsTreeView(aComponent).Items[c].Text);
    end;
  end;

  if aComponent is TLabel then
    with aComponent as TLabel do
      if aComponent.Tag >= 0 then
        Caption := GetValue(aComponent.Name);

  if aComponent is TLabeledEdit then
    with aComponent as TLabeledEdit do
      if aComponent.Tag >= 0 then
        TLabeledEdit(aComponent).EditLabel.Caption := GetValue(aComponent.Name);

  if aComponent is TLabeledDBEdit then
    with aComponent as TLabeledDBEdit do
      if aComponent.Tag >= 0 then
        TLabeledDBEdit(aComponent).EditLabel.Caption := GetValue(aComponent.Name);


  if aComponent is TvlDBEditCombo then
    with aComponent as TvlDBEditCombo do
      if aComponent.Tag >= 0 then
        TvlDBEditCombo(aComponent).EditLabel.Caption := GetValue(aComponent.Name);



  if aComponent is TLabeledDBCombobox then
    with aComponent as TLabeledDBCombobox do
      if aComponent.Tag >= 0 then
        TLabeledDBCombobox(aComponent).EditLabel.Caption := GetValue(aComponent.Name);

  if aComponent is TCheckBox then
    with aComponent as TCheckBox do
      Caption := GetValue(aComponent.Name);

  if aComponent is TDBCheckBox then
    with aComponent as TDBCheckBox do
      Caption := GetValue(aComponent.Name);



  if aComponent is TLabeledDBMemo then
    with aComponent as TLabeledDBMemo do
      TLabeledDBMemo(aComponent).EditLabel.Caption := GetValue(aComponent.Name);

  if aComponent is TButton then
    with aComponent as TButton do
      Caption := GetValue(aComponent.Name);

  if aComponent is TPanel then
    with aComponent as TPanel do
      Caption := StringReplace(FSection.Values[aComponent.Name],'~',#13#10,[rfReplaceAll, rfIgnoreCase]);



  if aComponent is TTabSheet then
    with aComponent as TTabSheet do
      if aComponent.Tag <> -1 then
        Caption := GetValue(aComponent.Name);

  if aComponent is TGroupBox then
    with aComponent as TGroupBox do
      Caption := GetValue(aComponent.Name);

  if aComponent is TJvWizardButtonControl then
    with aComponent as TJvWizardButtonControl do
      Caption := GetValue(Caption);

  if aComponent is TJvWizardCustomPage then
    with aComponent as TJvWizardCustomPage do
      TJvWizardCustomPage(aComponent).Header.Title.Text := GetValue(TJvWizardCustomPage(aComponent).Header.Title.Text);

  if aComponent is TJvWizardCustomPage then
    with aComponent as TJvWizardCustomPage do
      TJvWizardCustomPage(aComponent).Header.Subtitle.Text := GetValue(TJvWizardCustomPage(aComponent).Subtitle.Text);

  if aComponent is TRadioGroup then
    with aComponent as TRadioGroup do
      Caption := GetValue(aComponent.Name);

  if aComponent is TRadioButton then
    with aComponent as TRadioButton do
      Caption := GetValue(aComponent.Name);

end;

procedure TTranslator.FindComponent(aOwner: TComponent);
var
  i: integer;
begin
  for i := 0 to aOwner.ComponentCount - 1 do
  begin
    if aOwner.Components[i].ComponentCount > 0 then
      FindComponent(aOwner.Components[i]);
    TranslateComponent(aOwner.Components[i]);
  end;
end;

procedure TTranslator.TranslateWindow(Section: string; Window: TComponent);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FileName);
  try
    FSection.Clear;
    IniFile.ReadSectionValues(Section, FSection);
    if Window is TForm then
      if Application.MainForm <> TForm(Window) then
        TForm(Window).Caption := GetValue(Window.Name);
    FindComponent(Window);
  finally
    IniFile.Free;
  end;
end;

function TTranslator.GetCaption(Section,Name:string):string;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FileName);
  try
    result:=IniFile.ReadString(Section,Name,'');
  finally
    IniFile.Free;
  end;
end;


end.

