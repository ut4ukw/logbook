library WindowRadioControl;


uses
  ShareMem,
  uWindowRadioControl in 'uWindowRadioControl.pas',
  uWindowRadioControlForm in 'uWindowRadioControlForm.pas' {WindowRadioControlForm},
  uWindowRadioControlSettingsFrame in 'uWindowRadioControlSettingsFrame.pas' {WindowRadioControlSettingsFrame: TFrame};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
