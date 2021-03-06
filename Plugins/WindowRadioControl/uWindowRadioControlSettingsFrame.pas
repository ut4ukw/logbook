unit uWindowRadioControlSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls,   ExtCtrls, Spin,
  JvExStdCtrls, JvCombobox, JvColorCombo;

type
  TWindowRadioControlSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowRadioControl_gbFreqDisplay: TGroupBox;
    WindowRadioControl_spFreqDisplayDigits: TSpinEdit;
    WindowRadioControl_lbFreqDisplayDigits: TLabel;
    WindowRadioControl_cbFreqDisplayColor: TJvColorComboBox;
    WindowRadioControl_lbFreqDisplayColor: TLabel;
    WindowRadioControl_gbControl: TGroupBox;
    WindowRadioControl_lbTuneCoarse: TLabel;
    seTuneCoarse: TSpinEdit;
    WindowRadioControl_lbTuneFine: TLabel;
    seTuneFine: TSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
