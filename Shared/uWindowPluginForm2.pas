unit uWindowPluginForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,NativeXml, TypInfo, uUtils, StdCtrls, Mask, DBCtrls, My_Data_Controls,
  ExtCtrls;

type
  TWindowPluginForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    function GetFileName:string;
    procedure SaveForm(Form:TWinControl;FileName:string);
    procedure LoadForm(Form:TComponent;FileName:string);
    procedure Load;
    procedure Save;
  public
  end;

var
  WindowPluginForm: TWindowPluginForm;

implementation

{$R *.dfm}

procedure TWindowPluginForm.FormCreate(Sender: TObject);
begin
 Load;
end;

function TWindowPluginForm.GetFileName:string;
var
 DllName:string;
begin
 DllName:=GetDllFileName;
 Result:=Copy(DllName,1,Length(DllName)-4)+'.xml';
end;


procedure TWindowPluginForm.SaveForm(Form:TWinControl;FileName:string);
var
 ADoc:TNativeXml;
 ParentNode,PropNode:TXMLNode;


procedure SaveComponent(Component:TComponent);
var
  PropInfo: PPropInfo;
  TypeInf, PropTypeInf: PTypeInfo;
  TypeData: PTypeData;
  i, j: integer;
  AName, PropName, sPropValue: string;
  PropList: PPropList;
  NumProps: word;
  PropObject: TObject;
begin
 ParentNode:=ADoc.Root.NodeNew(Component.Name);
 TypeInf := Component.ClassInfo;

 AName := TypeInf^.Name;
 TypeData := GetTypeData(TypeInf);
 NumProps := TypeData^.PropCount;

 GetMem(PropList, NumProps * sizeof(pointer));
  try
    { Получаем список строк }
    GetPropInfos(TypeInf, PropList);

    for i := 0 to NumProps - 1 do
    begin
      PropName := PropList^[i]^.name;
      PropTypeInf := PropList^[i]^.PropType^;
      PropInfo := PropList^[i];
 case PropTypeInf^.Kind of
          tkInteger, tkChar, tkEnumeration, tkFloat, tkString, tkSet,
          tkWChar, tkLString, tkWString, tkVariant:
          begin
            { Получение значения свойства }
            sPropValue := GetPropValue(Component, PropName, true);

            if sPropValue = '' then
              continue;

            if (PropName='Top') or
               (PropName='Left') or
               (PropName='Width') or
               (PropName='Height') or
               (PropName='Tag') or
               (PropName='Caption') or
               (PropName='Visible') or
               (PropName='DataField')
             then
              begin

            PropNode:=ParentNode.NodeNew(PropName);
            PropNode.ValueAsString:=sPropValue;
              end;
{            if  (PropTypeInf^.Kind in ORDINAL_TYPES)
            and (sPropValue = IntToStr(PropInfo.default)) then
              continue;}

            { Замена спецсимволов }
{            if FReplaceReservedSymbols then
            begin
              sPropValue := StringReplace(sPropValue, '<', '%lt;', [rfReplaceAll]);
              sPropValue := StringReplace(sPropValue, '>', '%gt;', [rfReplaceAll]);
              sPropValue := StringReplace(sPropValue, '&', '%', [rfReplaceAll]);
            end;}

          end;
      end;
    end;
  finally

  end;
 ParentNode.ValueAsString:='a';
end;

procedure FindComponent(aControl : TWinControl);
var
 i:integer;
 z:TWinControl;
 begin
  for i := 0 to aControl.ControlCount-1 do
   begin
   if (aControl.Controls[i] is TWinControl) then
    if TWinControl(aControl.Controls[i]).ControlCount>0 then
         FindComponent(TWinControl(aControl.Controls[i]))
       else
        SaveComponent(aControl.Controls[i])
    else
        SaveComponent(aControl.Controls[i])
   end;
 end;


begin
 try
   ADoc := TNativeXml.CreateName(Form.Name);
   ADoc.XmlFormat:=xfReadable;
   FindComponent(Form);
   ADoc.SaveToFile(FileName);
 finally
  ADoc.Free;

 end;
end;


procedure TWindowPluginForm.LoadForm(Form:TComponent;FileName:string);
var
 ADoc:TNativeXml;
 i:integer;


procedure InternalSetProperty(AComp: TComponent; APropName: string;
  AValue: String);
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(AComp.ClassInfo, APropName);
  if PropInfo <> nil then
  begin
    if PropInfo^.PropType^.Kind = tkInteger then
      SetOrdProp(AComp, PropInfo, StrToInt(AValue));
    if PropInfo^.PropType^.Kind = tkString then
      SetStrProp(AComp, PropInfo, AValue);
    if PropInfo^.PropType^.Kind = tkEnumeration then
      SetOrdProp(AComp, PropInfo, Integer(StrToBool(AValue)));
   end;
end;

 function GetByNameComponent(aOwner:TComponent;Name:string):TComponent;
 var
  j:integer;
 begin
  result:=nil;
   for j:=0 to aOwner.ComponentCount-1 do
   begin
    if aOwner.Components[j].Name=Name then
     begin
       result:=aOwner.Components[j];
       exit;
     end;
{    if aOwner.Components[j].ComponentCount>0 then
      GetByNameComponent(aOwner,Name);}
   end;
 end;

function CreateComponent(Name,ClassName:string):TComponent;
begin
 if ClassName='TLabeledDBEdit' then
 begin
   result:=TLabeledDBEdit.Create(Self);
   result.Name:=Name;
   TLabeledDBEdit(result).Parent:=Self;
   TLabeledDBEdit(result).EditLabel.Caption:='aaa';

 end;
end;


 procedure LoadComponent(Node:TXMLNode);
 var
 k:integer;
 Comp:TComponent;
 begin
  Comp:=GetByNameComponent(Form,Node.Name);
  if Comp<>nil then
   begin
    for k:=0 to Node.NodeCount-1 do
      InternalSetProperty(Comp,Node.Nodes[k].Name,Node.Nodes[k].ValueAsString)
   end
   else
   begin
    for k:=0 to Node.NodeCount-1 do
    begin
     if k=0 then
     begin
      if Node.Nodes[k].Name='ClassName' then
       Comp:=CreateComponent(Node.Name,Node.Nodes[k].ValueAsString)
      else
        raise Exception.Create(Node.Name+' ClassName property not found');
     end
     else
      InternalSetProperty(Comp,Node.Nodes[k].Name,Node.Nodes[k].ValueAsString)
    end;
   end;
 end;

begin
 ADoc:=TNativeXml.Create;
 try
  ADoc.LoadFromFile(FileName);
  for i:=0 to ADoc.Root.NodeCount-1 do
   LoadComponent(ADoc.Root.Nodes[i]);
 finally
  ADoc.Free;
 end;

end;

procedure TWindowPluginForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (Button=mbRight) and (ssAlt in Shift) then
  Save;
end;

procedure TWindowPluginForm.Load;
var
 FileName:string;
begin
 FileName:=GetFileName;
 if FileExists(FileName) then
   LoadForm(Self,FileName);
end;

procedure TWindowPluginForm.Save;
var
 FileName:string;
begin
 FileName:=GetFileName+'.dist';
 SaveForm(Self,FileName)
end;



end.
