program CWEngine;

uses
  Forms,
  uCWEngine in 'uCWEngine.pas' {CWEngineForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCWEngineForm, CWEngineForm);
  Application.Run;
end.
