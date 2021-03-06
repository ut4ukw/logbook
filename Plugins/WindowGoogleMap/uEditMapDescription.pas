unit uEditMapDescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, ComCtrls;

type
  TEditMapDescription = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leMapDescription: TLabeledEdit;
    dtpDate: TDateTimePicker;
    cbCopyToClipboard: TCheckBox;
    lbDate: TLabel;
    procedure leMapDescriptionChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditMapDescription: TEditMapDescription;

implementation

{$R *.dfm}

procedure TEditMapDescription.FormShow(Sender: TObject);
begin
dtpDate.Date:=Date;
end;

procedure TEditMapDescription.leMapDescriptionChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leMapDescription.Text))>0;
end;

end.
