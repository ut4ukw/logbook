library WindowJT65HF;


uses
  ShareMem,
  uWindowJT65HF in 'uWindowJT65HF.pas',
  uWindowJT65HFForm in 'uWindowJT65HFForm.pas' {WindowJT65HFForm},
  uWindowJT65HFSettingsFrame in 'uWindowJT65HFSettingsFrame.pas' {WindowJT65HFSettingsFrame: TFrame};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
