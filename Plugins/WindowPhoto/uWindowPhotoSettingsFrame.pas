unit uWindowPhotoSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls,   ExtCtrls, Spin,
  JvExStdCtrls, JvCombobox, JvColorCombo, Mask, JvExMask, JvToolEdit;

type
  TWindowPhotoSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowPhoto_cbSaveCache: TCheckBox;
    deDirectory: TJvDirectoryEdit;
    WindowPhoto_lbDirectory: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
