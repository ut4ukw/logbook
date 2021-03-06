unit uWindowSoundRecorderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, ActnList,
  ImgList, ComCtrls, ToolWin, ACS_Classes, ACS_LAME, ACS_DXAudio, uEditFileName,
  sToolBar, acAlphaImageList;


type
  TWindowSoundRecorderForm = class(TWindowPluginForm)
    ToolBar1: TToolBar;
    tbPlay: TToolButton;
    tbPause: TToolButton;
    tbStop: TToolButton;
    ilSoundRecorder: TImageList;
    alSoundRecorder: TActionList;
    aSoundRecorderRecord: TAction;
    aSoundRecorderPause: TAction;
    aSoundRecorderStop: TAction;
    AudioIn: TDXAudioIn;
    MP3Out: TMP3Out;
    WindowSoundRecorder_EditFileName: TLabel;
    WindowSoundRecorder_EditFilebtnOk: TLabel;
    WindowSoundRecorder_EditFilebtnCancel: TLabel;
    ImageList1: TImageList;
    sToolBar1: TsToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sAlphaImageList1: TsAlphaImageList;
    ImageList2: TImageList;
    function GetDirectory:string;
    procedure aSoundRecorderRecordExecute(Sender: TObject);
    procedure aSoundRecorderStopExecute(Sender: TObject);
    procedure aSoundRecorderRecordUpdate(Sender: TObject);
    procedure aSoundRecorderPauseUpdate(Sender: TObject);
    procedure aSoundRecorderStopUpdate(Sender: TObject);
    procedure aSoundRecorderPauseExecute(Sender: TObject);
  private
    bRecording:boolean;
  public
    procedure NewQSO;
    procedure SaveFile;
    procedure OptionsChanged;
  end;

var
  WindowSoundRecorderForm: TWindowSoundRecorderForm;

implementation

uses uWindowSoundRecorder;
{$R *.dfm}


procedure TWindowSoundRecorderForm.aSoundRecorderPauseExecute(Sender: TObject);
begin
if tbPause.Down then
 MP3Out.Pause
else
 MP3Out.Resume;
end;

procedure TWindowSoundRecorderForm.aSoundRecorderPauseUpdate(Sender: TObject);
begin
 aSoundRecorderPause.Enabled:=(MP3Out.Status=tosPlaying) or (MP3Out.Status=tosPaused);
end;

procedure TWindowSoundRecorderForm.aSoundRecorderRecordExecute(Sender: TObject);
begin
 bRecording:=True;
 MP3Out.Run;
end;

procedure TWindowSoundRecorderForm.aSoundRecorderRecordUpdate(Sender: TObject);
begin
 aSoundRecorderRecord.Enabled:=MP3Out.Status=tosIdle;
end;

procedure TWindowSoundRecorderForm.aSoundRecorderStopExecute(Sender: TObject);
begin
 bRecording:=False;
 tbPause.Down:=False;
 if (MP3Out.Status=tosPlaying) or (MP3Out.Status=tosPaused) then
  begin
    MP3Out.Stop(False);
    SaveFile;
  end;
end;

procedure TWindowSoundRecorderForm.aSoundRecorderStopUpdate(Sender: TObject);
begin
 aSoundRecorderStop.Enabled:=not aSoundRecorderRecord.Enabled;
end;


procedure TWindowSoundRecorderForm.NewQSO;
begin
  if WindowSoundRecorderSettingsFrame.WindowSoundRecorder_rbAuto.Checked then
    aSoundRecorderRecordExecute(Self);
end;


procedure TWindowSoundRecorderForm.SaveFile;
var
 sFile, sCall : string;
begin
 if not WindowSoundRecorderSettingsFrame.WindowSoundRecorder_cbAutoFileName.Checked then
  begin
    EditFileName:=TEditFileName.Create(Application);
    EditFileName.Caption:=WindowSoundRecorder_EditFileName.Caption;
    EditFileName.leFileName.EditLabel.Caption:=EditFileName.Caption;
    EditFileName.btnOk.Caption:=WindowSoundRecorder_EditFilebtnOk.Caption;
    EditFileName.btnCancel.Caption:=WindowSoundRecorder_EditFilebtnCancel.Caption;
    if EditFileName.ShowModal=mrOk then
     begin
      sFile:=ExtractFilePath(MP3Out.FileName)+EditFileName.leFileName.Text+'.mp3';
      RenameFile(MP3Out.FileName,sFile);
     end;
    EditFileName.Free;
  end
  else
  begin
    if Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString)='' then
      sCall:='Unknown'
      else
      sCall:=Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').AsString);
    sFile := ExtractFilePath(MP3Out.FileName)+StringReplace(sCall, '/', '!', [rfReplaceAll]) + '_' + ldsLogEdit.DataSet.FieldByName('LOG_BAND').AsString + '_' + ldsLogEdit.DataSet.FieldByName('LOG_MODE').AsString + '_' + FormatDateTime('yyyymmdd',ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime) + FormatDateTime('hhnn',ldsLogEdit.DataSet.FieldByName('LOG_QSO_DATE').AsDateTime) + '.mp3';
    RenameFile(MP3Out.FileName,sFile);
  end;
end;

procedure TWindowSoundRecorderForm.OptionsChanged;
begin
  AudioIn.DeviceNumber:=WindowSoundRecorderSettingsFrame.AudioIn.DeviceNumber;
  if WindowSoundRecorderSettingsFrame.WindowSoundRecorder_cbStereo.Checked then
     AudioIn.InChannels:=2
  else
     AudioIn.InChannels:=1;
  AudioIn.InSampleRate:=WindowSoundRecorderSettingsFrame.seSampleRate.Value;
  AudioIn.InBitsPerSample:=WindowSoundRecorderSettingsFrame.seBitPerSample.Value;
  MP3Out.FileName:=GetDirectory+'Current.mp3';
end;

function TWindowSoundRecorderForm.GetDirectory:string;
begin
  if Trim(WindowSoundRecorderSettingsFrame.deDirectory.Text)<>'' then
   begin
     if Pos(':',WindowSoundRecorderSettingsFrame.deDirectory.Text)>0 then
       result:=WindowSoundRecorderSettingsFrame.deDirectory.Text
     else
       result:=ExtractFilePath(Application.ExeName)+WindowSoundRecorderSettingsFrame.deDirectory.Text;
   end
   else
       result:=ExtractFilePath(Application.ExeName)+WindowSoundRecorderSettingsFrame.deDirectory.Text;
  if result[Length(result)]<>'\' then
    result:=result+'\';
end;



end.
