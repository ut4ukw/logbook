unit uEditCallBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, Mask,
  JvExMask, JvToolEdit;

type
  TEditCallBook = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leCallBookName: TLabeledEdit;
    lbCallBookFileName: TLabel;
    lbCallBookType: TLabel;
    cbTypeCallBook: TComboBox;
    feCallBook: TJvFilenameEdit;
    procedure leCallBookNameChange(Sender: TObject);
    procedure cbTypeCallBookClick(Sender: TObject);
    procedure feCallBookChange(Sender: TObject);
  private
  public
    procedure CheckEnabled;
  end;

var
  EditCallBook: TEditCallBook;

implementation

{$R *.dfm}

procedure TEditCallBook.leCallBookNameChange(Sender: TObject);
begin
 CheckEnabled;
end;

procedure TEditCallBook.cbTypeCallBookClick(Sender: TObject);
begin
 CheckEnabled;
end;

procedure TEditCallBook.CheckEnabled;
begin
 btnOk.Enabled:=(Length(Trim(leCallBookName.Text))>0) and (cbTypeCallBook.ItemIndex<>-1) and (Trim(feCallBook.FileName)<>'');
end;



procedure TEditCallBook.feCallBookChange(Sender: TObject);
begin
 CheckEnabled;
end;

end.
