library WindowSoundRecorder;


uses
  ShareMem,
  uWindowSoundRecorder in 'uWindowSoundRecorder.pas',
  uWindowSoundRecorderForm in 'uWindowSoundRecorderForm.pas' {WindowSoundRecorderForm},
  uWindowSoundRecorderSettingsFrame in 'uWindowSoundRecorderSettingsFrame.pas' {WindowSoundRecorderSettingsFrame: TFrame},
  uEditFileName in 'uEditFileName.pas' {EditFileName};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
