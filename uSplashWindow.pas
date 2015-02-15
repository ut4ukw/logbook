unit uSplashWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TSplashWindow = class(TForm)
    Image1: TImage;
    pnlStatus: TPanel;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashWindow: TSplashWindow;

implementation

{$R *.dfm}

end.
