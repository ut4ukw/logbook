object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 669
  Width = 650
  object dsLogEdit: TDataSource
    DataSet = qryLogEdit
    Left = 152
    Top = 16
  end
  object dsStations: TDataSource
    AutoEdit = False
    DataSet = qryStations
    Left = 232
    Top = 16
  end
  object dsLog: TDataSource
    DataSet = qryLog
    OnDataChange = dsLogDataChange
    Left = 88
    Top = 16
  end
  object qryLogEdit: TJvMemoryData
    FieldDefs = <
      item
        Name = 'LOG_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'LOG_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QTH'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_OPERATOR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CALL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSO_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_RST_RCVD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_RST_SENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_LON'
        DataType = ftFloat
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
        Name = 'LOG_ADDRESS'
        DataType = ftMemo
      end
      item
        Name = 'LOG_AGE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_ARRL_SECT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CONTEST_ID'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_CQZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_DXCC'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_ITUZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_NOTES'
        DataType = ftMemo
      end
      item
        Name = 'LOG_PFX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_PROP_MODE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSLMSG'
        DataType = ftString
        Size = 255
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
        Name = 'LOG_RX_PWR'
        DataType = ftFloat
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
        Size = 1
      end
      item
        Name = 'LOG_EQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
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
        Size = 1
      end
      item
        Name = 'LOG_LOTW_QSL_SENT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_CONT'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOG_MY_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_POSTAL_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_BAND'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CONTINENT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CITY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STREET'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_MY_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MY_LON'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSL_SENT_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSL_RCVD_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_DQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_DQSL_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EMAIL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_A_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_AZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_EL'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_PATH'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_BAND_RX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CHECK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CLASS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CONTACTED_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CREDIT_SUBMITTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CREDIT_GRANTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_DISTANCE'
        DataType = ftFloat
      end
      item
        Name = 'LOG_EQ_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FORCE_INIT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ_RX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_GUEST_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_K_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MAX_BURSTS'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MS_SHOWER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_MY_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CQ_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_ITU_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_NR_BURSTS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NR_PINGS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_OWNER_CALLSIGN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_PRECEDENCE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_PUBLIC_KEY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_QSO_COMPLETE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSO_DATE_OFF'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSO_RANDOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SAT_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_SAT_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SFI'
        DataType = ftFloat
      end
      item
        Name = 'LOG_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SRX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_SRX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_STX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_STX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SWL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_TX_PWR'
        DataType = ftFloat
      end
      item
        Name = 'LOG_WEB'
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
        Name = 'LOG_CALL_ORIGINAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CUSTOM_STAT1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT4'
        DataType = ftString
        Size = 10
      end>
    BeforePost = qryLogEditBeforePost
    Left = 152
    Top = 72
    object qryLogEditLOG_ID: TAutoIncField
      FieldName = 'LOG_ID'
    end
    object qryLogEditLOG_GRIDSQUARE: TStringField
      FieldName = 'LOG_GRIDSQUARE'
      Size = 10
    end
    object qryLogEditLOG_QTH: TStringField
      FieldName = 'LOG_QTH'
      Size = 50
    end
    object qryLogEditLOG_OPERATOR: TStringField
      FieldName = 'LOG_OPERATOR'
      Size = 25
    end
    object qryLogEditLOG_CALL: TStringField
      FieldName = 'LOG_CALL'
      Required = True
    end
    object qryLogEditLOG_FREQ: TFloatField
      FieldName = 'LOG_FREQ'
    end
    object qryLogEditLOG_QSO_DATE: TDateTimeField
      FieldName = 'LOG_QSO_DATE'
    end
    object qryLogEditLOG_RST_RCVD: TStringField
      FieldName = 'LOG_RST_RCVD'
      Size = 255
    end
    object qryLogEditLOG_RST_SENT: TStringField
      FieldName = 'LOG_RST_SENT'
      Size = 255
    end
    object qryLogEditLOG_LAT: TFloatField
      FieldName = 'LOG_LAT'
    end
    object qryLogEditLOG_LON: TFloatField
      FieldName = 'LOG_LON'
    end
    object qryLogEditLOG_COMMENT: TStringField
      FieldName = 'LOG_COMMENT'
      Size = 255
    end
    object qryLogEditLOG_QSLSDATE: TDateTimeField
      FieldName = 'LOG_QSLSDATE'
    end
    object qryLogEditLOG_QSLRDATE: TDateTimeField
      FieldName = 'LOG_QSLRDATE'
    end
    object qryLogEditLOG_ADDRESS: TMemoField
      FieldName = 'LOG_ADDRESS'
      BlobType = ftMemo
    end
    object qryLogEditLOG_AGE: TSmallintField
      FieldName = 'LOG_AGE'
    end
    object qryLogEditLOG_ARRL_SECT: TStringField
      FieldName = 'LOG_ARRL_SECT'
      Size = 10
    end
    object qryLogEditLOG_CNTY: TStringField
      FieldName = 'LOG_CNTY'
      Size = 10
    end
    object qryLogEditLOG_CONTEST_ID: TStringField
      FieldName = 'LOG_CONTEST_ID'
      Size = 50
    end
    object qryLogEditLOG_CQZ: TSmallintField
      FieldName = 'LOG_CQZ'
    end
    object qryLogEditLOG_DXCC: TSmallintField
      FieldName = 'LOG_DXCC'
    end
    object qryLogEditLOG_IOTA: TStringField
      FieldName = 'LOG_IOTA'
      Size = 10
    end
    object qryLogEditLOG_ITUZ: TSmallintField
      FieldName = 'LOG_ITUZ'
    end
    object qryLogEditLOG_NAME: TStringField
      FieldName = 'LOG_NAME'
      Size = 50
    end
    object qryLogEditLOG_NOTES: TMemoField
      FieldName = 'LOG_NOTES'
      BlobType = ftMemo
    end
    object qryLogEditLOG_PFX: TStringField
      FieldName = 'LOG_PFX'
      Size = 10
    end
    object qryLogEditLOG_PROP_MODE: TStringField
      FieldName = 'LOG_PROP_MODE'
      Size = 255
    end
    object qryLogEditLOG_QSLMSG: TStringField
      FieldName = 'LOG_QSLMSG'
      Size = 255
    end
    object qryLogEditLOG_QSL_RCVD: TStringField
      FieldName = 'LOG_QSL_RCVD'
      Required = True
      Size = 255
    end
    object qryLogEditLOG_QSL_SENT: TStringField
      FieldName = 'LOG_QSL_SENT'
      Required = True
      Size = 255
    end
    object qryLogEditLOG_QSL_VIA: TStringField
      FieldName = 'LOG_QSL_VIA'
      Size = 255
    end
    object qryLogEditLOG_RX_PWR: TFloatField
      FieldName = 'LOG_RX_PWR'
    end
    object qryLogEditLOG_EQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLRDATE'
    end
    object qryLogEditLOG_EQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLSDATE'
    end
    object qryLogEditLOG_EQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_EQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object qryLogEditLOG_EQSL_QSL_SENT: TStringField
      FieldName = 'LOG_EQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object qryLogEditLOG_LOTW_QSLRDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLRDATE'
    end
    object qryLogEditLOG_LOTW_QSLSDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLSDATE'
    end
    object qryLogEditLOG_LOTW_QSL_RCVD: TStringField
      FieldName = 'LOG_LOTW_QSL_RCVD'
      Size = 1
    end
    object qryLogEditLOG_LOTW_QSL_SENT: TStringField
      FieldName = 'LOG_LOTW_QSL_SENT'
      Size = 1
    end
    object qryLogEditLOG_CONT: TStringField
      FieldName = 'LOG_CONT'
      Size = 2
    end
    object qryLogEditLOG_MY_NAME: TStringField
      FieldName = 'LOG_MY_NAME'
      Size = 25
    end
    object qryLogEditLOG_MY_POSTAL_CODE: TStringField
      FieldName = 'LOG_MY_POSTAL_CODE'
      Size = 10
    end
    object qryLogEditLOG_MY_COUNTRY: TStringField
      FieldName = 'LOG_MY_COUNTRY'
      Size = 25
    end
    object qryLogEditLOG_BAND: TStringField
      FieldName = 'LOG_BAND'
      Size = 10
    end
    object qryLogEditLOG_MODE: TStringField
      FieldName = 'LOG_MODE'
      Size = 10
    end
    object qryLogEditLOG_COUNTRY: TStringField
      FieldName = 'LOG_COUNTRY'
      Size = 25
    end
    object qryLogEditLOG_CONTINENT: TStringField
      FieldName = 'LOG_CONTINENT'
      Size = 10
    end
    object qryLogEditLOG_MY_CITY: TStringField
      FieldName = 'LOG_MY_CITY'
      Size = 25
    end
    object qryLogEditLOG_MY_STREET: TStringField
      FieldName = 'LOG_MY_STREET'
      Size = 50
    end
    object qryLogEditLOG_MY_GRIDSQUARE: TStringField
      FieldName = 'LOG_MY_GRIDSQUARE'
      Size = 10
    end
    object qryLogEditLOG_MY_LAT: TFloatField
      FieldName = 'LOG_MY_LAT'
    end
    object qryLogEditLOG_MY_LON: TFloatField
      FieldName = 'LOG_MY_LON'
    end
    object qryLogEditLOG_QSL_SENT_VIA: TStringField
      FieldName = 'LOG_QSL_SENT_VIA'
      Size = 10
    end
    object qryLogEditLOG_QSL_RCVD_VIA: TStringField
      FieldName = 'LOG_QSL_RCVD_VIA'
      Size = 10
    end
    object qryLogEditLOG_BAND_MHZ: TFloatField
      FieldName = 'LOG_BAND_MHZ'
    end
    object qryLogEditLOG_DQSL_QSL_SENT: TStringField
      FieldName = 'LOG_DQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object qryLogEditLOG_DQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_DQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object qryLogEditLOG_DQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLRDATE'
    end
    object qryLogEditLOG_DQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLSDATE'
    end
    object qryLogEditLOG_EMAIL: TStringField
      FieldName = 'LOG_EMAIL'
    end
    object qryLogEditLOG_A_INDEX: TFloatField
      FieldName = 'LOG_A_INDEX'
    end
    object qryLogEditLOG_ANT_AZ: TFloatField
      FieldName = 'LOG_ANT_AZ'
    end
    object qryLogEditLOG_ANT_EL: TFloatField
      FieldName = 'LOG_ANT_EL'
    end
    object qryLogEditLOG_ANT_PATH: TStringField
      FieldName = 'LOG_ANT_PATH'
    end
    object qryLogEditLOG_BAND_RX: TStringField
      FieldName = 'LOG_BAND_RX'
      Size = 10
    end
    object qryLogEditLOG_CHECK: TStringField
      FieldName = 'LOG_CHECK'
    end
    object qryLogEditLOG_CLASS: TStringField
      FieldName = 'LOG_CLASS'
    end
    object qryLogEditLOG_CONTACTED_OP: TStringField
      FieldName = 'LOG_CONTACTED_OP'
      Size = 25
    end
    object qryLogEditLOG_CREDIT_SUBMITTED: TStringField
      FieldName = 'LOG_CREDIT_SUBMITTED'
    end
    object qryLogEditLOG_CREDIT_GRANTED: TStringField
      FieldName = 'LOG_CREDIT_GRANTED'
    end
    object qryLogEditLOG_DISTANCE: TFloatField
      FieldName = 'LOG_DISTANCE'
    end
    object qryLogEditLOG_EQ_CALL: TStringField
      FieldName = 'LOG_EQ_CALL'
    end
    object qryLogEditLOG_FORCE_INIT: TStringField
      FieldName = 'LOG_FORCE_INIT'
    end
    object qryLogEditLOG_FREQ_RX: TFloatField
      FieldName = 'LOG_FREQ_RX'
    end
    object qryLogEditLOG_GUEST_OP: TStringField
      FieldName = 'LOG_GUEST_OP'
      Size = 25
    end
    object qryLogEditLOG_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_IOTA_ISLAND_ID'
      Size = 10
    end
    object qryLogEditLOG_K_INDEX: TFloatField
      FieldName = 'LOG_K_INDEX'
    end
    object qryLogEditLOG_MAX_BURSTS: TFloatField
      FieldName = 'LOG_MAX_BURSTS'
    end
    object qryLogEditLOG_MS_SHOWER: TStringField
      FieldName = 'LOG_MS_SHOWER'
    end
    object qryLogEditLOG_MY_CNTY: TStringField
      FieldName = 'LOG_MY_CNTY'
      Size = 10
    end
    object qryLogEditLOG_MY_CQ_ZONE: TSmallintField
      FieldName = 'LOG_MY_CQ_ZONE'
    end
    object qryLogEditLOG_MY_IOTA: TStringField
      FieldName = 'LOG_MY_IOTA'
      Size = 10
    end
    object qryLogEditLOG_MY_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_MY_IOTA_ISLAND_ID'
      Size = 10
    end
    object qryLogEditLOG_MY_ITU_ZONE: TSmallintField
      FieldName = 'LOG_MY_ITU_ZONE'
    end
    object qryLogEditLOG_MY_RIG: TStringField
      FieldName = 'LOG_MY_RIG'
      Size = 25
    end
    object qryLogEditLOG_MY_SIG: TStringField
      FieldName = 'LOG_MY_SIG'
      Size = 25
    end
    object qryLogEditLOG_MY_SIG_INFO: TStringField
      FieldName = 'LOG_MY_SIG_INFO'
      Size = 25
    end
    object qryLogEditLOG_MY_STATE: TStringField
      FieldName = 'LOG_MY_STATE'
      Size = 10
    end
    object qryLogEditLOG_NR_BURSTS: TSmallintField
      FieldName = 'LOG_NR_BURSTS'
    end
    object qryLogEditLOG_NR_PINGS: TSmallintField
      FieldName = 'LOG_NR_PINGS'
    end
    object qryLogEditLOG_OWNER_CALLSIGN: TStringField
      FieldName = 'LOG_OWNER_CALLSIGN'
    end
    object qryLogEditLOG_PRECEDENCE: TStringField
      FieldName = 'LOG_PRECEDENCE'
      Size = 25
    end
    object qryLogEditLOG_PUBLIC_KEY: TStringField
      FieldName = 'LOG_PUBLIC_KEY'
      Size = 25
    end
    object qryLogEditLOG_QSO_COMPLETE: TStringField
      FieldName = 'LOG_QSO_COMPLETE'
      Size = 10
    end
    object qryLogEditLOG_QSO_DATE_OFF: TDateTimeField
      FieldName = 'LOG_QSO_DATE_OFF'
    end
    object qryLogEditLOG_QSO_RANDOM: TStringField
      FieldName = 'LOG_QSO_RANDOM'
      Size = 10
    end
    object qryLogEditLOG_RIG: TStringField
      FieldName = 'LOG_RIG'
      Size = 25
    end
    object qryLogEditLOG_SAT_MODE: TStringField
      FieldName = 'LOG_SAT_MODE'
      Size = 10
    end
    object qryLogEditLOG_SAT_NAME: TStringField
      FieldName = 'LOG_SAT_NAME'
      Size = 25
    end
    object qryLogEditLOG_SFI: TFloatField
      FieldName = 'LOG_SFI'
    end
    object qryLogEditLOG_SIG: TStringField
      FieldName = 'LOG_SIG'
      Size = 25
    end
    object qryLogEditLOG_SIG_INFO: TStringField
      FieldName = 'LOG_SIG_INFO'
      Size = 25
    end
    object qryLogEditLOG_SRX: TSmallintField
      FieldName = 'LOG_SRX'
    end
    object qryLogEditLOG_SRX_STRING: TStringField
      FieldName = 'LOG_SRX_STRING'
      Size = 25
    end
    object qryLogEditLOG_STATE: TStringField
      FieldName = 'LOG_STATE'
      Size = 10
    end
    object qryLogEditLOG_STX: TSmallintField
      FieldName = 'LOG_STX'
    end
    object qryLogEditLOG_STX_STRING: TStringField
      FieldName = 'LOG_STX_STRING'
      Size = 25
    end
    object qryLogEditLOG_SWL: TStringField
      FieldName = 'LOG_SWL'
      Size = 25
    end
    object qryLogEditLOG_TX_PWR: TFloatField
      FieldName = 'LOG_TX_PWR'
    end
    object qryLogEditLOG_WEB: TStringField
      FieldName = 'LOG_WEB'
      Size = 255
    end
    object qryLogEditLOG_QSO_TIME: TDateTimeField
      FieldName = 'LOG_QSO_TIME'
    end
    object qryLogEditLOG_QSO_DATETIME: TDateTimeField
      FieldName = 'LOG_QSO_DATETIME'
    end
    object qryLogEditLOG_CALL_ORIGINAL: TStringField
      FieldName = 'LOG_CALL_ORIGINAL'
      Required = True
    end
    object qryLogEditLOG_CUSTOM_STAT1: TStringField
      FieldName = 'LOG_CUSTOM_STAT1'
      Size = 10
    end
    object qryLogEditLOG_CUSTOM_STAT2: TStringField
      FieldName = 'LOG_CUSTOM_STAT2'
      Size = 10
    end
    object qryLogEditLOG_CUSTOM_STAT3: TStringField
      FieldName = 'LOG_CUSTOM_STAT3'
      Size = 10
    end
    object qryLogEditLOG_CUSTOM_STAT4: TStringField
      FieldName = 'LOG_CUSTOM_STAT4'
      Size = 10
    end
    object qryLogEditSTATION_ID: TIntegerField
      FieldName = 'STATION_ID'
    end
  end
  object DAODatabase: TKADaoDatabase
    ComponentVersion = '2009.1'
    Exclusive = False
    DatabaseType = 'Access'
    Database = 
      'C:\Users\melnichenko.ADVENTIS\Documents\RAD Studio\Projects\UT4U' +
      'KW\LogBook\Distr\Data\Database\Logbook.mdb'
    ReadOnly = False
    LoginPrompt = False
    UserName = 'Admin'
    UseODBCDialog = True
    SystemDatabase = 'system.mdb'
    SaveUserName = True
    ShowSystemObjects = False
    SmartOpen = True
    EngineType = 2
    PrivateEngine = False
    TrackTransactions = True
    UsesDynaDao = True
    Version = '3.6'
    VersionDetails = '3.6'
    VersionInfo = '(In Access'#39'2000 mode)'
    Workspace = 'DaoWorkspace'
    DefaultCursorDriver = -1
    QueryTimeout = 60
    MdbVersionAutoDetect = False
    Left = 24
    Top = 16
  end
  object qryLog: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'LOG_2'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'LOG_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'LOG_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QTH'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_OPERATOR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CALL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSO_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_RST_RCVD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_RST_SENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_LON'
        DataType = ftFloat
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
        Name = 'LOG_ADDRESS'
        DataType = ftMemo
      end
      item
        Name = 'LOG_AGE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_ARRL_SECT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CONTEST_ID'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_CQZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_DXCC'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_ITUZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_NOTES'
        DataType = ftMemo
      end
      item
        Name = 'LOG_PFX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_PROP_MODE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSLMSG'
        DataType = ftString
        Size = 255
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
        Name = 'LOG_RX_PWR'
        DataType = ftFloat
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
        Size = 1
      end
      item
        Name = 'LOG_EQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
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
        Size = 1
      end
      item
        Name = 'LOG_LOTW_QSL_SENT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_CONT'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOG_MY_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_POSTAL_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_BAND'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CONTINENT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CITY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STREET'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_MY_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MY_LON'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSL_SENT_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSL_RCVD_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_DQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_DQSL_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EMAIL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_A_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_AZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_EL'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_PATH'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_BAND_RX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CHECK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CLASS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CONTACTED_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CREDIT_SUBMITTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CREDIT_GRANTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_DISTANCE'
        DataType = ftFloat
      end
      item
        Name = 'LOG_EQ_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FORCE_INIT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ_RX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_GUEST_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_K_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MAX_BURSTS'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MS_SHOWER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_MY_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CQ_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_ITU_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_NR_BURSTS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NR_PINGS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_OWNER_CALLSIGN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_PRECEDENCE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_PUBLIC_KEY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_QSO_COMPLETE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSO_DATE_OFF'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSO_RANDOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SAT_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_SAT_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SFI'
        DataType = ftFloat
      end
      item
        Name = 'LOG_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SRX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_SRX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_STX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_STX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SWL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_TX_PWR'
        DataType = ftFloat
      end
      item
        Name = 'LOG_WEB'
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
        Name = 'LOG_CALL_ORIGINAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CUSTOM_STAT1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT4'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    IndexFieldCount = 0
    ReadOnly = False
    LockEdits = False
    KeyField = 'LOG_ID'
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
    AfterOpen = qryLogAfterOpen
    BeforePost = qryLogBeforePost
    AfterScroll = qryLogAfterScroll
    Left = 88
    Top = 72
    object qryLogLOG_ID: TAutoIncField
      FieldName = 'LOG_ID'
    end
    object qryLogLOG_GRIDSQUARE: TStringField
      FieldName = 'LOG_GRIDSQUARE'
      Size = 10
    end
    object qryLogLOG_QTH: TStringField
      FieldName = 'LOG_QTH'
      Size = 50
    end
    object qryLogLOG_OPERATOR: TStringField
      FieldName = 'LOG_OPERATOR'
      Size = 25
    end
    object qryLogLOG_CALL: TStringField
      FieldName = 'LOG_CALL'
      Required = True
      OnValidate = qryLogLOG_CALLValidate
    end
    object qryLogLOG_FREQ: TFloatField
      FieldName = 'LOG_FREQ'
    end
    object qryLogLOG_QSO_DATE: TDateTimeField
      FieldName = 'LOG_QSO_DATE'
      OnValidate = qryLogLOG_QSO_DATEValidate
    end
    object qryLogLOG_RST_RCVD: TStringField
      FieldName = 'LOG_RST_RCVD'
      Size = 10
    end
    object qryLogLOG_RST_SENT: TStringField
      FieldName = 'LOG_RST_SENT'
      Size = 10
    end
    object qryLogLOG_LAT: TFloatField
      FieldName = 'LOG_LAT'
    end
    object qryLogLOG_LON: TFloatField
      FieldName = 'LOG_LON'
    end
    object qryLogLOG_COMMENT: TStringField
      FieldName = 'LOG_COMMENT'
      Size = 255
    end
    object qryLogLOG_QSLSDATE: TDateTimeField
      FieldName = 'LOG_QSLSDATE'
    end
    object qryLogLOG_QSLRDATE: TDateTimeField
      FieldName = 'LOG_QSLRDATE'
    end
    object qryLogLOG_ADDRESS: TMemoField
      FieldName = 'LOG_ADDRESS'
      BlobType = ftMemo
    end
    object qryLogLOG_AGE: TSmallintField
      FieldName = 'LOG_AGE'
    end
    object qryLogLOG_ARRL_SECT: TStringField
      FieldName = 'LOG_ARRL_SECT'
      Size = 10
    end
    object qryLogLOG_CNTY: TStringField
      FieldName = 'LOG_CNTY'
      Size = 10
    end
    object qryLogLOG_CONTEST_ID: TStringField
      FieldName = 'LOG_CONTEST_ID'
      Size = 50
    end
    object qryLogLOG_CQZ: TSmallintField
      FieldName = 'LOG_CQZ'
    end
    object qryLogLOG_DXCC: TSmallintField
      FieldName = 'LOG_DXCC'
    end
    object qryLogLOG_IOTA: TStringField
      FieldName = 'LOG_IOTA'
      Size = 10
    end
    object qryLogLOG_ITUZ: TSmallintField
      FieldName = 'LOG_ITUZ'
    end
    object qryLogLOG_NAME: TStringField
      FieldName = 'LOG_NAME'
      Size = 50
    end
    object qryLogLOG_NOTES: TMemoField
      FieldName = 'LOG_NOTES'
      BlobType = ftMemo
    end
    object qryLogLOG_PFX: TStringField
      FieldName = 'LOG_PFX'
      Size = 10
    end
    object qryLogLOG_PROP_MODE: TStringField
      FieldName = 'LOG_PROP_MODE'
      Size = 255
    end
    object qryLogLOG_QSLMSG: TStringField
      FieldName = 'LOG_QSLMSG'
      Size = 255
    end
    object qryLogLOG_QSL_RCVD: TStringField
      FieldName = 'LOG_QSL_RCVD'
      Required = True
      Size = 255
    end
    object qryLogLOG_QSL_SENT: TStringField
      FieldName = 'LOG_QSL_SENT'
      Required = True
      Size = 255
    end
    object qryLogLOG_QSL_VIA: TStringField
      FieldName = 'LOG_QSL_VIA'
      Size = 255
    end
    object qryLogLOG_RX_PWR: TFloatField
      FieldName = 'LOG_RX_PWR'
    end
    object qryLogLOG_EQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLRDATE'
    end
    object qryLogLOG_EQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLSDATE'
    end
    object qryLogLOG_EQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_EQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object qryLogLOG_EQSL_QSL_SENT: TStringField
      FieldName = 'LOG_EQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object qryLogLOG_LOTW_QSLRDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLRDATE'
    end
    object qryLogLOG_LOTW_QSLSDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLSDATE'
    end
    object qryLogLOG_LOTW_QSL_RCVD: TStringField
      FieldName = 'LOG_LOTW_QSL_RCVD'
      Size = 1
    end
    object qryLogLOG_LOTW_QSL_SENT: TStringField
      FieldName = 'LOG_LOTW_QSL_SENT'
      Size = 1
    end
    object qryLogLOG_CONT: TStringField
      FieldName = 'LOG_CONT'
      Size = 2
    end
    object qryLogLOG_MY_NAME: TStringField
      FieldName = 'LOG_MY_NAME'
      Size = 25
    end
    object qryLogLOG_MY_POSTAL_CODE: TStringField
      FieldName = 'LOG_MY_POSTAL_CODE'
      Size = 10
    end
    object qryLogLOG_MY_COUNTRY: TStringField
      FieldName = 'LOG_MY_COUNTRY'
      Size = 25
    end
    object qryLogLOG_BAND: TStringField
      FieldName = 'LOG_BAND'
      Size = 10
    end
    object qryLogLOG_MODE: TStringField
      FieldName = 'LOG_MODE'
      Size = 10
    end
    object qryLogLOG_COUNTRY: TStringField
      FieldName = 'LOG_COUNTRY'
      Size = 25
    end
    object qryLogLOG_CONTINENT: TStringField
      FieldName = 'LOG_CONTINENT'
      Size = 10
    end
    object qryLogLOG_MY_CITY: TStringField
      FieldName = 'LOG_MY_CITY'
      Size = 25
    end
    object qryLogLOG_MY_STREET: TStringField
      FieldName = 'LOG_MY_STREET'
      Size = 50
    end
    object qryLogLOG_MY_GRIDSQUARE: TStringField
      FieldName = 'LOG_MY_GRIDSQUARE'
      Size = 10
    end
    object qryLogLOG_MY_LAT: TFloatField
      FieldName = 'LOG_MY_LAT'
    end
    object qryLogLOG_MY_LON: TFloatField
      FieldName = 'LOG_MY_LON'
    end
    object qryLogLOG_QSL_SENT_VIA: TStringField
      FieldName = 'LOG_QSL_SENT_VIA'
      Size = 10
    end
    object qryLogLOG_QSL_RCVD_VIA: TStringField
      FieldName = 'LOG_QSL_RCVD_VIA'
      Size = 10
    end
    object qryLogLOG_BAND_MHZ: TFloatField
      FieldName = 'LOG_BAND_MHZ'
    end
    object qryLogLOG_DQSL_QSL_SENT: TStringField
      FieldName = 'LOG_DQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object qryLogLOG_DQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_DQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object qryLogLOG_DQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLRDATE'
    end
    object qryLogLOG_DQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLSDATE'
    end
    object qryLogLOG_EMAIL: TStringField
      FieldName = 'LOG_EMAIL'
    end
    object qryLogLOG_A_INDEX: TFloatField
      FieldName = 'LOG_A_INDEX'
    end
    object qryLogLOG_ANT_AZ: TFloatField
      FieldName = 'LOG_ANT_AZ'
    end
    object qryLogLOG_ANT_EL: TFloatField
      FieldName = 'LOG_ANT_EL'
    end
    object qryLogLOG_ANT_PATH: TStringField
      FieldName = 'LOG_ANT_PATH'
    end
    object qryLogLOG_BAND_RX: TStringField
      FieldName = 'LOG_BAND_RX'
      Size = 10
    end
    object qryLogLOG_CHECK: TStringField
      FieldName = 'LOG_CHECK'
    end
    object qryLogLOG_CLASS: TStringField
      FieldName = 'LOG_CLASS'
    end
    object qryLogLOG_CONTACTED_OP: TStringField
      FieldName = 'LOG_CONTACTED_OP'
      Size = 25
    end
    object qryLogLOG_CREDIT_SUBMITTED: TStringField
      FieldName = 'LOG_CREDIT_SUBMITTED'
    end
    object qryLogLOG_CREDIT_GRANTED: TStringField
      FieldName = 'LOG_CREDIT_GRANTED'
    end
    object qryLogLOG_DISTANCE: TFloatField
      FieldName = 'LOG_DISTANCE'
    end
    object qryLogLOG_EQ_CALL: TStringField
      FieldName = 'LOG_EQ_CALL'
    end
    object qryLogLOG_FORCE_INIT: TStringField
      FieldName = 'LOG_FORCE_INIT'
    end
    object qryLogLOG_FREQ_RX: TFloatField
      FieldName = 'LOG_FREQ_RX'
    end
    object qryLogLOG_GUEST_OP: TStringField
      FieldName = 'LOG_GUEST_OP'
      Size = 25
    end
    object qryLogLOG_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_IOTA_ISLAND_ID'
      Size = 10
    end
    object qryLogLOG_K_INDEX: TFloatField
      FieldName = 'LOG_K_INDEX'
    end
    object qryLogLOG_MAX_BURSTS: TFloatField
      FieldName = 'LOG_MAX_BURSTS'
    end
    object qryLogLOG_MS_SHOWER: TStringField
      FieldName = 'LOG_MS_SHOWER'
    end
    object qryLogLOG_MY_CNTY: TStringField
      FieldName = 'LOG_MY_CNTY'
      Size = 10
    end
    object qryLogLOG_MY_CQ_ZONE: TSmallintField
      FieldName = 'LOG_MY_CQ_ZONE'
    end
    object qryLogLOG_MY_IOTA: TStringField
      FieldName = 'LOG_MY_IOTA'
      Size = 10
    end
    object qryLogLOG_MY_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_MY_IOTA_ISLAND_ID'
      Size = 10
    end
    object qryLogLOG_MY_ITU_ZONE: TSmallintField
      FieldName = 'LOG_MY_ITU_ZONE'
    end
    object qryLogLOG_MY_RIG: TStringField
      FieldName = 'LOG_MY_RIG'
      Size = 25
    end
    object qryLogLOG_MY_SIG: TStringField
      FieldName = 'LOG_MY_SIG'
      Size = 25
    end
    object qryLogLOG_MY_SIG_INFO: TStringField
      FieldName = 'LOG_MY_SIG_INFO'
      Size = 25
    end
    object qryLogLOG_MY_STATE: TStringField
      FieldName = 'LOG_MY_STATE'
      Size = 10
    end
    object qryLogLOG_NR_BURSTS: TSmallintField
      FieldName = 'LOG_NR_BURSTS'
    end
    object qryLogLOG_NR_PINGS: TSmallintField
      FieldName = 'LOG_NR_PINGS'
    end
    object qryLogLOG_OWNER_CALLSIGN: TStringField
      FieldName = 'LOG_OWNER_CALLSIGN'
    end
    object qryLogLOG_PRECEDENCE: TStringField
      FieldName = 'LOG_PRECEDENCE'
      Size = 25
    end
    object qryLogLOG_PUBLIC_KEY: TStringField
      FieldName = 'LOG_PUBLIC_KEY'
      Size = 25
    end
    object qryLogLOG_QSO_COMPLETE: TStringField
      FieldName = 'LOG_QSO_COMPLETE'
      Size = 10
    end
    object qryLogLOG_QSO_DATE_OFF: TDateTimeField
      FieldName = 'LOG_QSO_DATE_OFF'
    end
    object qryLogLOG_QSO_RANDOM: TStringField
      FieldName = 'LOG_QSO_RANDOM'
      Size = 10
    end
    object qryLogLOG_RIG: TStringField
      FieldName = 'LOG_RIG'
      Size = 25
    end
    object qryLogLOG_SAT_MODE: TStringField
      FieldName = 'LOG_SAT_MODE'
      Size = 10
    end
    object qryLogLOG_SAT_NAME: TStringField
      FieldName = 'LOG_SAT_NAME'
      Size = 25
    end
    object qryLogLOG_SFI: TFloatField
      FieldName = 'LOG_SFI'
    end
    object qryLogLOG_SIG: TStringField
      FieldName = 'LOG_SIG'
      Size = 25
    end
    object qryLogLOG_SIG_INFO: TStringField
      FieldName = 'LOG_SIG_INFO'
      Size = 25
    end
    object qryLogLOG_SRX: TSmallintField
      FieldName = 'LOG_SRX'
    end
    object qryLogLOG_SRX_STRING: TStringField
      FieldName = 'LOG_SRX_STRING'
      Size = 25
    end
    object qryLogLOG_STATE: TStringField
      FieldName = 'LOG_STATE'
      Size = 10
    end
    object qryLogLOG_STX: TSmallintField
      FieldName = 'LOG_STX'
    end
    object qryLogLOG_STX_STRING: TStringField
      FieldName = 'LOG_STX_STRING'
      Size = 25
    end
    object qryLogLOG_SWL: TStringField
      FieldName = 'LOG_SWL'
      Size = 25
    end
    object qryLogLOG_TX_PWR: TFloatField
      FieldName = 'LOG_TX_PWR'
    end
    object qryLogLOG_WEB: TStringField
      FieldName = 'LOG_WEB'
      Size = 255
    end
    object qryLogLOG_QSO_TIME: TDateTimeField
      FieldName = 'LOG_QSO_TIME'
      OnValidate = qryLogLOG_QSO_TIMEValidate
    end
    object qryLogLOG_QSO_DATETIME: TDateTimeField
      FieldName = 'LOG_QSO_DATETIME'
    end
    object qryLogLOG_CALL_ORIGINAL: TStringField
      FieldName = 'LOG_CALL_ORIGINAL'
    end
    object qryLogLOG_CUSTOM_STAT1: TStringField
      FieldName = 'LOG_CUSTOM_STAT1'
      Size = 10
    end
    object qryLogLOG_CUSTOM_STAT2: TStringField
      FieldName = 'LOG_CUSTOM_STAT2'
      Size = 10
    end
    object qryLogLOG_CUSTOM_STAT3: TStringField
      FieldName = 'LOG_CUSTOM_STAT3'
      Size = 10
    end
    object qryLogLOG_CUSTOM_STAT4: TStringField
      FieldName = 'LOG_CUSTOM_STAT4'
      Size = 10
    end
  end
  object qryStations: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'STATIONS'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'STATION_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'STATION_CALL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_STREET'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_GRIDSQUARE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_LAT'
        DataType = ftFloat
      end
      item
        Name = 'STATION_LON'
        DataType = ftFloat
      end
      item
        Name = 'STATION_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_CITY'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_COUNTRY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_ITU_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CQ_ZONE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_POSTAL_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'STATION_RIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_EQSL_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_EQSL_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_BOOK_NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_BOOK_DESCRIPTION'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_EQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_SMTP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_SMTP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_DQSL_MAIL_USERNAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_MAIL_PASSWORD'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_DEFAULT_TEMPLATE'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'STATION_DQSL_POP_HOST'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'STATION_DQSL_POP_PORT'
        DataType = ftInteger
      end
      item
        Name = 'STATION_CNTY'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_SIG'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_SIG_INFO'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'STATION_STATE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_LOTW_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_LOTW_HOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HRDLOG_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'STATION_EQSL_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HRDLOG_SENT_EVERY'
        DataType = ftInteger
      end
      item
        Name = 'STATION_PARENT_ID'
        DataType = ftInteger
      end
      item
        Name = 'IS_GROUP'
        DataType = ftInteger
      end
      item
        Name = 'STATION_HAMQTH_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_HAMQTH_PASSWORD'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_LOGIN'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'STATION_QRZCOM_PASSWORD'
        DataType = ftString
        Size = 100
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
    AfterInsert = qryStationsAfterInsert
    Left = 248
    Top = 72
    object qryStationsSTATION_ID: TAutoIncField
      FieldName = 'STATION_ID'
      ReadOnly = True
    end
    object qryStationsSTATION_CALL: TStringField
      FieldName = 'STATION_CALL'
      Size = 100
    end
    object qryStationsSTATION_STREET: TStringField
      FieldName = 'STATION_STREET'
      Size = 255
    end
    object qryStationsSTATION_GRIDSQUARE: TStringField
      FieldName = 'STATION_GRIDSQUARE'
      Size = 255
    end
    object qryStationsSTATION_LAT: TFloatField
      FieldName = 'STATION_LAT'
      Precision = 7
    end
    object qryStationsSTATION_LON: TFloatField
      FieldName = 'STATION_LON'
      Precision = 7
    end
    object qryStationsSTATION_NAME: TStringField
      FieldName = 'STATION_NAME'
      Size = 255
    end
    object qryStationsSTATION_CITY: TStringField
      FieldName = 'STATION_CITY'
      Size = 255
    end
    object qryStationsSTATION_COUNTRY: TIntegerField
      FieldName = 'STATION_COUNTRY'
    end
    object qryStationsSTATION_ITU_ZONE: TIntegerField
      FieldName = 'STATION_ITU_ZONE'
    end
    object qryStationsSTATION_CQ_ZONE: TIntegerField
      FieldName = 'STATION_CQ_ZONE'
    end
    object qryStationsSTATION_POSTAL_CODE: TStringField
      FieldName = 'STATION_POSTAL_CODE'
    end
    object qryStationsSTATION_RIG: TStringField
      FieldName = 'STATION_RIG'
      Size = 255
    end
    object qryStationsSTATION_EQSL_LOGIN: TStringField
      FieldName = 'STATION_EQSL_LOGIN'
      Size = 100
    end
    object qryStationsSTATION_EQSL_PASSWORD: TStringField
      FieldName = 'STATION_EQSL_PASSWORD'
      Size = 100
    end
    object qryStationsSTATION_BOOK_NAME: TStringField
      FieldName = 'STATION_BOOK_NAME'
      Size = 254
    end
    object qryStationsSTATION_BOOK_DESCRIPTION: TStringField
      FieldName = 'STATION_BOOK_DESCRIPTION'
      Size = 254
    end
    object qryStationsSTATION_EQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_EQSL_ACTIVE'
    end
    object qryStationsSTATION_DQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_DQSL_ACTIVE'
    end
    object qryStationsSTATION_DQSL_SMTP_HOST: TStringField
      FieldName = 'STATION_DQSL_SMTP_HOST'
      Size = 50
    end
    object qryStationsSTATION_DQSL_SMTP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_SMTP_PORT'
    end
    object qryStationsSTATION_DQSL_MAIL_USERNAME: TStringField
      FieldName = 'STATION_DQSL_MAIL_USERNAME'
      Size = 50
    end
    object qryStationsSTATION_DQSL_MAIL_PASSWORD: TStringField
      FieldName = 'STATION_DQSL_MAIL_PASSWORD'
      Size = 50
    end
    object qryStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField
      FieldName = 'STATION_DQSL_DEFAULT_TEMPLATE'
      Size = 254
    end
    object qryStationsSTATION_DQSL_POP_HOST: TStringField
      FieldName = 'STATION_DQSL_POP_HOST'
      Size = 50
    end
    object qryStationsSTATION_DQSL_POP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_POP_PORT'
    end
    object qryStationsSTATION_CNTY: TStringField
      FieldName = 'STATION_CNTY'
      Size = 100
    end
    object qryStationsSTATION_IOTA: TStringField
      FieldName = 'STATION_IOTA'
      Size = 100
    end
    object qryStationsSTATION_IOTA_ISLAND_ID: TStringField
      FieldName = 'STATION_IOTA_ISLAND_ID'
      Size = 100
    end
    object qryStationsSTATION_SIG: TStringField
      FieldName = 'STATION_SIG'
      Size = 255
    end
    object qryStationsSTATION_SIG_INFO: TStringField
      FieldName = 'STATION_SIG_INFO'
      Size = 255
    end
    object qryStationsSTATION_STATE: TStringField
      FieldName = 'STATION_STATE'
      Size = 100
    end
    object qryStationsSTATION_LOTW_ACTIVE: TIntegerField
      FieldName = 'STATION_LOTW_ACTIVE'
    end
    object qryStationsSTATION_LOTW_LOGIN: TStringField
      FieldName = 'STATION_LOTW_LOGIN'
      Size = 100
    end
    object qryStationsSTATION_LOTW_PASSWORD: TStringField
      FieldName = 'STATION_LOTW_PASSWORD'
      Size = 100
    end
    object qryStationsSTATION_LOTW_HOME: TStringField
      FieldName = 'STATION_LOTW_HOME'
      Size = 100
    end
    object qryStationsSTATION_HRDLOG_LOGIN: TStringField
      FieldName = 'STATION_HRDLOG_LOGIN'
      Size = 100
    end
    object qryStationsSTATION_HRDLOG_PASSWORD: TStringField
      FieldName = 'STATION_HRDLOG_PASSWORD'
      Size = 100
    end
    object qryStationsSTATION_HRDLOG_ACTIVE: TIntegerField
      FieldName = 'STATION_HRDLOG_ACTIVE'
    end
    object qryStationsSTATION_EQSL_SENT_EVERY: TIntegerField
      FieldName = 'STATION_EQSL_SENT_EVERY'
    end
    object qryStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField
      FieldName = 'STATION_HRDLOG_SENT_EVERY'
    end
    object qryStationsSTATION_PARENT_ID: TIntegerField
      FieldName = 'STATION_PARENT_ID'
    end
    object qryStationsIS_GROUP: TIntegerField
      FieldName = 'IS_GROUP'
    end
    object qryStationsSTATION_HAMQTH_LOGIN: TStringField
      FieldName = 'STATION_HAMQTH_LOGIN'
      Size = 100
    end
    object qryStationsSTATION_HAMQTH_PASSWORD: TStringField
      FieldName = 'STATION_HAMQTH_PASSWORD'
      Size = 100
    end
    object qryStationsSTATION_QRZCOM_LOGIN: TStringField
      FieldName = 'STATION_QRZCOM_LOGIN'
      Size = 100
    end
    object qryStationsSTATION_QRZCOM_PASSWORD: TStringField
      FieldName = 'STATION_QRZCOM_PASSWORD'
      Size = 100
    end
  end
  object qryExportEQSLStations: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'STATIONS'
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
    Left = 88
    Top = 144
  end
  object qryBands: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'BANDS'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
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
    Left = 88
    Top = 208
    object qryBandsBAND_ID: TAutoIncField
      FieldName = 'BAND_ID'
    end
    object qryBandsBAND_MHZ: TFloatField
      FieldName = 'BAND_MHZ'
      Precision = 3
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
  object qryContinents: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
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
    Left = 184
    Top = 208
  end
  object qryLogUpdate: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
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
    Left = 376
    Top = 16
  end
  object frDesigner: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    OnLoadReport = frDesignerLoadReport
    OnLoadRecentReport = frDesignerLoadRecentReport
    OnSaveReport = frDesignerSaveReport
    OnShow = frDesignerShow
    Left = 392
    Top = 288
  end
  object Report: TfrxReport
    Version = '4.10.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40603.493462638900000000
    ReportOptions.LastChange = 40604.508177569400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '{  '
      'select count(*) as qso_count,  '
      '          l.log_dxcc,'
      
        '          t.territory_name,                                     ' +
        '                      '
      
        '          (select count(*) from [SELECT log_qsl_sent FROM $LOG_T' +
        'ABLE$]  where log_qsl_sent='#39'Y'#39' and log_dxcc=l.log_dxcc) as qsl_s' +
        'ent'
      'from '
      '[SELECT log_dxcc,'
      '            log_qsl_sent,'
      '            log_qsl_rcvd,'
      '            log_eqsl_qsl_sent,'
      '            log_eqsl_qsl_rcvd'
      'FROM $LOG_TABLE$]'
      'l,'
      'territory t'
      
        'WHERE l.log_dxcc=t.adif_id                                      ' +
        '                   '
      'group by l.log_dxcc,t.territory_name    '
      '}'
      '  '
      'procedure DialogPage1OnShow(Sender: TfrxComponent);'
      'begin'
      ' dblStations.Dataset.Open;'
      ' dblStations.KeyValue:=<StationId>;                        '
      'end;'
      ''
      'procedure Button1OnClick(Sender: TfrxComponent);'
      'begin'
      'ReportChangeSQL();      '
      'end;  '
      ''
      ''
      ''
      'begin'
      ''
      'end.')
    OnPreview = ReportPreview
    OnAfterPrintReport = ReportAfterPrintReport
    OnProgressStart = ReportProgressStart
    OnProgressStop = ReportProgressStop
    OnUserFunction = ReportUserFunction
    Left = 448
    Top = 288
    Datasets = <
      item
        DataSet = frDBPrintReport
        DataSetName = 'frDBPrintReport'
      end
      item
        DataSet = frDBPrintStations
        DataSetName = 'frDBPrintStations'
      end>
    Variables = <
      item
        Name = ' Main'
        Value = Null
      end
      item
        Name = 'StationId'
        Value = '2'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 18.897650000000000000
        Top = 83.149660000000000000
        Width = 718.110700000000000000
        DataSet = frDBPrintReport
        DataSetName = 'frDBPrintReport'
        RowCount = 0
        object Memo2: TfrxMemoView
          Top = -0.000000000000002762
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frDBPrintReport."LOG_DXCC"]')
          ParentFont = False
        end
        object frDBPrintReportqsl_sent: TfrxMemoView
          Left = 94.488250000000000000
          Top = -0.000000000000002762
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'qsl_sent'
          DataSet = frDBPrintReport
          DataSetName = 'frDBPrintReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frDBPrintReport."qsl_sent"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Top = -0.000000000000004247
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
    object DialogPage1: TfrxDialogPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      BorderStyle = bsDialog
      Height = 165.000000000000000000
      ClientHeight = 127.000000000000000000
      Left = 426.000000000000000000
      Top = 262.000000000000000000
      Width = 300.000000000000000000
      ClientWidth = 284.000000000000000000
      OnShow = 'DialogPage1OnShow'
      object btnReport: TfrxButtonControl
        Left = 72.000000000000000000
        Top = 96.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = #1054#1090#1095#1077#1090
        ModalResult = 1
        OnClick = 'Button1OnClick'
      end
      object cbAllStations: TfrxCheckBoxControl
        Left = 24.000000000000000000
        Top = 56.000000000000000000
        Width = 245.000000000000000000
        Height = 17.000000000000000000
        ShowHint = True
        Caption = #1055#1086' '#1074#1089#1077#1084' '#1078#1091#1088#1085#1072#1083#1072#1084
        Color = clBtnFace
      end
      object dblStations: TfrxDBLookupComboBox
        Left = 24.000000000000000000
        Top = 20.000000000000000000
        Width = 245.000000000000000000
        Height = 21.000000000000000000
        ShowHint = True
        ListField = 'STATION_NAME'
        DataSet = frDBPrintStations
        DataSetName = 'frDBPrintStations'
        KeyField = 'STATION_ID'
        DropDownWidth = 0
        DropDownRows = 7
      end
      object Button2: TfrxButtonControl
        Left = 156.000000000000000000
        Top = 96.000000000000000000
        Width = 75.000000000000000000
        Height = 25.000000000000000000
        ShowHint = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 40
    Top = 416
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 128
    Top = 424
  end
  object frxJPEGExport: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 32
    Top = 528
  end
  object frxSimpleTextExport1: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    Left = 224
    Top = 424
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Separator = ';'
    OEMCodepage = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 224
    Top = 480
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 40
    Top = 468
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    Left = 128
    Top = 480
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 544
    Top = 288
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 544
    Top = 336
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 536
    Top = 456
  end
  object frxChartObject1: TfrxChartObject
    Left = 544
    Top = 384
  end
  object qryModes: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'MODES'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'MODE_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'MODE_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'MODE_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'MODE_TITLE'
        DataType = ftString
        Size = 50
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
    Left = 88
    Top = 272
  end
  object frDBPrintQSL: TfrxDBDataset
    UserName = 'frDBPrintQSL'
    CloseDataSource = False
    DataSet = cdsPrintQSL
    BCDToCurrency = False
    Left = 448
    Top = 352
  end
  object cdsPrintQSL: TJvMemoryData
    FieldDefs = <
      item
        Name = 'LOG_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'LOG_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QTH'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_OPERATOR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CALL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSO_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_RST_RCVD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_RST_SENT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_LON'
        DataType = ftFloat
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
        Name = 'LOG_ADDRESS'
        DataType = ftMemo
      end
      item
        Name = 'LOG_AGE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_ARRL_SECT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CONTEST_ID'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_CQZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_DXCC'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_ITUZ'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_NOTES'
        DataType = ftMemo
      end
      item
        Name = 'LOG_PFX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_PROP_MODE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOG_QSLMSG'
        DataType = ftString
        Size = 255
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
        Name = 'LOG_RX_PWR'
        DataType = ftFloat
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
        Size = 1
      end
      item
        Name = 'LOG_EQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
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
        Size = 1
      end
      item
        Name = 'LOG_LOTW_QSL_SENT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_CONT'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'LOG_MY_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_POSTAL_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_BAND'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_COUNTRY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CONTINENT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CITY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STREET'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LOG_MY_GRIDSQUARE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_LAT'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MY_LON'
        DataType = ftFloat
      end
      item
        Name = 'LOG_QSL_SENT_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSL_RCVD_VIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_BAND_MHZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_DQSL_QSL_SENT'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSL_RCVD'
        Attributes = [faRequired]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOG_DQSL_QSLRDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_DQSL_QSLSDATE'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_EMAIL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_A_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_AZ'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_EL'
        DataType = ftFloat
      end
      item
        Name = 'LOG_ANT_PATH'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_BAND_RX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CHECK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CLASS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CONTACTED_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_CREDIT_SUBMITTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CREDIT_GRANTED'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_DISTANCE'
        DataType = ftFloat
      end
      item
        Name = 'LOG_EQ_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FORCE_INIT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_FREQ_RX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_GUEST_OP'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_K_INDEX'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MAX_BURSTS'
        DataType = ftFloat
      end
      item
        Name = 'LOG_MS_SHOWER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_MY_CNTY'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_CQ_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_IOTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_IOTA_ISLAND_ID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_MY_ITU_ZONE'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_MY_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_MY_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_NR_BURSTS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_NR_PINGS'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_OWNER_CALLSIGN'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_PRECEDENCE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_PUBLIC_KEY'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_QSO_COMPLETE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_QSO_DATE_OFF'
        DataType = ftDateTime
      end
      item
        Name = 'LOG_QSO_RANDOM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_RIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SAT_MODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_SAT_NAME'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SFI'
        DataType = ftFloat
      end
      item
        Name = 'LOG_SIG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SIG_INFO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SRX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_SRX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_STATE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_STX'
        DataType = ftSmallint
      end
      item
        Name = 'LOG_STX_STRING'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_SWL'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'LOG_TX_PWR'
        DataType = ftFloat
      end
      item
        Name = 'LOG_WEB'
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
        Name = 'LOG_CALL_ORIGINAL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOG_CUSTOM_STAT1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOG_CUSTOM_STAT4'
        DataType = ftString
        Size = 10
      end>
    Left = 536
    Top = 528
    object cdsPrintQSLLOG_ID: TAutoIncField
      FieldName = 'LOG_ID'
    end
    object cdsPrintQSLLOG_GRIDSQUARE: TStringField
      FieldName = 'LOG_GRIDSQUARE'
      Size = 10
    end
    object cdsPrintQSLLOG_QTH: TStringField
      FieldName = 'LOG_QTH'
      Size = 50
    end
    object cdsPrintQSLLOG_OPERATOR: TStringField
      FieldName = 'LOG_OPERATOR'
      Size = 25
    end
    object cdsPrintQSLLOG_CALL: TStringField
      FieldName = 'LOG_CALL'
      Required = True
    end
    object cdsPrintQSLLOG_FREQ: TFloatField
      FieldName = 'LOG_FREQ'
    end
    object cdsPrintQSLLOG_QSO_DATE: TDateTimeField
      FieldName = 'LOG_QSO_DATE'
    end
    object cdsPrintQSLLOG_RST_RCVD: TStringField
      FieldName = 'LOG_RST_RCVD'
      Size = 255
    end
    object cdsPrintQSLLOG_RST_SENT: TStringField
      FieldName = 'LOG_RST_SENT'
      Size = 255
    end
    object cdsPrintQSLLOG_LAT: TFloatField
      FieldName = 'LOG_LAT'
    end
    object cdsPrintQSLLOG_LON: TFloatField
      FieldName = 'LOG_LON'
    end
    object cdsPrintQSLLOG_COMMENT: TStringField
      FieldName = 'LOG_COMMENT'
      Size = 255
    end
    object cdsPrintQSLLOG_QSLSDATE: TDateTimeField
      FieldName = 'LOG_QSLSDATE'
    end
    object cdsPrintQSLLOG_QSLRDATE: TDateTimeField
      FieldName = 'LOG_QSLRDATE'
    end
    object cdsPrintQSLLOG_ADDRESS: TMemoField
      FieldName = 'LOG_ADDRESS'
      BlobType = ftMemo
    end
    object cdsPrintQSLLOG_AGE: TSmallintField
      FieldName = 'LOG_AGE'
    end
    object cdsPrintQSLLOG_ARRL_SECT: TStringField
      FieldName = 'LOG_ARRL_SECT'
      Size = 10
    end
    object cdsPrintQSLLOG_CNTY: TStringField
      FieldName = 'LOG_CNTY'
      Size = 10
    end
    object cdsPrintQSLLOG_CONTEST_ID: TStringField
      FieldName = 'LOG_CONTEST_ID'
      Size = 50
    end
    object cdsPrintQSLLOG_CQZ: TSmallintField
      FieldName = 'LOG_CQZ'
    end
    object cdsPrintQSLLOG_DXCC: TSmallintField
      FieldName = 'LOG_DXCC'
    end
    object cdsPrintQSLLOG_IOTA: TStringField
      FieldName = 'LOG_IOTA'
      Size = 10
    end
    object cdsPrintQSLLOG_ITUZ: TSmallintField
      FieldName = 'LOG_ITUZ'
    end
    object cdsPrintQSLLOG_NAME: TStringField
      FieldName = 'LOG_NAME'
      Size = 50
    end
    object cdsPrintQSLLOG_NOTES: TMemoField
      FieldName = 'LOG_NOTES'
      BlobType = ftMemo
    end
    object cdsPrintQSLLOG_PFX: TStringField
      FieldName = 'LOG_PFX'
      Size = 10
    end
    object cdsPrintQSLLOG_PROP_MODE: TStringField
      FieldName = 'LOG_PROP_MODE'
      Size = 255
    end
    object cdsPrintQSLLOG_QSLMSG: TStringField
      FieldName = 'LOG_QSLMSG'
      Size = 255
    end
    object cdsPrintQSLLOG_QSL_RCVD: TStringField
      FieldName = 'LOG_QSL_RCVD'
      Required = True
      Size = 255
    end
    object cdsPrintQSLLOG_QSL_SENT: TStringField
      FieldName = 'LOG_QSL_SENT'
      Required = True
      Size = 255
    end
    object cdsPrintQSLLOG_QSL_VIA: TStringField
      FieldName = 'LOG_QSL_VIA'
      Size = 255
    end
    object cdsPrintQSLLOG_RX_PWR: TFloatField
      FieldName = 'LOG_RX_PWR'
    end
    object cdsPrintQSLLOG_EQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLRDATE'
    end
    object cdsPrintQSLLOG_EQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_EQSL_QSLSDATE'
    end
    object cdsPrintQSLLOG_EQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_EQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object cdsPrintQSLLOG_EQSL_QSL_SENT: TStringField
      FieldName = 'LOG_EQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object cdsPrintQSLLOG_LOTW_QSLRDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLRDATE'
    end
    object cdsPrintQSLLOG_LOTW_QSLSDATE: TDateTimeField
      FieldName = 'LOG_LOTW_QSLSDATE'
    end
    object cdsPrintQSLLOG_LOTW_QSL_RCVD: TStringField
      FieldName = 'LOG_LOTW_QSL_RCVD'
      Size = 1
    end
    object cdsPrintQSLLOG_LOTW_QSL_SENT: TStringField
      FieldName = 'LOG_LOTW_QSL_SENT'
      Size = 1
    end
    object cdsPrintQSLLOG_CONT: TStringField
      FieldName = 'LOG_CONT'
      Size = 2
    end
    object cdsPrintQSLLOG_MY_NAME: TStringField
      FieldName = 'LOG_MY_NAME'
      Size = 25
    end
    object cdsPrintQSLLOG_MY_POSTAL_CODE: TStringField
      FieldName = 'LOG_MY_POSTAL_CODE'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_COUNTRY: TStringField
      FieldName = 'LOG_MY_COUNTRY'
      Size = 25
    end
    object cdsPrintQSLLOG_BAND: TStringField
      FieldName = 'LOG_BAND'
      Size = 10
    end
    object cdsPrintQSLLOG_MODE: TStringField
      FieldName = 'LOG_MODE'
      Size = 10
    end
    object cdsPrintQSLLOG_COUNTRY: TStringField
      FieldName = 'LOG_COUNTRY'
      Size = 25
    end
    object cdsPrintQSLLOG_CONTINENT: TStringField
      FieldName = 'LOG_CONTINENT'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_CITY: TStringField
      FieldName = 'LOG_MY_CITY'
      Size = 25
    end
    object cdsPrintQSLLOG_MY_STREET: TStringField
      FieldName = 'LOG_MY_STREET'
      Size = 50
    end
    object cdsPrintQSLLOG_MY_GRIDSQUARE: TStringField
      FieldName = 'LOG_MY_GRIDSQUARE'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_LAT: TFloatField
      FieldName = 'LOG_MY_LAT'
    end
    object cdsPrintQSLLOG_MY_LON: TFloatField
      FieldName = 'LOG_MY_LON'
    end
    object cdsPrintQSLLOG_QSL_SENT_VIA: TStringField
      FieldName = 'LOG_QSL_SENT_VIA'
      Size = 10
    end
    object cdsPrintQSLLOG_QSL_RCVD_VIA: TStringField
      FieldName = 'LOG_QSL_RCVD_VIA'
      Size = 10
    end
    object cdsPrintQSLLOG_BAND_MHZ: TFloatField
      FieldName = 'LOG_BAND_MHZ'
    end
    object cdsPrintQSLLOG_DQSL_QSL_SENT: TStringField
      FieldName = 'LOG_DQSL_QSL_SENT'
      Required = True
      Size = 1
    end
    object cdsPrintQSLLOG_DQSL_QSL_RCVD: TStringField
      FieldName = 'LOG_DQSL_QSL_RCVD'
      Required = True
      Size = 1
    end
    object cdsPrintQSLLOG_DQSL_QSLRDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLRDATE'
    end
    object cdsPrintQSLLOG_DQSL_QSLSDATE: TDateTimeField
      FieldName = 'LOG_DQSL_QSLSDATE'
    end
    object cdsPrintQSLLOG_EMAIL: TStringField
      FieldName = 'LOG_EMAIL'
    end
    object cdsPrintQSLLOG_A_INDEX: TFloatField
      FieldName = 'LOG_A_INDEX'
    end
    object cdsPrintQSLLOG_ANT_AZ: TFloatField
      FieldName = 'LOG_ANT_AZ'
    end
    object cdsPrintQSLLOG_ANT_EL: TFloatField
      FieldName = 'LOG_ANT_EL'
    end
    object cdsPrintQSLLOG_ANT_PATH: TStringField
      FieldName = 'LOG_ANT_PATH'
    end
    object cdsPrintQSLLOG_BAND_RX: TStringField
      FieldName = 'LOG_BAND_RX'
      Size = 10
    end
    object cdsPrintQSLLOG_CHECK: TStringField
      FieldName = 'LOG_CHECK'
    end
    object cdsPrintQSLLOG_CLASS: TStringField
      FieldName = 'LOG_CLASS'
    end
    object cdsPrintQSLLOG_CONTACTED_OP: TStringField
      FieldName = 'LOG_CONTACTED_OP'
      Size = 25
    end
    object cdsPrintQSLLOG_CREDIT_SUBMITTED: TStringField
      FieldName = 'LOG_CREDIT_SUBMITTED'
    end
    object cdsPrintQSLLOG_CREDIT_GRANTED: TStringField
      FieldName = 'LOG_CREDIT_GRANTED'
    end
    object cdsPrintQSLLOG_DISTANCE: TFloatField
      FieldName = 'LOG_DISTANCE'
    end
    object cdsPrintQSLLOG_EQ_CALL: TStringField
      FieldName = 'LOG_EQ_CALL'
    end
    object cdsPrintQSLLOG_FORCE_INIT: TStringField
      FieldName = 'LOG_FORCE_INIT'
    end
    object cdsPrintQSLLOG_FREQ_RX: TFloatField
      FieldName = 'LOG_FREQ_RX'
    end
    object cdsPrintQSLLOG_GUEST_OP: TStringField
      FieldName = 'LOG_GUEST_OP'
      Size = 25
    end
    object cdsPrintQSLLOG_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_IOTA_ISLAND_ID'
      Size = 10
    end
    object cdsPrintQSLLOG_K_INDEX: TFloatField
      FieldName = 'LOG_K_INDEX'
    end
    object cdsPrintQSLLOG_MAX_BURSTS: TFloatField
      FieldName = 'LOG_MAX_BURSTS'
    end
    object cdsPrintQSLLOG_MS_SHOWER: TStringField
      FieldName = 'LOG_MS_SHOWER'
    end
    object cdsPrintQSLLOG_MY_CNTY: TStringField
      FieldName = 'LOG_MY_CNTY'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_CQ_ZONE: TSmallintField
      FieldName = 'LOG_MY_CQ_ZONE'
    end
    object cdsPrintQSLLOG_MY_IOTA: TStringField
      FieldName = 'LOG_MY_IOTA'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_IOTA_ISLAND_ID: TStringField
      FieldName = 'LOG_MY_IOTA_ISLAND_ID'
      Size = 10
    end
    object cdsPrintQSLLOG_MY_ITU_ZONE: TSmallintField
      FieldName = 'LOG_MY_ITU_ZONE'
    end
    object cdsPrintQSLLOG_MY_RIG: TStringField
      FieldName = 'LOG_MY_RIG'
      Size = 25
    end
    object cdsPrintQSLLOG_MY_SIG: TStringField
      FieldName = 'LOG_MY_SIG'
      Size = 25
    end
    object cdsPrintQSLLOG_MY_SIG_INFO: TStringField
      FieldName = 'LOG_MY_SIG_INFO'
      Size = 25
    end
    object cdsPrintQSLLOG_MY_STATE: TStringField
      FieldName = 'LOG_MY_STATE'
      Size = 10
    end
    object cdsPrintQSLLOG_NR_BURSTS: TSmallintField
      FieldName = 'LOG_NR_BURSTS'
    end
    object cdsPrintQSLLOG_NR_PINGS: TSmallintField
      FieldName = 'LOG_NR_PINGS'
    end
    object cdsPrintQSLLOG_OWNER_CALLSIGN: TStringField
      FieldName = 'LOG_OWNER_CALLSIGN'
    end
    object cdsPrintQSLLOG_PRECEDENCE: TStringField
      FieldName = 'LOG_PRECEDENCE'
      Size = 25
    end
    object cdsPrintQSLLOG_PUBLIC_KEY: TStringField
      FieldName = 'LOG_PUBLIC_KEY'
      Size = 25
    end
    object cdsPrintQSLLOG_QSO_COMPLETE: TStringField
      FieldName = 'LOG_QSO_COMPLETE'
      Size = 10
    end
    object cdsPrintQSLLOG_QSO_DATE_OFF: TDateTimeField
      FieldName = 'LOG_QSO_DATE_OFF'
    end
    object cdsPrintQSLLOG_QSO_RANDOM: TStringField
      FieldName = 'LOG_QSO_RANDOM'
      Size = 10
    end
    object cdsPrintQSLLOG_RIG: TStringField
      FieldName = 'LOG_RIG'
      Size = 25
    end
    object cdsPrintQSLLOG_SAT_MODE: TStringField
      FieldName = 'LOG_SAT_MODE'
      Size = 10
    end
    object cdsPrintQSLLOG_SAT_NAME: TStringField
      FieldName = 'LOG_SAT_NAME'
      Size = 25
    end
    object cdsPrintQSLLOG_SFI: TFloatField
      FieldName = 'LOG_SFI'
    end
    object cdsPrintQSLLOG_SIG: TStringField
      FieldName = 'LOG_SIG'
      Size = 25
    end
    object cdsPrintQSLLOG_SIG_INFO: TStringField
      FieldName = 'LOG_SIG_INFO'
      Size = 25
    end
    object cdsPrintQSLLOG_SRX: TSmallintField
      FieldName = 'LOG_SRX'
    end
    object cdsPrintQSLLOG_SRX_STRING: TStringField
      FieldName = 'LOG_SRX_STRING'
      Size = 25
    end
    object cdsPrintQSLLOG_STATE: TStringField
      FieldName = 'LOG_STATE'
      Size = 10
    end
    object cdsPrintQSLLOG_STX: TSmallintField
      FieldName = 'LOG_STX'
    end
    object cdsPrintQSLLOG_STX_STRING: TStringField
      FieldName = 'LOG_STX_STRING'
      Size = 25
    end
    object cdsPrintQSLLOG_SWL: TStringField
      FieldName = 'LOG_SWL'
      Size = 25
    end
    object cdsPrintQSLLOG_TX_PWR: TFloatField
      FieldName = 'LOG_TX_PWR'
    end
    object cdsPrintQSLLOG_WEB: TStringField
      FieldName = 'LOG_WEB'
      Size = 255
    end
    object cdsPrintQSLLOG_QSO_TIME: TDateTimeField
      FieldName = 'LOG_QSO_TIME'
    end
    object cdsPrintQSLLOG_QSO_DATETIME: TDateTimeField
      FieldName = 'LOG_QSO_DATETIME'
    end
    object cdsPrintQSLLOG_CALL_ORIGINAL: TStringField
      FieldName = 'LOG_CALL_ORIGINAL'
      Required = True
    end
    object cdsPrintQSLLOG_CUSTOM_STAT1: TStringField
      FieldName = 'LOG_CUSTOM_STAT1'
      Size = 10
    end
    object cdsPrintQSLLOG_CUSTOM_STAT2: TStringField
      FieldName = 'LOG_CUSTOM_STAT2'
      Size = 10
    end
    object cdsPrintQSLLOG_CUSTOM_STAT3: TStringField
      FieldName = 'LOG_CUSTOM_STAT3'
      Size = 10
    end
    object cdsPrintQSLLOG_CUSTOM_STAT4: TStringField
      FieldName = 'LOG_CUSTOM_STAT4'
      Size = 10
    end
    object cdsPrintQSLNEXT_CALL: TStringField
      FieldName = 'NEXT_CALL'
    end
  end
  object cdsManagers: TJvMemoryData
    Active = True
    UseDataSetFilter = True
    FieldDefs = <
      item
        Name = 'MANAGER_LOG_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MANAGER_MANAGER_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MANAGER_INFO'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 176
    object cdsManagersMANAGER_LOG_CALL: TStringField
      FieldName = 'MANAGER_LOG_CALL'
    end
    object cdsManagersMANAGER_MANAGER_CALL: TStringField
      FieldName = 'MANAGER_MANAGER_CALL'
    end
    object cdsManagersMANAGER_INFO: TStringField
      FieldName = 'MANAGER_INFO'
    end
  end
  object qryLastContact: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
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
    Left = 176
    Top = 272
  end
  object qryReports: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
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
    Left = 328
    Top = 288
  end
  object frDBPrintReport: TfrxDBDataset
    UserName = 'frDBPrintReport'
    CloseDataSource = False
    DataSet = qryReports
    BCDToCurrency = False
    Left = 448
    Top = 408
  end
  object qryReportStations: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      
        'SELECT STATION_ID,STATION_BOOK_NAME &'#39' ['#39'& STATION_CALL&'#39']'#39'  as ' +
        'station_name FROM STATIONS')
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
    AfterInsert = qryStationsAfterInsert
    Left = 328
    Top = 352
    object qryReportStationsSTATION_ID: TAutoIncField
      FieldName = 'STATION_ID'
    end
    object qryReportStationsstation_name: TStringField
      FieldName = 'station_name'
      Size = 255
    end
  end
  object frDBPrintStations: TfrxDBDataset
    UserName = 'frDBPrintStations'
    CloseDataSource = False
    DataSet = qryReportStations
    BCDToCurrency = False
    Left = 448
    Top = 472
  end
  object frxUserDataSet1: TfrxUserDataSet
    UserName = 'frxUserDataSet1'
    Left = 376
    Top = 592
  end
  object frxDBXComponents1: TfrxDBXComponents
    Left = 448
    Top = 528
  end
  object OpenReportDialog: TJvOpenDialog
    Filter = '*.fr3'
    Height = 0
    Width = 0
    Left = 328
    Top = 232
  end
  object SaveDialogReport: TSaveDialog
    Filter = '*.fr3|Report'
    Left = 328
    Top = 176
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 336
    Top = 480
  end
  object frDBPrintModes: TfrxDBDataset
    UserName = 'frDBPrintModes'
    CloseDataSource = False
    DataSet = qryReportModes
    BCDToCurrency = False
    Left = 288
    Top = 544
  end
  object qryReportModes: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      'SELECT * FROM MODES WHERE MODE_ACTIVE=1')
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'MODE_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'MODE_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'MODE_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'MODE_TITLE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MODE_DEFAULT_REPORT'
        DataType = ftString
        Size = 255
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
    AfterInsert = qryStationsAfterInsert
    Left = 328
    Top = 416
    object qryReportModesMODE_ID: TAutoIncField
      FieldName = 'MODE_ID'
    end
    object qryReportModesMODE_NAME: TStringField
      FieldName = 'MODE_NAME'
      Size = 100
    end
    object qryReportModesMODE_ACTIVE: TIntegerField
      FieldName = 'MODE_ACTIVE'
    end
    object qryReportModesMODE_TITLE: TStringField
      FieldName = 'MODE_TITLE'
      Size = 50
    end
    object qryReportModesMODE_DEFAULT_REPORT: TStringField
      FieldName = 'MODE_DEFAULT_REPORT'
      Size = 255
    end
  end
  object qryTerritory: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    SQL.Strings = (
      'SELECT   TERRITORY_NAME FROM'
      ' TERRITORY WHERE ADIF_ID=:ADIF_ID')
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
    Left = 232
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ADIF_ID'
        ParamType = ptUnknown
      end>
  end
  object UnZipper: TAbUnZipper
    ExtractOptions = [eoCreateDirs, eoRestorePath]
    Left = 432
    Top = 88
  end
end
