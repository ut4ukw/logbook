library WindowQSLInfo;


uses
  ShareMem,
  SysUtils,
  Classes,
  uWindowQSLInfo in 'uWindowQSLInfo.pas',
  uWindowQSLInfoForm in 'uWindowQSLInfoForm.pas' {WindowQSLInfoForm};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
