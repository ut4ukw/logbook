unit uEditBookGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, udmMain;

type
  TEditBookGroup = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    leBookGroup: TLabeledEdit;
    procedure leBookGroupChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
  public
    isEdit:boolean;
  end;

var
  EditBookGroup: TEditBookGroup;

implementation
uses uOptions, uMainWindow;
{$R *.dfm}

procedure TEditBookGroup.btnOkClick(Sender: TObject);
var
 i:integer;
begin
 if isEdit then
 begin
  dmMain.qryStations.Edit;
  dmMain.qryStations.FieldByName('STATION_BOOK_NAME').AsString:=leBookGroup.Text;
  dmMain.qryStations.Post;
 // MainWindow.EditBookInMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger,dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString);
 end
 else
 begin
  dmMain.qryStations.DisableControls;
  dmMain.qryStations.Append;
  dmMain.qryStations.FieldByName('STATION_BOOK_NAME').AsString:=leBookGroup.Text;
  dmMain.qryStations.FieldByName('IS_GROUP').AsInteger:=1;
  dmMain.qryStations.Post;
  dmMain.qryStations.EnableControls;
  i:=dmMain.qryStations.FieldByName('STATION_ID').AsInteger;
//  MainWindow.AddBookToMenu(dmMain.qryStations.FieldByName('STATION_ID').AsInteger,dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString,1);
  Options.RefreshmdsStations(dmMain.qryStations.FieldByName('STATION_ID').AsInteger);
//  Options.mdsStations.Locate('STATION_ID',dmMain.qryStations.FieldByName('STATION_ID').AsInteger,[]);
 end;
end;

procedure TEditBookGroup.leBookGroupChange(Sender: TObject);
begin
 btnOk.Enabled:=Length(Trim(leBookGroup.Text))>0;
end;

end.
