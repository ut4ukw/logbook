unit uEditImportRule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, udmMain;

type
  TEditImportRule = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leImportRule: TLabeledEdit;
    procedure leImportRuleChange(Sender: TObject);
  private
  public
    isEdit:boolean;
  end;

var
  EditImportRule: TEditImportRule;

implementation
uses uOptions, uMainWindow;
{$R *.dfm}

procedure TEditImportRule.leImportRuleChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leImportRule.Text))>0;
end;

end.
