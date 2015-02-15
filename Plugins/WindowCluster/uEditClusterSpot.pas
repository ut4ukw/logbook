unit uEditClusterSpot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, ComCtrls,
  DTPEx, Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
  TEditClusterSpot = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leClusterSpot: TLabeledEdit;
    lbDate: TLabel;
    dtpDateTime: TDateTimePickerEx;
    lbFreq: TLabel;
    ceFreq: TJvCalcEdit;
    leDescription: TLabeledEdit;
    procedure leClusterSpotChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditClusterSpot: TEditClusterSpot;

implementation

{$R *.dfm}

procedure TEditClusterSpot.leClusterSpotChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leClusterSpot.Text))>0;
end;

end.
