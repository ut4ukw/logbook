object EditBandGrid: TEditBandGrid
  Left = 0
  Top = 0
  ActiveControl = dblBands
  BorderStyle = bsDialog
  Caption = 'EditBandGrid'
  ClientHeight = 300
  ClientWidth = 160
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
  object lbBand: TLabel
    Left = 8
    Top = 10
    Width = 38
    Height = 16
    Caption = 'lbBand'
  end
  object lbMode: TLabel
    Left = 8
    Top = 58
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object lbFreqBegin: TLabel
    Left = 8
    Top = 157
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object lbModeCAT: TLabel
    Left = 8
    Top = 106
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object lbFreqEnd: TLabel
    Left = 8
    Top = 209
    Width = 37
    Height = 16
    Caption = 'Label1'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 266
    Width = 160
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 27
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
      Left = 92
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
  object dblBands: TJvDBLookupCombo
    Left = 8
    Top = 28
    Width = 145
    Height = 24
    LookupField = 'BAND_MHZ'
    LookupDisplay = 'BAND_MHZ'
    LookupSource = dsBands
    TabOrder = 1
    OnClick = dblBandsClick
  end
  object dblModes: TJvDBLookupCombo
    Left = 8
    Top = 76
    Width = 145
    Height = 24
    LookupField = 'MODE_NAME'
    LookupDisplay = 'MODE_NAME'
    LookupSource = dsModes
    TabOrder = 2
    OnClick = dblModesClick
  end
  object ceFreqBegin: TJvCalcEdit
    Left = 8
    Top = 176
    Width = 145
    Height = 24
    DecimalPlaces = 3
    DisplayFormat = '0.###'
    TabOrder = 4
    DecimalPlacesAlwaysShown = False
    OnChange = ceFreqBeginChange
  end
  object cbCatModes: TComboBox
    Left = 8
    Top = 124
    Width = 145
    Height = 24
    Style = csDropDownList
    TabOrder = 3
    OnClick = cbCatModesClick
    Items.Strings = (
      'CW_U'
      'CW_L'
      'SSB_U'
      'SSB_L'
      'DIG_U'
      'DIG_L'
      'AM'
      'FM')
  end
  object ceFreqEnd: TJvCalcEdit
    Left = 8
    Top = 228
    Width = 145
    Height = 24
    DecimalPlaces = 3
    DisplayFormat = '0.###'
    TabOrder = 5
    DecimalPlacesAlwaysShown = False
    OnChange = ceFreqEndChange
  end
  object qryBands: TKADaoTable
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
      'SELECT * FROM BANDS WHERE BAND_ACTIVE=1')
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
    Left = 48
    Top = 88
  end
  object dsBands: TDataSource
    DataSet = qryBands
    Left = 80
    Top = 88
  end
  object qryModes: TKADaoTable
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
      'SELECT * FROM MODES ')
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
    Left = 48
    Top = 144
  end
  object dsModes: TDataSource
    DataSet = qryModes
    Left = 80
    Top = 144
  end
end
