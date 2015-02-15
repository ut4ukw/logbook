unit uWindowQSODataSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ExtCtrls;

type
  TWindowQSODataSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowQSOData_cbSaveRecordOnEnter: TCheckBox;
    WindowQSOData_leAutoChangeKeyLayout: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
