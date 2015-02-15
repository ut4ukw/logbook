unit uEditCWEngineMacros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, Mask,
  JvExMask, JvToolEdit, ComCtrls, JvExComCtrls, JvHotKey, DBCtrls,
  LabeledControls, JvExStdCtrls, JvCombobox, JvColorCombo;

type
  TEditCWEngineMacros = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leCWEngineMacrosCaption: TLabeledEdit;
    lbCWEngineShortCut: TLabel;
    edCWEngineMacrosShortCut: TJvHotKey;
    lbCWEngineMacros: TLabel;
    meCWEngineMacrosText: TMemo;
    lbModeBackgroundColor: TLabel;
    cbBtnColor: TJvColorComboBox;
    procedure leCWEngineMacrosCaptionChange(Sender: TObject);
    procedure cbTypeCWEngineMacrosClick(Sender: TObject);
    procedure feCWEngineMacrosChange(Sender: TObject);
    procedure meCWEngineMacrosTextChange(Sender: TObject);
  private
  public
    procedure CheckEnabled;
  end;

var
  EditCWEngineMacros: TEditCWEngineMacros;

implementation

{$R *.dfm}

procedure TEditCWEngineMacros.leCWEngineMacrosCaptionChange(Sender: TObject);
begin
 CheckEnabled;
end;

procedure TEditCWEngineMacros.meCWEngineMacrosTextChange(Sender: TObject);
begin
 CheckEnabled;
end;

procedure TEditCWEngineMacros.cbTypeCWEngineMacrosClick(Sender: TObject);
begin
 CheckEnabled;
end;

procedure TEditCWEngineMacros.CheckEnabled;
begin
 btnOk.Enabled:=(Length(Trim(leCWEngineMacrosCaption.Text))>0) and (Length(Trim(meCWEngineMacrosText.Lines.Text))>0);
end;



procedure TEditCWEngineMacros.feCWEngineMacrosChange(Sender: TObject);
begin
 CheckEnabled;
end;

end.
