unit uCancelDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, ExtCtrls, acPNG;

type
  TCancelDialog = class(TForm)
    ActionList1: TActionList;
    aCancel: TAction;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Image1: TImage;
    lbMessage: TLabel;
    procedure aCancelExecute(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
  public
    bResult:boolean;
  end;

var
  CancelDialog: TCancelDialog;

implementation

{$R *.dfm}

procedure TCancelDialog.aCancelExecute(Sender: TObject);
begin
 bResult:=True;
 Close;
end;

procedure TCancelDialog.btnOkClick(Sender: TObject);
begin
 bResult:=True;
 Close;
end;

end.
