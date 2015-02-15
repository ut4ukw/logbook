unit uCatOmniRigForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm;

type
  TCatOmniRigForm = class(TWindowPluginForm)
  private
  public
  end;

var
  CatOmniRigForm: TCatOmniRigForm;

implementation

uses uCatOmniRig;
{$R *.dfm}


end.
