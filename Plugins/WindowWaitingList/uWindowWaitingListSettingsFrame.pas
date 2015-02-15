unit uWindowWaitingListSettingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvComponentBase, JvFormPlacement, StdCtrls, ACS_Classes, ACS_DXAudio,
  ExtCtrls, Spin, Mask, JvExMask, JvToolEdit,uUtils ;

type
  TWindowWaitingListSettingsFrame = class(TFrame)
    FormStorage: TJvFormStorage;
    WindowWaitingList_cbSetNextCall: TCheckBox;
    WindowWaitingList_leSetCallMacros: TLabeledEdit;
  private
  public
  end;

implementation

uses uWindowWaitingListForm;


{$R *.dfm}



end.
