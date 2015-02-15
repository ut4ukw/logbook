unit uWindowPhotoForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uUtils, ExtCtrls, JvExExtCtrls, JvImage, GIFImg, JvComponentBase,
  JvThread, ShellApi, JvExControls, StdCtrls, uWindowPluginForm, jpeg,
  uWindowPhotoSettingsFrame;

type
  TWindowPhotoForm = class(TWindowPluginForm)
    Panel1: TPanel;
    imPhoto: TJvImage;
    imNoPhoto: TJvImage;
    thrPhoto: TJvThread;
    lbPhotoLoading: TLabel;
    procedure thrPhotoExecute(Sender: TObject; Params: Pointer);
    procedure thrPhotoFinishAll(Sender: TObject);
    procedure imPhotoClick(Sender: TObject);
  private
    Call: string;
    PhotoDir : string;
  public
    procedure CallInfo;
    procedure CancelQSO;
    procedure OptionsChanged;
  end;

var
  WindowPhotoForm: TWindowPhotoForm;

implementation

uses uWindowPhoto;
{$R *.dfm}

procedure TWindowPhotoForm.CallInfo;
begin
  Call := Trim(ldsLogEdit.DataSet.FieldByName('LOG_CALL').asString);

  imPhoto.Visible := False;
  imPhoto.Picture:=nil;
  imNoPhoto.Visible := True;

  if Trim(Call) = '' then
  begin
{    imPhoto.Visible := False;
    imPhoto.Picture:=nil;
    imNoPhoto.Visible := True;}
    exit;
  end;

  Call:=GetOriginalCall(Call);

  if FileExists(PhotoDir+Call+'.jpg') then
    begin
     imPhoto.Picture.LoadFromFile(PhotoDir+Call+'.jpg');
     imNoPhoto.Visible := False;
     imPhoto.Visible := True;
    end
    else
    begin
     if not thrPhoto.Terminated then
     begin
      thrPhoto.Terminate;
      thrPhoto.WaitFor;
     end;
     thrPhoto.Execute(nil);
    end;
end;

procedure TWindowPhotoForm.imPhotoClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, PChar('open'),PChar('http://www.qrz.com/db/' + Call), Nil, Nil,SW_SHOW);
end;

procedure TWindowPhotoForm.thrPhotoExecute(Sender: TObject; Params: Pointer);
begin
  lbPhotoLoading.Visible:=True;
  Application.ProcessMessages;
  //GetJpeg(imPhoto,LowerCase('http://www.qrz.com/hampages/' + Call[Length(Call)] + '/' + Call[Length(Call) - 1] + '/' + Call + '/' + Call + '.jpg'));
  GetJpeg(imPhoto,LowerCase('http://files.qrz.com/' + Call[Length(Call)] + '/' + Call + '/' + Call + '.jpg'));
end;

procedure TWindowPhotoForm.thrPhotoFinishAll(Sender: TObject);
var
 sDir:string;
begin
  lbPhotoLoading.Visible:=False;
  Application.ProcessMessages;
  if imPhoto.Picture.Width > 0 then
  begin
    imNoPhoto.Visible := False;
    Self.Repaint;
    imPhoto.Visible := True;
    if WindowPhotoSettingsFrame.WindowPhoto_cbSaveCache.Checked then
       imPhoto.Picture.SaveToFile(PhotoDir+LowerCase(Call)+'.jpg');
  end
  else
  begin
    imPhoto.Visible := False;
    imPhoto.Picture:=nil;
    imNoPhoto.Visible := True;
  end;
end;

procedure TWindowPhotoForm.CancelQSO;
begin
  imPhoto.Visible := False;
  imPhoto.Picture:=nil;
  imNoPhoto.Visible := True;
end;

procedure TWindowPhotoForm.OptionsChanged;
begin
  PhotoDir:=Trim(WindowPhotoSettingsFrame.deDirectory.Text);
  if Length(PhotoDir)>0 then
     if PhotoDir[Length(PhotoDir)]<>'\' then
        PhotoDir:=PhotoDir+'\';
  if not DirectoryExists(PhotoDir)  then
    PhotoDir:=ExtractFilePath(Application.ExeName)+'Data\Photo\';
end;


end.
