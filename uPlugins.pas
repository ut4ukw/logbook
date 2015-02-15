unit uPlugins;

interface

uses SysUtils, uPluginHeaders, Classes, Windows, Dialogs, ExtCtrls, JPEG, Forms, uOptions,
  DB, ActnList, Controls, JvAppIniStorage, LMDDckSite, uTranslator, JvFormPlacement,
  KDaoDataBase, uWindowPluginForm, Grids;

type
  TMoveSG = class(TCustomGrid); // reveals protected MoveRow procedure

//  TOnRegisterWindow = procedure(Id: integer; Name: string) of object;
  TOnRegisterWindows = procedure(slWindows:TStringList) of object;
  TOnUnRegisterWindow = procedure(Id: integer; Name: string) of object;

  TPlugin = class
    Initialize: TInitialize;
    DeInitialize: TDeInitialize;
    CoreCommand: TCoreCommand;
    DllCommand: TCoreCommand;
    CoreGetData: TCoreGetData;
    FFormStorage: TJvFormStorage;
  public
    PluginForm: TWindowPluginForm;
    SettingsFrame: TFrame;
    DllName: string;
    Name: string;
    Handle: THandle;
    IMSName: string;
  end;

  TPlugins = class
  private
    FPath: String;
    FOnRegisterWindows: TOnRegisterWindows;
    FOnUnRegisterWindow: TOnUnRegisterWindow;
  protected
  public
    Translator: TTranslator;
    Items: TList;
    constructor Create(Path: string);
    destructor Destroy;
    procedure LoadPlugin(FileName: string);
    // procedure Load;
    procedure UnLoad;
    procedure RegisterWindows;
    procedure RegisterSettings;
    procedure UnRegisterWindows;

    { function Initialize(App : TApplication;
      Scr : TScreen;
      ActionList:TActionList;
      AppStorage:TJvAppIniFileStorage;
      ImageList:TImageList;
      DllCommand:pointer;
      Database:TKADaoDatabase;
      dsLogEdit:TDataSource;
      dsLog:TDataSource;
      IMSName:string
      ) : integer;
    }

    function InitializePlugin(Index: integer; App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource; dsLog: TDataSource;
      IMSName: string): integer;

    function DeInitialize: integer;
    function ShowWindow(Id: integer; aParent: TCustomControl): TForm;
    function CoreCommand(IdCommand: integer; Sender: TObject; lParam, wParam: variant): integer;
    function CoreGetData(IdCommand: integer; var lParam, wParam: variant): integer;

    function GetIdByNameWindow(NameWindow: string): integer;
    function PluginByName(Name: string): TPlugin;
    function PluginByNameWindow(NameWindow: string): TPlugin;
    { function ChangeStationCall(var vStationInfo : TStationInfo; bGetStationInfoPlugin:boolean) : integer;
      function GetStationInfo(var vStationInfo : TStationInfo) : integer;
      function GetStationPhoto(var vStationInfo : TStationInfo) : integer;
      }
    property OnRegisterWindows: TOnRegisterWindows read FOnRegisterWindows write FOnRegisterWindows;
    property OnUnRegisterWindow: TOnUnRegisterWindow read FOnUnRegisterWindow write FOnUnRegisterWindow;
    procedure SaveSettings;
    procedure RestoreSettings;
  end;

implementation

uses uMainWindow;

constructor TPlugins.Create(Path: string);
begin
  FPath := Path;
  Items := TList.Create;
end;

destructor TPlugins.Destroy;
begin
  Items.Free;
end;

procedure TPlugins.LoadPlugin(FileName: string);
var
  h: THandle;
  Plugin: TPlugin;
begin
  h := LoadLibrary(PWideChar(FileName));
  if h <> 0 then
  begin
    Plugin := TPlugin.Create;
    Plugin.DllName := FileName;
    Plugin.Name := ChangeFileExt(ExtractFileName(FileName), '');
    Plugin.Handle := h;
    @Plugin.Initialize := getProcAddress(Plugin.Handle, 'Initialize');

    @Plugin.DeInitialize := getProcAddress(Plugin.Handle, 'DeInitialize');

    // @Plugin.Settings:=getProcAddress(Plugin.Handle,'Settings');

    { @Plugin.GetStationInfo:=getProcAddress(Plugin.Handle,'GetStationInfo');

      @Plugin.GetStationPhoto:=getProcAddress(Plugin.Handle,'GetStationPhoto');

      @Plugin.ChangeStationCall:=getProcAddress(Plugin.Handle,'ChangeStationCall'); }

    // @Plugin.RegisterWindow:=getProcAddress(Plugin.Handle,'RegisterWindow');

    // @Plugin.ShowWindow:=getProcAddress(Plugin.Handle,'ShowWindow');

    // @Plugin.GetWindow:=getProcAddress(Plugin.Handle,'GetWindow');

    @Plugin.CoreCommand := getProcAddress(Plugin.Handle, 'CoreCommand');

    @Plugin.CoreGetData := getProcAddress(Plugin.Handle, 'CoreGetData');

    Items.Add(Plugin);
  end
  else
    raise Exception.Create('Error load plugin ' + FileName);
end;

procedure TPlugins.UnLoad;
var
  i: integer;
begin
  for i := 0 to Items.Count - 1 do
  begin
    FreeLibrary(TPlugin(Items[i]).Handle);
    TPlugin(Items[i]).Free;
  end;
  Items.Clear;
end;

{ function TPlugins.Initialize(App : TApplication;
  Scr : TScreen;
  ActionList:TActionList;
  AppStorage:TJvAppIniFileStorage;
  ImageList:TImageList;
  DllCommand:pointer;
  Database:TKADaoDatabase;
  dsLogEdit:TDataSource;
  dsLog:TDataSource;
  IMSName:string
  ) :  integer;
  var
  i:integer;
  begin
  for i:= 0 to Items.Count - 1 do
  begin
  if @TPlugin(Items[i]).Initialize<>nil then
  Result:=TPlugin(Items[i]).Initialize(App,Scr,ActionList,AppStorage,ImageList,DllCommand,Database,dsLogEdit,dsLog);
  end;
  end; }

function TPlugins.InitializePlugin(Index: integer; App: TApplication; Scr: TScreen; ActionList: TActionList; AppStorage: TJvAppIniFileStorage; ImageList: TImageList; DllCommand: pointer; Database: TKADaoDatabase; dsLogEdit: TDataSource;
  dsLog: TDataSource; IMSName: string): integer;
begin
  TPlugin(Items[Index]).IMSName := IMSName;
  Result := TPlugin(Items[Index]).Initialize(App, Scr, ActionList, AppStorage, ImageList, DllCommand, Database, dsLogEdit, dsLog, IMSName, TForm(TPlugin(Items[Index]).PluginForm), TPlugin(Items[Index]).SettingsFrame);
  // TPlugin(Items[Index]).Form:=TPlugin(Items[Index]).GetWindow(0);
end;

function TPlugins.DeInitialize: integer;
var
  i: integer;
begin
  for i := 0 to Items.Count - 1 do
    if @TPlugin(Items[i]).DeInitialize <> nil then
    begin
      if TPlugin(Items[i]).PluginForm <> nil then
      begin
        if TPlugin(Items[i]).PluginForm.Parent is TLMDDockPanel then
          TLMDDockPanel(TPlugin(Items[i]).PluginForm.Parent).MainToolBarPanel := nil;
      end;
      Result := TPlugin(Items[i]).DeInitialize;
    end;
end;

{ function TPlugins.GetStationInfo(var vStationInfo : TStationInfo) :  integer;
  var
  i:integer;
  begin
  Result:=0;
  for i:= 0 to Items.Count - 1 do
  if @TPlugin(Items[i]).GetStationInfo<>nil then
  Result:=TPlugin(Items[i]).GetStationInfo(vStationInfo);
  end;

  function TPlugins.GetStationPhoto(var vStationInfo : TStationInfo) :  integer;
  var
  i:integer;
  begin
  Result:=0;
  for i:= 0 to Items.Count - 1 do
  if @TPlugin(Items[i]).GetStationPhoto<>nil then
  Result:=TPlugin(Items[i]).GetStationPhoto(vStationInfo);
  end;

  function TPlugins.ChangeStationCall(var vStationInfo : TStationInfo; bGetStationInfoPlugin:boolean) : integer;
  var
  i:integer;
  begin
  Result:=0;
  for i:= 0 to Items.Count - 1 do
  if @TPlugin(Items[i]).ChangeStationCall<>nil then
  Result:=TPlugin(Items[i]).ChangeStationCall(vStationInfo, bGetStationInfoPlugin);
  end;
}

procedure TPlugins.RegisterWindows;
var
  i: integer;
  vName: PChar;
  Result: integer;
  slWindows:TStringList;
  aStringGrid:TStringGrid;


procedure SortGridByCols(Grid: TStringGrid; ColOrder: array of Integer);
 var
   i, j:   Integer;
   Sorted: Boolean;

 function Sort(Row1, Row2: Integer): Integer;
 var
   C: Integer;
 begin
   C      := 0;
   Result := AnsiCompareStr(Grid.Cols[ColOrder[C]][Row1], Grid.Cols[ColOrder[C]][Row2]);
   if Result = 0 then
   begin
     Inc(C);
     while (C <= High(ColOrder)) and (Result = 0) do
     begin
       Result := AnsiCompareStr(Grid.Cols[ColOrder[C]][Row1],
         Grid.Cols[ColOrder[C]][Row2]);
       Inc(C);
     end;
   end;
 end;

 begin
   if SizeOf(ColOrder) div SizeOf(i) <> Grid.ColCount then Exit;

   for i := 0 to High(ColOrder) do
     if (ColOrder[i] < 0) or (ColOrder[i] >= Grid.ColCount) then Exit;

   j := 0;
   Sorted := False;
   repeat
     Inc(j);
     with Grid do
       for i := 0 to RowCount - 2 do
         if Sort(i, i + 1) > 0 then
         begin
           TMoveSG(Grid).MoveRow(i + 1, i);
           Sorted := False;
         end;
   until Sorted or (j = 1000);
//   Grid.Repaint;
 end;


begin
{  aStringGrid:=TStringGrid.Create(nil);
  aStringGrid.ColCount:=3;}
  slWindows:=TStringList.Create;
  try
  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).PluginForm <> nil then
    begin
      Translator.TranslateWindow(TPlugin(Items[i]).PluginForm.Name, TPlugin(Items[i]).PluginForm);
{      aStringGrid.RowCount:=i+1;
      aStringGrid.Cells[0,i]:=Translator.GetCaption('MainWindow',TPlugin(Items[i]).PluginForm.Name);
      aStringGrid.Cells[1,i]:=TPlugin(Items[i]).PluginForm.Name;
      aStringGrid.Cells[2,i]:=IntToStr(i);}
      slWindows.AddObject(TPlugin(Items[i]).Name,Pointer(i));
{      if Assigned(FOnRegisterWindows) then
        FOnRegisterWindows(i, TPlugin(Items[i]).Name);}
    end;
    slWindows.Sort;
//    SortGridByCols(aStringGrid,[0]);
   if Assigned(FOnRegisterWindows) then
      FOnRegisterWindows(slWindows);
  finally
    slWindows.Free;
//    aStringGrid.Free;
  end;
end;

procedure TPlugins.RegisterSettings;
var
  i, j: integer;
  Frame: TFrame;
begin
  { for i:= 0 to Items.Count - 1 do
    if @TPlugin(Items[i]).Settings<>nil then
    begin
    Frame:=TPlugin(Items[i]).Settings;
    TPlugin(Items[i]).SettingsFrame:=Frame;
    for j:=0 to Frame.ComponentCount-1 do
    if Frame.Components[j] is TJVFormStorage then
    begin
    TPlugin(Items[i]).FFormStorage:=TJVFormStorage(Frame.Components[j]);
    break;
    end;
    end; }

  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).SettingsFrame <> nil then
    begin
      for j := 0 to TPlugin(Items[i]).SettingsFrame.ComponentCount - 1 do
        if TPlugin(Items[i]).SettingsFrame.Components[j] is TJvFormStorage then
        begin
          TPlugin(Items[i]).FFormStorage := TJvFormStorage(TPlugin(Items[i]).SettingsFrame.Components[j]);
          break;
        end;

      { if @TPlugin(Items[i]).Settings<>nil then
        begin
        Frame:=TPlugin(Items[i]).Settings;
        TPlugin(Items[i]).SettingsFrame:=Frame;
        for j:=0 to Frame.ComponentCount-1 do
        if Frame.Components[j] is TJVFormStorage then
        begin
        TPlugin(Items[i]).FFormStorage:=TJVFormStorage(Frame.Components[j]);
        break;
        end; }
    end;

end;

procedure TPlugins.UnRegisterWindows;
var
  i: integer;
begin
  for i := 0 to Items.Count - 1 do
    if Assigned(FOnUnRegisterWindow) then
      FOnUnRegisterWindow(i, TPlugin(Items[i]).Name);

  { if @TPlugin(Items[i]).UnRegisterWindow<>nil then
    begin
    Result:=TPlugin(Items[i]).RegisterWindow(vName);
    TPlugin(Items[i]).NameWindow:=vName;
    if Result=1 then
    begin
    if Assigned(FOnRegisterWindow) then
    FOnRegisterWindow(i,vName);
    end; }
end;

function TPlugins.ShowWindow(Id: integer; aParent: TCustomControl): TForm;
var
  vForm: TWindowPluginForm;
begin
  // vForm:=TPlugin(Items[id]).GetWindow(aParent.Handle);
  vForm := TPlugin(Items[Id]).PluginForm;
  vForm.ParentFont := False;
  vForm.Parent := aParent;
  { if (TPlugin(Items[id]).IMSName='')  then
    ModifyFontsFor(aParent); }
  vForm.Align := alClient;
  // Translator.TranslateWindow(vForm.Name,vForm);

  if aParent is TLMDDockPanel then
  begin
    TLMDDockPanel(aParent).Caption := vForm.Caption;
    TLMDDockPanel(aParent).MainToolBarPanel := vForm.MainToolBarPanel;
  end;

  vForm.Show;
  if (@TPlugin(Items[Id]).CoreCommand <> nil) and vForm.Parent.Visible then
    TPlugin(Items[Id]).CoreCommand(CC_WINDOW_SHOW, nil, 0, 0);

  if (@TPlugin(Items[Id]).CoreCommand <> nil) and not vForm.Parent.Visible then
    if aParent is TLMDDockPanel then
      if Assigned(TLMDDockPanel(aParent).Zone.Parent) then
        if TLMDDockPanel(aParent).Zone.Parent.Kind = zkTabs then
          TPlugin(Items[Id]).CoreCommand(CC_WINDOW_SHOW, nil, 0, 0);

  { if aParent is TLMDDockPanel then
    TLMDDockPanel(aParent).UpdateLayout; }

  if Assigned(vForm.OnActivate) then
    vForm.OnActivate(vForm);
  // SetForegroundWindow(vForm.Handle);
  Result := vForm;
end;

function TPlugins.GetIdByNameWindow(NameWindow: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Items.Count - 1 do
  begin
    if Assigned(TPlugin(Items[i]).PluginForm) then
      if TPlugin(Items[i]).PluginForm.Name = NameWindow then
      begin
        Result := i;
        exit;
      end;
  end;
end;

function TPlugins.PluginByName(Name: string): TPlugin;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).Name = Name then
    begin
      Result := TPlugin(Items[i]);
      exit;
    end;
end;

function TPlugins.PluginByNameWindow(NameWindow: string): TPlugin;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).PluginForm.Name = NameWindow then
    begin
      Result := TPlugin(Items[i]);
      exit;
    end;
end;

function TPlugins.CoreCommand(IdCommand: integer; Sender: TObject; lParam, wParam: variant): integer;
var
  i: integer;
begin
  Result := 0;
  if Items=nil then exit;
  
  try
    for i := 0 to Items.Count - 1 do
      if @TPlugin(Items[i]).CoreCommand <> nil then
        Result := TPlugin(Items[i]).CoreCommand(IdCommand, Sender, lParam, wParam);
  except
    on e: Exception do
      ShowMessage(e.Message + ' | ' + TPlugin(Items[i]).Name);
  end;
end;

function TPlugins.CoreGetData(IdCommand: integer; var lParam, wParam: variant): integer;
var
  i: integer;
begin
  Result := 0;
  try
    for i := 0 to Items.Count - 1 do
      if @TPlugin(Items[i]).CoreGetData <> nil then
        Result := TPlugin(Items[i]).CoreGetData(IdCommand, lParam, wParam);
  except
    on e: Exception do
      ShowMessage(e.Message + ' | ' + IntToStr(i));
  end;
end;

procedure TPlugins.SaveSettings;
var
  i: integer;
begin
  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).FFormStorage <> nil then
      TPlugin(Items[i]).FFormStorage.SaveFormPlacement;
end;

procedure TPlugins.RestoreSettings;
var
  i: integer;
begin
  for i := 0 to Items.Count - 1 do
    if TPlugin(Items[i]).FFormStorage <> nil then
      TPlugin(Items[i]).FFormStorage.RestoreFormPlacement;
end;

end.
