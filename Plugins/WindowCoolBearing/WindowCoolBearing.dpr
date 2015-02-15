library WindowCoolBearing;


uses
  ShareMem,
  uWindowCoolBearing in 'uWindowCoolBearing.pas',
  uWindowCoolBearingForm in 'uWindowCoolBearingForm.pas' {WindowCoolBearingForm};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
