unit uEditBandGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExComCtrls, JvHotKey, ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvFooter, Menus, Mask, DBCtrls, LabeledControls, DB,
  JvExControls, JvDBLookup, KDaoTable, JvExMask, JvToolEdit, JvBaseEdits;

type
  TEditBandGrid = class(TForm)
    JvFooter1: TJvFooter;
    btnOk: TButton;
    btnCancel: TButton;
    qryBands: TKADaoTable;
    dblBands: TJvDBLookupCombo;
    lbBand: TLabel;
    dsBands: TDataSource;
    qryModes: TKADaoTable;
    dsModes: TDataSource;
    dblModes: TJvDBLookupCombo;
    lbMode: TLabel;
    ceFreqBegin: TJvCalcEdit;
    lbFreqBegin: TLabel;
    cbCatModes: TComboBox;
    lbModeCAT: TLabel;
    ceFreqEnd: TJvCalcEdit;
    lbFreqEnd: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dblBandsClick(Sender: TObject);
    procedure dblModesClick(Sender: TObject);
    procedure cbCatModesClick(Sender: TObject);
    procedure ceFreqBeginChange(Sender: TObject);
    procedure ceFreqEndChange(Sender: TObject);
  private
    procedure CheckOk;
  public
  end;

var
  EditBandGrid: TEditBandGrid;

implementation

uses uOptions;

{$R *.dfm}

procedure TEditBandGrid.cbCatModesClick(Sender: TObject);
begin
 CheckOk;
end;

procedure TEditBandGrid.ceFreqBeginChange(Sender: TObject);
begin
 CheckOk;
end;

procedure TEditBandGrid.ceFreqEndChange(Sender: TObject);
begin
 CheckOk;
end;

procedure TEditBandGrid.CheckOk;
begin
  btnOk.Enabled:=(dblBands.Text<>'') and (dblModes.Text<>'') and (cbCatModes.Text<>'') and (ceFreqBegin.Value<>0) and (ceFreqEnd.Value<>0);
end;


procedure TEditBandGrid.dblBandsClick(Sender: TObject);
begin
 CheckOk;
end;

procedure TEditBandGrid.dblModesClick(Sender: TObject);
begin
 CheckOk;
end;

procedure TEditBandGrid.FormShow(Sender: TObject);
begin
 qryBands.Open;
 qryModes.Open;
end;

end.
