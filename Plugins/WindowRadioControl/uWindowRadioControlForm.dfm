object WindowRadioControlForm: TWindowRadioControlForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowRadioControlForm'
  ClientHeight = 286
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 104
    Width = 434
    Height = 3
    Cursor = crVSplit
    Align = alTop
    AutoSnap = False
    Beveled = True
    ExplicitTop = 73
    ExplicitWidth = 213
  end
  object pnlScale: TPanel
    Left = 0
    Top = 31
    Width = 434
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object FreqDisplay: TILSegmentText
      Left = 0
      Top = 0
      Width = 434
      Height = 73
      Align = alClient
      OnMouseDown = FreqDisplayMouseDown
      OnMouseUp = FreqDisplayMouseUp
      SegmentsType = stSeven
      Segments.Gap.Value = 0.009999999776482582
      Segments.Width.Value = 0.129999995231628400
      Segments.Color = -16751616
      Segments.CenterColor = -7278960
      DecimalPoint.Visible = True
      DecimalPoint.Offset.Right.Value = 0.039999999105930330
      DecimalPoint.Offset.Bottom.Value = 0.100000001490116100
      DecimalPoint.Size.Value = 0.129999995231628400
      Indents.Left.Value = 0.100000001490116100
      Indents.Right.Value = 0.100000001490116100
      Indents.Top.Value = 0.100000001490116100
      Indents.Bottom.Value = 0.100000001490116100
      Rows = 1
      Cols = 8
    end
  end
  object pnlBandMode: TPanel
    Left = 0
    Top = 107
    Width = 434
    Height = 179
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlBands: TPanel
      Left = 0
      Top = 0
      Width = 116
      Height = 179
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object pnlModes: TPanel
      Left = 116
      Top = 0
      Width = 116
      Height = 179
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 2
        Height = 179
        Align = alLeft
        Shape = bsLeftLine
        ExplicitHeight = 177
      end
    end
  end
  object pnlMainToolbar: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbBand: TLabel
      Left = -2
      Top = 7
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbBand'
    end
    object lbMode: TLabel
      Left = 97
      Top = 7
      Width = 38
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbBand'
    end
    object cbBand: TComboBox
      Left = 39
      Top = 4
      Width = 58
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      OnClick = cbBandClick
    end
    object cbMode: TComboBox
      Left = 138
      Top = 4
      Width = 81
      Height = 24
      Style = csDropDownList
      TabOrder = 1
      OnClick = cbModeClick
    end
  end
  object qryModes: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      'SELECT * FROM MODES WHERE MODE_ACTIVE=1 ORDER BY MODE_NAME'
      ' ')
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
    Left = 32
    Top = 128
  end
  object qryBands: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      'SELECT * FROM BANDS WHERE BAND_ACTIVE=1 ORDER BY BAND_MHZ')
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'BAND_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'BAND_METER'
        DataType = ftFloat
      end
      item
        Name = 'BAND_ADIF'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BAND_LOWER_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'BAND_UPPER_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'BAND_ACTIVE'
        DataType = ftInteger
      end>
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
    Left = 96
    Top = 128
    object qryBandsBAND_ID: TAutoIncField
      FieldName = 'BAND_ID'
    end
    object qryBandsBAND_MHZ: TFloatField
      FieldName = 'BAND_MHZ'
      DisplayFormat = '0.000'
    end
    object qryBandsBAND_METER: TFloatField
      FieldName = 'BAND_METER'
    end
    object qryBandsBAND_ADIF: TStringField
      FieldName = 'BAND_ADIF'
      Size = 10
    end
    object qryBandsBAND_LOWER_FREQ: TFloatField
      FieldName = 'BAND_LOWER_FREQ'
    end
    object qryBandsBAND_UPPER_FREQ: TFloatField
      FieldName = 'BAND_UPPER_FREQ'
    end
    object qryBandsBAND_ACTIVE: TIntegerField
      FieldName = 'BAND_ACTIVE'
    end
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    StoredProps.Strings = (
      'pnlScale.Height'
      'pnlMainToolbar.Visible')
    StoredValues = <>
    Left = 192
    Top = 184
  end
  object timFreq: TTimer
    Enabled = False
    Interval = 300
    OnTimer = timFreqTimer
    Left = 288
    Top = 160
  end
end
