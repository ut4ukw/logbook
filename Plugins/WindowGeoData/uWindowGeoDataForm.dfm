object WindowGeoDataForm: TWindowGeoDataForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowGeoDataForm'
  ClientHeight = 274
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 259
    Height = 274
    Align = alClient
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object lbLatitude: TLabel
      Left = 38
      Top = 106
      Width = 55
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbLatitude'
    end
    object lbLongitude: TLabel
      Left = 28
      Top = 132
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbLongitude'
    end
    object lbTerritory: TLabel
      Left = 33
      Top = 47
      Width = 60
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbTerritory'
    end
    object lbContinent: TLabel
      Left = 29
      Top = 19
      Width = 64
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbContinent'
    end
    object lbLocator: TLabel
      Left = 41
      Top = 75
      Width = 52
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbLocator'
    end
    object lbPrefix: TLabel
      Left = 28
      Top = 161
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbLongitude'
    end
    object lbDxccId: TLabel
      Left = 29
      Top = 191
      Width = 65
      Height = 16
      Alignment = taRightJustify
      Caption = 'lbLongitude'
    end
    object dbeLocator: TDBEdit
      Left = 96
      Top = 72
      Width = 143
      Height = 24
      DataField = 'LOG_GRIDSQUARE'
      TabOrder = 2
      OnKeyDown = dbeLocatorKeyDown
      OnKeyPress = dbeLocatorKeyPress
      OnKeyUp = dbeLocatorKeyUp
    end
    object dbceLatitude: TJvDBCalcEdit
      Left = 96
      Top = 100
      Width = 143
      Height = 24
      DecimalPlaces = 10
      DisplayFormat = '0.0000000000'
      TabOrder = 3
      DecimalPlacesAlwaysShown = True
      OnKeyUp = dbceLatitudeKeyUp
      DataField = 'LOG_LAT'
    end
    object dbceLongitude: TJvDBCalcEdit
      Left = 96
      Top = 128
      Width = 143
      Height = 24
      DecimalPlaces = 10
      DisplayFormat = '0.0000000000'
      TabOrder = 4
      DecimalPlacesAlwaysShown = True
      OnKeyUp = dbceLongitudeKeyUp
      DataField = 'LOG_LON'
    end
    object dbePrefix: TDBEdit
      Left = 96
      Top = 158
      Width = 143
      Height = 24
      DataField = 'LOG_PFX'
      TabOrder = 5
    end
    object dbceDxccId: TJvDBCalcEdit
      Left = 96
      Top = 188
      Width = 143
      Height = 24
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 6
      DecimalPlacesAlwaysShown = False
      DataField = 'LOG_DXCC'
    end
    object dblContinents: TJvDBLookupCombo
      Left = 96
      Top = 16
      Width = 143
      Height = 23
      DataField = 'LOG_CONT'
      Enabled = False
      LookupField = 'CONTINENT_SH_NAME'
      LookupDisplay = 'CONTINENT_NAME'
      LookupSource = dsContinents
      TabOrder = 0
      OnClick = dblContinentsClick
    end
    object dblTerritory: TJvDBLookupCombo
      Left = 96
      Top = 43
      Width = 143
      Height = 23
      DataField = 'LOG_DXCC'
      EmptyValue = 'vvvvv'
      Enabled = False
      LookupField = 'ADIF_ID'
      LookupDisplay = 'TERRITORY_NAME'
      LookupSource = dsTerritory
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 0
      Top = 255
      Width = 259
      Height = 19
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 7
      object imgTime: TImage
        Left = 2
        Top = 2
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C0000020A4944415478DA8D93CD6BD360
          1CC7BF4FD7B5A64BDBB475E9FAB2ACEE254D55F0E0C5C28481971D046F8A30E6
          DDC30E2A2D3B7810041D19E21FE0450A8A7AF1E651A1524544D7B420385699C8
          F01D8BCEADAFF1C9931A1A32DD7E971F247C3EDF7C9FF0105DD7B197B9B7981D
          A08B3B73EDD9AFFEE7642F82BBF963594248C9E522E874BAF367979E172C417E
          66F8BFF0E1A329062B8A048EF342D3D6D06E77E6E7965F147615648E4859BA4A
          998363888E8451FFB1094200AD6C4ACEDD7C59F8A7403E94C8129092D7EB81AC
          8C1A001EDE7F8AD3733330AAF424C28E82F1F4C8345D4525232110E4515BDDC0
          A41C47BDFE1B6254C0F676132BAF56D168B4920E8134214ED3CEC5216E1F26A6
          6210423CBADD2E4D75B1F70C7EBD66C0B9F3B7AAAA4D1097223499D0E4240201
          1FD66B9F706032068FC76DC1E5951A83176EBF516D8728C60496ECE739A4C6A3
          08068768B2CEFA5A70F91D9A14BE70E7AD6AFB8DA1FD3C83E57482811FDE7F85
          941AC6E0A0DB01E71FD4D4FECAE4EA2989C12181C7E89808BF9F73246B06DC6C
          E57ED6B7D4EB8F3FDBCE8C5C3999D4A76433F9E3C677C412119A3CD0835BA868
          06DCCE6D6D3658B243707936AE2B4A02E1B0DF915CA9AC33B8D5685B9FED102C
          9E1067698547E99EE42F5C35E18BDD8E7EA31F70088CCB440FD2946412F0F9BC
          A86A26BCF4E48B0DDE69ACDB78E9788449DCB47F8BC2CBC56FBBC2C6FC01AE42
          F47680B888D10000000049454E44AE426082}
      end
      object lbsTime: TLabel
        Tag = -1
        Left = 21
        Top = 2
        Width = 4
        Height = 16
      end
      object Image1: TImage
        Left = 112
        Top = 2
        Width = 16
        Height = 16
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF610000001974455874536F6674776172650041646F62
          6520496D616765526561647971C9653C000003224944415478DA95935D489361
          14C7FFEFEB744E27D398A59B9AA9F38BCCB99BD014CD8FBCC8D41BB30F2F0CED
          6205B9880421A205694A7E34504310499448F1A63108CA500619950D519BA22E
          D36DE6A64B4D36755FBDEF234951373D70789F87E79CDF73FEE73D87F27ABDF8
          9FF5BC2E9D57DE30E6F875A6FE05E8EDEDCD653E72C6D219133366626C8C366B
          AD9C8DCF72B7CB79EBF2A3F72D7F00140A05A452E921667B372424A426353515
          A1A1A108080880DD6E87D56AC5C4C40404DC5D7C7BD70787CD587745F5E9E101
          A0BBBB3B99A6E9E9949414A4A5A581A228B85C2EF4F5F5A1A2A2021C0E07ACEF
          E4E424743A1D380635EC96B9BA0340575757474646863C3A3611EB5B0E08F934
          DC6E37161616101F1FBFAF9781FAFBFB636666064BB3E330BE79B22FA1A3A323
          332C2C4C5B5A5A8AA5D54D34BCB020FF381FB9893C2C2E7E81442221326C361B
          222222C0E7F3A156AB61D63EDD07A854AAFE8282824B313131D8DEDEC6C88C1D
          431F7F4024A0912DB6212D290A66B3192291083C1E0F818181301A8D500FF4EA
          09A0A5A5C5585555256635B3E66154A95E6FE2EBDA1E1282B790E9D423B6208F
          04B38BAD0797CB65655B09A0A9A969B7A6A6C6AFA7A707494949C469C3EE857E
          9D8B9B65322CD65E83F5543EDC4744E44EAFD7A3BABA1AADADADFB12EAEBEB8D
          72B95CCCEADCDBDB234E0E8703A60FE3383A3506E7EC3428512478B795004DC3
          D7D717414141686F6F5F2300A5F2DEB3E2E2920B6C0D565757B1B3B3038BC502
          A15008DBA201616F87E199D2C1A7E4227C4E1792FE585959C1E0E0A086001AAF
          9F7D1C925A72A3B2B2127373732458201090974C2613222323E165005ECD10E8
          AB0A484EA6A3BFBF1F0683A1886A2C8BF1A168DAC5979D8734AB0832998CBD20
          523C1E0F79492C1613597E5E0FA219D8E482011A8D6640A95496930CEE9F8BCA
          F5060A87778E152227270759595944C6F2F232464747919D9D4DB2609B48ABD5
          626464846DB20CA6F863079D78E74C782EC5E50F079FC8032D4C20A0B8B83822
          C3E974627E7E9E0432197532C10F9A9B9B4D7F4D636D4E289942F7E1E4EFEE70
          A988E95DF6CCFE7C767C5F31D6D9D6D6F6F2F7C9FD09C7BE75479D5B64220000
          000049454E44AE426082}
      end
      object lbDistance: TLabel
        Tag = -1
        Left = 22
        Top = 2
        Width = 4
        Height = 16
      end
      object lbBearing: TLabel
        Tag = -1
        Left = 132
        Top = 3
        Width = 4
        Height = 16
      end
    end
  end
  object dsContinents: TDataSource
    DataSet = qryContinents
    OnDataChange = dsContinentsDataChange
    Left = 72
    Top = 32
  end
  object dsTerritory: TDataSource
    DataSet = qryTerritory
    OnDataChange = dsTerritoryDataChange
    Left = 72
    Top = 128
  end
  object qryContinents: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'CONTINENTS'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
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
    AfterScroll = qryContinentsAfterScroll
    Left = 24
    Top = 32
  end
  object qryTerritory: TKADaoTable
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
      'SELECT'
      'TERRITORY.TERRITORY_name,'
      'TERRITORY.TERRITORY_ID,'
      'TERRITORY.CONTINENT_ID,'
      'TERRITORY.ADIF_ID'
      'FROM territory'
      'where continent_id=:continent_id'
      'UNION ALL'
      'SELECT'
      'TERRITORY.TERRITORY_name,'
      'TERRITORY.TERRITORY_ID,'
      'TERRITORY.CONTINENT_ID,'
      'TERRITORY.ADIF_ID'
      'FROM territory'
      'where territory_id=-1'
      'ORDER BY 1')
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
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'continent_id'
        ParamType = ptUnknown
      end>
  end
end
