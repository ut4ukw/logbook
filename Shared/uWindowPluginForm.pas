unit uWindowPluginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NativeXml, TypInfo, uUtils, StdCtrls, Mask, DBCtrls, LabeledControls,
  ExtCtrls, DB, ComCtrls, Contnrs, uPluginFormDesigner;

type

  ThControl = class(TControl)
     public
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TWindowPluginForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    bIMSLoaded: Boolean;
    FPanel: TPanel;
    bLoadClass: Boolean;
    FDataSource: TDataSource;
    FIMSName: string;
    FNodes: TObjectList;
    FNodePositioning: Boolean;
    FDesignMode:boolean;
    FCurrentNodeControl: TWinControl;
    oldPos: TPoint;
    inReposition : boolean;
    FPluginFormDesigner:TPluginFormDesigner;
    function GetFileName: string;
    procedure SaveForm(Form: TComponent; FileName: string);
    procedure LoadForm(Form: TComponent; FileName: string);
    procedure Load(IMSName: string);
    procedure Save;
    procedure CreateNodes;
    procedure NodeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure NodeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PositionNodes(AroundControl: TWinControl);
    procedure SetNodesVisible(Visible: Boolean);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  protected
  public
    procedure LoadIMS;
    constructor Create(AOwner: TComponent; DataSource: TDataSource; IMSName: string); overload;
    destructor Destroy;
  published
    property MainToolBarPanel: TPanel read FPanel write FPanel;
  end;

var
  WindowPluginForm: TWindowPluginForm;

implementation

{$R *.dfm}

function TWindowPluginForm.GetFileName: string;
var
  DllName: string;
begin
  DllName := GetDllFileName;
  Result := ExtractFilePath(DllName) + FIMSName;
end;

procedure TWindowPluginForm.SaveForm(Form: TComponent; FileName: string);
var
  ADoc: TNativeXml;
  ParentNode, PropNode, lPropNode: TXMLNode;

  procedure SaveComponent(Component: TComponent);
  var
    PropInfo: PPropInfo;
    TypeInf, AETypeInfo, PropTypeInf, cTypeInf: PTypeInfo;
    TypeData, cTypeData: PTypeData;
    i, j, l: integer;
    AName, PropName, sPropValue: string;
    PropList, cPropList: PPropList;
    NumProps, cNumProps: Word;
    PropObject: TObject;
  begin
    if not(Component is TControl) then
      exit;
    if Trim(Component.Name) = '' then
      exit;

    ParentNode := ADoc.Root.NodeNew(Component.Name);
    PropNode := ParentNode.NodeNew('Parent');
    PropNode.ValueAsString := TControl(Component).Parent.Name;

    TypeInf := Component.ClassInfo;

    AName := TypeInf^.Name;
    TypeData := GetTypeData(TypeInf);
    NumProps := TypeData^.PropCount;

    GetMem(PropList, NumProps * sizeof(pointer));
    try
      GetPropInfos(TypeInf, PropList);
      for i := 0 to NumProps - 1 do
      begin
        PropName := PropList^[i]^.name;
        PropTypeInf := PropList^[i]^.PropType^;
        PropInfo := PropList^[i];
        if PropTypeInf^.Kind = tkClass then
          if PropName = 'Font' then
          begin
            PropNode := ParentNode.NodeNew(PropName);
            PropObject := GetObjectProp(Component, PropInfo);
            if Assigned(PropObject) then
            begin
              cTypeInf := PropObject.ClassInfo;
              cTypeData := GetTypeData(cTypeInf);
              cNumProps := cTypeData^.PropCount;
              GetMem(cPropList, cNumProps * sizeof(pointer));
              try
                GetPropInfos(cTypeInf, cPropList);
                for l := 0 to cNumProps - 1 do
                begin
                  PropName := cPropList^[l]^.name;
                  if (PropName = 'Color') or (PropName = 'Name') or (PropName = 'Size') or (PropName = 'Style') then
                  begin
                    lPropNode := PropNode.NodeNew(PropName);
                    if PropName = 'Color' then
                      lPropNode.ValueAsString := ColorToHex(GetPropValue(PropObject, PropName, true))
                    else
                      lPropNode.ValueAsString := GetPropValue(PropObject, PropName, true);
                  end;
                end;
              finally
                FreeMem(cPropList);
              end;
            end;
          end;

        case PropTypeInf^.Kind of
          tkInteger, tkChar, tkEnumeration, tkFloat, tkString, tkSet, tkWChar, tkLString, tkWString, tkVariant:
            begin
              sPropValue := GetPropValue(Component, PropName, true);
              if sPropValue = '' then
                continue;
              if (PropName = 'Top') or (PropName = 'Left') or (PropName = 'Width') or (PropName = 'Height') or (PropName = 'Tag') or (PropName = 'Caption') or (PropName = 'Visible') or (PropName = 'LabelPosition') or (PropName = 'Font') or
                (PropName = 'Align') or (PropName = 'DataField') then
              begin
                PropNode := ParentNode.NodeNew(PropName);
                PropNode.ValueAsString := sPropValue;
              end;
            end;
        end;
      end;
    finally
      FreeMem(PropList);
    end;
  end;

  procedure FindComponent(aComponent: TComponent);
  var
    i: integer;
  begin
    for i := 0 to aComponent.ComponentCount - 1 do
      SaveComponent(aComponent.Components[i])
  end;

begin
  try
    ADoc := TNativeXml.CreateName(Form.Name);
    ADoc.XmlFormat := xfReadable;
    FindComponent(Form);
    ADoc.SaveToFile(FileName);
  finally
    ADoc.Free;
  end;
end;

procedure TWindowPluginForm.LoadForm(Form: TComponent; FileName: string);
var
  ADoc: TNativeXml;
  i: integer;

  function GetControlByName(aControl: TWinControl; Name: string): TWinControl;
  var
    l: integer;
  begin
    Result := nil;
    if aControl.Name = Name then
    begin
      Result := aControl;
      exit;
    end;
    for l := 0 to aControl.ControlCount - 1 do
    begin
      if aControl.Controls[l].Name = Name then
        if aControl.Controls[l] is TWinControl then
        begin
          Result := TWinControl(aControl.Controls[l]);
          exit;
        end
        else
          raise Exception.Create(aControl.Controls[l].Name + ' is not TWinControl');
      if aControl.Controls[l] is TWinControl then
        if TWinControl(aControl.Controls[l]).ControlCount > 0 then
        begin
          Result := GetControlByName(TWinControl(aControl.Controls[l]), Name);
          if Assigned(Result) then
            exit;
        end;
    end;
  end;

  procedure InternalSetProperty(AComp: TComponent; APropName: string; AValue: Variant);
  var
    PropInfo: PPropInfo;
    Parent: TWinControl;
  begin
    if (APropName = 'Parent') and (AComp is TControl) then
    begin
      Parent := GetControlByName(TWinControl(Form), AValue);
      if Parent <> nil then
        TControl(AComp).Parent := Parent
      else
        raise Exception.Create('Can''t find parent for ' + AComp.Name);
    end;

    PropInfo := GetPropInfo(AComp.ClassInfo, APropName);
    if PropInfo <> nil then
    begin
      if PropInfo^.PropType^.Kind = tkInteger then
      begin
        if APropName = 'Color' then
          AValue := HexToColor(AValue);
        SetOrdProp(AComp, PropInfo, AValue);
      end;

      if (PropInfo^.PropType^.Kind = tkString) or (PropInfo^.PropType^.Kind = tkWString) then
        SetStrProp(AComp, PropInfo, AValue);

      if PropInfo^.PropType^.Kind = tkEnumeration then
      begin
        if (AValue = 'True') or (AValue = 'False') then
          SetOrdProp(AComp, PropInfo, integer(StrToBool(AValue)))
        else
          SetPropValue(AComp, APropName, AValue);
      end;
    end;
  end;

  function GetByNameComponent(AOwner: TComponent; Name: string): TComponent;
  var
    j: integer;
  begin
    Result := nil;
    for j := 0 to AOwner.ComponentCount - 1 do
    begin
      if AOwner.Components[j].Name = Name then
      begin
        Result := AOwner.Components[j];
        exit;
      end;
    end;
  end;

  function CreateComponent(Name, ClassName: string): TComponent;
  begin
    if ClassName = 'TLabeledDBEdit' then
    begin
      Result := TLabeledDBEdit.Create(Self);
      Result.Name := Name;
      TLabeledDBEdit(Result).DataSource := FDataSource;
      TLabeledDBEdit(Result).EditLabel.Caption := Name;
    end;
  end;

  procedure LoadComponent(Node: TXMLNode);
  var
    k, l: integer;
    Comp: TComponent;
    PropInfo: PPropInfo;
    cObject: TObject;
  begin
    Comp := GetByNameComponent(Form, Node.Name);
    if Comp <> nil then
    begin

      // Node.Nodes[k].NodeCount
      for k := 0 to Node.NodeCount - 1 do
        if Node.Nodes[k].NodeCount > 0 then
        begin
          PropInfo := GetPropInfo(Comp, Node.Nodes[k].Name);
          cObject := GetObjectProp(Comp, PropInfo);
          for l := 0 to Node.Nodes[k].NodeCount - 1 do
          begin
            if (Comp is TLabeledDBEdit) then
              InternalSetProperty(TComponent(TLabeledDBEdit(Comp).EditLabel.Font), Node.Nodes[k].Nodes[l].Name, Node.Nodes[k].Nodes[l].ValueAsString);
            if (Comp is TLabeledDBComboBox) then
              InternalSetProperty(TComponent(TLabeledDBComboBox(Comp).EditLabel.Font), Node.Nodes[k].Nodes[l].Name, Node.Nodes[k].Nodes[l].ValueAsString);
            if (Comp is TLabeledDBMemo) then
              InternalSetProperty(TComponent(TLabeledDBMemo(Comp).EditLabel.Font), Node.Nodes[k].Nodes[l].Name, Node.Nodes[k].Nodes[l].ValueAsString);
            if (Node.Name = 'ldeCall') and (TComponent(cObject).ClassName = 'TFont') and (Node.Nodes[k].Nodes[l].Name = 'Size') then
              InternalSetProperty(TComponent(cObject), Node.Nodes[k].Nodes[l].Name, IntToStr(StrToInt(Node.Nodes[k].Nodes[l].ValueAsString) + 2))
            else
              InternalSetProperty(TComponent(cObject), Node.Nodes[k].Nodes[l].Name, Node.Nodes[k].Nodes[l].ValueAsString)
          end;
        end
        else
          InternalSetProperty(Comp, Node.Nodes[k].Name, Node.Nodes[k].ValueAsString)
    end
    else
    begin
      for k := 0 to Node.NodeCount - 1 do
      begin
        if k = 0 then
        begin
          if Node.Nodes[k].Name = 'ClassName' then
            Comp := CreateComponent(Node.Name, Node.Nodes[k].ValueAsString)
          else
          begin
            MessageBox(0, PWideChar(Utf8ToAnsi(Node.Name) + ' - ClassName property not found.'), PWideChar('Error'), MB_OK or MB_ICONERROR or MB_SYSTEMMODAL);
            exit;
          end;
        end
        else
          InternalSetProperty(Comp, Node.Nodes[k].Name, Node.Nodes[k].ValueAsString)
      end;
    end;
    if Comp.Name = 'dbeQSLVia' then
      TLabeledDBEdit(Comp).EditLabel.Visible := false;

    if Comp is TPageControl then
      TPageControl(Comp).ActivePageIndex := 0;

    { if Comp is TPageControl then
      if not bIMSLoaded then
      TPageControl(Comp).ActivePageIndex:=0
      else
      begin
      TPageControl(Comp).ActivePage.Update;
      TPageControl(Comp).ActivePage.Refresh;

      TPageControl(Comp).ActivePage.Repaint;
      end; }

  end;

begin

  ADoc := TNativeXml.Create;
  try
    try
      ADoc.LoadFromFile(FileName);
      for i := 0 to ADoc.Root.NodeCount - 1 do
        LoadComponent(ADoc.Root.Nodes[i]);
    except
      on E: Exception do
        MessageBox(0, PWideChar(FIMSName + ' - ' + E.Message), PWideChar('Error'), MB_OK or MB_ICONERROR or MB_SYSTEMMODAL);
    end;
    bIMSLoaded := true;
  finally
    ADoc.Free;
  end;

end;

procedure TWindowPluginForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i:integer;
begin
  if (ssCtrl in Shift) and (ssAlt in Shift) and (Key = 83) then
    Save;
  if (ssCtrl in Shift) and (ssAlt in Shift) and (Key = 76) then
    Load(FIMSName);

  if (ssCtrl in Shift) and (ssAlt in Shift) and (Key = 68) then
  begin
   if FDesignMode then
     FPluginFormDesigner.Free
   else
    begin
     FPluginFormDesigner:=TPluginFormDesigner.Create(nil);
     FPluginFormDesigner.Show;
    end;

  for i:=0 to Self.ComponentCount-1  do
   begin
   if Self.Components[i] is TControl then
   begin
     ThControl(Self.Components[i]).OnMouseDown := ControlMouseDown;
     ThControl(Self.Components[i]).OnMouseMove := ControlMouseMove;
     ThControl(Self.Components[i]).OnMouseUp := ControlMouseUp;
   end;
   end;

    FDesignMode:=not FDesignMode;
    SetNodesVisible(FDesignMode);
  end;
  { for Node := 0 to 7 do
    TWinControl(FNodes.Items[Node]).Visible := not TWinControl(FNodes.Items[Node]).Visible;
  }
end;

procedure TWindowPluginForm.FormShow(Sender: TObject);
begin
  { KeyPreview := true;
    Load(FIMSName); }
end;

procedure TWindowPluginForm.Load(IMSName: string);
var
  FileName: string;
begin
  FileName := GetFileName + '.xml';
  if FileExists(FileName) then
    LoadForm(Self, FileName)
end;

procedure TWindowPluginForm.Save;
var
  DllName, FileName: string;
begin
  DllName := GetDllFileName;
  FileName := Copy(DllName, 1, Length(DllName) - 4) + '.dist';
  SaveForm(Self, FileName)
end;

procedure TWindowPluginForm.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
  Load(FIMSName);
end;

procedure TWindowPluginForm.LoadIMS;
begin
  Load(FIMSName);
end;

constructor TWindowPluginForm.Create(AOwner: TComponent; DataSource: TDataSource; IMSName: string);
var
  i:integer;
  s:TWinControl;
begin
  FIMSName := IMSName;
  inherited Create(AOwner);
  FDataSource := DataSource;
  FNodes := TObjectList.Create(false);
  CreateNodes;

end;

destructor TWindowPluginForm.Destroy;
begin
  FNodes.Free;
  inherited;
end;

procedure TWindowPluginForm.CreateNodes;
var
  Node: integer;
  Panel: TPanel;
begin
  for Node := 0 to 7 do
  begin
    Panel := TPanel.Create(Self);
    FNodes.Add(Panel);
    with Panel do
    begin
//      BevelOuter := bvNone;
      Name := 'Node' + IntToStr(Node);
      Width := 5;
      Height := 5;
      Parent := Self;
      Visible := False;

      case Node of
        0, 4:
          Cursor := crSizeNWSE;
        1, 5:
          Cursor := crSizeNS;
        2, 6:
          Cursor := crSizeNESW;
        3, 7:
          Cursor := crSizeWE;
      end;
      OnMouseDown := NodeMouseDown;
      OnMouseMove := NodeMouseMove;
      OnMouseUp := NodeMouseUp;
    end;
  end;
end; (* CreateNodes *)

procedure TWindowPluginForm.NodeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (FDesignMode) AND (Sender is TWinControl) then
  begin
    FNodePositioning:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
  end;
end; (*NodeMouseDown*)

procedure TWindowPluginForm.NodeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
  OldRect: TRect;
  AdjL,AdjR,AdjT,AdjB: Boolean;
begin
  if FNodePositioning then
  begin
    begin
      with TWinControl(Sender) do
      begin
      GetCursorPos(newPos);
      with FCurrentNodeControl do
      begin //resize
        frmPoint := FCurrentNodeControl.Parent.ScreenToClient(Mouse.CursorPos);
        OldRect := FCurrentNodeControl.BoundsRect;
        AdjL := False;
        AdjR := False;
        AdjT := False;
        AdjB := False;
        case FNodes.IndexOf(TWinControl(Sender)) of
          0: begin
               AdjL := True;
               AdjT := True;
             end;
          1: begin
               AdjT := True;
             end;
          2: begin
               AdjR := True;
               AdjT := True;
             end;
          3: begin
               AdjR := True;
             end;
          4: begin
               AdjR := True;
               AdjB := True;
             end;
          5: begin
               AdjB := True;
             end;
          6: begin
               AdjL := True;
               AdjB := True;
             end;
          7: begin
               AdjL := True;
             end;
        end;

        if AdjL then
          OldRect.Left := frmPoint.X;
        if AdjR then
          OldRect.Right := frmPoint.X;
        if AdjT then
          OldRect.Top := frmPoint.Y;
        if AdjB then
          OldRect.Bottom := frmPoint.Y;
        SetBounds(OldRect.Left,OldRect.Top,OldRect.Right - OldRect.Left,OldRect.Bottom - OldRect.Top);
      end;
      Left := Left - oldPos.X + newPos.X;
      Top := Top - oldPos.Y + newPos.Y;
      oldPos := newPos;
      end;
    end;
    PositionNodes(FCurrentNodeControl);
  end;
end; (*NodeMouseMove*)

procedure TWindowPluginForm.NodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FNodePositioning then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    FNodePositioning := False;
  end;
end; (*NodeMouseUp*)

procedure TWindowPluginForm.PositionNodes(AroundControl: TWinControl);
var
  Node,T,L,CT,CL,FR,FB,FT,FL: Integer;
  TopLeft: TPoint;
begin
  FCurrentNodeControl := nil;
  for Node := 0 to 7 do
  begin
    with AroundControl do
    begin
      CL := (Width div 2) + Left -2;
      CT := (Height div 2) + Top -2;
      FR := Left + Width - 2;
      FB := Top + Height - 2;
      FT := Top - 2;
      FL := Left - 2;
      case Node of
        0: begin
             T := FT;
             L := FL;
           end;
        1: begin
             T := FT;
             L := CL;
           end;
        2: begin
             T := FT;
             L := FR;
           end;
        3: begin
             T := CT;
             L := FR;
           end;
        4: begin
             T := FB;
             L := FR;
           end;
        5: begin
             T := FB;
             L := CL;
           end;
        6: begin
             T := FB;
             L := FL;
           end;
        7: begin
             T := CT;
             L := FL;
           end;
        else
          T := 0;
          L := 0;
      end;
      TopLeft := Parent.ClientToScreen(Point(L,T));
    end;
    with TPanel(FNodes[Node]) do
    begin
      TopLeft := Parent.ScreenToClient(TopLeft);
      Top := TopLeft.Y;
      Left := TopLeft.X;
      ParentColor:=False;
      Parent:=AroundControl.Parent;
      Color:=clBlack;
      Ctl3D:=False;
//      BevelKind:=bkFlat;
    end;
  end;
  FCurrentNodeControl := AroundControl;
  FPluginFormDesigner.Inspector.Clear;
  FPluginFormDesigner.Inspector.AddComponent(FCurrentNodeControl);
  SetNodesVisible(True);
end; (*PositionNodes*)

procedure TWindowPluginForm.SetNodesVisible(Visible: Boolean);
var
  Node: Integer;
begin
  for Node := 0 to 7 do
  begin
    TWinControl(FNodes.Items[Node]).Visible := Visible;
    //TPanel(FNodes.Items[Node]).Color:=clBlack;
  end;
end; (*SetNodesVisible*)


procedure TWindowPluginForm.ControlMouseDown(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState;
  X, Y: Integer);
begin
  if (FDesignMode) AND (Sender is TWinControl) then
  begin
    inReposition:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
    PositionNodes(TWinControl(Sender));
  end;
end; (*ControlMouseDown*)

procedure TWindowPluginForm.ControlMouseMove(
  Sender: TObject;
  Shift: TShiftState;
  X, Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
begin
  if inReposition then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(newPos);
      Screen.Cursor := crSize;
      Left := Left - oldPos.X + newPos.X;
      Top := Top - oldPos.Y + newPos.Y;
      oldPos := newPos;
    end;
    PositionNodes(TWinControl(Sender));
  end;
end; (*ControlMouseMove*)

procedure TWindowPluginForm.ControlMouseUp(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if inReposition then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    inReposition := False;
  end;
end; (*ControlMouseUp*)




end.
