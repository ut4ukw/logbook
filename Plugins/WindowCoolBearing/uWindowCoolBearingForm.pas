unit uWindowCoolBearingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   uWindowPluginForm, LPControl,  SLControlCollection, LPControlDrawLayers, LPTransparentControl,
  ULBasicControl, ILSegmentIndicator, ILSegmentGauge, ExtCtrls,
  ILAnalogInstrument, ILAngularGauge, ILSegmentText;

type
  TWindowCoolBearingForm = class(TWindowPluginForm)
    pnlBearing: TPanel;
    agBearing: TILAngularGauge;
    sgBearing: TILSegmentText;
    Splitter1: TSplitter;
    procedure pnlBearingResize(Sender: TObject);
  private
  public
   procedure CallInfo;
   procedure NewQSO;
  end;

var
  WindowCoolBearingForm: TWindowCoolBearingForm;

implementation

uses uWindowCoolBearing;
{$R *.dfm}

procedure TWindowCoolBearingForm.CallInfo;
begin
 agBearing.Value:=Round(ldsLogEdit.DataSet.FieldByName('LOG_ANT_AZ').AsFloat);
 sgBearing.Text:=IntToStr(Round(ldsLogEdit.DataSet.FieldByName('LOG_ANT_AZ').AsFloat));
end;

procedure TWindowCoolBearingForm.NewQSO;
begin
 agBearing.Value:=0;
 sgBearing.Text:='';
end;


procedure TWindowCoolBearingForm.pnlBearingResize(Sender: TObject);
begin
 sgBearing.Left:=Round((pnlBearing.Width-sgBearing.Width)/2);
 sgBearing.Height:=pnlBearing.Height;

end;

end.
