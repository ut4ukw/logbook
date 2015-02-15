unit uEditProfileName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter;

type
  TEditProfileName = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leProfileName: TLabeledEdit;
    procedure leProfileNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditProfileName: TEditProfileName;

implementation

{$R *.dfm}

procedure TEditProfileName.leProfileNameChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leProfilename.Text))>0;
end;

end.
