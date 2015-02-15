unit udmMain;

interface

uses
  SysUtils, Classes, DB,
  windows, Forms, uUtils, Dialogs, KDaoTable,
  KDaoDataBase, Variants, DAOApi, Math, JvMemoryDataset, frxClass, frxDesgn,
  frxExportMail, frxExportODF, frxExportCSV, frxExportText, frxExportImage,
  frxExportXLS, frxExportPDF, Controls, frxChart, frxDCtrl, frxChBox,
  frxGradient, uPluginHeaders, frxDBSet, JvCsvData, frxDBXComponents, frxCustomDB,
  JvDialogs, frxCross, AbBase, AbBrowse, AbZBrows, AbUnzper,DateUtils;

type
  TdmMain = class(TDataModule)
    dsLogEdit: TDataSource;
    dsStations: TDataSource;
    dsLog: TDataSource;
    qryLogEdit: TJvMemoryData;
    DAODatabase: TKADaoDatabase;
    qryLog: TKADaoTable;
    qryStations: TKADaoTable;
    qryExportEQSLStations: TKADaoTable;
    qryStationsSTATION_ID: TAutoIncField;
    qryStationsSTATION_CALL: TStringField;
    qryStationsSTATION_STREET: TStringField;
    qryStationsSTATION_GRIDSQUARE: TStringField;
    qryStationsSTATION_LAT: TFloatField;
    qryStationsSTATION_LON: TFloatField;
    qryStationsSTATION_NAME: TStringField;
    qryStationsSTATION_CITY: TStringField;
    qryStationsSTATION_COUNTRY: TIntegerField;
    qryStationsSTATION_ITU_ZONE: TIntegerField;
    qryStationsSTATION_CQ_ZONE: TIntegerField;
    qryStationsSTATION_POSTAL_CODE: TStringField;
    qryStationsSTATION_RIG: TStringField;
    qryStationsSTATION_EQSL_LOGIN: TStringField;
    qryStationsSTATION_EQSL_PASSWORD: TStringField;
    qryStationsSTATION_BOOK_NAME: TStringField;
    qryStationsSTATION_BOOK_DESCRIPTION: TStringField;
    qryBands: TKADaoTable;
    qryContinents: TKADaoTable;
    qryLogUpdate: TKADaoTable;
    frDesigner: TfrxDesigner;
    Report: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxJPEGExport: TfrxJPEGExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxCSVExport1: TfrxCSVExport;
    frxODTExport1: TfrxODTExport;
    frxMailExport1: TfrxMailExport;
    frxGradientObject1: TfrxGradientObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxDialogControls1: TfrxDialogControls;
    frxChartObject1: TfrxChartObject;
    qryModes: TKADaoTable;
    frDBPrintQSL: TfrxDBDataset;
    cdsPrintQSL: TJvMemoryData;
    qryStationsSTATION_EQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_ACTIVE: TIntegerField;
    qryStationsSTATION_DQSL_SMTP_HOST: TStringField;
    qryStationsSTATION_DQSL_SMTP_PORT: TIntegerField;
    qryStationsSTATION_DQSL_MAIL_USERNAME: TStringField;
    qryStationsSTATION_DQSL_MAIL_PASSWORD: TStringField;
    qryStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField;
    qryStationsSTATION_DQSL_POP_HOST: TStringField;
    qryStationsSTATION_DQSL_POP_PORT: TIntegerField;
    cdsManagers: TJvMemoryData;
    cdsManagersMANAGER_LOG_CALL: TStringField;
    cdsManagersMANAGER_MANAGER_CALL: TStringField;
    cdsManagersMANAGER_INFO: TStringField;
    qryStationsSTATION_CNTY: TStringField;
    qryStationsSTATION_IOTA: TStringField;
    qryStationsSTATION_IOTA_ISLAND_ID: TStringField;
    qryStationsSTATION_SIG: TStringField;
    qryStationsSTATION_SIG_INFO: TStringField;
    qryStationsSTATION_STATE: TStringField;
    qryLastContact: TKADaoTable;
    qryReports: TKADaoTable;
    frDBPrintReport: TfrxDBDataset;
    qryReportStations: TKADaoTable;
    qryReportStationsSTATION_ID: TAutoIncField;
    qryReportStationsstation_name: TStringField;
    frDBPrintStations: TfrxDBDataset;
    frxUserDataSet1: TfrxUserDataSet;
    frxDBXComponents1: TfrxDBXComponents;
    OpenReportDialog: TJvOpenDialog;
    SaveDialogReport: TSaveDialog;
    qryStationsSTATION_LOTW_ACTIVE: TIntegerField;
    qryStationsSTATION_LOTW_LOGIN: TStringField;
    qryStationsSTATION_LOTW_PASSWORD: TStringField;
    qryStationsSTATION_LOTW_HOME: TStringField;
    qryStationsSTATION_HRDLOG_LOGIN: TStringField;
    qryStationsSTATION_HRDLOG_PASSWORD: TStringField;
    qryStationsSTATION_HRDLOG_ACTIVE: TIntegerField;
    qryStationsSTATION_EQSL_SENT_EVERY: TIntegerField;
    qryStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField;
    frxCrossObject1: TfrxCrossObject;
    frDBPrintModes: TfrxDBDataset;
    qryReportModes: TKADaoTable;
    qryReportModesMODE_ID: TAutoIncField;
    qryReportModesMODE_NAME: TStringField;
    qryReportModesMODE_ACTIVE: TIntegerField;
    qryReportModesMODE_TITLE: TStringField;
    qryReportModesMODE_DEFAULT_REPORT: TStringField;
    qryTerritory: TKADaoTable;
    qryStationsSTATION_PARENT_ID: TIntegerField;
    qryStationsIS_GROUP: TIntegerField;
    qryStationsSTATION_HAMQTH_LOGIN: TStringField;
    qryStationsSTATION_HAMQTH_PASSWORD: TStringField;
    qryStationsSTATION_QRZCOM_LOGIN: TStringField;
    qryStationsSTATION_QRZCOM_PASSWORD: TStringField;
    qryLogLOG_ID: TAutoIncField;
    qryLogLOG_GRIDSQUARE: TStringField;
    qryLogLOG_QTH: TStringField;
    qryLogLOG_OPERATOR: TStringField;
    qryLogLOG_CALL: TStringField;
    qryLogLOG_FREQ: TFloatField;
    qryLogLOG_QSO_DATE: TDateTimeField;
    qryLogLOG_RST_RCVD: TStringField;
    qryLogLOG_RST_SENT: TStringField;
    qryLogLOG_LAT: TFloatField;
    qryLogLOG_LON: TFloatField;
    qryLogLOG_COMMENT: TStringField;
    qryLogLOG_QSLSDATE: TDateTimeField;
    qryLogLOG_QSLRDATE: TDateTimeField;
    qryLogLOG_ADDRESS: TMemoField;
    qryLogLOG_AGE: TSmallintField;
    qryLogLOG_ARRL_SECT: TStringField;
    qryLogLOG_CNTY: TStringField;
    qryLogLOG_CONTEST_ID: TStringField;
    qryLogLOG_CQZ: TSmallintField;
    qryLogLOG_DXCC: TSmallintField;
    qryLogLOG_IOTA: TStringField;
    qryLogLOG_ITUZ: TSmallintField;
    qryLogLOG_NAME: TStringField;
    qryLogLOG_NOTES: TMemoField;
    qryLogLOG_PFX: TStringField;
    qryLogLOG_PROP_MODE: TStringField;
    qryLogLOG_QSLMSG: TStringField;
    qryLogLOG_QSL_RCVD: TStringField;
    qryLogLOG_QSL_SENT: TStringField;
    qryLogLOG_QSL_VIA: TStringField;
    qryLogLOG_RX_PWR: TFloatField;
    qryLogLOG_EQSL_QSLRDATE: TDateTimeField;
    qryLogLOG_EQSL_QSLSDATE: TDateTimeField;
    qryLogLOG_EQSL_QSL_RCVD: TStringField;
    qryLogLOG_EQSL_QSL_SENT: TStringField;
    qryLogLOG_LOTW_QSLRDATE: TDateTimeField;
    qryLogLOG_LOTW_QSLSDATE: TDateTimeField;
    qryLogLOG_LOTW_QSL_RCVD: TStringField;
    qryLogLOG_LOTW_QSL_SENT: TStringField;
    qryLogLOG_CONT: TStringField;
    qryLogLOG_MY_NAME: TStringField;
    qryLogLOG_MY_POSTAL_CODE: TStringField;
    qryLogLOG_MY_COUNTRY: TStringField;
    qryLogLOG_BAND: TStringField;
    qryLogLOG_MODE: TStringField;
    qryLogLOG_COUNTRY: TStringField;
    qryLogLOG_CONTINENT: TStringField;
    qryLogLOG_MY_CITY: TStringField;
    qryLogLOG_MY_STREET: TStringField;
    qryLogLOG_MY_GRIDSQUARE: TStringField;
    qryLogLOG_MY_LAT: TFloatField;
    qryLogLOG_MY_LON: TFloatField;
    qryLogLOG_QSL_SENT_VIA: TStringField;
    qryLogLOG_QSL_RCVD_VIA: TStringField;
    qryLogLOG_BAND_MHZ: TFloatField;
    qryLogLOG_DQSL_QSL_SENT: TStringField;
    qryLogLOG_DQSL_QSL_RCVD: TStringField;
    qryLogLOG_DQSL_QSLRDATE: TDateTimeField;
    qryLogLOG_DQSL_QSLSDATE: TDateTimeField;
    qryLogLOG_EMAIL: TStringField;
    qryLogLOG_A_INDEX: TFloatField;
    qryLogLOG_ANT_AZ: TFloatField;
    qryLogLOG_ANT_EL: TFloatField;
    qryLogLOG_ANT_PATH: TStringField;
    qryLogLOG_BAND_RX: TStringField;
    qryLogLOG_CHECK: TStringField;
    qryLogLOG_CLASS: TStringField;
    qryLogLOG_CONTACTED_OP: TStringField;
    qryLogLOG_CREDIT_SUBMITTED: TStringField;
    qryLogLOG_CREDIT_GRANTED: TStringField;
    qryLogLOG_DISTANCE: TFloatField;
    qryLogLOG_EQ_CALL: TStringField;
    qryLogLOG_FORCE_INIT: TStringField;
    qryLogLOG_FREQ_RX: TFloatField;
    qryLogLOG_GUEST_OP: TStringField;
    qryLogLOG_IOTA_ISLAND_ID: TStringField;
    qryLogLOG_K_INDEX: TFloatField;
    qryLogLOG_MAX_BURSTS: TFloatField;
    qryLogLOG_MS_SHOWER: TStringField;
    qryLogLOG_MY_CNTY: TStringField;
    qryLogLOG_MY_CQ_ZONE: TSmallintField;
    qryLogLOG_MY_IOTA: TStringField;
    qryLogLOG_MY_IOTA_ISLAND_ID: TStringField;
    qryLogLOG_MY_ITU_ZONE: TSmallintField;
    qryLogLOG_MY_RIG: TStringField;
    qryLogLOG_MY_SIG: TStringField;
    qryLogLOG_MY_SIG_INFO: TStringField;
    qryLogLOG_MY_STATE: TStringField;
    qryLogLOG_NR_BURSTS: TSmallintField;
    qryLogLOG_NR_PINGS: TSmallintField;
    qryLogLOG_OWNER_CALLSIGN: TStringField;
    qryLogLOG_PRECEDENCE: TStringField;
    qryLogLOG_PUBLIC_KEY: TStringField;
    qryLogLOG_QSO_COMPLETE: TStringField;
    qryLogLOG_QSO_DATE_OFF: TDateTimeField;
    qryLogLOG_QSO_RANDOM: TStringField;
    qryLogLOG_RIG: TStringField;
    qryLogLOG_SAT_MODE: TStringField;
    qryLogLOG_SAT_NAME: TStringField;
    qryLogLOG_SFI: TFloatField;
    qryLogLOG_SIG: TStringField;
    qryLogLOG_SIG_INFO: TStringField;
    qryLogLOG_SRX: TSmallintField;
    qryLogLOG_SRX_STRING: TStringField;
    qryLogLOG_STATE: TStringField;
    qryLogLOG_STX: TSmallintField;
    qryLogLOG_STX_STRING: TStringField;
    qryLogLOG_SWL: TStringField;
    qryLogLOG_TX_PWR: TFloatField;
    qryLogLOG_WEB: TStringField;
    qryLogLOG_QSO_TIME: TDateTimeField;
    qryLogLOG_QSO_DATETIME: TDateTimeField;
    qryLogLOG_CALL_ORIGINAL: TStringField;
    qryLogLOG_CUSTOM_STAT1: TStringField;
    qryLogLOG_CUSTOM_STAT2: TStringField;
    qryLogLOG_CUSTOM_STAT3: TStringField;
    qryLogLOG_CUSTOM_STAT4: TStringField;
    qryLogEditLOG_ID: TAutoIncField;
    qryLogEditLOG_GRIDSQUARE: TStringField;
    qryLogEditLOG_QTH: TStringField;
    qryLogEditLOG_OPERATOR: TStringField;
    qryLogEditLOG_CALL: TStringField;
    qryLogEditLOG_FREQ: TFloatField;
    qryLogEditLOG_QSO_DATE: TDateTimeField;
    qryLogEditLOG_RST_RCVD: TStringField;
    qryLogEditLOG_RST_SENT: TStringField;
    qryLogEditLOG_LAT: TFloatField;
    qryLogEditLOG_LON: TFloatField;
    qryLogEditLOG_COMMENT: TStringField;
    qryLogEditLOG_QSLSDATE: TDateTimeField;
    qryLogEditLOG_QSLRDATE: TDateTimeField;
    qryLogEditLOG_ADDRESS: TMemoField;
    qryLogEditLOG_AGE: TSmallintField;
    qryLogEditLOG_ARRL_SECT: TStringField;
    qryLogEditLOG_CNTY: TStringField;
    qryLogEditLOG_CONTEST_ID: TStringField;
    qryLogEditLOG_CQZ: TSmallintField;
    qryLogEditLOG_DXCC: TSmallintField;
    qryLogEditLOG_IOTA: TStringField;
    qryLogEditLOG_ITUZ: TSmallintField;
    qryLogEditLOG_NAME: TStringField;
    qryLogEditLOG_NOTES: TMemoField;
    qryLogEditLOG_PFX: TStringField;
    qryLogEditLOG_PROP_MODE: TStringField;
    qryLogEditLOG_QSLMSG: TStringField;
    qryLogEditLOG_QSL_RCVD: TStringField;
    qryLogEditLOG_QSL_SENT: TStringField;
    qryLogEditLOG_QSL_VIA: TStringField;
    qryLogEditLOG_RX_PWR: TFloatField;
    qryLogEditLOG_EQSL_QSLRDATE: TDateTimeField;
    qryLogEditLOG_EQSL_QSLSDATE: TDateTimeField;
    qryLogEditLOG_EQSL_QSL_RCVD: TStringField;
    qryLogEditLOG_EQSL_QSL_SENT: TStringField;
    qryLogEditLOG_LOTW_QSLRDATE: TDateTimeField;
    qryLogEditLOG_LOTW_QSLSDATE: TDateTimeField;
    qryLogEditLOG_LOTW_QSL_RCVD: TStringField;
    qryLogEditLOG_LOTW_QSL_SENT: TStringField;
    qryLogEditLOG_CONT: TStringField;
    qryLogEditLOG_MY_NAME: TStringField;
    qryLogEditLOG_MY_POSTAL_CODE: TStringField;
    qryLogEditLOG_MY_COUNTRY: TStringField;
    qryLogEditLOG_BAND: TStringField;
    qryLogEditLOG_MODE: TStringField;
    qryLogEditLOG_COUNTRY: TStringField;
    qryLogEditLOG_CONTINENT: TStringField;
    qryLogEditLOG_MY_CITY: TStringField;
    qryLogEditLOG_MY_STREET: TStringField;
    qryLogEditLOG_MY_GRIDSQUARE: TStringField;
    qryLogEditLOG_MY_LAT: TFloatField;
    qryLogEditLOG_MY_LON: TFloatField;
    qryLogEditLOG_QSL_SENT_VIA: TStringField;
    qryLogEditLOG_QSL_RCVD_VIA: TStringField;
    qryLogEditLOG_BAND_MHZ: TFloatField;
    qryLogEditLOG_DQSL_QSL_SENT: TStringField;
    qryLogEditLOG_DQSL_QSL_RCVD: TStringField;
    qryLogEditLOG_DQSL_QSLRDATE: TDateTimeField;
    qryLogEditLOG_DQSL_QSLSDATE: TDateTimeField;
    qryLogEditLOG_EMAIL: TStringField;
    qryLogEditLOG_A_INDEX: TFloatField;
    qryLogEditLOG_ANT_AZ: TFloatField;
    qryLogEditLOG_ANT_EL: TFloatField;
    qryLogEditLOG_ANT_PATH: TStringField;
    qryLogEditLOG_BAND_RX: TStringField;
    qryLogEditLOG_CHECK: TStringField;
    qryLogEditLOG_CLASS: TStringField;
    qryLogEditLOG_CONTACTED_OP: TStringField;
    qryLogEditLOG_CREDIT_SUBMITTED: TStringField;
    qryLogEditLOG_CREDIT_GRANTED: TStringField;
    qryLogEditLOG_DISTANCE: TFloatField;
    qryLogEditLOG_EQ_CALL: TStringField;
    qryLogEditLOG_FORCE_INIT: TStringField;
    qryLogEditLOG_FREQ_RX: TFloatField;
    qryLogEditLOG_GUEST_OP: TStringField;
    qryLogEditLOG_IOTA_ISLAND_ID: TStringField;
    qryLogEditLOG_K_INDEX: TFloatField;
    qryLogEditLOG_MAX_BURSTS: TFloatField;
    qryLogEditLOG_MS_SHOWER: TStringField;
    qryLogEditLOG_MY_CNTY: TStringField;
    qryLogEditLOG_MY_CQ_ZONE: TSmallintField;
    qryLogEditLOG_MY_IOTA: TStringField;
    qryLogEditLOG_MY_IOTA_ISLAND_ID: TStringField;
    qryLogEditLOG_MY_ITU_ZONE: TSmallintField;
    qryLogEditLOG_MY_RIG: TStringField;
    qryLogEditLOG_MY_SIG: TStringField;
    qryLogEditLOG_MY_SIG_INFO: TStringField;
    qryLogEditLOG_MY_STATE: TStringField;
    qryLogEditLOG_NR_BURSTS: TSmallintField;
    qryLogEditLOG_NR_PINGS: TSmallintField;
    qryLogEditLOG_OWNER_CALLSIGN: TStringField;
    qryLogEditLOG_PRECEDENCE: TStringField;
    qryLogEditLOG_PUBLIC_KEY: TStringField;
    qryLogEditLOG_QSO_COMPLETE: TStringField;
    qryLogEditLOG_QSO_DATE_OFF: TDateTimeField;
    qryLogEditLOG_QSO_RANDOM: TStringField;
    qryLogEditLOG_RIG: TStringField;
    qryLogEditLOG_SAT_MODE: TStringField;
    qryLogEditLOG_SAT_NAME: TStringField;
    qryLogEditLOG_SFI: TFloatField;
    qryLogEditLOG_SIG: TStringField;
    qryLogEditLOG_SIG_INFO: TStringField;
    qryLogEditLOG_SRX: TSmallintField;
    qryLogEditLOG_SRX_STRING: TStringField;
    qryLogEditLOG_STATE: TStringField;
    qryLogEditLOG_STX: TSmallintField;
    qryLogEditLOG_STX_STRING: TStringField;
    qryLogEditLOG_SWL: TStringField;
    qryLogEditLOG_TX_PWR: TFloatField;
    qryLogEditLOG_WEB: TStringField;
    qryLogEditLOG_QSO_TIME: TDateTimeField;
    qryLogEditLOG_QSO_DATETIME: TDateTimeField;
    qryLogEditLOG_CALL_ORIGINAL: TStringField;
    qryLogEditLOG_CUSTOM_STAT1: TStringField;
    qryLogEditLOG_CUSTOM_STAT2: TStringField;
    qryLogEditLOG_CUSTOM_STAT3: TStringField;
    qryLogEditLOG_CUSTOM_STAT4: TStringField;
    cdsPrintQSLLOG_ID: TAutoIncField;
    cdsPrintQSLLOG_GRIDSQUARE: TStringField;
    cdsPrintQSLLOG_QTH: TStringField;
    cdsPrintQSLLOG_OPERATOR: TStringField;
    cdsPrintQSLLOG_CALL: TStringField;
    cdsPrintQSLLOG_FREQ: TFloatField;
    cdsPrintQSLLOG_QSO_DATE: TDateTimeField;
    cdsPrintQSLLOG_RST_RCVD: TStringField;
    cdsPrintQSLLOG_RST_SENT: TStringField;
    cdsPrintQSLLOG_LAT: TFloatField;
    cdsPrintQSLLOG_LON: TFloatField;
    cdsPrintQSLLOG_COMMENT: TStringField;
    cdsPrintQSLLOG_QSLSDATE: TDateTimeField;
    cdsPrintQSLLOG_QSLRDATE: TDateTimeField;
    cdsPrintQSLLOG_ADDRESS: TMemoField;
    cdsPrintQSLLOG_AGE: TSmallintField;
    cdsPrintQSLLOG_ARRL_SECT: TStringField;
    cdsPrintQSLLOG_CNTY: TStringField;
    cdsPrintQSLLOG_CONTEST_ID: TStringField;
    cdsPrintQSLLOG_CQZ: TSmallintField;
    cdsPrintQSLLOG_DXCC: TSmallintField;
    cdsPrintQSLLOG_IOTA: TStringField;
    cdsPrintQSLLOG_ITUZ: TSmallintField;
    cdsPrintQSLLOG_NAME: TStringField;
    cdsPrintQSLLOG_NOTES: TMemoField;
    cdsPrintQSLLOG_PFX: TStringField;
    cdsPrintQSLLOG_PROP_MODE: TStringField;
    cdsPrintQSLLOG_QSLMSG: TStringField;
    cdsPrintQSLLOG_QSL_RCVD: TStringField;
    cdsPrintQSLLOG_QSL_SENT: TStringField;
    cdsPrintQSLLOG_QSL_VIA: TStringField;
    cdsPrintQSLLOG_RX_PWR: TFloatField;
    cdsPrintQSLLOG_EQSL_QSLRDATE: TDateTimeField;
    cdsPrintQSLLOG_EQSL_QSLSDATE: TDateTimeField;
    cdsPrintQSLLOG_EQSL_QSL_RCVD: TStringField;
    cdsPrintQSLLOG_EQSL_QSL_SENT: TStringField;
    cdsPrintQSLLOG_LOTW_QSLRDATE: TDateTimeField;
    cdsPrintQSLLOG_LOTW_QSLSDATE: TDateTimeField;
    cdsPrintQSLLOG_LOTW_QSL_RCVD: TStringField;
    cdsPrintQSLLOG_LOTW_QSL_SENT: TStringField;
    cdsPrintQSLLOG_CONT: TStringField;
    cdsPrintQSLLOG_MY_NAME: TStringField;
    cdsPrintQSLLOG_MY_POSTAL_CODE: TStringField;
    cdsPrintQSLLOG_MY_COUNTRY: TStringField;
    cdsPrintQSLLOG_BAND: TStringField;
    cdsPrintQSLLOG_MODE: TStringField;
    cdsPrintQSLLOG_COUNTRY: TStringField;
    cdsPrintQSLLOG_CONTINENT: TStringField;
    cdsPrintQSLLOG_MY_CITY: TStringField;
    cdsPrintQSLLOG_MY_STREET: TStringField;
    cdsPrintQSLLOG_MY_GRIDSQUARE: TStringField;
    cdsPrintQSLLOG_MY_LAT: TFloatField;
    cdsPrintQSLLOG_MY_LON: TFloatField;
    cdsPrintQSLLOG_QSL_SENT_VIA: TStringField;
    cdsPrintQSLLOG_QSL_RCVD_VIA: TStringField;
    cdsPrintQSLLOG_BAND_MHZ: TFloatField;
    cdsPrintQSLLOG_DQSL_QSL_SENT: TStringField;
    cdsPrintQSLLOG_DQSL_QSL_RCVD: TStringField;
    cdsPrintQSLLOG_DQSL_QSLRDATE: TDateTimeField;
    cdsPrintQSLLOG_DQSL_QSLSDATE: TDateTimeField;
    cdsPrintQSLLOG_EMAIL: TStringField;
    cdsPrintQSLLOG_A_INDEX: TFloatField;
    cdsPrintQSLLOG_ANT_AZ: TFloatField;
    cdsPrintQSLLOG_ANT_EL: TFloatField;
    cdsPrintQSLLOG_ANT_PATH: TStringField;
    cdsPrintQSLLOG_BAND_RX: TStringField;
    cdsPrintQSLLOG_CHECK: TStringField;
    cdsPrintQSLLOG_CLASS: TStringField;
    cdsPrintQSLLOG_CONTACTED_OP: TStringField;
    cdsPrintQSLLOG_CREDIT_SUBMITTED: TStringField;
    cdsPrintQSLLOG_CREDIT_GRANTED: TStringField;
    cdsPrintQSLLOG_DISTANCE: TFloatField;
    cdsPrintQSLLOG_EQ_CALL: TStringField;
    cdsPrintQSLLOG_FORCE_INIT: TStringField;
    cdsPrintQSLLOG_FREQ_RX: TFloatField;
    cdsPrintQSLLOG_GUEST_OP: TStringField;
    cdsPrintQSLLOG_IOTA_ISLAND_ID: TStringField;
    cdsPrintQSLLOG_K_INDEX: TFloatField;
    cdsPrintQSLLOG_MAX_BURSTS: TFloatField;
    cdsPrintQSLLOG_MS_SHOWER: TStringField;
    cdsPrintQSLLOG_MY_CNTY: TStringField;
    cdsPrintQSLLOG_MY_CQ_ZONE: TSmallintField;
    cdsPrintQSLLOG_MY_IOTA: TStringField;
    cdsPrintQSLLOG_MY_IOTA_ISLAND_ID: TStringField;
    cdsPrintQSLLOG_MY_ITU_ZONE: TSmallintField;
    cdsPrintQSLLOG_MY_RIG: TStringField;
    cdsPrintQSLLOG_MY_SIG: TStringField;
    cdsPrintQSLLOG_MY_SIG_INFO: TStringField;
    cdsPrintQSLLOG_MY_STATE: TStringField;
    cdsPrintQSLLOG_NR_BURSTS: TSmallintField;
    cdsPrintQSLLOG_NR_PINGS: TSmallintField;
    cdsPrintQSLLOG_OWNER_CALLSIGN: TStringField;
    cdsPrintQSLLOG_PRECEDENCE: TStringField;
    cdsPrintQSLLOG_PUBLIC_KEY: TStringField;
    cdsPrintQSLLOG_QSO_COMPLETE: TStringField;
    cdsPrintQSLLOG_QSO_DATE_OFF: TDateTimeField;
    cdsPrintQSLLOG_QSO_RANDOM: TStringField;
    cdsPrintQSLLOG_RIG: TStringField;
    cdsPrintQSLLOG_SAT_MODE: TStringField;
    cdsPrintQSLLOG_SAT_NAME: TStringField;
    cdsPrintQSLLOG_SFI: TFloatField;
    cdsPrintQSLLOG_SIG: TStringField;
    cdsPrintQSLLOG_SIG_INFO: TStringField;
    cdsPrintQSLLOG_SRX: TSmallintField;
    cdsPrintQSLLOG_SRX_STRING: TStringField;
    cdsPrintQSLLOG_STATE: TStringField;
    cdsPrintQSLLOG_STX: TSmallintField;
    cdsPrintQSLLOG_STX_STRING: TStringField;
    cdsPrintQSLLOG_SWL: TStringField;
    cdsPrintQSLLOG_TX_PWR: TFloatField;
    cdsPrintQSLLOG_WEB: TStringField;
    cdsPrintQSLLOG_QSO_TIME: TDateTimeField;
    cdsPrintQSLLOG_QSO_DATETIME: TDateTimeField;
    cdsPrintQSLLOG_CALL_ORIGINAL: TStringField;
    cdsPrintQSLLOG_CUSTOM_STAT1: TStringField;
    cdsPrintQSLLOG_CUSTOM_STAT2: TStringField;
    cdsPrintQSLLOG_CUSTOM_STAT3: TStringField;
    cdsPrintQSLLOG_CUSTOM_STAT4: TStringField;
    cdsPrintQSLNEXT_CALL: TStringField;
    qryBandsBAND_ID: TAutoIncField;
    qryBandsBAND_MHZ: TFloatField;
    qryBandsBAND_METER: TFloatField;
    qryBandsBAND_ADIF: TStringField;
    qryBandsBAND_LOWER_FREQ: TFloatField;
    qryBandsBAND_UPPER_FREQ: TFloatField;
    qryBandsBAND_ACTIVE: TIntegerField;
    UnZipper: TAbUnZipper;
    qryLogEditSTATION_ID: TIntegerField;

    procedure qryStationsAfterInsert(DataSet: TDataSet);
    procedure qryLogAfterScroll(DataSet: TDataSet);
    procedure qryLogAfterOpen(DataSet: TDataSet);
    procedure frDesignerShow(Sender: TObject);
    procedure ReportAfterPrintReport(Sender: TObject);
    procedure qryLogLOG_BAND_MHZGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    function ReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure ReportChangeSQL(Design: Boolean = false);
    function frDesignerLoadReport(Report: TfrxReport): Boolean;
    function frDesignerLoadRecentReport(Report: TfrxReport; FileName: string): Boolean;
    procedure ReportProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
    procedure ReportPreview(Sender: TObject);
    procedure ReportProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
    function frDesignerSaveReport(Report: TfrxReport; SaveAs: Boolean): Boolean;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure dsLogDataChange(Sender: TObject; Field: TField);
    procedure qryLogEditBeforePost(DataSet: TDataSet);
    procedure qryLogLOG_CALLValidate(Sender: TField);
    procedure qryLogBeforePost(DataSet: TDataSet);
    procedure qryLogLOG_QSO_TIMEValidate(Sender: TField);
    procedure qryLogLOG_QSO_DATEValidate(Sender: TField);
  private
    procedure SetQSODateTime(Date:TDateTime;Time:TDateTime);
  public
    LangId: Integer;
    MyCountryName:string;
    SelectFromAllLogClause: string;
    BookTableList:TStringList;
    DBCRC:cardinal;
    DBLastModified:TDateTime;
    procedure OpenDatasets;
    procedure CloseDatasets;
    procedure SetStationId(StationId: Integer);
    procedure CreateTable(StationId: Integer);
    procedure DeleteTable(StationId: Integer);
    function GetADIFBandFromMhz(Mhz: real): string;
    function GetContinentName(ShName: string): string;
    function GetAllTableForSelect: string;

  end;

var
  dmMain: TdmMain;
  arrMDBTypes: array [TFieldType] of Integer = (
    { ftUnknown, } 10,
    { ftString, } 10,
    { ftSmallint, } 3,
    { ftInteger, } 3,
    { ftWord, } 3,
    { ftBoolean, } 1,
    { ftFloat, } 6,
    { ftCurrency, } 6,
    { ftBCD, } 7,
    { ftDate, } 8,
    { ftTime, } 22,
    { ftDateTime, } 8,
    { ftBytes, } 11,
    { ftVarBytes, } 11,
    { ftAutoInc, } 3,
    { ftBlob, } 11,
    { ftMemo, } 12,
    { ftGraphic, } 11,
    { ftFmtMemo, } 12,
    { ftParadoxOle, } 11,
    { ftDBaseOle, } 11,
    { ftTypedBinary, } 11,
    { ftCursor, } 10,
    { ftFixedChar, } 10,
    { ftWideString, } 10,
    { ftLargeint, } 3,
    { ftADT, } 10,
    { ftArray, } 10,
    { ftReference, } 10,
    { ftDataSet, } 10,
    { ftOraBlob, } 11,
    { ftOraClob, } 11,
    { ftVariant, } 10,
    { ftInterface, } 10,
    { ftIDispatch, } 10,
    { ftGuid, } 10,
    { ftTimeStamp, } 8,
    { ftFMTBcd, } 7,
    { ftFixedWideChar, } 10,
    { ftWideMemo, } 11,
    { ftOraTimeStamp, } 8,
    { ftOraInterval, } 8,
    { ftLongWord, } 3,
    { ftShortint, } 3,
    { ftByte, } 3,
    { ftExtended, } 7,
    { ftConnection, } 0,
    { ftParams, } 0,
    { ftStream, } 0,
    { ftTimeStampOffset, } 0,
    { ftObject, } 0,
    { ftSingle } 7
  );

implementation

uses uOptions, uMainWindow;
{$R *.dfm}

procedure TdmMain.CreateTable(StationId: Integer);
var
  Fields, FieldsType, FieldsSize, FieldsIndex, FieldsRequired: Variant;
  i: Integer;
  NewTable, NewIndex: OleVariant;
  TableName: string;
  qryDDL: TKADaoTable;
begin
  TableName := 'LOG_' + IntToStr(StationId);
  Fields := VarArrayCreate([0, qryLog.FieldCount - 1], varVariant);
  FieldsType := VarArrayCreate([0, qryLog.FieldCount - 1], varVariant);
  FieldsSize := VarArrayCreate([0, qryLog.FieldCount - 1], varVariant);
  FieldsIndex := VarArrayCreate([0, qryLog.FieldCount - 1], varVariant);
  FieldsRequired := VarArrayCreate([0, qryLog.FieldCount - 1], varVariant);
  for i := 0 to qryLog.FieldCount - 1 do
  begin
    FieldsRequired[i] := 0;

    if (qryLog.Fields[i].FieldName = 'LOG_CALL') or (qryLog.Fields[i].FieldName = 'LOG_QSL_SENT') or (qryLog.Fields[i].FieldName = 'LOG_QSL_RCVD') or (qryLog.Fields[i].FieldName = 'LOG_EQSL_QSL_SENT') or (qryLog.Fields[i].FieldName = 'LOG_EQSL_QSL_RCVD') or (qryLog.Fields[i].FieldName = 'LOG_DQSL_QSL_SENT') or (qryLog.Fields[i].FieldName = 'LOG_DQSL_QSL_RCVD') or (qryLog.Fields[i].FieldName = 'LOG_CALL_ORIGINAL') then
    begin
      FieldsRequired[i] := 1;
      FieldsIndex[i] := 4;
    end;

    Fields[i] := qryLog.Fields[i].FieldName;
    if qryLog.Fields[i].FieldName = 'LOG_ID' then
    begin
      FieldsType[i] := dbAutoIncInteger;
      FieldsIndex[i] := 1;
    end
    else
      FieldsType[i] := arrMDBTypes[qryLog.Fields[i].DataType];

    if FieldsType[i] = 10 then
      FieldsSize[i] := qryLog.Fields[i].DataSize-1
    else
      FieldsSize[i] := qryLog.Fields[i].DataSize;
  end;
  try
    DAODatabase.CreateTable(TableName, Fields, FieldsType, FieldsSize, FieldsIndex, FieldsRequired);
    NewTable := DAODatabase.CoreDatabase.TableDefs.Item[TableName];
    NewIndex := NewTable.CreateIndex('LOG_CALL_DATE_UNIQ');
    NewIndex.Unique := true;
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_CALL'));
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_QSO_DATE'));
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_QSO_TIME'));
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_BAND'));
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_MODE'));
    NewTable.Indexes.AppEnd(NewIndex);

    NewIndex := NewTable.CreateIndex('LOG_DXCC');
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_DXCC'));
    NewTable.Indexes.AppEnd(NewIndex);

    NewIndex := NewTable.CreateIndex('LOG_DXCC_DATE');
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_DXCC'));
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_QSO_DATE'));
    NewTable.Indexes.AppEnd(NewIndex);


    NewIndex := NewTable.CreateIndex('LOG_STATE');
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_STATE'));
    NewTable.Indexes.AppEnd(NewIndex);


    NewIndex := NewTable.CreateIndex('LOG_CNTY');
    NewIndex.Fields.AppEnd(NewTable.CreateField('LOG_CNTY'));
    NewTable.Indexes.AppEnd(NewIndex);

    DAODatabase.RefreshDefinitions;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
  GetAllTableForSelect;
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
 BookTableList:=TStringList.Create;
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
 BookTableList.Free;
end;

procedure TdmMain.DeleteTable(StationId: Integer);
var
  qryDeleteImages: TKADaoTable;
begin
  if StationId = MainWindow.CurrentStationId then
  begin
    qryLog.Close;
  end;

  DAODatabase.DeleteTable('LOG_' + IntToStr(StationId));

  qryDeleteImages := TKADaoTable.Create(nil);
  try
    try
      qryDeleteImages.Database := DAODatabase;
      qryDeleteImages.SQL.Text := 'DELETE FROM QSL_IMAGE_FILES WHERE STATION_ID=' + IntToStr(StationId);
      qryDeleteImages.ExecuteSQL;
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    qryDeleteImages.Free;
  end;

  GetAllTableForSelect;
end;

procedure TdmMain.dsLogDataChange(Sender: TObject; Field: TField);
begin
  if qryLogEdit.State in [dsEdit] then
  MainWindow.CoreCommand(MainWindow.aCancelQSO);
end;

function TdmMain.frDesignerLoadRecentReport(Report: TfrxReport; FileName: string): Boolean;
var
  sFilePath: string;
begin
  Report.LoadFromFile(FileName);
  sFilePath := Trim(ExtractFilePath(FileName));
  if sFilePath <> '' then
    if Copy(sFilePath, Length(sFilePath) - 16, 17) <> 'Data\Reports\QSL\' then
      ReportChangeSQL(true);
  result := true;
end;

function TdmMain.frDesignerLoadReport(Report: TfrxReport): Boolean;
var
  sFilePath: string;
begin
  OpenReportDialog.InitialDir := frDesigner.OpenDir;
  if OpenReportDialog.Execute then
  begin
    Report.LoadFromFile(OpenReportDialog.FileName);
    sFilePath := Trim(ExtractFilePath(OpenReportDialog.FileName));
    if sFilePath <> '' then
      if Copy(sFilePath, Length(sFilePath) - 16, 17) <> 'Data\Reports\QSL\' then
        ReportChangeSQL(true);
    result := true;
  end;
end;

function TdmMain.frDesignerSaveReport(Report: TfrxReport; SaveAs: Boolean): Boolean;
var
  sFilePath: string;
begin
  if SaveAs or (Report.FileName = '') then
  begin
    SaveDialogReport.FileName:='';
    SaveDialogReport.InitialDir := frDesigner.SaveDir;
    if SaveDialogReport.Execute then
    begin
      if ExtractFileExt(SaveDialogReport.FileName) <> '.fr3' then
        SaveDialogReport.FileName := SaveDialogReport.FileName + '.fr3';
      sFilePath := Trim(ExtractFilePath(SaveDialogReport.FileName));
      Report.FileName := SaveDialogReport.FileName;
      Report.SaveToFile(Report.FileName);

      sFilePath := Trim(ExtractFilePath(Report.FileName));
      if sFilePath <> '' then
        if Copy(sFilePath, Length(sFilePath) - 16, 17) <> 'Data\Reports\QSL\' then
        begin
         MainWindow.AddReportToMenu(Report.FileName);
        end;
      result := true;
    end;
  end
  else
  begin
    Report.SaveToFile(Report.FileName);
    result := true;
  end;

end;

procedure TdmMain.frDesignerShow(Sender: TObject);
begin
  ReportChangeSQL(true);
  Screen.Cursor := crDefault;
end;

procedure TdmMain.CloseDatasets;
begin
  qryBands.Close;
  qryContinents.Close;
  qryStations.Close;
  qryLog.Close;
end;


procedure TdmMain.OpenDatasets;
var
 slBandLine : TStringList;
 slBands : TStringList;
 i:integer;

 function GetActiveBand(sBand:string):integer;
 var
  j:integer;
 begin
   result:=0;
   for j := 0 to slBands.Count - 1 do
   begin

//    slBandLine.DelimitedText:=StringReplace(slBands[j], '.' , MainWindow.Delimeter , [rfReplaceAll, rfIgnoreCase]);
    slBandLine.DelimitedText:=slBands[j];
    if slBandLine[0]=sBand then
    begin
     if slBandLine[1]='1' then
       result:=1
     else
       result:=0;
       exit;
    end;
   end;
 end;

begin
  dmMain.DBLastModified:=FileLastModified(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb');
  qryBands.Open;

  slBands := TStringList.Create;
  slBandLine := TStringList.Create;
  slBandLine.Delimiter := '|';

  qryBands.DisableControls;
  try
    Options.FormStorage.AppStorage.ReadStringList('Options\ActiveBands', slBands);
    qryBands.Database.StartTransaction;
    qryBands.First;
    while not qryBands.Eof do
    begin
     qryBands.Edit;
     qryBands.FieldByName('BAND_ACTIVE').AsInteger:=GetActiveBand(FloatToStr(SimpleRoundTo(qryBands.FieldByName('BAND_MHZ').asFloat,-3)));
     qryBands.Post;
     qryBands.Next;
    end;
  finally
    qryBands.First;
    qryBands.EnableControls;
    slBandLine.Free;
    slBands.Free;
  end;
 qryBands.Database.Commit;
  qryBands.Close;
  dmMain.DAODatabase.Close;
  FileSetDate(dmMain.DAODatabase.Database, DateTimeToFileDate(dmMain.DBLastModified));
  dmMain.DAODatabase.Open;
  qryBands.Open;

  // qryModes.Open;
  qryContinents.Open;
  qryStations.Open;
  GetAllTableForSelect;

  qryLogLOG_QSO_DATE.DisplayFormat := ShortDateFormat;
  qryLogLOG_QSO_TIME.DisplayFormat := ShortTimeFormat;

  Application.Tag := 100;

end;

procedure TdmMain.qryLogAfterOpen(DataSet: TDataSet);
begin
  if qryLog.RecNo = -1 then
    MainWindow.sbMain.Panels[4].Text := '0/' + IntToStr(qryLog.RecordCount)
  else
    MainWindow.sbMain.Panels[4].Text := IntToStr(qryLog.RecNo) + '/' + IntToStr(qryLog.RecordCount)
end;

procedure TdmMain.qryLogAfterScroll(DataSet: TDataSet);
begin
  if qryLog.ControlsDisabled then
    exit;
  try
    if qryLog.IsEmpty then
    begin
      MainWindow.sbMain.Panels[4].Text := '0/0';
      exit;
    end;
    if qryLog.RecNo = -1 then
      MainWindow.sbMain.Panels[4].Text := '0/' + IntToStr(qryLog.RecordCount)
    else
      MainWindow.sbMain.Panels[4].Text := IntToStr(qryLog.RecNo) + '/' + IntToStr(qryLog.RecordCount);
  except
    MainWindow.sbMain.Panels[4].Text := '0/0';
  end;
end;

procedure TdmMain.qryLogBeforePost(DataSet: TDataSet);
begin
//  dmMain.qryLog.FieldByName('LOG_QSO_DATE').AsDateTime := StrToDate(DateToStr(dmMain.qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime));
{  dmMain.qryLog.FieldByName('LOG_QSO_TIME').AsDateTime := StrToTime(FormatDateTime('hh:nn', dmMain.qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime));}
end;

procedure TdmMain.qryLogEditBeforePost(DataSet: TDataSet);
begin
 dmMain.qryLogEdit.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(dmMain.qryLogEdit.FieldByName('LOG_CALL').asString);
end;

procedure TdmMain.qryLogLOG_BAND_MHZGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin

  // Text:=Sender.Value;
end;

procedure TdmMain.qryLogLOG_CALLValidate(Sender: TField);
var
  pData: PCallInfo;
  CallInfo: TCallInfo;
begin
 dmMain.qryLog.FieldByName('LOG_CALL_ORIGINAL').asString := GetOriginalCall(Sender.Value);
  New(pData);
  pData^ := MainWindow.GetPrefixData(Sender.Value, qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime);
  qryLog.FieldByName('LOG_CONT').asString := pData.PrefixData.Continent;
  qryLog.FieldByName('LOG_DXCC').asString := pData.PrefixData.ADIF;
  qryLog.FieldByName('LOG_PFX').asString := pData.PrefixData.Prefix;
  qryLog.FieldByName('LOG_COUNTRY').asString := pData.PrefixData.Territory;
  qryLog.FieldByName('LOG_CONTINENT').asString := GetContinentName(pData.PrefixData.Continent);
  Dispose(pData);
end;

procedure TdmMain.qryLogLOG_QSO_DATEValidate(Sender: TField);
begin
if Sender.Value=Null then exit;
 SetQSODateTime(Sender.Value,0);
end;

procedure TdmMain.qryLogLOG_QSO_TIMEValidate(Sender: TField);
begin
if Sender.Value=Null then exit;
 SetQSODateTime(0,Sender.Value);
end;

procedure TdmMain.qryStationsAfterInsert(DataSet: TDataSet);
begin
  qryStations.FieldByName('STATION_COUNTRY').AsInteger := -1;
end;

procedure TdmMain.ReportAfterPrintReport(Sender: TObject);
begin
  if Copy(Report.FileName, Length(Report.FileName) - 16, 17) <> 'Data\Reports\QSL\' then
    if MessageBox(MainWindow.Handle, PWideChar(Options.msgCheckPrintedRecords.Caption), PWideChar(Options.msgConfirmation.Caption), mb_YesNo or mb_iconquestion) <> mrYes then
      exit;
  MainWindow.PrintQSLQueueClear(false, 'Y');
end;

function TdmMain.ReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  if MethodName = 'REPORTCHANGESQL' then
    ReportChangeSQL;
end;

procedure TdmMain.SetStationId(StationId: Integer);
begin

  if qryStations.IsEmpty then
  begin
    qryLog.Close;
    MainWindow.CurrentStationId := -1;
    exit;
  end;
  try
    MainWindow.CurrentStationId := StationId;
    dmMain.qryStations.Locate('STATION_ID',StationId,[]);
    Options.FormStorageOnExit.StoredValue['StationId'] := StationId;

    MainWindow.CurrentStationParentId := dmMain.qryStations.FieldByName('STATION_PARENT_ID').AsInteger;
    MainWindow.CurrentStationBookName:=dmMain.qryStations.FieldByName('STATION_BOOK_NAME').AsString;
    MainWindow.CurrentStationCall:=dmMain.qryStations.FieldByName('STATION_CALL').AsString;

    qryTerritory.Close;
    qryTerritory.Params.ParamByName('ADIF_ID').AsInteger:=dmMain.qryStations.FieldByName('STATION_COUNTRY').AsInteger;
    qryTerritory.Open;
    if (qryTerritory.RecordCount=0) or (dmMain.qryStations.FieldByName('STATION_COUNTRY').AsInteger=-1) then
     MyCountryName:=''
    else
     MyCountryName:=qryTerritory.FieldByName('TERRITORY_NAME').AsString;

    qryTerritory.Close;

    MainWindow.Plugins.CoreCommand(CC_STATION_CHANGED, Pointer(dmMain.qryStations.FieldByName('STATION_PARENT_ID').AsInteger), dmMain.qryStations.FieldByName('STATION_ID').AsInteger, dmMain.qryStations.FieldByName('STATION_CALL').AsString);
//    MainWindow.Caption:=Application.Title+' '+dmMain.qryStations.FieldByName('STATION_BOOK_NAME').asString + ' [' + Trim(dmMain.qryStations.FieldByName('STATION_CALL').asString) + ']';
    { if not qryLog.Active then
      begin
      qryLog.TableName := 'LOG_' + IntToStr(StationId);
      qryLog.Open;
      end; }
  except
  end;
end;

function TdmMain.GetADIFBandFromMhz(Mhz: real): string;
begin
  if Mhz = 0 then
    exit;
  qryBands.First;
  if qryBands.Locate('BAND_MHZ', SimpleRoundTo(Mhz, -3), []) then
    result := qryBands.FieldByName('BAND_ADIF').AsString
  else
    raise Exception.Create('Error get ADIF specification for band ' + FloatToStr(Mhz));
end;

function TdmMain.GetContinentName(ShName: string): string;
begin
  qryContinents.First;
  if qryContinents.Locate('CONTINENT_SH_NAME', ShName, [loCaseInsensitive, loPartialKey]) then
    result := qryContinents.FieldByName('CONTINENT_NAME').AsString
  else
    result := '!Undefined!';
end;

function TdmMain.GetAllTableForSelect: string;
var
  qryTmp: TKADaoTable;
  sResult: string;
  i: Integer;
begin
  BookTableList.Clear;
  qryTmp := TKADaoTable.Create(nil);
  i := 0;
  sResult := ' (';
  try
    qryTmp.Database := DAODatabase;
    qryTmp.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE IS_GROUP=0';
    qryTmp.Open;
    while not qryTmp.Eof do
    begin
      if i = 0 then
        sResult := sResult + ' SELECT '+qryTmp.FieldByName('STATION_ID').AsString+' as STATION_ID,LOG_ID,LOG_CALL,LOG_QSO_DATETIME,LOG_BAND,LOG_MODE  FROM LOG_' + IntToStr(qryTmp.FieldByName('STATION_ID').AsInteger)
      else
        sResult := sResult + ' UNION ALL SELECT '+qryTmp.FieldByName('STATION_ID').AsString+' as STATION_ID,LOG_ID,LOG_CALL,LOG_QSO_DATETIME,LOG_BAND,LOG_MODE  FROM LOG_' + qryTmp.FieldByName('STATION_ID').AsString;
      inc(i);
      BookTableList.Add(qryTmp.FieldByName('STATION_ID').AsString);
      qryTmp.Next;
    end;
    result := sResult + ') ';
    SelectFromAllLogClause := result;
    MainWindow.Plugins.CoreCommand(CC_CHANGE_BOOK_LIST, Self, SelectFromAllLogClause, 0);
  finally
    qryTmp.Free;
  end;
end;

procedure TdmMain.ReportChangeSQL(Design: Boolean = false);
var
  compAllStation, compDblStation ,compedModes: TComponent;
  sSql, sFrom, sUnionFrom: string;
  lFromStart, lFromEnd, lNewSQL: Integer;
  qrySQLStations: TKADaoTable;
  aStationId: Integer;

begin
  if Copy(Report.ScriptText.Text, 1, 2) <> '{#' then
    exit;
  sSql := Copy(Report.ScriptText.Text, 1, Pos('}', Report.ScriptText.Text) - 1);
  Delete(sSql, 1, Pos('{', sSql) + 1);
  if Design then
  begin
    repeat
      lFromStart := Pos('[', sSql);
      if lFromStart = 0 then
        break;
      lFromEnd := Pos(']', sSql);
      sFrom := Copy(sSql, lFromStart + 1, lFromEnd - lFromStart - 1);
      sUnionFrom := '';
      sUnionFrom := sUnionFrom + StringReplace(sFrom, '$LOG_TABLE$', 'LOG_' + qryStations.FieldByName('STATION_ID').AsString, [rfReplaceAll, rfIgnoreCase]);
      Delete(sSql, lFromStart, lFromEnd - lFromStart + 1);
      Insert('(' + sUnionFrom + ')', sSql, lFromStart);
    until lFromStart = 0;
    qryReports.Close;
    qryReports.SQL.Text := sSql;
    exit;
  end;

  qrySQLStations := TKADaoTable.Create(nil);
  qrySQLStations.Database := DAODatabase;
  qrySQLStations.SQL.Text := 'SELECT STATION_ID FROM STATIONS WHERE STATION_PARENT_ID=:STATION_PARENT_ID';
  qrySQLStations.Params.ParamByName('STATION_PARENT_ID').AsInteger:=MainWindow.CurrentStationParentId;
  try
    compAllStation := dmMain.Report.FindComponent('cbAllStations');
    compDblStation := dmMain.Report.FindComponent('dblStations');
    compedModes := dmMain.Report.FindComponent('edModes');
    if compDblStation <> nil then
      aStationId := TfrxDbLookupComboBox(compDblStation).KeyValue;
    if compAllStation <> nil then
    begin
      if TfrxCheckBoxControl(compAllStation).Checked then
      begin
        qrySQLStations.Close;
        qrySQLStations.Open;
        repeat
          lFromStart := Pos('[', sSql);
          if lFromStart = 0 then
            break;
          lFromEnd := Pos(']', sSql);
          sFrom := Copy(sSql, lFromStart + 1, lFromEnd - lFromStart - 1);
          qrySQLStations.First;
          sUnionFrom := '';
          while not qrySQLStations.Eof do
          begin
            sUnionFrom := sUnionFrom + StringReplace(sFrom, '$LOG_TABLE$', 'LOG_' + qrySQLStations.FieldByName('STATION_ID').AsString, [rfReplaceAll, rfIgnoreCase]) + ' UNION ALL ';
            qrySQLStations.Next;
          end;
          Delete(sUnionFrom, Length(sUnionFrom) - 10, 10);
          Delete(sSql, lFromStart, lFromEnd - lFromStart + 1);
          Insert('(' + sUnionFrom + ')', sSql, lFromStart);
        until lFromStart = 0;
      end
      else
      begin
        repeat
          lFromStart := Pos('[', sSql);
          if lFromStart = 0 then
            break;
          lFromEnd := Pos(']', sSql);
          sFrom := Copy(sSql, lFromStart + 1, lFromEnd - lFromStart - 1);
          sUnionFrom := '';
          sUnionFrom := sUnionFrom + StringReplace(sFrom, '$LOG_TABLE$', 'LOG_' + IntToStr(aStationId), [rfReplaceAll, rfIgnoreCase]);
          Delete(sSql, lFromStart, lFromEnd - lFromStart + 1);
          Insert('(' + sUnionFrom + ')', sSql, lFromStart);
        until lFromStart = 0;
      end;
      qryReports.Close;

      if compedModes<>nil then
        sSql:=StringReplace(UpperCase(sSql),':MODES',TfrxEditControl(compedModes).Text,[rfReplaceAll, rfIgnoreCase]);
      qryReports.SQL.Text := sSql;
//      qryReports.SQL.SaveToFile('D:\!\!SQL.sql');
    end;
  finally
    qrySQLStations.Free;
  end;
end;

procedure TdmMain.ReportPreview(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TdmMain.ReportProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
  Screen.Cursor := crHourGlass;
end;

procedure TdmMain.ReportProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: Integer);
begin
  Screen.Cursor := crDefault;
end;

procedure TdmMain.SetQSODateTime(Date:TDateTime;Time:TDateTime);
var
D,M,Y:word;
H,Mi,S,Ms:Word;
begin
 if Date=0 then
  begin
     DecodeDate(qryLog.FieldByName('LOG_QSO_DATE').AsDateTime,Y,M,D);
     DecodeTime(Time,H,Mi,S,Ms);
     qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime:=EncodeDateTime(Y,M,D,H,Mi,0,0);
  end;

 if Time=0 then
  begin
     DecodeDate(Date,Y,M,D);
     DecodeTime(qryLog.FieldByName('LOG_QSO_TIME').AsDateTime,H,Mi,S,Ms);
     qryLog.FieldByName('LOG_QSO_DATETIME').AsDateTime:=EncodeDateTime(Y,M,D,H,Mi,0,0);
  end;


end;


end.
