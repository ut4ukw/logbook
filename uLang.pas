unit uTranslator;

interface
uses Classes, Forms, IniFiles, ActnList;

type
    TTranslator=class(TPersistent)
    private
      FFileName:string;
      FSection:TStringList;
      procedure FindComponent(aOwner : TComponent);
      procedure TranslateComponent(aComponent : TComponent);
      function GetValue(aName:string) : string;
    public
      constructor Create(aFileName:string);
      destructor Destroy; override;
      procedure TranslateWindow(Section:string;Window:TForm);
    end;

implementation

constructor TTranslator.Create(aFileName:string);
begin
 inherited Create;
 FFileName:=aFileName;
 FSection:=TStringList.Create;
end;

destructor TTranslator.Destroy;
begin
 FSection.Free;
 inherited;
end;

function TTranslator.GetValue(aName:string) : string;
begin
 result:=FSection.Values[aName];
 if result='' then
  result:='ERROR get value from '+aName;
end;

procedure TTranslator.TranslateComponent(aComponent : TComponent);
begin
 if aComponent is TAction then
  with aComponent as TAction do
   Caption:=GetValue(aComponent.Name);
end;


procedure TTranslator.FindComponent(aOwner : TComponent);
var
 i:integer;
begin
 for i := 0 to aOwner.ComponentCount-1 do
  begin
   if aOwner.Components[i].ComponentCount>0 then
     FindComponent(aOwner.Components[i]);
  end;
end;


procedure TTranslator.TranslateWindow(Section:string;Window:TForm);
var
 IniFile:TIniFile;
begin
  IniFile:=TIniFile.Create(FFileName);
  try
   FSection.Clear;
   IniFile.ReadSection(Section,FSection);
  finally
   IniFile.Free;
  end;

end;

end.
