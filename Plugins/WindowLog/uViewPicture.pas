unit uViewPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ShellApi,Printers, JvComponentBase,
  JvFormPlacement;

type
  TViewPicture = class(TForm)
    tbMain: TToolBar;
    ToolButton1: TToolButton;
    imgPicture: TImage;
    FormStorage: TJvFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgPictureClick(Sender: TObject);
  private
    FPath:string;
    FFileName:string;
  public
    TypeQSL:integer;
    procedure LoadImage(iType:integer;Path,FileName:string);
  end;

var
  ViewPicture: TViewPicture;

implementation

{$R *.dfm}

procedure TViewPicture.imgPictureClick(Sender: TObject);
begin
//Printer.Title := 'sss';
{  Printer.BeginDoc;
  Printer.Canvas.Draw(0, 0, imgPicture.Picture.Graphic);
  Printer.EndDoc}
  ShellExecute(0, 'open', PChar('Explorer'), PChar(FPath+FFileName), nil, SW_SHOWNORMAL);
end;

procedure TViewPicture.LoadImage(iType:integer;Path,FileName:string);
begin
 TypeQSL:=iType;
 Caption:=FileName;
 FPath:=Path;
 FFileName:=FileName;
 if Trim(FileName)='' then exit;
 if FileExists(Path+FileName) then
  begin
   imgPicture.Picture.LoadFromFile(Path+FileName);
{   self.ClientWidth:=imgPicture.Picture.Width;
   self.ClientHeight:=imgPicture.Picture.Height+tbMain.Height;}
  end
  else
   imgPicture.Picture:=nil;
end;


procedure TViewPicture.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
