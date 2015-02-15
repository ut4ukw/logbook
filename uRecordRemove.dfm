object RecordRemove: TRecordRemove
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'RecordRemove'
  ClientHeight = 120
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lbBook: TLabel
    Left = 8
    Top = 13
    Width = 37
    Height = 16
    Caption = 'lbBook'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 86
    Width = 320
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 185
      Top = 4
      Width = 61
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnOk'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 250
      Top = 4
      Width = 65
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnCancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object dbcStations: TDBLookupComboBox
    Left = 8
    Top = 32
    Width = 303
    Height = 24
    KeyField = 'STATION_ID'
    ListField = 'name'
    ListSource = dsStations
    TabOrder = 1
    OnClick = dbcStationsClick
  end
  object qryStations: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = dmMain.DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      
        'SELECT STATION_ID,STATION_BOOK_NAME &'#39' ['#39'& STATION_CALL&'#39']'#39'  as ' +
        'name FROM STATIONS WHERE STATION_ID<>:STATION_ID AND IS_GROUP=0')
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    MasterAutoActivate = True
    DatabaseAutoActivate = False
    UseBrackets = True
    UseCaptions = False
    UseDaoProperties = True
    UseGetRecNo = True
    UseRecordCount = True
    WarnOnBadDatabase = False
    Filtered = False
    ParamCheck = True
    ProcessMessages = False
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'STATION_ID'
        ParamType = ptUnknown
      end>
  end
  object dsStations: TDataSource
    DataSet = qryStations
    Left = 80
    Top = 40
  end
end
