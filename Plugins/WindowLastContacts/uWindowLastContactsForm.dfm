object WindowLastContactsForm: TWindowLastContactsForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowLastContactsForm'
  ClientHeight = 464
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object dbgLastContacts: TDBGridEh
    Left = 0
    Top = 31
    Width = 540
    Height = 433
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.EndEllipsis = True
    ColumnDefValues.Title.EndEllipsis = True
    ColumnDefValues.Title.TitleButton = True
    DataGrouping.GroupLevels = <>
    DataSource = dsLastContacts
    DrawMemoText = True
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghClearSelection, dghAutoSortMarking, dghIncSearch, dghColumnResize, dghColumnMove, dghHotTrack]
    ParentShowHint = False
    PopupMenu = pmLog
    ReadOnly = True
    RowDetailPanel.Color = clBtnFace
    ShowHint = True
    SortLocal = True
    STFilter.InstantApply = True
    STFilter.Local = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = dbgLastContactsDblClick
    OnEnter = dbgLastContactsEnter
    OnExit = dbgLastContactsExit
    OnGetCellParams = dbgLastContactsGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LOG_QTH'
        Footers = <>
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_CALL'
        Footers = <>
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSO_DATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_COMMENT'
        Footers = <>
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSLRDATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_CNTY'
        Footers = <>
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_NAME'
        Footers = <>
        Width = 2290
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSL_RCVD'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSL_SENT'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          ''
          ''
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSL_VIA'
        Footers = <>
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_EQSL_QSLRDATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_EQSL_QSLSDATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_EQSL_QSL_RCVD'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_EQSL_QSL_SENT'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          ''
          ''
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_LOTW_QSLRDATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_LOTW_QSLSDATE'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_LOTW_QSL_RCVD'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_LOTW_QSL_SENT'
        Footers = <>
        ImageList = ilQSL
        KeyList.Strings = (
          ''
          ''
          'Y')
        Width = 2299
      end
      item
        EditButtons = <>
        FieldName = 'LOG_MODE'
        Footers = <>
        Width = 2290
      end
      item
        EditButtons = <>
        FieldName = 'LOG_BAND_MHZ'
        Footers = <>
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'LOG_STATE'
        Footers = <>
        Width = 2299
      end
      item
        DisplayFormat = 'hh:mm'
        EditButtons = <>
        FieldName = 'LOG_QSO_TIME'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'LOG_QSLSDATE'
        Footers = <>
        Width = 166
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlMainToolbar: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlMainToolbar'
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 540
      Height = 31
      ButtonHeight = 32
      ButtonWidth = 32
      Caption = 'ToolBar1'
      Images = ilLastContacts
      TabOrder = 0
      object tbSyncBrowse: TToolButton
        Left = 0
        Top = 0
        Action = aLastContactsSyncBrowse
        Style = tbsCheck
      end
      object tbSearchAllBook: TToolButton
        Left = 32
        Top = 0
        Action = aLastContactsSearchAllBook
        Style = tbsCheck
      end
    end
  end
  object dsLastContacts: TDataSource
    DataSet = qryLastContacts
    Left = 320
    Top = 208
  end
  object qryLastContacts: TKADaoTable
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
      
        'SELECT LOG_EMAIL,LOG_WEB,LOG_IOTA, LOG_GRIDSQUARE,  LOG_STATE, L' +
        'OG_CNTY, LOG_ID, '
      'LOG_QTH, LOG_OPERATOR, LOG_CALL, '
      'LOG_QSO_DATE, LOG_COMMENT, '
      'LOG_QSLSDATE, LOG_QSLRDATE, '
      'LOG_QSL_RCVD, LOG_QSL_SENT, '
      'LOG_QSL_VIA, '
      'LOG_EQSL_QSLRDATE, LOG_EQSL_QSLSDATE, LOG_EQSL_QSL_RCVD, '
      'LOG_EQSL_QSL_SENT, LOG_LOTW_QSLRDATE, LOG_LOTW_QSLSDATE, '
      'LOG_LOTW_QSL_RCVD, LOG_LOTW_QSL_SENT, '
      'LOG_BAND_MHZ, LOG_MODE, LOG_NAME, '
      'LOG_QSO_TIME  ,'
      'LOG_QSO_DATETIME,"1" as STATION_ID FROM LOG_1')
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'LOG_EMAIL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_WEB'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_IOTA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_GRIDSQUARE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_STATE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_CNTY'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_ID'
        DataType = ftInteger
      end
      item
        Name = 'LOG_QTH'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_OPERATOR'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_CALL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSO_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_COMMENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSL_VIA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_EQSL_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EQSL_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EQSL_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_EQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LOTW_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_LOTW_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_LOTW_QSL_RCVD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LOTW_QSL_SENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MODE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSO_TIME'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSO_DATETIME'
        DataType = ftDateTime
      end
      item
        Name = 'STATION_ID'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    KeyField = 'LOG_QSO_DATE'
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
    Top = 216
    object qryLastContactsLOG_ID: TIntegerField
      FieldName = 'LOG_ID'
      ReadOnly = True
      Visible = False
    end
    object qryLastContactsLOG_CALL: TStringField
      FieldName = 'LOG_CALL'
      Required = True
      Size = 255
    end
    object qryLastContactsLOG_BAND_MHZ: TFloatField
      FieldName = 'LOG_BAND_MHZ'
      DisplayFormat = '0.###'
      Precision = 7
    end
    object qryLastContactsLOG_QSO_DATE: TDateTimeField
      FieldName = 'LOG_QSO_DATE'
    end
    object qryLastContactsLOG_QTH: TStringField
      FieldName = 'LOG_QTH'
      Size = 255
    end
    object qryLastContactsLOG_COMMENT: TStringField
      FieldName = 'LOG_COMMENT'
      Size = 255
    end
    object qryLastContactsLOG_QSLSDATE: TDateTimeField
      FieldName = 'LOG_QSLSDATE'
    end
    object qryLastContactsLOG_QSLRDATE: TDateTimeField
      FieldName = 'LOG_QSLRDATE'
    end
    object qryLastContactsLOG_QSL_SENT: TStringField
      FieldName = 'LOG_QSL_SENT'
      Size = 255
    end
    object qryLastContactsLOG_QSL_RCVD: TStringField
      FieldName = 'LOG_QSL_RCVD'
      Size = 255
    end
    object qryLastContactsLOG_QSL_VIA: TStringField
      FieldName = 'LOG_QSL_VIA'
      Size = 255
    end
    object qryLastContactsLOG_EQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLRDATE'
    end
    object qryLastContactsLOG_EQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLSDATE'
    end
    object qryLastContactsLOG_EQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_EQSL_QSL_RCVD'
      Size = 255
    end
    object qryLastContactsLOG_EQSL_QSL_SENT: TStringField
      FieldName = 'LOG_EQSL_QSL_SENT'
      Size = 255
    end
    object qryLastContactsLOG_LOTW_QSLRDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLRDATE'
    end
    object qryLastContactsLOG_LOTW_QSLSDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLSDATE'
    end
    object qryLastContactsLOG_LOTW_QSL_RCVD: TStringField
      FieldName = 'LOG_LOTW_QSL_RCVD'
      Size = 255
    end
    object qryLastContactsLOG_LOTW_QSL_SENT: TStringField
      FieldName = 'LOG_LOTW_QSL_SENT'
      Size = 255
    end
    object qryLastContactsLOG_MODE: TStringField
      FieldName = 'LOG_MODE'
      Size = 254
    end
    object qryLastContactsLOG_NAME: TStringField
      FieldName = 'LOG_NAME'
      Size = 254
    end
    object qryLastContactsLOG_OPERATOR: TStringField
      FieldName = 'LOG_OPERATOR'
      Size = 255
    end
    object qryLastContactsLOG_QSO_TIME: TDateTimeField
      FieldName = 'LOG_QSO_TIME'
      Required = True
    end
    object qryLastContactsLOG_STATE: TStringField
      FieldName = 'LOG_STATE'
      Size = 255
    end
    object qryLastContactsLOG_CNTY: TStringField
      FieldName = 'LOG_CNTY'
      Size = 255
    end
    object qryLastContactsLOG_QSO_DATETIME: TDateTimeField
      FieldName = 'LOG_QSO_DATETIME'
      Required = True
    end
    object qryLastContactsLOG_EMAIL: TStringField
      FieldName = 'LOG_EMAIL'
      Size = 255
    end
    object qryLastContactsLOG_WEB: TStringField
      FieldName = 'LOG_WEB'
      Size = 255
    end
    object qryLastContactsLOG_IOTA: TStringField
      FieldName = 'LOG_IOTA'
      Size = 255
    end
    object qryLastContactsLOG_GRIDSQUARE: TStringField
      FieldName = 'LOG_GRIDSQUARE'
      Size = 255
    end
    object qryLastContactsSTATION_ID: TStringField
      FieldName = 'STATION_ID'
      Visible = False
      Size = 255
    end
  end
  object FormStorage: TJvFormStorage
    Active = False
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 200
    Top = 160
  end
  object ActionList: TActionList
    Images = ilLastContacts
    Left = 144
    Top = 216
    object aLastContactsSyncBrowse: TAction
      Caption = 'aLastContactsSyncBrowse'
      ImageIndex = 0
      OnExecute = aLastContactsSyncBrowseExecute
    end
    object aLastContactsSearchAllBook: TAction
      Caption = 'aLastContactsSearchAllBook'
      ImageIndex = 1
      OnExecute = aLastContactsSearchAllBookExecute
    end
    object aLastContactsQSLQueue: TAction
      Tag = 3
      Caption = 'aLastContactsQSLQueue'
      OnExecute = aLastContactsQSLQueueExecute
    end
    object aLastContactsQSLRcvd: TAction
      Tag = 3
      Caption = 'aLastContactsQSLRcvd'
      OnExecute = aLastContactsQSLRcvdExecute
    end
    object aLastContactsQSLSent: TAction
      Caption = 'aLastContactsQSLSent'
      OnExecute = aLastContactsQSLSentExecute
    end
    object aLastContactsQSLIgnore: TAction
      Tag = 3
      Caption = 'aLastContactsQSLIgnore'
      OnExecute = aLastContactsQSLIgnoreExecute
    end
    object aLastContactsQSLPrint: TAction
      Caption = 'aLastContactsQSLPrint'
      OnExecute = aLastContactsQSLPrintExecute
    end
  end
  object ilLastContacts: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 176
    Top = 88
    Bitmap = {
      494C01010200F000E00510001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000020101001C0000000F000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      000200000004000000070000000A0000000D0000001000000013000000150000
      0017000000190000001A000000150000000A0000000000000000000000000000
      00000000000009090045283810B1588D41F5709853FE496A25EB151C009C0404
      003D0000000E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0004000000080000000E00000013000000190000001F000000251108044ABB4F
      34D4E86240FFBB4F34D41006044900000013000000000000000007070037212E
      0BA6518339F27DCF72FFA2FFA1FF8EF08BFFCFDAC5FFFFFFFFFFD6E9CCFF8CB2
      71FE3E5C1AE31216009103030034000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2492DD0E491
      79FFE8BFB2FFE49179FFB2492DD000000000000000000606002367A753FF9BFA
      9AFF97FA97FF88F287FF77EA76FF67E267FF9AB987FFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFEFDFFCBE2BFFF324211D7000000090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000202024D0101016601010166CC5230FFF0C7
      BAFFF0C7BAFFF0C7BAFFCC5230FF00000000000000001011005587E983FF7CED
      7CFF67D763FF4A812CFF6A5614FF655317FF447E3DFF69A45AFFABCF98FFF0F7
      EDFFFFFFFFFFFFFFFFFF373722AE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000505056600000000000000009A3C20D0DB90
      77FFF7CEC1FFDB9077FF9A3C20D000000000000000000E0E004E4A7E2CFF6956
      13FFAB6617FFEA8D26FFC17E2DFFFCF4EFFFE7BD9EFFAC7A48FF4F591AFF3F80
      39FF6FA75DFFB5CDA6FF373A1EBF0000000D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000909096600000000000000001C0A05299038
      1DD0B14422FF90381DD01C0A05290000000025180078A06014FBE38924FFFF9E
      2EFFF69329FFEE8825FFB16E29FFFFFFFFFFFFFFFFFFFFFFFFFFFCF2EBFFE3B7
      98FF9A6C38FF487C48FC212F0E9D000000030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000F0F0F660000000000000000000000000000
      00000000000000000000000000000000000070480DD5F7942AFFEF8926FFE67E
      22FFDF771EFFC26E1AFFAE7229FF9C7266FF534B8EFF474792FFA2A2B4FFE8E8
      E8FFD1C1AEFF0906004400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000151515660000000000000000000000000000
      0000000000000000000000000000000000007A490DE4E0771FFFC8711CFFB978
      2BFF926743FF533A61FF3F3CA8FF706EE4FF6968CDFFE4E4FAFF8E8EE0FF3F3E
      ABFF3E3A75FF00000D7700000014000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001E0D0829934327D0B65230FF9343
      27D01E0D082900000000000000001919196600000000000000001E0D08299343
      27D0B65230FF934327D01E0D0829000000003927049CB68540FFA97A5AFF3C39
      A1FF6867DCFF9B99FFFF8684FFFF706FFFFF4343C8FFFFFFFFFFFFFFFFFFFFFF
      FFFFDDDDF8FF8686DBFF282894EE0000105E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A04E33D0D7927AFFE8BFB2FFD792
      7AFFA04E33D000000000000000001D1D1D660000000000000000A04E33D0D792
      7AFFE8BFB2FFD7927AFFA04E33D000000000000000000B08002D38326EE78886
      FFFF7271FFFF5D5CFFFF5151FFFF5958EAFF4E4CBDFF8181DFFFD5D5F7FFFFFF
      FFFFFFFFFFFFFFFFFFFFC1C1E5FF0000145E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D46E4CFFF0C7BAFFF0C7BAFFF0C7
      BAFFD46E4CFF2121216621212166212121662121216621212166D46E4CFFF0C7
      BAFFF0C7BAFFF0C7BAFFD46E4CFF0000000000000000000000001F1D81D24F4F
      FFFF5B5AF0FF5655CBFF6E6ECFFF7D7CEEFF7A7AFFFF7272FFFF6969F8FF6262
      DDFF8E8EE3FFE2E2FAFFC5C5E1FF00000B4E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B86448D0EEA891FFF7CEC1FFEEA8
      91FFB86448D00000000000000000000000000000000000000000B86448D0EEA8
      91FFF7CEC1FFEEA891FFB86448D000000000000000000000000008083E8C6261
      C1FF8A89E7FF9191FFFF8989FFFF8282FFFF7979FFFF7272FFFF6A6AFFFF6565
      FFFF6565FFFF6363F3FF5F5FCAFF00001C760000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025151029C16D52D0EC8663FFC16D
      52D025151029000000000000000000000000000000000000000025151029C16D
      52D0EC8663FFC16D52D025151029000000000000000000000000000000010000
      163D45457DBF8E8EDDFC9292FDFF8181FFFF7878FFFF7171FFFF6969FFFF7272
      FDFF7777DDFC3E3E82CC0000174F000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000020402021E4C505094D18585E6FE8080E3FD484890D60202
      1D5B000001050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000300000003000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object FormStorageOnExit: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    AfterRestorePlacement = FormStorageOnExitAfterRestorePlacement
    StoredProps.Strings = (
      'tbSearchAllBook.Down'
      'tbSyncBrowse.Down'
      'pnlMainToolbar.Visible')
    StoredValues = <>
    Left = 104
    Top = 368
  end
  object cdsLastContacts: TJvMemoryData
    FieldDefs = <
      item
        Name = 'LOG_EMAIL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_WEB'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_IOTA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_GRIDSQUARE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_STATE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_CNTY'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'LOG_QTH'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_OPERATOR'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_CALL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSO_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_COMMENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSL_VIA'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_EQSL_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EQSL_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EQSL_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_EQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LOTW_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_LOTW_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_LOTW_QSL_RCVD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LOTW_QSL_SENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MODE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSO_TIME'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSO_DATETIME'
        Attributes = [faRequired]
        DataType = ftDateTime
      end>
    Left = 56
    Top = 296
    object cdsLastContactsLOG_EMAIL: TStringField
      FieldName = 'LOG_EMAIL'
      Size = 255
    end
    object cdsLastContactsLOG_WEB: TStringField
      FieldName = 'LOG_WEB'
      Size = 255
    end
    object cdsLastContactsLOG_IOTA: TStringField
      FieldName = 'LOG_IOTA'
      Size = 255
    end
    object cdsLastContactsLOG_GRIDSQUARE: TStringField
      FieldName = 'LOG_GRIDSQUARE'
      Size = 255
    end
    object cdsLastContactsLOG_STATE: TStringField
      FieldName = 'LOG_STATE'
      Size = 255
    end
    object cdsLastContactsLOG_CNTY: TStringField
      FieldName = 'LOG_CNTY'
      Size = 255
    end
    object cdsLastContactsLOG_QTH: TStringField
      FieldName = 'LOG_QTH'
      Size = 255
    end
    object cdsLastContactsLOG_OPERATOR: TStringField
      FieldName = 'LOG_OPERATOR'
      Size = 255
    end
    object cdsLastContactsLOG_CALL: TStringField
      FieldName = 'LOG_CALL'
      Required = True
      Size = 255
    end
    object cdsLastContactsLOG_QSO_DATE: TDateTimeField
      FieldName = 'LOG_QSO_DATE'
    end
    object cdsLastContactsLOG_COMMENT: TStringField
      FieldName = 'LOG_COMMENT'
      Size = 255
    end
    object cdsLastContactsLOG_QSLSDATE: TDateTimeField
      FieldName = 'LOG_QSLSDATE'
    end
    object cdsLastContactsLOG_QSLRDATE: TDateTimeField
      FieldName = 'LOG_QSLRDATE'
    end
    object cdsLastContactsLOG_QSL_RCVD: TStringField
      FieldName = 'LOG_QSL_RCVD'
      Required = True
      Size = 255
    end
    object cdsLastContactsLOG_QSL_SENT: TStringField
      FieldName = 'LOG_QSL_SENT'
      Required = True
      Size = 255
    end
    object cdsLastContactsLOG_QSL_VIA: TStringField
      FieldName = 'LOG_QSL_VIA'
      Size = 255
    end
    object cdsLastContactsLOG_EQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLRDATE'
    end
    object cdsLastContactsLOG_EQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLSDATE'
    end
    object cdsLastContactsLOG_EQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_EQSL_QSL_RCVD'
      Required = True
      Size = 255
    end
    object cdsLastContactsLOG_EQSL_QSL_SENT: TStringField
      FieldName = 'LOG_EQSL_QSL_SENT'
      Required = True
      Size = 255
    end
    object cdsLastContactsLOG_LOTW_QSLRDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLRDATE'
    end
    object cdsLastContactsLOG_LOTW_QSLSDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLSDATE'
    end
    object cdsLastContactsLOG_LOTW_QSL_RCVD: TStringField
      FieldName = 'LOG_LOTW_QSL_RCVD'
      Size = 255
    end
    object cdsLastContactsLOG_LOTW_QSL_SENT: TStringField
      FieldName = 'LOG_LOTW_QSL_SENT'
      Size = 255
    end
    object cdsLastContactsLOG_BAND_MHZ: TFloatField
      FieldName = 'LOG_BAND_MHZ'
      DisplayFormat = '0.###'
    end
    object cdsLastContactsLOG_MODE: TStringField
      FieldName = 'LOG_MODE'
      Size = 255
    end
    object cdsLastContactsLOG_NAME: TStringField
      FieldName = 'LOG_NAME'
      Size = 255
    end
    object cdsLastContactsLOG_QSO_TIME: TDateTimeField
      FieldName = 'LOG_QSO_TIME'
      Required = True
    end
    object cdsLastContactsLOG_QSO_DATETIME: TDateTimeField
      FieldName = 'LOG_QSO_DATETIME'
      Required = True
    end
    object cdsLastContactsSTATION_ID: TIntegerField
      FieldName = 'STATION_ID'
      Visible = False
    end
    object cdsLastContactsLOG_ID: TIntegerField
      FieldName = 'LOG_ID'
    end
  end
  object qryStations: TKADaoTable
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
      
        'SELECT STATION_ID FROM STATIONS WHERE STATION_PARENT_ID=:STATION' +
        '_PARENT_ID')
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
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'STATION_PARENT_ID'
        ParamType = ptUnknown
      end>
  end
  object ilQSL: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 240
    Top = 264
    Bitmap = {
      494C01010400F000980610001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000053A15EFF238531FC111B
      1326000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000182F6A064F
      95DE00050B530000000700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000100
      012D0D081A7700000108000000000000000000000006000000160000001A0000
      001A0000001A0000001A0000001A0000001A5FA86AFF3E9C4BFF59B767FF2084
      2EFE0C150E380000001A000000160000000600000006000000160000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      001A0000001A0000001A000000160000000600000006000000160000001A0000
      001A0000001A0000001A00050A2B00010236000002390000002F00204290158A
      FFFF064F96DF00060B690000001E0000000600000006000000160000001A0000
      001A0000001A0000001A0000001A0000001A0000001A0000001A0000001A0000
      03523F38B1F91613358C00000016000000060F0F055C18180676181806760909
      01580000001A090901581818067661A96CFF3D9D4BFF5EC16EFF5EC16EFF58BC
      68FF238730FF18180676181806760F0F055C0F0F055C18180676181806760909
      01580000001A0909015818180676181806761818067618180676090901580000
      001A0909015818180676181806760F0F055C0F0F055C18180676181806760909
      01580000001A090901580A4A8BE1246EC0F92972C2F7236EBCF61B74D0FA0A7D
      F7FF017DF6FF025698ED0F160FA70D0D05650F0F055C18180676181806760909
      01580000001A09090158191907771918087917170A7C18180B7E0909025B0000
      04540300BCF8463CFDFF211F33B80F0F055C24241472F9F9E9FFF3F3E3FF6565
      50B511110078848472C35EA869FF3DA04BFF5DC86EFF5DC86EFF51BB62FF5DC8
      6EFF58C268FF268933FFF9F9E9FF2424147224241472F9F9E9FFF3F3E3FF6565
      50B511110078848472C3F3F3E3FFF3F3E3FFF3F3E3FFF3F3E3FF848472C31111
      0078656550B5F3F3E3FFF9F9E9FF2424147224241472F9F9E9FFF3F3E3FF6565
      50B511110078848472C33988DEFF8ABEFCFF99CAFFFF88C1FFFF57A9FDFF0880
      F3FF007BF4FF0084F8FF1776BCFF16201AA724241472F9F9E9FFF3F3E3FF6565
      50B511110078848472C3E9E9E1FFA7A6C5FF554FAAFF3E36ADFF2D2699F31C13
      8AE90C07D4FE0000F0FF3F3DE8FF28253CB72E2E1D6FF4F4E6FFE9E9DAFFEFEF
      E0FFF4F4E6FFEFEFE0FF52A25FFF3DA44CFF5CCE6FFF349642FF3C9649FF3DA5
      4DFF5CCE6FFF57C869FF298B36FF2E2E1D6F2E2E1D6FF4F4E6FFE9E9DAFFEFEF
      E0FFF4F4E6FFEFEFE0FFE9E9DAFFE9E9DAFFE9E9DAFFE9E9DAFFEFEFE0FFF4F4
      E6FFEFEFE0FFE9E9DAFFF4F4E6FF2E2E1D6F2E2E1D6FF4F4E6FFE9E9DAFFEFEF
      E0FFF4F4E6FFEFEFE0FF3787DCFF82B9FCFF92C7FFFF80BEFFFF3A9BFBFF007B
      F3FF0080F3FF0089FCFF097BCCFF1B2725AD2E2E1D6FF4F4E6FFE9E9DAFFEFEF
      E0FFF4F4E6FFEFEFE0FFDADBD8FF8D8FD9FF1F23DAFF0B0FD6FF0B0FD6FF0A0F
      D4FF0108C4FF0005BEFF0205C7FF2D2EC7FF3131216EF5F5E8FFB97341FF3535
      35FF353535FF353535FFB99275FF59A764FF2C8F3AFF70AC70FFEBEBDEFF469C
      52FF3DA84EFF5BD570FF55CE6AFF2A8B36FF3131216EF5F5E8FFB97341FF3535
      35FF353535FF353535FFB99275FFEBEBDEFFEBEBDEFFEBEBDEFFEBEBDEFFEBEB
      DEFFEBEBDEFFEBEBDEFFF5F5E8FF3131216E3131216EF5F5E8FFB97341FF3535
      35FF353535FF353535FF246CB9FF2D82DCFF348CE1FF2C87DDFF0F7BE1FF007D
      F4FF0088F9FF0D7AC8FF859495FF2D2D1E7A3131216EF5F5E8FFB97341FF3535
      35FF353535FF353535FFAD8979FF8E8BC0FF201A91FF080084FF0A0184FF0B05
      92FF0108B3FF0008BBFF0003B3FF0E0F71D53434236DF7F7ECFFFFBE8CFF9D83
      6FFF3B3B3BFF9D8978FFFFC79DFFEEEEE3FFBDBDACFFBDBDACFFCECEBDFFC6C6
      B5FF449B51FF3DAB4EFF5ADA71FF3CAE4EFF3434236DF7F7ECFFFFBE8CFF9D83
      6FFF3B3B3BFF9D8978FFFFC79DFFEEEEE3FFBDBDACFFBDBDACFFCECEBDFFC6C6
      B5FFEEEEE3FFEEEEE3FFF7F7ECFF3434236D3434236DF7F7ECFFFFBE8CFF9D83
      6FFF3B3B3BFF9D8978FFD9AC8AFFBBBEB9FF91958CFF9C9F94FF5A829DFF008B
      FFFF0E7ACAFF829092FFE8E8DEFF3434236D3434236DF7F7ECFFFFBE8CFF9D83
      6FFF3B3B3BFF9D8978FFFBC49DFFD8D8DEFF9797ABFF8F90ABFFA5A5BAFF7A79
      97FF080EA3FF0005CCFF4C4BB5FF31312E773737266BF8F8EFFFFFDBBDFFD0B1
      98FF414141FFD1B59FFFFFD7B7FFF1F1E8FFE2E2D1FFE2E2D1FFE2E2D1FFE2E2
      D1FFF1F1E8FF429A4FFF3CAC4EFF5ADD71FF3737266BF8F8EFFFFFDBBDFFD0B1
      98FF414141FFD1B59FFFFFD7B7FFF1F1E8FFE2E2D1FFE2E2D1FFE2E2D1FFE2E2
      D1FFF1F1E8FFF1F1E8FFF8F8EFFF3737266B3737266BF8F8EFFFFFDBBDFFD0B1
      98FF414141FFD1B59FFFFFD7B7FFF1F1E8FFE2E2D1FFE2E2D1FF809DAAFF0878
      C8FF89989BFFE4E4DBFFF8F8EFFF3737266B3737266BF8F8EFFFFFDBBDFFD0B1
      98FF414141FFD1B59FFFFFD7B7FFF1F1E8FFE2E2D1FFE2E2D1FFE2E2D1FFAEAE
      A8FF0307A2FF4345BEFFEAEBECFF3737266B3A3A286AFAFAF4FFFFD4B0FF645D
      57FF494949FF645B53FFFFD2ADFFF5F5EEFFC5C5B4FFD6D6C5FFC5C5B4FFC5C5
      B4FFD6D6C5FFCECEBDFF3E994CFF3CA74CFF3A3A286AFAFAF4FFFFD4B0FF645D
      57FF494949FF645B53FFFFD2ADFFF5F5EEFFC5C5B4FFD6D6C5FFC5C5B4FFC5C5
      B4FFD6D6C5FFCECEBDFFFAFAF4FF3A3A286A3A3A286AFAFAF4FFFFD4B0FF645D
      57FF494949FF645B53FFFFD2ADFFF5F5EEFFC5C5B4FFD6D6C5FFA9AEA2FF8D94
      8CFFC7C7B7FFCECEBDFFFAFAF4FF3A3A286A3A3A286AFAFAF4FFFFD4B0FF645D
      57FF494949FF645B53FFFFD2ADFFF5F5EEFFC5C5B4FFD6D6C5FFC5C5B4FF9F9F
      A1FF5654A8FFBBBBBFFFFAFAF4FF3A3A286A3D3D2B69FCFCF7FFFEC18CFF4F4F
      4FFF4F4F4FFF4F4F4FFFFFDCBEFFF8F8F3FFEBEBDAFFEBEBDAFFEBEBDAFFF8F8
      F3FFF8F8F3FFF8F8F3FFFCFCF7FF459D51FF3D3D2B69FCFCF7FFFEC18CFF4F4F
      4FFF4F4F4FFF4F4F4FFFFFDCBEFFF8F8F3FFEBEBDAFFEBEBDAFFEBEBDAFFF8F8
      F3FFF8F8F3FFF8F8F3FFFCFCF7FF3D3D2B693D3D2B69FCFCF7FFFEC18CFF4F4F
      4FFF4F4F4FFF4F4F4FFFFFDCBEFFF8F8F3FFEBEBDAFFEBEBDAFFEBEBDAFFF8F8
      F3FFF8F8F3FFF8F8F3FFFCFCF7FF3D3D2B693D3D2B69FCFCF7FFFEC18CFF4F4F
      4FFF4F4F4FFF4F4F4FFFFFDCBEFFF8F8F3FFEBEBDAFFEBEBDAFFEBEBDAFFF8F8
      F3FFF8F8F3FFF8F8F3FFFCFCF7FF3D3D2B693E3E2D68FDFDFAFFFDC38DFF908A
      85FF535353FF908A85FFFECC9DFFFBFBF7FFCCCCBBFFDDDDCCFFD5D5C4FFFBFB
      F7FFFBFBF7FFFBFBF7FFFDFDFAFF3E3E2D683E3E2D68FDFDFAFFFDC38DFF908A
      85FF535353FF908A85FFFECC9DFFFBFBF7FFCCCCBBFFDDDDCCFFD5D5C4FFFBFB
      F7FFFBFBF7FFFBFBF7FFFDFDFAFF3E3E2D683E3E2D68FDFDFAFFFDC38DFF908A
      85FF535353FF908A85FFFECC9DFFFBFBF7FFCCCCBBFFDDDDCCFFD5D5C4FFFBFB
      F7FFFBFBF7FFFBFBF7FFFDFDFAFF3E3E2D683E3E2D68FDFDFAFFFDC38DFF908A
      85FF535353FF908A85FFFECC9DFFFBFBF7FFCCCCBBFFDDDDCCFFD5D5C4FFFBFB
      F7FFFBFBF7FFFBFBF7FFFDFDFAFF3E3E2D6841413068FEFEFDFFFDC996FFFDC9
      96FFFDC996FFFDC996FFFED7B1FFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFD
      FBFFFDFDFBFFFDFDFBFFFEFEFDFF4141306841413068FEFEFDFFFDC996FFFDC9
      96FFFDC996FFFDC996FFFED7B1FFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFD
      FBFFFDFDFBFFFDFDFBFFFEFEFDFF4141306841413068FEFEFDFFFDC996FFFDC9
      96FFFDC996FFFDC996FFFED7B1FFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFD
      FBFFFDFDFBFFFDFDFBFFFEFEFDFF4141306841413068FEFEFDFFFDC996FFFDC9
      96FFFDC996FFFDC996FFFED7B1FFFDFDFBFFFDFDFBFFFDFDFBFFFDFDFBFFFDFD
      FBFFFDFDFBFFFDFDFBFFFEFEFDFF4141306843433167FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4343316743433167FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4343316743433167FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF4343316743433167FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF434331673333254D44443366444433664444
      3366444433664444336644443366444433664444336644443366444433664444
      33664444336644443366444433663333254D3333254D44443366444433664444
      3366444433664444336644443366444433664444336644443366444433664444
      33664444336644443366444433663333254D3333254D44443366444433664444
      3366444433664444336644443366444433664444336644443366444433664444
      33664444336644443366444433663333254D3333254D44443366444433664444
      3366444433664444336644443366444433664444336644443366444433664444
      33664444336644443366444433663333254D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object dsLog: TDataSource
    OnDataChange = dsLogDataChange
    Left = 352
    Top = 312
  end
  object pmLog: TPopupMenu
    Left = 272
    Top = 112
    object miQSL: TMenuItem
      Caption = 'QSL'
      object TMenuItem
      end
      object N112: TMenuItem
        Caption = '11'
      end
      object N111: TMenuItem
        Caption = '-'
      end
      object N1111: TMenuItem
        Caption = '111'
      end
      object N11111: TMenuItem
        Caption = '1111'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N1112: TMenuItem
        Caption = '111'
      end
    end
  end
end
