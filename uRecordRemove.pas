unit uRecordRemove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExExtCtrls, JvExtComponent, JvFooter, DB,
  KDaoTable, JvExControls, JvDBLookup, DBCtrls;

type
  TRecordRemove = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    qryStations: TKADaoTable;
    dsStations: TDataSource;
    dbcStations: TDBLookupComboBox;
    lbBook: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbcStationsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecordRemove: TRecordRemove;

implementation

uses uMainWindow;

{$R *.dfm}

procedure TRecordRemove.dbcStationsClick(Sender: TObject);
begin
 btnOk.Enabled:=Trim(dbcStations.Text)<>'';
end;

procedure TRecordRemove.FormShow(Sender: TObject);
begin
 qryStations.Params.ParamByName('STATION_ID').AsInteger:=MainWindow.CurrentStationId;
 qryStations.Open;
end;

end.
