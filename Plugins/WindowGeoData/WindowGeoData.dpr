library WindowGeoData;

uses
  ShareMem,
  ExceptionLog,
  SysUtils,
  Classes,
  uWindowGeoData in 'uWindowGeoData.pas',
  uWindowGeoDataForm in 'uWindowGeoDataForm.pas' {WindowGeoDataForm};

{$R *.res}

exports
Initialize,
DeInitialize,
CoreCommand;

end.
