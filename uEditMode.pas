unit uEditMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExComCtrls, JvHotKey, ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvFooter, Menus, Mask, DBCtrls, LabeledControls, JvExStdCtrls,
  JvCombobox, JvColorCombo;

type
  TEditMode = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leModeTitle: TLabeledEdit;
    leModeDefaultReport: TLabeledEdit;
    cbColorMode: TJvColorComboBox;
    lbModeBackgroundColor: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditMode: TEditMode;

implementation

uses uOptions;

{$R *.dfm}

end.
