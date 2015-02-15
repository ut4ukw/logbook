unit uEditFilterName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter;

type
  TEditFilterName = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leFilterName: TLabeledEdit;
    procedure leFilterNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditFilterName: TEditFilterName;

implementation

{$R *.dfm}

procedure TEditFilterName.leFilterNameChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leFiltername.Text))>0;
end;

end.
