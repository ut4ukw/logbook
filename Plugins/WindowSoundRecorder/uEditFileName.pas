unit uEditFileName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter;

type
  TEditFileName = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leFileName: TLabeledEdit;
    procedure leFileNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditFileName: TEditFileName;

implementation

{$R *.dfm}

procedure TEditFileName.leFileNameChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leFileName.Text))>0;
end;

end.
