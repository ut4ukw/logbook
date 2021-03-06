object dmCatOmniRig: TdmCatOmniRig
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 299
  Width = 374
  object qryBandGrid: TKADaoTable
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
      
        'SELECT bandgrid_band_mhz, min(bandgrid_freq_begin)  as fmin, max' +
        '(bandgrid_freq_end)  as fmax from bandgrid WHERE  bandgrid_band_' +
        'mhz=:bandgrid_band_mhz group by bandgrid_band_mhz')
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
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'bandgrid_band_mhz'
        ParamType = ptUnknown
      end>
  end
  object qryBandGridFreq: TKADaoTable
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
      
        'SELECT * from bandgrid WHERE :freq  BETWEEN bandgrid_freq_begin ' +
        'and  bandgrid_freq_end')
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
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'freq'
        ParamType = ptUnknown
      end>
    object qryBandGridFreqBANDGRID_ID: TAutoIncField
      FieldName = 'BANDGRID_ID'
    end
    object qryBandGridFreqBANDGRID_BAND_MHZ: TFloatField
      FieldName = 'BANDGRID_BAND_MHZ'
    end
    object qryBandGridFreqBANDGRID_MODE_NAME: TStringField
      FieldName = 'BANDGRID_MODE_NAME'
      Size = 50
    end
    object qryBandGridFreqBANDGRID_FREQ_BEGIN: TFloatField
      FieldName = 'BANDGRID_FREQ_BEGIN'
    end
    object qryBandGridFreqBANDGRID_FREQ_END: TFloatField
      FieldName = 'BANDGRID_FREQ_END'
    end
  end
  object cdsBandGrid: TJvMemoryData
    FieldDefs = <
      item
        Name = 'BANDGRID_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'BANDGRID_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'BANDGRID_MODE_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BANDGRID_FREQ_BEGIN'
        DataType = ftFloat
      end
      item
        Name = 'BANDGRID_FREQ_END'
        DataType = ftFloat
      end>
    Left = 168
    Top = 16
    object cdsBandGridBANDGRID_ID: TAutoIncField
      FieldName = 'BANDGRID_ID'
    end
    object cdsBandGridBANDGRID_BAND_MHZ: TFloatField
      FieldName = 'BANDGRID_BAND_MHZ'
    end
    object cdsBandGridBANDGRID_MODE_NAME: TStringField
      FieldName = 'BANDGRID_MODE_NAME'
      Size = 50
    end
    object cdsBandGridBANDGRID_FREQ_BEGIN: TFloatField
      FieldName = 'BANDGRID_FREQ_BEGIN'
    end
    object cdsBandGridBANDGRID_FREQ_END: TFloatField
      FieldName = 'BANDGRID_FREQ_END'
    end
  end
  object dsLogEdit: TDataSource
    OnDataChange = dsLogEditDataChange
    Left = 232
    Top = 184
  end
  object qryBandGridModeFreq: TKADaoTable
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
      
        'SELECT * from bandgrid WHERE :freq  BETWEEN bandgrid_freq_begin ' +
        'and  bandgrid_freq_end AND bandgrid_mode_name=:mode')
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
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'freq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mode'
        ParamType = ptUnknown
      end>
  end
  object qryCatMode: TKADaoTable
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
      
        'SELECT bandgrid_band_mhz, min(bandgrid_freq_begin)  as fmin, max' +
        '(bandgrid_freq_end)  as fmax from bandgrid WHERE  bandgrid_band_' +
        'mhz=:bandgrid_band_mhz group by bandgrid_band_mhz')
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
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'bandgrid_band_mhz'
        ParamType = ptUnknown
      end>
  end
  object qryBandGridModeCatFreq: TKADaoTable
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
      
        'SELECT * from bandgrid WHERE :freq  BETWEEN bandgrid_freq_begin ' +
        'and  bandgrid_freq_end AND bandgrid_cat_mode=:mode')
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
    Left = 160
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'freq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'mode'
        ParamType = ptUnknown
      end>
  end
end
