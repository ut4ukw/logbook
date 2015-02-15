unit uEditShortCut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExComCtrls, JvHotKey, ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvFooter, Menus, pngimage, JvExControls, JvXPCore, JvXPButtons;

type
  TEditShortCut = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    edShortCut: TJvHotKey;
    lbActionCaption: TLabel;
    lbShortCut: TLabel;
    JvXPButton1: TJvXPButton;
    procedure edShortCutKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvXPButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditShortCut: TEditShortCut;

implementation

{$R *.dfm}

procedure TEditShortCut.edShortCutKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=27 then
 edShortCut.HotKey:=TextToShortCut('Esc');

if Key=32 then
 edShortCut.HotKey:=TextToShortCut('Space');

end;

procedure TEditShortCut.JvXPButton1Click(Sender: TObject);
begin
 edShortCut.HotKey:=0;
end;

end.
