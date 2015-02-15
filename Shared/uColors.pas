unit uColors;

interface
uses
 Contnrs,Graphics;


type
  TGridColor=class(TObject)
  public
     ColorBackground:integer;
     ColorForeground:integer;
     FontStyle:TFontStyles;
  end;

  TGridColorList=class(TObjectList)
  private
    function GetItem(Index: Integer): TGridColor;
  public
    function Add(AObject: TGridColor): Integer;
    property Items[Index: Integer]: TGridColor read GetItem; default;
  end;



implementation


function TGridColorList.Add(AObject: TGridColor): Integer;
begin
  Result := inherited Add(AObject);
end;

function TGridColorList.GetItem(Index: Integer): TGridColor;
begin
  Result := TGridColor(inherited GetItem(Index));
end;


end.
