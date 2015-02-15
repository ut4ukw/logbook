unit DAO_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 5081 $
// File generated on 21/06/2007 14:24:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll (1)
// LIBID: {00025E01-0000-0000-C000-000000000046}
// LCID: 0
// Helpfile: C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.chm
// HelpString: Microsoft DAO 3.6 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// Errors:
//   Hint: TypeInfo 'Property' changed to 'Property_'
//   Hint: Parameter 'Object' of _DynaCollection.Append changed to 'Object_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Member 'Inherited' of 'Property' changed to 'Inherited_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Database._30_OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of Database.CreateProperty changed to 'Type_'
//   Hint: Parameter 'Type' of Database.OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _TableDef.OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _TableDef.CreateField changed to 'Type_'
//   Hint: Parameter 'Type' of _TableDef.CreateProperty changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of _Field.CreateProperty changed to 'Type_'
//   Hint: Parameter 'Type' of _Index.CreateField changed to 'Type_'
//   Hint: Parameter 'Type' of _Index.CreateProperty changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Recordset.OpenRecordset changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of _QueryDef._30_OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _QueryDef._30__OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _QueryDef.CreateProperty changed to 'Type_'
//   Hint: Parameter 'Type' of _QueryDef.OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _QueryDef._OpenRecordset changed to 'Type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Symbol 'Type' renamed to 'type_'
//   Hint: Parameter 'Type' of Connection.OpenRecordset changed to 'Type_'
//   Hint: Parameter 'Type' of _Relation.CreateField changed to 'Type_'
//   Hint: Parameter 'Type' of Document.CreateProperty changed to 'Type_'
//   Error creating palette bitmap of (TTableDef) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TField) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TIndex) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TQueryDef) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TRelation) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TUser) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
//   Error creating palette bitmap of (TGroup) : Server C:\Program Files\Common Files\Microsoft Shared\DAO\dao360.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DAOMajorVersion = 5;
  DAOMinorVersion = 0;

  LIBID_DAO: TGUID = '{00025E01-0000-0000-C000-000000000046}';

  IID__DAO: TGUID = '{0000000A-0000-0010-8000-00AA006D2EA4}';
  IID__DBEngine: TGUID = '{00000021-0000-0010-8000-00AA006D2EA4}';
  IID__Collection: TGUID = '{000000A0-0000-0010-8000-00AA006D2EA4}';
  IID__DynaCollection: TGUID = '{000000A2-0000-0010-8000-00AA006D2EA4}';
  IID_Properties: TGUID = '{00000029-0000-0010-8000-00AA006D2EA4}';
  IID_Property_: TGUID = '{00000027-0000-0010-8000-00AA006D2EA4}';
  IID_Workspaces: TGUID = '{0000003B-0000-0010-8000-00AA006D2EA4}';
  IID_Workspace: TGUID = '{00000039-0000-0010-8000-00AA006D2EA4}';
  IID_Databases: TGUID = '{00000073-0000-0010-8000-00AA006D2EA4}';
  IID_Database: TGUID = '{00000071-0000-0010-8000-00AA006D2EA4}';
  IID_TableDefs: TGUID = '{0000004B-0000-0010-8000-00AA006D2EA4}';
  IID__TableDef: TGUID = '{00000049-0000-0010-8000-00AA006D2EA4}';
  CLASS_TableDef: TGUID = '{00000103-0000-0010-8000-00AA006D2EA4}';
  IID_Fields: TGUID = '{00000053-0000-0010-8000-00AA006D2EA4}';
  IID__Field: TGUID = '{00000051-0000-0010-8000-00AA006D2EA4}';
  CLASS_Field: TGUID = '{00000104-0000-0010-8000-00AA006D2EA4}';
  IID_Indexes: TGUID = '{0000005B-0000-0010-8000-00AA006D2EA4}';
  IID__Index: TGUID = '{00000059-0000-0010-8000-00AA006D2EA4}';
  CLASS_Index: TGUID = '{00000105-0000-0010-8000-00AA006D2EA4}';
  IID_Recordset: TGUID = '{00000031-0000-0010-8000-00AA006D2EA4}';
  IID__QueryDef: TGUID = '{00000079-0000-0010-8000-00AA006D2EA4}';
  CLASS_QueryDef: TGUID = '{00000108-0000-0010-8000-00AA006D2EA4}';
  IID_Parameters: TGUID = '{00000083-0000-0010-8000-00AA006D2EA4}';
  IID_Parameter: TGUID = '{00000081-0000-0010-8000-00AA006D2EA4}';
  IID_Connection: TGUID = '{00000041-0000-0010-8000-00AA006D2EA4}';
  IID_QueryDefs: TGUID = '{0000007B-0000-0010-8000-00AA006D2EA4}';
  IID_Recordsets: TGUID = '{00000033-0000-0010-8000-00AA006D2EA4}';
  IID_Relations: TGUID = '{0000008B-0000-0010-8000-00AA006D2EA4}';
  IID__Relation: TGUID = '{00000089-0000-0010-8000-00AA006D2EA4}';
  CLASS_Relation: TGUID = '{00000109-0000-0010-8000-00AA006D2EA4}';
  IID_Containers: TGUID = '{00000093-0000-0010-8000-00AA006D2EA4}';
  IID_Container: TGUID = '{00000091-0000-0010-8000-00AA006D2EA4}';
  IID_Documents: TGUID = '{0000009B-0000-0010-8000-00AA006D2EA4}';
  IID_Document: TGUID = '{00000099-0000-0010-8000-00AA006D2EA4}';
  IID_Users: TGUID = '{0000006B-0000-0010-8000-00AA006D2EA4}';
  IID__User: TGUID = '{00000069-0000-0010-8000-00AA006D2EA4}';
  CLASS_User: TGUID = '{00000107-0000-0010-8000-00AA006D2EA4}';
  IID_Groups: TGUID = '{00000063-0000-0010-8000-00AA006D2EA4}';
  IID__Group: TGUID = '{00000061-0000-0010-8000-00AA006D2EA4}';
  CLASS_Group: TGUID = '{00000106-0000-0010-8000-00AA006D2EA4}';
  IID_Connections: TGUID = '{00000043-0000-0010-8000-00AA006D2EA4}';
  IID_Errors: TGUID = '{00000025-0000-0010-8000-00AA006D2EA4}';
  IID_Error: TGUID = '{00000023-0000-0010-8000-00AA006D2EA4}';
  CLASS_DBEngine: TGUID = '{00000100-0000-0010-8000-00AA006D2EA4}';
  CLASS_PrivDBEngine: TGUID = '{00000101-0000-0010-8000-00AA006D2EA4}';
  IID_IndexFields: TGUID = '{0000005D-0000-0010-8000-00AA006D2EA4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum RecordsetTypeEnum
type
  RecordsetTypeEnum = TOleEnum;
const
  dbOpenTable = $00000001;
  dbOpenDynaset = $00000002;
  dbOpenSnapshot = $00000004;
  dbOpenForwardOnly = $00000008;
  dbOpenDynamic = $00000010;

// Constants for enum EditModeEnum
type
  EditModeEnum = TOleEnum;
const
  dbEditNone = $00000000;
  dbEditInProgress = $00000001;
  dbEditAdd = $00000002;

// Constants for enum RecordsetOptionEnum
type
  RecordsetOptionEnum = TOleEnum;
const
  dbDenyWrite = $00000001;
  dbDenyRead = $00000002;
  dbReadOnly = $00000004;
  dbAppendOnly = $00000008;
  dbInconsistent = $00000010;
  dbConsistent = $00000020;
  dbSQLPassThrough = $00000040;
  dbFailOnError = $00000080;
  dbForwardOnly = $00000100;
  dbSeeChanges = $00000200;
  dbRunAsync = $00000400;
  dbExecDirect = $00000800;

// Constants for enum LockTypeEnum
type
  LockTypeEnum = TOleEnum;
const
  dbPessimistic = $00000002;
  dbOptimistic = $00000003;
  dbOptimisticValue = $00000001;
  dbOptimisticBatch = $00000005;

// Constants for enum UpdateCriteriaEnum
type
  UpdateCriteriaEnum = TOleEnum;
const
  dbCriteriaKey = $00000001;
  dbCriteriaModValues = $00000002;
  dbCriteriaAllCols = $00000004;
  dbCriteriaTimestamp = $00000008;
  dbCriteriaDeleteInsert = $00000010;
  dbCriteriaUpdate = $00000020;

// Constants for enum FieldAttributeEnum
type
  FieldAttributeEnum = TOleEnum;
const
  dbFixedField = $00000001;
  dbVariableField = $00000002;
  dbAutoIncrField = $00000010;
  dbUpdatableField = $00000020;
  dbSystemField = $00002000;
  dbHyperlinkField = $00008000;
  dbDescending = $00000001;

// Constants for enum DataTypeEnum
type
  DataTypeEnum = TOleEnum;
const
  dbBoolean = $00000001;
  dbByte = $00000002;
  dbInteger = $00000003;
  dbLong = $00000004;
  dbCurrency = $00000005;
  dbSingle = $00000006;
  dbDouble = $00000007;
  dbDate = $00000008;
  dbBinary = $00000009;
  dbText = $0000000A;
  dbLongBinary = $0000000B;
  dbMemo = $0000000C;
  dbGUID = $0000000F;
  dbBigInt = $00000010;
  dbVarBinary = $00000011;
  dbChar = $00000012;
  dbNumeric = $00000013;
  dbDecimal = $00000014;
  dbFloat = $00000015;
  dbTime = $00000016;
  dbTimeStamp = $00000017;

// Constants for enum RelationAttributeEnum
type
  RelationAttributeEnum = TOleEnum;
const
  dbRelationUnique = $00000001;
  dbRelationDontEnforce = $00000002;
  dbRelationInherited = $00000004;
  dbRelationUpdateCascade = $00000100;
  dbRelationDeleteCascade = $00001000;
  dbRelationLeft = $01000000;
  dbRelationRight = $02000000;

// Constants for enum TableDefAttributeEnum
type
  TableDefAttributeEnum = TOleEnum;
const
  dbAttachExclusive = $00010000;
  dbAttachSavePWD = $00020000;
  dbSystemObject = $80000002;
  dbAttachedTable = $40000000;
  dbAttachedODBC = $20000000;
  dbHiddenObject = $00000001;

// Constants for enum QueryDefTypeEnum
type
  QueryDefTypeEnum = TOleEnum;
const
  dbQSelect = $00000000;
  dbQProcedure = $000000E0;
  dbQAction = $000000F0;
  dbQCrosstab = $00000010;
  dbQDelete = $00000020;
  dbQUpdate = $00000030;
  dbQAppend = $00000040;
  dbQMakeTable = $00000050;
  dbQDDL = $00000060;
  dbQSQLPassThrough = $00000070;
  dbQSetOperation = $00000080;
  dbQSPTBulk = $00000090;
  dbQCompound = $000000A0;

// Constants for enum QueryDefStateEnum
type
  QueryDefStateEnum = TOleEnum;
const
  dbQPrepare = $00000001;
  dbQUnprepare = $00000002;

// Constants for enum DatabaseTypeEnum
type
  DatabaseTypeEnum = TOleEnum;
const
  dbVersion10 = $00000001;
  dbEncrypt = $00000002;
  dbDecrypt = $00000004;
  dbVersion11 = $00000008;
  dbVersion20 = $00000010;
  dbVersion30 = $00000020;
  dbVersion40 = $00000040;

// Constants for enum CollatingOrderEnum
type
  CollatingOrderEnum = TOleEnum;
const
  dbSortNeutral = $00000400;
  dbSortArabic = $00000401;
  dbSortCyrillic = $00000419;
  dbSortCzech = $00000405;
  dbSortDutch = $00000413;
  dbSortGeneral = $00000409;
  dbSortGreek = $00000408;
  dbSortHebrew = $0000040D;
  dbSortHungarian = $0000040E;
  dbSortIcelandic = $0000040F;
  dbSortNorwdan = $00000406;
  dbSortPDXIntl = $00000409;
  dbSortPDXNor = $00000406;
  dbSortPDXSwe = $0000041D;
  dbSortPolish = $00000415;
  dbSortSpanish = $0000040A;
  dbSortSwedFin = $0000041D;
  dbSortTurkish = $0000041F;
  dbSortJapanese = $00000411;
  dbSortChineseSimplified = $00000804;
  dbSortChineseTraditional = $00000404;
  dbSortKorean = $00000412;
  dbSortThai = $0000041E;
  dbSortSlovenian = $00000424;
  dbSortUndefined = $FFFFFFFF;

// Constants for enum IdleEnum
type
  IdleEnum = TOleEnum;
const
  dbFreeLocks = $00000001;
  dbRefreshCache = $00000008;

// Constants for enum PermissionEnum
type
  PermissionEnum = TOleEnum;
const
  dbSecNoAccess = $00000000;
  dbSecFullAccess = $000FFFFF;
  dbSecDelete = $00010000;
  dbSecReadSec = $00020000;
  dbSecWriteSec = $00040000;
  dbSecWriteOwner = $00080000;
  dbSecDBCreate = $00000001;
  dbSecDBOpen = $00000002;
  dbSecDBExclusive = $00000004;
  dbSecDBAdmin = $00000008;
  dbSecCreate = $00000001;
  dbSecReadDef = $00000004;
  dbSecWriteDef = $0001000C;
  dbSecRetrieveData = $00000014;
  dbSecInsertData = $00000020;
  dbSecReplaceData = $00000040;
  dbSecDeleteData = $00000080;

// Constants for enum SynchronizeTypeEnum
type
  SynchronizeTypeEnum = TOleEnum;
const
  dbRepExportChanges = $00000001;
  dbRepImportChanges = $00000002;
  dbRepImpExpChanges = $00000004;
  dbRepSyncInternet = $00000010;

// Constants for enum ReplicaTypeEnum
type
  ReplicaTypeEnum = TOleEnum;
const
  dbRepMakeReadOnly = $00000002;
  dbRepMakePartial = $00000001;

// Constants for enum WorkspaceTypeEnum
type
  WorkspaceTypeEnum = TOleEnum;
const
  dbUseODBC = $00000001;
  dbUseJet = $00000002;

// Constants for enum CursorDriverEnum
type
  CursorDriverEnum = TOleEnum;
const
  dbUseDefaultCursor = $FFFFFFFF;
  dbUseODBCCursor = $00000001;
  dbUseServerCursor = $00000002;
  dbUseClientBatchCursor = $00000003;
  dbUseNoCursor = $00000004;

// Constants for enum DriverPromptEnum
type
  DriverPromptEnum = TOleEnum;
const
  dbDriverPrompt = $00000002;
  dbDriverNoPrompt = $00000001;
  dbDriverComplete = $00000000;
  dbDriverCompleteRequired = $00000003;

// Constants for enum SetOptionEnum
type
  SetOptionEnum = TOleEnum;
const
  dbPageTimeout = $00000006;
  dbLockRetry = $00000039;
  dbMaxBufferSize = $00000008;
  dbUserCommitSync = $0000003A;
  dbImplicitCommitSync = $0000003B;
  dbExclusiveAsyncDelay = $0000003C;
  dbSharedAsyncDelay = $0000003D;
  dbMaxLocksPerFile = $0000003E;
  dbLockDelay = $0000003F;
  dbRecycleLVs = $00000041;
  dbFlushTransactionTimeout = $00000042;

// Constants for enum ParameterDirectionEnum
type
  ParameterDirectionEnum = TOleEnum;
const
  dbParamInput = $00000001;
  dbParamOutput = $00000002;
  dbParamInputOutput = $00000003;
  dbParamReturnValue = $00000004;

// Constants for enum UpdateTypeEnum
type
  UpdateTypeEnum = TOleEnum;
const
  dbUpdateBatch = $00000004;
  dbUpdateRegular = $00000001;
  dbUpdateCurrentRecord = $00000002;

// Constants for enum RecordStatusEnum
type
  RecordStatusEnum = TOleEnum;
const
  dbRecordUnmodified = $00000000;
  dbRecordModified = $00000001;
  dbRecordNew = $00000002;
  dbRecordDeleted = $00000003;
  dbRecordDBDeleted = $00000004;

// Constants for enum CommitTransOptionsEnum
type
  CommitTransOptionsEnum = TOleEnum;
const
  dbForceOSFlush = $00000001;

// Constants for enum _DAOSuppHelp
type
  _DAOSuppHelp = TOleEnum;
const
  LogMessages = $00000000;
  KeepLocal = $00000000;
  Replicable = $00000000;
  ReplicableBool = $00000000;
  V1xNullBehavior = $00000000;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DAO = interface;
  _DAODisp = dispinterface;
  _DBEngine = interface;
  _DBEngineDisp = dispinterface;
  _Collection = interface;
  _CollectionDisp = dispinterface;
  _DynaCollection = interface;
  _DynaCollectionDisp = dispinterface;
  Properties = interface;
  PropertiesDisp = dispinterface;
  Property_ = interface;
  Property_Disp = dispinterface;
  Workspaces = interface;
  WorkspacesDisp = dispinterface;
  Workspace = interface;
  WorkspaceDisp = dispinterface;
  Databases = interface;
  DatabasesDisp = dispinterface;
  Database = interface;
  DatabaseDisp = dispinterface;
  TableDefs = interface;
  TableDefsDisp = dispinterface;
  _TableDef = interface;
  _TableDefDisp = dispinterface;
  Fields = interface;
  FieldsDisp = dispinterface;
  _Field = interface;
  _FieldDisp = dispinterface;
  Indexes = interface;
  IndexesDisp = dispinterface;
  _Index = interface;
  _IndexDisp = dispinterface;
  Recordset = interface;
  RecordsetDisp = dispinterface;
  _QueryDef = interface;
  _QueryDefDisp = dispinterface;
  Parameters = interface;
  ParametersDisp = dispinterface;
  Parameter = interface;
  ParameterDisp = dispinterface;
  Connection = interface;
  ConnectionDisp = dispinterface;
  QueryDefs = interface;
  QueryDefsDisp = dispinterface;
  Recordsets = interface;
  RecordsetsDisp = dispinterface;
  Relations = interface;
  RelationsDisp = dispinterface;
  _Relation = interface;
  _RelationDisp = dispinterface;
  Containers = interface;
  ContainersDisp = dispinterface;
  Container = interface;
  ContainerDisp = dispinterface;
  Documents = interface;
  DocumentsDisp = dispinterface;
  Document = interface;
  DocumentDisp = dispinterface;
  Users = interface;
  UsersDisp = dispinterface;
  _User = interface;
  _UserDisp = dispinterface;
  Groups = interface;
  GroupsDisp = dispinterface;
  _Group = interface;
  _GroupDisp = dispinterface;
  Connections = interface;
  ConnectionsDisp = dispinterface;
  Errors = interface;
  ErrorsDisp = dispinterface;
  Error = interface;
  ErrorDisp = dispinterface;
  IndexFields = interface;
  IndexFieldsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TableDef = _TableDef;
  Field = _Field;
  Index = _Index;
  QueryDef = _QueryDef;
  Relation = _Relation;
  User = _User;
  Group = _Group;
  DBEngine = _DBEngine;
  PrivDBEngine = _DBEngine;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}
  PSmallint1 = ^Smallint; {*}


// *********************************************************************//
// Interface: _DAO
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000000A-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DAO = interface(IDispatch)
    ['{0000000A-0000-0010-8000-00AA006D2EA4}']
    function Get_Properties: Properties; safecall;
    property Properties: Properties read Get_Properties;
  end;

// *********************************************************************//
// DispIntf:  _DAODisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000000A-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DAODisp = dispinterface
    ['{0000000A-0000-0010-8000-00AA006D2EA4}']
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: _DBEngine
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000021-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DBEngine = interface(_DAO)
    ['{00000021-0000-0010-8000-00AA006D2EA4}']
    function Get_Version: WideString; safecall;
    function Get_IniPath: WideString; safecall;
    procedure Set_IniPath(const pbstr: WideString); safecall;
    procedure Set_DefaultUser(const Param1: WideString); safecall;
    procedure Set_DefaultPassword(const Param1: WideString); safecall;
    function Get_LoginTimeout: Smallint; safecall;
    procedure Set_LoginTimeout(ps: Smallint); safecall;
    function Get_Workspaces: Workspaces; safecall;
    function Get_Errors: Errors; safecall;
    procedure Idle(Action: OleVariant); safecall;
    procedure CompactDatabase(const SrcName: WideString; const DstName: WideString; 
                              DstLocale: OleVariant; Options: OleVariant; SrcLocale: OleVariant); safecall;
    procedure RepairDatabase(const Name: WideString); safecall;
    procedure RegisterDatabase(const Dsn: WideString; const Driver: WideString; Silent: WordBool; 
                               const Attributes: WideString); safecall;
    function _30_CreateWorkspace(const Name: WideString; const UserName: WideString; 
                                 const Password: WideString): Workspace; safecall;
    function OpenDatabase(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                          Connect: OleVariant): Database; safecall;
    function CreateDatabase(const Name: WideString; const Locale: WideString; Option: OleVariant): Database; safecall;
    procedure FreeLocks; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans(Option: Integer); safecall;
    procedure Rollback; safecall;
    procedure SetDefaultWorkspace(const Name: WideString; const Password: WideString); safecall;
    procedure SetDataAccessOption(Option: Smallint; Value: OleVariant); safecall;
    function ISAMStats(StatNum: Integer; Reset: OleVariant): Integer; safecall;
    function Get_SystemDB: WideString; safecall;
    procedure Set_SystemDB(const pbstr: WideString); safecall;
    function CreateWorkspace(const Name: WideString; const UserName: WideString; 
                             const Password: WideString; UseType: OleVariant): Workspace; safecall;
    function OpenConnection(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                            Connect: OleVariant): Connection; safecall;
    function Get_DefaultType: Integer; safecall;
    procedure Set_DefaultType(Option: Integer); safecall;
    procedure SetOption(Option: Integer; Value: OleVariant); safecall;
    property Version: WideString read Get_Version;
    property IniPath: WideString read Get_IniPath write Set_IniPath;
    property DefaultUser: WideString write Set_DefaultUser;
    property DefaultPassword: WideString write Set_DefaultPassword;
    property LoginTimeout: Smallint read Get_LoginTimeout write Set_LoginTimeout;
    property Workspaces: Workspaces read Get_Workspaces;
    property Errors: Errors read Get_Errors;
    property SystemDB: WideString read Get_SystemDB write Set_SystemDB;
    property DefaultType: Integer read Get_DefaultType write Set_DefaultType;
  end;

// *********************************************************************//
// DispIntf:  _DBEngineDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000021-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DBEngineDisp = dispinterface
    ['{00000021-0000-0010-8000-00AA006D2EA4}']
    property Version: WideString readonly dispid 1610809344;
    property IniPath: WideString dispid 1610809345;
    property DefaultUser: WideString writeonly dispid 1610809347;
    property DefaultPassword: WideString writeonly dispid 1610809348;
    property LoginTimeout: Smallint dispid 1610809349;
    property Workspaces: Workspaces readonly dispid 0;
    property Errors: Errors readonly dispid 1610809352;
    procedure Idle(Action: OleVariant); dispid 1610809353;
    procedure CompactDatabase(const SrcName: WideString; const DstName: WideString; 
                              DstLocale: OleVariant; Options: OleVariant; SrcLocale: OleVariant); dispid 1610809354;
    procedure RepairDatabase(const Name: WideString); dispid 1610809355;
    procedure RegisterDatabase(const Dsn: WideString; const Driver: WideString; Silent: WordBool; 
                               const Attributes: WideString); dispid 1610809356;
    function _30_CreateWorkspace(const Name: WideString; const UserName: WideString; 
                                 const Password: WideString): Workspace; dispid 1610809357;
    function OpenDatabase(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                          Connect: OleVariant): Database; dispid 1610809358;
    function CreateDatabase(const Name: WideString; const Locale: WideString; Option: OleVariant): Database; dispid 1610809359;
    procedure FreeLocks; dispid 1610809360;
    procedure BeginTrans; dispid 1610809361;
    procedure CommitTrans(Option: Integer); dispid 1610809362;
    procedure Rollback; dispid 1610809363;
    procedure SetDefaultWorkspace(const Name: WideString; const Password: WideString); dispid 1610809364;
    procedure SetDataAccessOption(Option: Smallint; Value: OleVariant); dispid 1610809365;
    function ISAMStats(StatNum: Integer; Reset: OleVariant): Integer; dispid 1610809366;
    property SystemDB: WideString dispid 1610809367;
    function CreateWorkspace(const Name: WideString; const UserName: WideString; 
                             const Password: WideString; UseType: OleVariant): Workspace; dispid 1610809369;
    function OpenConnection(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                            Connect: OleVariant): Connection; dispid 1610809370;
    property DefaultType: Integer dispid 1610809371;
    procedure SetOption(Option: Integer; Value: OleVariant); dispid 1610809373;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: _Collection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {000000A0-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Collection = interface(IDispatch)
    ['{000000A0-0000-0010-8000-00AA006D2EA4}']
    function Get_Count: Smallint; safecall;
    function _NewEnum: IUnknown; safecall;
    procedure Refresh; safecall;
    property Count: Smallint read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  _CollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {000000A0-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _CollectionDisp = dispinterface
    ['{000000A0-0000-0010-8000-00AA006D2EA4}']
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _DynaCollection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {000000A2-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollection = interface(_Collection)
    ['{000000A2-0000-0010-8000-00AA006D2EA4}']
    procedure Append(const Object_: IDispatch); safecall;
    procedure Delete(const Name: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  _DynaCollectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {000000A2-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _DynaCollectionDisp = dispinterface
    ['{000000A2-0000-0010-8000-00AA006D2EA4}']
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Properties
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000029-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Properties = interface(_DynaCollection)
    ['{00000029-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Property_; safecall;
    property Item[Item: OleVariant]: Property_ read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  PropertiesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000029-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  PropertiesDisp = dispinterface
    ['{00000029-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Property_ readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Property_
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000027-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_ = interface(_DAO)
    ['{00000027-0000-0010-8000-00AA006D2EA4}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pval: OleVariant); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_type_: Smallint; safecall;
    procedure Set_type_(ptype: Smallint); safecall;
    function Get_Inherited_: WordBool; safecall;
    property Value: OleVariant read Get_Value write Set_Value;
    property Name: WideString read Get_Name write Set_Name;
    property type_: Smallint read Get_type_ write Set_type_;
    property Inherited_: WordBool read Get_Inherited_;
  end;

// *********************************************************************//
// DispIntf:  Property_Disp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000027-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Property_Disp = dispinterface
    ['{00000027-0000-0010-8000-00AA006D2EA4}']
    property Value: OleVariant dispid 0;
    property Name: WideString dispid 1610809346;
    property type_: Smallint dispid 1610809348;
    property Inherited_: WordBool readonly dispid 1610809350;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Workspaces
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000003B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Workspaces = interface(_DynaCollection)
    ['{0000003B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Workspace; safecall;
    property Item[Item: OleVariant]: Workspace read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  WorkspacesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000003B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  WorkspacesDisp = dispinterface
    ['{0000003B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Workspace readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Workspace
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000039-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Workspace = interface(_DAO)
    ['{00000039-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_UserName: WideString; safecall;
    procedure Set__30_UserName(const Param1: WideString); safecall;
    procedure Set__30_Password(const Param1: WideString); safecall;
    function Get_IsolateODBCTrans: Smallint; safecall;
    procedure Set_IsolateODBCTrans(ps: Smallint); safecall;
    function Get_Databases: Databases; safecall;
    function Get_Users: Users; safecall;
    function Get_Groups: Groups; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans(Options: Integer); safecall;
    procedure Close; safecall;
    procedure Rollback; safecall;
    function OpenDatabase(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                          Connect: OleVariant): Database; safecall;
    function CreateDatabase(const Name: WideString; const Connect: WideString; Option: OleVariant): Database; safecall;
    function CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User; safecall;
    function CreateGroup(Name: OleVariant; PID: OleVariant): Group; safecall;
    function OpenConnection(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                            Connect: OleVariant): Connection; safecall;
    function Get_LoginTimeout: Integer; safecall;
    procedure Set_LoginTimeout(pTimeout: Integer); safecall;
    function Get_DefaultCursorDriver: Integer; safecall;
    procedure Set_DefaultCursorDriver(pCursorType: Integer); safecall;
    function Get_hEnv: Integer; safecall;
    function Get_type_: Integer; safecall;
    function Get_Connections: Connections; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property UserName: WideString read Get_UserName;
    property _30_UserName: WideString write Set__30_UserName;
    property _30_Password: WideString write Set__30_Password;
    property IsolateODBCTrans: Smallint read Get_IsolateODBCTrans write Set_IsolateODBCTrans;
    property Databases: Databases read Get_Databases;
    property Users: Users read Get_Users;
    property Groups: Groups read Get_Groups;
    property LoginTimeout: Integer read Get_LoginTimeout write Set_LoginTimeout;
    property DefaultCursorDriver: Integer read Get_DefaultCursorDriver write Set_DefaultCursorDriver;
    property hEnv: Integer read Get_hEnv;
    property type_: Integer read Get_type_;
    property Connections: Connections read Get_Connections;
  end;

// *********************************************************************//
// DispIntf:  WorkspaceDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000039-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  WorkspaceDisp = dispinterface
    ['{00000039-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 1610809344;
    property UserName: WideString readonly dispid 1610809346;
    property _30_UserName: WideString writeonly dispid 1610809347;
    property _30_Password: WideString writeonly dispid 1610809348;
    property IsolateODBCTrans: Smallint dispid 1610809349;
    property Databases: Databases readonly dispid 0;
    property Users: Users readonly dispid 1610809352;
    property Groups: Groups readonly dispid 1610809353;
    procedure BeginTrans; dispid 1610809354;
    procedure CommitTrans(Options: Integer); dispid 1610809355;
    procedure Close; dispid 1610809356;
    procedure Rollback; dispid 1610809357;
    function OpenDatabase(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                          Connect: OleVariant): Database; dispid 1610809358;
    function CreateDatabase(const Name: WideString; const Connect: WideString; Option: OleVariant): Database; dispid 1610809359;
    function CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User; dispid 1610809360;
    function CreateGroup(Name: OleVariant; PID: OleVariant): Group; dispid 1610809361;
    function OpenConnection(const Name: WideString; Options: OleVariant; ReadOnly: OleVariant; 
                            Connect: OleVariant): Connection; dispid 1610809362;
    property LoginTimeout: Integer dispid 1610809363;
    property DefaultCursorDriver: Integer dispid 1610809365;
    property hEnv: Integer readonly dispid 1610809367;
    property type_: Integer readonly dispid 1610809368;
    property Connections: Connections readonly dispid 1610809369;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Databases
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000073-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Databases = interface(_Collection)
    ['{00000073-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Database; safecall;
    property Item[Item: OleVariant]: Database read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  DatabasesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000073-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  DatabasesDisp = dispinterface
    ['{00000073-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Database readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Database
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000071-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Database = interface(_DAO)
    ['{00000071-0000-0010-8000-00AA006D2EA4}']
    function Get_CollatingOrder: Integer; safecall;
    function Get_Connect: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_QueryTimeout: Smallint; safecall;
    procedure Set_QueryTimeout(ps: Smallint); safecall;
    function Get_Transactions: WordBool; safecall;
    function Get_Updatable: WordBool; safecall;
    function Get_Version: WideString; safecall;
    function Get_RecordsAffected: Integer; safecall;
    function Get_TableDefs: TableDefs; safecall;
    function Get_QueryDefs: QueryDefs; safecall;
    function Get_Relations: Relations; safecall;
    function Get_Containers: Containers; safecall;
    function Get_Recordsets: Recordsets; safecall;
    procedure Close; safecall;
    procedure Execute(const Query: WideString; Options: OleVariant); safecall;
    function _30_OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant): Recordset; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    function CreateRelation(Name: OleVariant; Table: OleVariant; ForeignTable: OleVariant; 
                            Attributes: OleVariant): Relation; safecall;
    function CreateTableDef(Name: OleVariant; Attributes: OleVariant; SourceTableName: OleVariant; 
                            Connect: OleVariant): TableDef; safecall;
    procedure BeginTrans; safecall;
    procedure CommitTrans(Options: Integer); safecall;
    procedure Rollback; safecall;
    function CreateDynaset(const Name: WideString; Options: OleVariant; Inconsistent: OleVariant): Recordset; safecall;
    function CreateQueryDef(Name: OleVariant; SQLText: OleVariant): QueryDef; safecall;
    function CreateSnapshot(const Source: WideString; Options: OleVariant): Recordset; safecall;
    procedure DeleteQueryDef(const Name: WideString); safecall;
    function ExecuteSQL(const SQL: WideString): Integer; safecall;
    function ListFields(const Name: WideString): Recordset; safecall;
    function ListTables: Recordset; safecall;
    function OpenQueryDef(const Name: WideString): QueryDef; safecall;
    function OpenTable(const Name: WideString; Options: OleVariant): Recordset; safecall;
    function Get_ReplicaID: WideString; safecall;
    function Get_DesignMasterID: WideString; safecall;
    procedure Set_DesignMasterID(const pbstr: WideString); safecall;
    procedure Synchronize(const DbPathName: WideString; ExchangeType: OleVariant); safecall;
    procedure MakeReplica(const PathName: WideString; const Description: WideString; 
                          Options: OleVariant); safecall;
    procedure Set_Connect(const pbstr: WideString); safecall;
    procedure NewPassword(const bstrOld: WideString; const bstrNew: WideString); safecall;
    function OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant; 
                           LockEdit: OleVariant): Recordset; safecall;
    function Get_Connection: Connection; safecall;
    procedure PopulatePartial(const DbPathName: WideString); safecall;
    property CollatingOrder: Integer read Get_CollatingOrder;
    property Connect: WideString read Get_Connect write Set_Connect;
    property Name: WideString read Get_Name;
    property QueryTimeout: Smallint read Get_QueryTimeout write Set_QueryTimeout;
    property Transactions: WordBool read Get_Transactions;
    property Updatable: WordBool read Get_Updatable;
    property Version: WideString read Get_Version;
    property RecordsAffected: Integer read Get_RecordsAffected;
    property TableDefs: TableDefs read Get_TableDefs;
    property QueryDefs: QueryDefs read Get_QueryDefs;
    property Relations: Relations read Get_Relations;
    property Containers: Containers read Get_Containers;
    property Recordsets: Recordsets read Get_Recordsets;
    property ReplicaID: WideString read Get_ReplicaID;
    property DesignMasterID: WideString read Get_DesignMasterID write Set_DesignMasterID;
    property Connection: Connection read Get_Connection;
  end;

// *********************************************************************//
// DispIntf:  DatabaseDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000071-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  DatabaseDisp = dispinterface
    ['{00000071-0000-0010-8000-00AA006D2EA4}']
    property CollatingOrder: Integer readonly dispid 1610809344;
    property Connect: WideString dispid 1610809345;
    property Name: WideString readonly dispid 1610809346;
    property QueryTimeout: Smallint dispid 1610809347;
    property Transactions: WordBool readonly dispid 1610809349;
    property Updatable: WordBool readonly dispid 1610809350;
    property Version: WideString readonly dispid 1610809351;
    property RecordsAffected: Integer readonly dispid 1610809352;
    property TableDefs: TableDefs readonly dispid 0;
    property QueryDefs: QueryDefs readonly dispid 1610809354;
    property Relations: Relations readonly dispid 1610809355;
    property Containers: Containers readonly dispid 1610809356;
    property Recordsets: Recordsets readonly dispid 1610809357;
    procedure Close; dispid 1610809358;
    procedure Execute(const Query: WideString; Options: OleVariant); dispid 1610809359;
    function _30_OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant): Recordset; dispid 1610809360;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809361;
    function CreateRelation(Name: OleVariant; Table: OleVariant; ForeignTable: OleVariant; 
                            Attributes: OleVariant): Relation; dispid 1610809362;
    function CreateTableDef(Name: OleVariant; Attributes: OleVariant; SourceTableName: OleVariant; 
                            Connect: OleVariant): TableDef; dispid 1610809363;
    procedure BeginTrans; dispid 1610809364;
    procedure CommitTrans(Options: Integer); dispid 1610809365;
    procedure Rollback; dispid 1610809366;
    function CreateDynaset(const Name: WideString; Options: OleVariant; Inconsistent: OleVariant): Recordset; dispid 1610809367;
    function CreateQueryDef(Name: OleVariant; SQLText: OleVariant): QueryDef; dispid 1610809368;
    function CreateSnapshot(const Source: WideString; Options: OleVariant): Recordset; dispid 1610809369;
    procedure DeleteQueryDef(const Name: WideString); dispid 1610809370;
    function ExecuteSQL(const SQL: WideString): Integer; dispid 1610809371;
    function ListFields(const Name: WideString): Recordset; dispid 1610809372;
    function ListTables: Recordset; dispid 1610809373;
    function OpenQueryDef(const Name: WideString): QueryDef; dispid 1610809374;
    function OpenTable(const Name: WideString; Options: OleVariant): Recordset; dispid 1610809375;
    property ReplicaID: WideString readonly dispid 1610809376;
    property DesignMasterID: WideString dispid 1610809377;
    procedure Synchronize(const DbPathName: WideString; ExchangeType: OleVariant); dispid 1610809379;
    procedure MakeReplica(const PathName: WideString; const Description: WideString; 
                          Options: OleVariant); dispid 1610809380;
    procedure NewPassword(const bstrOld: WideString; const bstrNew: WideString); dispid 1610809382;
    function OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant; 
                           LockEdit: OleVariant): Recordset; dispid 1610809383;
    property Connection: Connection readonly dispid 1610809384;
    procedure PopulatePartial(const DbPathName: WideString); dispid 1610809385;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: TableDefs
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000004B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  TableDefs = interface(_DynaCollection)
    ['{0000004B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): TableDef; safecall;
    property Item[Item: OleVariant]: TableDef read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  TableDefsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000004B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  TableDefsDisp = dispinterface
    ['{0000004B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: TableDef readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _TableDef
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000049-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _TableDef = interface(_DAO)
    ['{00000049-0000-0010-8000-00AA006D2EA4}']
    function Get_Attributes: Integer; safecall;
    procedure Set_Attributes(pl: Integer); safecall;
    function Get_Connect: WideString; safecall;
    procedure Set_Connect(const pbstr: WideString); safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_LastUpdated: OleVariant; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_SourceTableName: WideString; safecall;
    procedure Set_SourceTableName(const pbstr: WideString); safecall;
    function Get_Updatable: WordBool; safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pbstr: WideString); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pbstr: WideString); safecall;
    function Get_RecordCount: Integer; safecall;
    function Get_Fields: Fields; safecall;
    function Get_Indexes: Indexes; safecall;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; safecall;
    procedure RefreshLink; safecall;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; safecall;
    function CreateIndex(Name: OleVariant): Index; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    function Get_ConflictTable: WideString; safecall;
    function Get_ReplicaFilter: OleVariant; safecall;
    procedure Set_ReplicaFilter(pFilter: OleVariant); safecall;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property Connect: WideString read Get_Connect write Set_Connect;
    property DateCreated: OleVariant read Get_DateCreated;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property Name: WideString read Get_Name write Set_Name;
    property SourceTableName: WideString read Get_SourceTableName write Set_SourceTableName;
    property Updatable: WordBool read Get_Updatable;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property RecordCount: Integer read Get_RecordCount;
    property Fields: Fields read Get_Fields;
    property Indexes: Indexes read Get_Indexes;
    property ConflictTable: WideString read Get_ConflictTable;
    property ReplicaFilter: OleVariant read Get_ReplicaFilter write Set_ReplicaFilter;
  end;

// *********************************************************************//
// DispIntf:  _TableDefDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000049-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _TableDefDisp = dispinterface
    ['{00000049-0000-0010-8000-00AA006D2EA4}']
    property Attributes: Integer dispid 1610809344;
    property Connect: WideString dispid 1610809346;
    property DateCreated: OleVariant readonly dispid 1610809348;
    property LastUpdated: OleVariant readonly dispid 1610809349;
    property Name: WideString dispid 1610809350;
    property SourceTableName: WideString dispid 1610809352;
    property Updatable: WordBool readonly dispid 1610809354;
    property ValidationText: WideString dispid 1610809355;
    property ValidationRule: WideString dispid 1610809357;
    property RecordCount: Integer readonly dispid 1610809359;
    property Fields: Fields readonly dispid 0;
    property Indexes: Indexes readonly dispid 1610809361;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; dispid 1610809362;
    procedure RefreshLink; dispid 1610809363;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; dispid 1610809364;
    function CreateIndex(Name: OleVariant): Index; dispid 1610809365;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809366;
    property ConflictTable: WideString readonly dispid 1610809367;
    property ReplicaFilter: OleVariant dispid 1610809368;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Fields
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000053-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Fields = interface(_DynaCollection)
    ['{00000053-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Field; safecall;
    property Item[Item: OleVariant]: Field read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  FieldsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000053-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  FieldsDisp = dispinterface
    ['{00000053-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Field readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Field
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000051-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Field = interface(_DAO)
    ['{00000051-0000-0010-8000-00AA006D2EA4}']
    function Get_CollatingOrder: Integer; safecall;
    function Get_type_: Smallint; safecall;
    procedure Set_type_(ps: Smallint); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_Size: Integer; safecall;
    procedure Set_Size(pl: Integer); safecall;
    function Get_SourceField: WideString; safecall;
    function Get_SourceTable: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pvar: OleVariant); safecall;
    function Get_Attributes: Integer; safecall;
    procedure Set_Attributes(pl: Integer); safecall;
    function Get_OrdinalPosition: Smallint; safecall;
    procedure Set_OrdinalPosition(ps: Smallint); safecall;
    function Get_ValidationText: WideString; safecall;
    procedure Set_ValidationText(const pbstr: WideString); safecall;
    function Get_ValidateOnSet: WordBool; safecall;
    procedure Set_ValidateOnSet(pb: WordBool); safecall;
    function Get_ValidationRule: WideString; safecall;
    procedure Set_ValidationRule(const pbstr: WideString); safecall;
    function Get_DefaultValue: OleVariant; safecall;
    procedure Set_DefaultValue(pvar: OleVariant); safecall;
    function Get_Required: WordBool; safecall;
    procedure Set_Required(pb: WordBool); safecall;
    function Get_AllowZeroLength: WordBool; safecall;
    procedure Set_AllowZeroLength(pb: WordBool); safecall;
    function Get_DataUpdatable: WordBool; safecall;
    function Get_ForeignName: WideString; safecall;
    procedure Set_ForeignName(const pbstr: WideString); safecall;
    procedure AppendChunk(Val: OleVariant); safecall;
    function GetChunk(Offset: Integer; Bytes: Integer): OleVariant; safecall;
    function _30_FieldSize: Integer; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    function Get_CollectionIndex: Smallint; safecall;
    function Get_OriginalValue: OleVariant; safecall;
    function Get_VisibleValue: OleVariant; safecall;
    function Get_FieldSize: Integer; safecall;
    property CollatingOrder: Integer read Get_CollatingOrder;
    property type_: Smallint read Get_type_ write Set_type_;
    property Name: WideString read Get_Name write Set_Name;
    property Size: Integer read Get_Size write Set_Size;
    property SourceField: WideString read Get_SourceField;
    property SourceTable: WideString read Get_SourceTable;
    property Value: OleVariant read Get_Value write Set_Value;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property OrdinalPosition: Smallint read Get_OrdinalPosition write Set_OrdinalPosition;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidateOnSet: WordBool read Get_ValidateOnSet write Set_ValidateOnSet;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property DefaultValue: OleVariant read Get_DefaultValue write Set_DefaultValue;
    property Required: WordBool read Get_Required write Set_Required;
    property AllowZeroLength: WordBool read Get_AllowZeroLength write Set_AllowZeroLength;
    property DataUpdatable: WordBool read Get_DataUpdatable;
    property ForeignName: WideString read Get_ForeignName write Set_ForeignName;
    property CollectionIndex: Smallint read Get_CollectionIndex;
    property OriginalValue: OleVariant read Get_OriginalValue;
    property VisibleValue: OleVariant read Get_VisibleValue;
    property FieldSize: Integer read Get_FieldSize;
  end;

// *********************************************************************//
// DispIntf:  _FieldDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000051-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _FieldDisp = dispinterface
    ['{00000051-0000-0010-8000-00AA006D2EA4}']
    property CollatingOrder: Integer readonly dispid 1610809344;
    property type_: Smallint dispid 1610809345;
    property Name: WideString dispid 1610809347;
    property Size: Integer dispid 1610809349;
    property SourceField: WideString readonly dispid 1610809351;
    property SourceTable: WideString readonly dispid 1610809352;
    property Value: OleVariant dispid 0;
    property Attributes: Integer dispid 1610809355;
    property OrdinalPosition: Smallint dispid 1610809357;
    property ValidationText: WideString dispid 1610809359;
    property ValidateOnSet: WordBool dispid 1610809361;
    property ValidationRule: WideString dispid 1610809363;
    property DefaultValue: OleVariant dispid 1610809365;
    property Required: WordBool dispid 1610809367;
    property AllowZeroLength: WordBool dispid 1610809369;
    property DataUpdatable: WordBool readonly dispid 1610809371;
    property ForeignName: WideString dispid 1610809372;
    procedure AppendChunk(Val: OleVariant); dispid 1610809374;
    function GetChunk(Offset: Integer; Bytes: Integer): OleVariant; dispid 1610809375;
    function _30_FieldSize: Integer; dispid 1610809376;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809377;
    property CollectionIndex: Smallint readonly dispid 1610809378;
    property OriginalValue: OleVariant readonly dispid 1610809379;
    property VisibleValue: OleVariant readonly dispid 1610809380;
    property FieldSize: Integer readonly dispid 1610809381;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Indexes
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000005B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Indexes = interface(_DynaCollection)
    ['{0000005B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Index; safecall;
    property Item[Item: OleVariant]: Index read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IndexesDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000005B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  IndexesDisp = dispinterface
    ['{0000005B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Index readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Index
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000059-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Index = interface(_DAO)
    ['{00000059-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_Foreign: WordBool; safecall;
    function Get_Unique: WordBool; safecall;
    procedure Set_Unique(pb: WordBool); safecall;
    function Get_Clustered: WordBool; safecall;
    procedure Set_Clustered(pb: WordBool); safecall;
    function Get_Required: WordBool; safecall;
    procedure Set_Required(pb: WordBool); safecall;
    function Get_IgnoreNulls: WordBool; safecall;
    procedure Set_IgnoreNulls(pb: WordBool); safecall;
    function Get_Primary: WordBool; safecall;
    procedure Set_Primary(pb: WordBool); safecall;
    function Get_DistinctCount: Integer; safecall;
    function Get_Fields: OleVariant; safecall;
    procedure Set_Fields(pv: OleVariant); safecall;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Foreign: WordBool read Get_Foreign;
    property Unique: WordBool read Get_Unique write Set_Unique;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property Required: WordBool read Get_Required write Set_Required;
    property IgnoreNulls: WordBool read Get_IgnoreNulls write Set_IgnoreNulls;
    property Primary: WordBool read Get_Primary write Set_Primary;
    property DistinctCount: Integer read Get_DistinctCount;
    property Fields: OleVariant read Get_Fields write Set_Fields;
  end;

// *********************************************************************//
// DispIntf:  _IndexDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000059-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _IndexDisp = dispinterface
    ['{00000059-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 1610809344;
    property Foreign: WordBool readonly dispid 1610809346;
    property Unique: WordBool dispid 1610809347;
    property Clustered: WordBool dispid 1610809349;
    property Required: WordBool dispid 1610809351;
    property IgnoreNulls: WordBool dispid 1610809353;
    property Primary: WordBool dispid 1610809355;
    property DistinctCount: Integer readonly dispid 1610809357;
    property Fields: OleVariant dispid 1610809358;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; dispid 1610809360;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809361;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Recordset
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000031-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordset = interface(_DAO)
    ['{00000031-0000-0010-8000-00AA006D2EA4}']
    function Get_BOF: WordBool; safecall;
    function Get_Bookmark: PSafeArray; safecall;
    procedure Set_Bookmark(var ppsach: PSafeArray); safecall;
    function Get_Bookmarkable: WordBool; safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_EOF: WordBool; safecall;
    function Get_Filter: WideString; safecall;
    procedure Set_Filter(const pbstr: WideString); safecall;
    function Get_Index: WideString; safecall;
    procedure Set_Index(const pbstr: WideString); safecall;
    function Get_LastModified: PSafeArray; safecall;
    function Get_LastUpdated: OleVariant; safecall;
    function Get_LockEdits: WordBool; safecall;
    procedure Set_LockEdits(pb: WordBool); safecall;
    function Get_Name: WideString; safecall;
    function Get_NoMatch: WordBool; safecall;
    function Get_Sort: WideString; safecall;
    procedure Set_Sort(const pbstr: WideString); safecall;
    function Get_Transactions: WordBool; safecall;
    function Get_type_: Smallint; safecall;
    function Get_RecordCount: Integer; safecall;
    function Get_Updatable: WordBool; safecall;
    function Get_Restartable: WordBool; safecall;
    function Get_ValidationText: WideString; safecall;
    function Get_ValidationRule: WideString; safecall;
    function Get_CacheStart: PSafeArray; safecall;
    procedure Set_CacheStart(var ppsa: PSafeArray); safecall;
    function Get_CacheSize: Integer; safecall;
    procedure Set_CacheSize(pl: Integer); safecall;
    function Get_PercentPosition: Single; safecall;
    procedure Set_PercentPosition(pd: Single); safecall;
    function Get_AbsolutePosition: Integer; safecall;
    procedure Set_AbsolutePosition(pl: Integer); safecall;
    function Get_EditMode: Smallint; safecall;
    function Get_ODBCFetchCount: Integer; safecall;
    function Get_ODBCFetchDelay: Integer; safecall;
    function Get_Parent: Database; safecall;
    function Get_Fields: Fields; safecall;
    function Get_Indexes: Indexes; safecall;
    procedure _30_CancelUpdate; safecall;
    procedure AddNew; safecall;
    procedure Close; safecall;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; safecall;
    procedure Delete; safecall;
    procedure Edit; safecall;
    procedure FindFirst(const Criteria: WideString); safecall;
    procedure FindLast(const Criteria: WideString); safecall;
    procedure FindNext(const Criteria: WideString); safecall;
    procedure FindPrevious(const Criteria: WideString); safecall;
    procedure MoveFirst; safecall;
    procedure _30_MoveLast; safecall;
    procedure MoveNext; safecall;
    procedure MovePrevious; safecall;
    procedure Seek(const Comparison: WideString; Key1: OleVariant; Key2: OleVariant; 
                   Key3: OleVariant; Key4: OleVariant; Key5: OleVariant; Key6: OleVariant; 
                   Key7: OleVariant; Key8: OleVariant; Key9: OleVariant; Key10: OleVariant; 
                   Key11: OleVariant; Key12: OleVariant; Key13: OleVariant); safecall;
    procedure _30_Update; safecall;
    function Clone: Recordset; safecall;
    procedure Requery(NewQueryDef: OleVariant); safecall;
    procedure Move(Rows: Integer; StartBookmark: OleVariant); safecall;
    procedure FillCache(Rows: OleVariant; StartBookmark: OleVariant); safecall;
    function CreateDynaset(Options: OleVariant; Inconsistent: OleVariant): Recordset; safecall;
    function CreateSnapshot(Options: OleVariant): Recordset; safecall;
    function CopyQueryDef: QueryDef; safecall;
    function ListFields: Recordset; safecall;
    function ListIndexes: Recordset; safecall;
    function GetRows(NumRows: OleVariant): OleVariant; safecall;
    function Get_Collect(Item: OleVariant): OleVariant; safecall;
    procedure Set_Collect(Item: OleVariant; pvar: OleVariant); safecall;
    procedure Cancel; safecall;
    function NextRecordset: WordBool; safecall;
    function Get_hStmt: Integer; safecall;
    function Get_StillExecuting: WordBool; safecall;
    function Get_BatchSize: Integer; safecall;
    procedure Set_BatchSize(pl: Integer); safecall;
    function Get_BatchCollisionCount: Integer; safecall;
    function Get_BatchCollisions: OleVariant; safecall;
    function Get_Connection: Connection; safecall;
    procedure _Set_Connection(const ppCn: Connection); safecall;
    function Get_RecordStatus: Smallint; safecall;
    function Get_UpdateOptions: Integer; safecall;
    procedure Set_UpdateOptions(pl: Integer); safecall;
    procedure CancelUpdate(UpdateType: Integer); safecall;
    procedure Update(UpdateType: Integer; Force: WordBool); safecall;
    procedure MoveLast(Options: Integer); safecall;
    property BOF: WordBool read Get_BOF;
    property Bookmarkable: WordBool read Get_Bookmarkable;
    property DateCreated: OleVariant read Get_DateCreated;
    property EOF: WordBool read Get_EOF;
    property Filter: WideString read Get_Filter write Set_Filter;
    property Index: WideString read Get_Index write Set_Index;
    property LastModified: PSafeArray read Get_LastModified;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property LockEdits: WordBool read Get_LockEdits write Set_LockEdits;
    property Name: WideString read Get_Name;
    property NoMatch: WordBool read Get_NoMatch;
    property Sort: WideString read Get_Sort write Set_Sort;
    property Transactions: WordBool read Get_Transactions;
    property type_: Smallint read Get_type_;
    property RecordCount: Integer read Get_RecordCount;
    property Updatable: WordBool read Get_Updatable;
    property Restartable: WordBool read Get_Restartable;
    property ValidationText: WideString read Get_ValidationText;
    property ValidationRule: WideString read Get_ValidationRule;
    property CacheSize: Integer read Get_CacheSize write Set_CacheSize;
    property PercentPosition: Single read Get_PercentPosition write Set_PercentPosition;
    property AbsolutePosition: Integer read Get_AbsolutePosition write Set_AbsolutePosition;
    property EditMode: Smallint read Get_EditMode;
    property ODBCFetchCount: Integer read Get_ODBCFetchCount;
    property ODBCFetchDelay: Integer read Get_ODBCFetchDelay;
    property Parent: Database read Get_Parent;
    property Fields: Fields read Get_Fields;
    property Indexes: Indexes read Get_Indexes;
    property Collect[Item: OleVariant]: OleVariant read Get_Collect write Set_Collect;
    property hStmt: Integer read Get_hStmt;
    property StillExecuting: WordBool read Get_StillExecuting;
    property BatchSize: Integer read Get_BatchSize write Set_BatchSize;
    property BatchCollisionCount: Integer read Get_BatchCollisionCount;
    property BatchCollisions: OleVariant read Get_BatchCollisions;
    property Connection: Connection read Get_Connection write _Set_Connection;
    property RecordStatus: Smallint read Get_RecordStatus;
    property UpdateOptions: Integer read Get_UpdateOptions write Set_UpdateOptions;
  end;

// *********************************************************************//
// DispIntf:  RecordsetDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000031-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  RecordsetDisp = dispinterface
    ['{00000031-0000-0010-8000-00AA006D2EA4}']
    property BOF: WordBool readonly dispid 101;
    function Bookmark: {??PSafeArray}OleVariant; dispid 102;
    property Bookmarkable: WordBool readonly dispid 103;
    property DateCreated: OleVariant readonly dispid 104;
    property EOF: WordBool readonly dispid 105;
    property Filter: WideString dispid 106;
    property Index: WideString dispid 107;
    property LastModified: {??PSafeArray}OleVariant readonly dispid 108;
    property LastUpdated: OleVariant readonly dispid 109;
    property LockEdits: WordBool dispid 110;
    property Name: WideString readonly dispid 111;
    property NoMatch: WordBool readonly dispid 112;
    property Sort: WideString dispid 113;
    property Transactions: WordBool readonly dispid 114;
    property type_: Smallint readonly dispid 115;
    property RecordCount: Integer readonly dispid 116;
    property Updatable: WordBool readonly dispid 117;
    property Restartable: WordBool readonly dispid 118;
    property ValidationText: WideString readonly dispid 119;
    property ValidationRule: WideString readonly dispid 120;
    function CacheStart: {??PSafeArray}OleVariant; dispid 121;
    property CacheSize: Integer dispid 122;
    property PercentPosition: Single dispid 123;
    property AbsolutePosition: Integer dispid 124;
    property EditMode: Smallint readonly dispid 125;
    property ODBCFetchCount: Integer readonly dispid 126;
    property ODBCFetchDelay: Integer readonly dispid 127;
    property Parent: Database readonly dispid 128;
    property Fields: Fields readonly dispid 0;
    property Indexes: Indexes readonly dispid 130;
    procedure _30_CancelUpdate; dispid 131;
    procedure AddNew; dispid 132;
    procedure Close; dispid 133;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; dispid 134;
    procedure Delete; dispid 135;
    procedure Edit; dispid 136;
    procedure FindFirst(const Criteria: WideString); dispid 137;
    procedure FindLast(const Criteria: WideString); dispid 138;
    procedure FindNext(const Criteria: WideString); dispid 139;
    procedure FindPrevious(const Criteria: WideString); dispid 140;
    procedure MoveFirst; dispid 141;
    procedure _30_MoveLast; dispid 142;
    procedure MoveNext; dispid 143;
    procedure MovePrevious; dispid 144;
    procedure Seek(const Comparison: WideString; Key1: OleVariant; Key2: OleVariant; 
                   Key3: OleVariant; Key4: OleVariant; Key5: OleVariant; Key6: OleVariant; 
                   Key7: OleVariant; Key8: OleVariant; Key9: OleVariant; Key10: OleVariant; 
                   Key11: OleVariant; Key12: OleVariant; Key13: OleVariant); dispid 145;
    procedure _30_Update; dispid 146;
    function Clone: Recordset; dispid 147;
    procedure Requery(NewQueryDef: OleVariant); dispid 148;
    procedure Move(Rows: Integer; StartBookmark: OleVariant); dispid 149;
    procedure FillCache(Rows: OleVariant; StartBookmark: OleVariant); dispid 150;
    function CreateDynaset(Options: OleVariant; Inconsistent: OleVariant): Recordset; dispid 151;
    function CreateSnapshot(Options: OleVariant): Recordset; dispid 152;
    function CopyQueryDef: QueryDef; dispid 153;
    function ListFields: Recordset; dispid 154;
    function ListIndexes: Recordset; dispid 155;
    function GetRows(NumRows: OleVariant): OleVariant; dispid 156;
    property Collect[Item: OleVariant]: OleVariant dispid -8;
    procedure Cancel; dispid 157;
    function NextRecordset: WordBool; dispid 158;
    property hStmt: Integer readonly dispid 159;
    property StillExecuting: WordBool readonly dispid 160;
    property BatchSize: Integer dispid 161;
    property BatchCollisionCount: Integer readonly dispid 162;
    property BatchCollisions: OleVariant readonly dispid 163;
    property Connection: Connection dispid 164;
    property RecordStatus: Smallint readonly dispid 165;
    property UpdateOptions: Integer dispid 166;
    procedure CancelUpdate(UpdateType: Integer); dispid 167;
    procedure Update(UpdateType: Integer; Force: WordBool); dispid 168;
    procedure MoveLast(Options: Integer); dispid 169;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: _QueryDef
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000079-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _QueryDef = interface(_DAO)
    ['{00000079-0000-0010-8000-00AA006D2EA4}']
    function Get_DateCreated: OleVariant; safecall;
    function Get_LastUpdated: OleVariant; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_ODBCTimeout: Smallint; safecall;
    procedure Set_ODBCTimeout(ps: Smallint); safecall;
    function Get_type_: Smallint; safecall;
    function Get_SQL: WideString; safecall;
    procedure Set_SQL(const pbstr: WideString); safecall;
    function Get_Updatable: WordBool; safecall;
    function Get_Connect: WideString; safecall;
    procedure Set_Connect(const pbstr: WideString); safecall;
    function Get_ReturnsRecords: WordBool; safecall;
    procedure Set_ReturnsRecords(pb: WordBool); safecall;
    function Get_RecordsAffected: Integer; safecall;
    function Get_Fields: Fields; safecall;
    function Get_Parameters: Parameters; safecall;
    procedure Close; safecall;
    function _30_OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; safecall;
    function _30__OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; safecall;
    function _Copy: QueryDef; safecall;
    procedure Execute(Options: OleVariant); safecall;
    procedure Compare(const pQdef: QueryDef; var lps: Smallint); safecall;
    function CreateDynaset(Options: OleVariant; Inconsistent: OleVariant): Recordset; safecall;
    function CreateSnapshot(Options: OleVariant): Recordset; safecall;
    function ListParameters: Recordset; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset; safecall;
    function _OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset; safecall;
    procedure Cancel; safecall;
    function Get_hStmt: Integer; safecall;
    function Get_MaxRecords: Integer; safecall;
    procedure Set_MaxRecords(pMxRecs: Integer); safecall;
    function Get_StillExecuting: WordBool; safecall;
    function Get_CacheSize: Integer; safecall;
    procedure Set_CacheSize(lCacheSize: Integer); safecall;
    function Get_Prepare: OleVariant; safecall;
    procedure Set_Prepare(pb: OleVariant); safecall;
    property DateCreated: OleVariant read Get_DateCreated;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property Name: WideString read Get_Name write Set_Name;
    property ODBCTimeout: Smallint read Get_ODBCTimeout write Set_ODBCTimeout;
    property type_: Smallint read Get_type_;
    property SQL: WideString read Get_SQL write Set_SQL;
    property Updatable: WordBool read Get_Updatable;
    property Connect: WideString read Get_Connect write Set_Connect;
    property ReturnsRecords: WordBool read Get_ReturnsRecords write Set_ReturnsRecords;
    property RecordsAffected: Integer read Get_RecordsAffected;
    property Fields: Fields read Get_Fields;
    property Parameters: Parameters read Get_Parameters;
    property hStmt: Integer read Get_hStmt;
    property MaxRecords: Integer read Get_MaxRecords write Set_MaxRecords;
    property StillExecuting: WordBool read Get_StillExecuting;
    property CacheSize: Integer read Get_CacheSize write Set_CacheSize;
    property Prepare: OleVariant read Get_Prepare write Set_Prepare;
  end;

// *********************************************************************//
// DispIntf:  _QueryDefDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000079-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _QueryDefDisp = dispinterface
    ['{00000079-0000-0010-8000-00AA006D2EA4}']
    property DateCreated: OleVariant readonly dispid 1610809344;
    property LastUpdated: OleVariant readonly dispid 1610809345;
    property Name: WideString dispid 1610809346;
    property ODBCTimeout: Smallint dispid 1610809348;
    property type_: Smallint readonly dispid 1610809350;
    property SQL: WideString dispid 1610809351;
    property Updatable: WordBool readonly dispid 1610809353;
    property Connect: WideString dispid 1610809354;
    property ReturnsRecords: WordBool dispid 1610809356;
    property RecordsAffected: Integer readonly dispid 1610809358;
    property Fields: Fields readonly dispid 1610809359;
    property Parameters: Parameters readonly dispid 0;
    procedure Close; dispid 1610809361;
    function _30_OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; dispid 1610809362;
    function _30__OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; dispid 1610809363;
    function _Copy: QueryDef; dispid 1610809364;
    procedure Execute(Options: OleVariant); dispid 1610809365;
    procedure Compare(const pQdef: QueryDef; var lps: Smallint); dispid 1610809366;
    function CreateDynaset(Options: OleVariant; Inconsistent: OleVariant): Recordset; dispid 1610809367;
    function CreateSnapshot(Options: OleVariant): Recordset; dispid 1610809368;
    function ListParameters: Recordset; dispid 1610809369;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809370;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset; dispid 1610809371;
    function _OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset; dispid 1610809372;
    procedure Cancel; dispid 1610809373;
    property hStmt: Integer readonly dispid 1610809374;
    property MaxRecords: Integer dispid 1610809375;
    property StillExecuting: WordBool readonly dispid 1610809377;
    property CacheSize: Integer dispid 1610809378;
    property Prepare: OleVariant dispid 1610809380;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Parameters
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000083-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Parameters = interface(_Collection)
    ['{00000083-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Parameter; safecall;
    property Item[Item: OleVariant]: Parameter read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ParametersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000083-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ParametersDisp = dispinterface
    ['{00000083-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Parameter readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Parameter
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000081-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Parameter = interface(_DAO)
    ['{00000081-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pvar: OleVariant); safecall;
    function Get_type_: Smallint; safecall;
    procedure Set_type_(ps: Smallint); safecall;
    function Get_Direction: Smallint; safecall;
    procedure Set_Direction(pOption: Smallint); safecall;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value write Set_Value;
    property type_: Smallint read Get_type_ write Set_type_;
    property Direction: Smallint read Get_Direction write Set_Direction;
  end;

// *********************************************************************//
// DispIntf:  ParameterDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000081-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ParameterDisp = dispinterface
    ['{00000081-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString readonly dispid 1610809344;
    property Value: OleVariant dispid 0;
    property type_: Smallint dispid 1610809347;
    property Direction: Smallint dispid 1610809349;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Connection
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000041-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Connection = interface(IDispatch)
    ['{00000041-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    function Get_Connect: WideString; safecall;
    function Get_Database: Database; safecall;
    function Get_hDbc: Integer; safecall;
    function Get_QueryTimeout: Smallint; safecall;
    procedure Set_QueryTimeout(pSeconds: Smallint); safecall;
    function Get_Transactions: WordBool; safecall;
    function Get_RecordsAffected: Integer; safecall;
    function Get_StillExecuting: WordBool; safecall;
    function Get_Updatable: WordBool; safecall;
    function Get_QueryDefs: QueryDefs; safecall;
    function Get_Recordsets: Recordsets; safecall;
    procedure Cancel; safecall;
    procedure Close; safecall;
    function CreateQueryDef(Name: OleVariant; SQLText: OleVariant): QueryDef; safecall;
    procedure Execute(const Query: WideString; Options: OleVariant); safecall;
    function OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant; 
                           LockEdit: OleVariant): Recordset; safecall;
    property Name: WideString read Get_Name;
    property Connect: WideString read Get_Connect;
    property Database: Database read Get_Database;
    property hDbc: Integer read Get_hDbc;
    property QueryTimeout: Smallint read Get_QueryTimeout write Set_QueryTimeout;
    property Transactions: WordBool read Get_Transactions;
    property RecordsAffected: Integer read Get_RecordsAffected;
    property StillExecuting: WordBool read Get_StillExecuting;
    property Updatable: WordBool read Get_Updatable;
    property QueryDefs: QueryDefs read Get_QueryDefs;
    property Recordsets: Recordsets read Get_Recordsets;
  end;

// *********************************************************************//
// DispIntf:  ConnectionDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000041-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ConnectionDisp = dispinterface
    ['{00000041-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString readonly dispid 1610743808;
    property Connect: WideString readonly dispid 1610743809;
    property Database: Database readonly dispid 1610743810;
    property hDbc: Integer readonly dispid 1610743811;
    property QueryTimeout: Smallint dispid 1610743812;
    property Transactions: WordBool readonly dispid 1610743814;
    property RecordsAffected: Integer readonly dispid 1610743815;
    property StillExecuting: WordBool readonly dispid 1610743816;
    property Updatable: WordBool readonly dispid 1610743817;
    property QueryDefs: QueryDefs readonly dispid 0;
    property Recordsets: Recordsets readonly dispid 1610743819;
    procedure Cancel; dispid 1610743820;
    procedure Close; dispid 1610743821;
    function CreateQueryDef(Name: OleVariant; SQLText: OleVariant): QueryDef; dispid 1610743822;
    procedure Execute(const Query: WideString; Options: OleVariant); dispid 1610743823;
    function OpenRecordset(const Name: WideString; Type_: OleVariant; Options: OleVariant; 
                           LockEdit: OleVariant): Recordset; dispid 1610743824;
  end;

// *********************************************************************//
// Interface: QueryDefs
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000007B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  QueryDefs = interface(_DynaCollection)
    ['{0000007B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): QueryDef; safecall;
    property Item[Item: OleVariant]: QueryDef read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  QueryDefsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000007B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  QueryDefsDisp = dispinterface
    ['{0000007B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: QueryDef readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Recordsets
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000033-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Recordsets = interface(_Collection)
    ['{00000033-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Recordset; safecall;
    property Item[Item: OleVariant]: Recordset read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  RecordsetsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000033-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  RecordsetsDisp = dispinterface
    ['{00000033-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Recordset readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Relations
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000008B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Relations = interface(_DynaCollection)
    ['{0000008B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Relation; safecall;
    property Item[Item: OleVariant]: Relation read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  RelationsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000008B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  RelationsDisp = dispinterface
    ['{0000008B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Relation readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Relation
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000089-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Relation = interface(_DAO)
    ['{00000089-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    function Get_Table: WideString; safecall;
    procedure Set_Table(const pbstr: WideString); safecall;
    function Get_ForeignTable: WideString; safecall;
    procedure Set_ForeignTable(const pbstr: WideString); safecall;
    function Get_Attributes: Integer; safecall;
    procedure Set_Attributes(pl: Integer); safecall;
    function Get_Fields: Fields; safecall;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; safecall;
    function Get_PartialReplica: WordBool; safecall;
    procedure Set_PartialReplica(pfPartialReplica: WordBool); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Table: WideString read Get_Table write Set_Table;
    property ForeignTable: WideString read Get_ForeignTable write Set_ForeignTable;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property Fields: Fields read Get_Fields;
    property PartialReplica: WordBool read Get_PartialReplica write Set_PartialReplica;
  end;

// *********************************************************************//
// DispIntf:  _RelationDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000089-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _RelationDisp = dispinterface
    ['{00000089-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 1610809344;
    property Table: WideString dispid 1610809346;
    property ForeignTable: WideString dispid 1610809348;
    property Attributes: Integer dispid 1610809350;
    property Fields: Fields readonly dispid 0;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; dispid 1610809353;
    property PartialReplica: WordBool dispid 1610809354;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Containers
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000093-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Containers = interface(_Collection)
    ['{00000093-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Container; safecall;
    property Item[Item: OleVariant]: Container read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ContainersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000093-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ContainersDisp = dispinterface
    ['{00000093-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Container readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Container
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000091-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Container = interface(_DAO)
    ['{00000091-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    function Get_Owner: WideString; safecall;
    procedure Set_Owner(const pbstr: WideString); safecall;
    function Get_UserName: WideString; safecall;
    procedure Set_UserName(const pbstr: WideString); safecall;
    function Get_Permissions: Integer; safecall;
    procedure Set_Permissions(pl: Integer); safecall;
    function Get_Inherit: WordBool; safecall;
    procedure Set_Inherit(pb: WordBool); safecall;
    function Get_Documents: Documents; safecall;
    function Get_AllPermissions: Integer; safecall;
    property Name: WideString read Get_Name;
    property Owner: WideString read Get_Owner write Set_Owner;
    property UserName: WideString read Get_UserName write Set_UserName;
    property Permissions: Integer read Get_Permissions write Set_Permissions;
    property Inherit: WordBool read Get_Inherit write Set_Inherit;
    property Documents: Documents read Get_Documents;
    property AllPermissions: Integer read Get_AllPermissions;
  end;

// *********************************************************************//
// DispIntf:  ContainerDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000091-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ContainerDisp = dispinterface
    ['{00000091-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString readonly dispid 1610809344;
    property Owner: WideString dispid 1610809345;
    property UserName: WideString dispid 1610809347;
    property Permissions: Integer dispid 1610809349;
    property Inherit: WordBool dispid 1610809351;
    property Documents: Documents readonly dispid 0;
    property AllPermissions: Integer readonly dispid 1610809354;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Documents
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000009B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Documents = interface(_Collection)
    ['{0000009B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Document; safecall;
    property Item[Item: OleVariant]: Document read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  DocumentsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000009B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  DocumentsDisp = dispinterface
    ['{0000009B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Document readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Document
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000099-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Document = interface(_DAO)
    ['{00000099-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    function Get_Owner: WideString; safecall;
    procedure Set_Owner(const pbstr: WideString); safecall;
    function Get_Container: WideString; safecall;
    function Get_UserName: WideString; safecall;
    procedure Set_UserName(const pbstr: WideString); safecall;
    function Get_Permissions: Integer; safecall;
    procedure Set_Permissions(pl: Integer); safecall;
    function Get_DateCreated: OleVariant; safecall;
    function Get_LastUpdated: OleVariant; safecall;
    function Get_AllPermissions: Integer; safecall;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; safecall;
    property Name: WideString read Get_Name;
    property Owner: WideString read Get_Owner write Set_Owner;
    property Container: WideString read Get_Container;
    property UserName: WideString read Get_UserName write Set_UserName;
    property Permissions: Integer read Get_Permissions write Set_Permissions;
    property DateCreated: OleVariant read Get_DateCreated;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property AllPermissions: Integer read Get_AllPermissions;
  end;

// *********************************************************************//
// DispIntf:  DocumentDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000099-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  DocumentDisp = dispinterface
    ['{00000099-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString readonly dispid 1610809344;
    property Owner: WideString dispid 1610809345;
    property Container: WideString readonly dispid 1610809347;
    property UserName: WideString dispid 1610809348;
    property Permissions: Integer dispid 1610809350;
    property DateCreated: OleVariant readonly dispid 1610809352;
    property LastUpdated: OleVariant readonly dispid 1610809353;
    property AllPermissions: Integer readonly dispid 1610809354;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; dispid 1610809355;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Users
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000006B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Users = interface(_DynaCollection)
    ['{0000006B-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): User; safecall;
    property Item[Item: OleVariant]: User read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  UsersDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000006B-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  UsersDisp = dispinterface
    ['{0000006B-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: User readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _User
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000069-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _User = interface(_DAO)
    ['{00000069-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    procedure Set_PID(const Param1: WideString); safecall;
    procedure Set_Password(const Param1: WideString); safecall;
    function Get_Groups: Groups; safecall;
    procedure NewPassword(const bstrOld: WideString; const bstrNew: WideString); safecall;
    function CreateGroup(Name: OleVariant; PID: OleVariant): Group; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property PID: WideString write Set_PID;
    property Password: WideString write Set_Password;
    property Groups: Groups read Get_Groups;
  end;

// *********************************************************************//
// DispIntf:  _UserDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000069-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _UserDisp = dispinterface
    ['{00000069-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 1610809344;
    property PID: WideString writeonly dispid 1610809346;
    property Password: WideString writeonly dispid 1610809347;
    property Groups: Groups readonly dispid 0;
    procedure NewPassword(const bstrOld: WideString; const bstrNew: WideString); dispid 1610809349;
    function CreateGroup(Name: OleVariant; PID: OleVariant): Group; dispid 1610809350;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Groups
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000063-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Groups = interface(_DynaCollection)
    ['{00000063-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Group; safecall;
    property Item[Item: OleVariant]: Group read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  GroupsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000063-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  GroupsDisp = dispinterface
    ['{00000063-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Group readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: _Group
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000061-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _Group = interface(_DAO)
    ['{00000061-0000-0010-8000-00AA006D2EA4}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pbstr: WideString); safecall;
    procedure Set_PID(const Param1: WideString); safecall;
    function Get_Users: Users; safecall;
    function CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property PID: WideString write Set_PID;
    property Users: Users read Get_Users;
  end;

// *********************************************************************//
// DispIntf:  _GroupDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000061-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  _GroupDisp = dispinterface
    ['{00000061-0000-0010-8000-00AA006D2EA4}']
    property Name: WideString dispid 1610809344;
    property PID: WideString writeonly dispid 1610809346;
    property Users: Users readonly dispid 0;
    function CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User; dispid 1610809348;
    property Properties: Properties readonly dispid 10;
  end;

// *********************************************************************//
// Interface: Connections
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000043-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Connections = interface(_Collection)
    ['{00000043-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Connection; safecall;
    property Item[Item: OleVariant]: Connection read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ConnectionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000043-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ConnectionsDisp = dispinterface
    ['{00000043-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Connection readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Errors
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000025-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Errors = interface(_Collection)
    ['{00000025-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): Error; safecall;
    property Item[Item: OleVariant]: Error read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ErrorsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000025-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ErrorsDisp = dispinterface
    ['{00000025-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: Error readonly dispid 0; default;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// Interface: Error
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000023-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  Error = interface(IDispatch)
    ['{00000023-0000-0010-8000-00AA006D2EA4}']
    function Get_Number: Integer; safecall;
    function Get_Source: WideString; safecall;
    function Get_Description: WideString; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_HelpContext: Integer; safecall;
    property Number: Integer read Get_Number;
    property Source: WideString read Get_Source;
    property Description: WideString read Get_Description;
    property HelpFile: WideString read Get_HelpFile;
    property HelpContext: Integer read Get_HelpContext;
  end;

// *********************************************************************//
// DispIntf:  ErrorDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {00000023-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  ErrorDisp = dispinterface
    ['{00000023-0000-0010-8000-00AA006D2EA4}']
    property Number: Integer readonly dispid 1610743808;
    property Source: WideString readonly dispid 1610743809;
    property Description: WideString readonly dispid 0;
    property HelpFile: WideString readonly dispid 1610743811;
    property HelpContext: Integer readonly dispid 1610743812;
  end;

// *********************************************************************//
// Interface: IndexFields
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000005D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  IndexFields = interface(_DynaCollection)
    ['{0000005D-0000-0010-8000-00AA006D2EA4}']
    function Get_Item(Item: OleVariant): OleVariant; safecall;
    property Item[Item: OleVariant]: OleVariant read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  IndexFieldsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {0000005D-0000-0010-8000-00AA006D2EA4}
// *********************************************************************//
  IndexFieldsDisp = dispinterface
    ['{0000005D-0000-0010-8000-00AA006D2EA4}']
    property Item[Item: OleVariant]: OleVariant readonly dispid 0; default;
    procedure Append(const Object_: IDispatch); dispid 1610809344;
    procedure Delete(const Name: WideString); dispid 1610809345;
    property Count: Smallint readonly dispid 1610743808;
    function _NewEnum: IUnknown; dispid -4;
    procedure Refresh; dispid 1610743810;
  end;

// *********************************************************************//
// The Class CoTableDef provides a Create and CreateRemote method to          
// create instances of the default interface _TableDef exposed by              
// the CoClass TableDef. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTableDef = class
    class function Create: _TableDef;
    class function CreateRemote(const MachineName: string): _TableDef;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTableDef
// Help String      : 
// Default Interface: _TableDef
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTableDefProperties= class;
{$ENDIF}
  TTableDef = class(TOleServer)
  private
    FIntf: _TableDef;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTableDefProperties;
    function GetServerProperties: TTableDefProperties;
{$ENDIF}
    function GetDefaultInterface: _TableDef;
  protected
    procedure InitServerData; override;
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_Connect: WideString;
    procedure Set_Connect(const pbstr: WideString);
    function Get_DateCreated: OleVariant;
    function Get_LastUpdated: OleVariant;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_SourceTableName: WideString;
    procedure Set_SourceTableName(const pbstr: WideString);
    function Get_Updatable: WordBool;
    function Get_ValidationText: WideString;
    procedure Set_ValidationText(const pbstr: WideString);
    function Get_ValidationRule: WideString;
    procedure Set_ValidationRule(const pbstr: WideString);
    function Get_RecordCount: Integer;
    function Get_Fields: Fields;
    function Get_Indexes: Indexes;
    function Get_ConflictTable: WideString;
    function Get_ReplicaFilter: OleVariant;
    procedure Set_ReplicaFilter(pFilter: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TableDef);
    procedure Disconnect; override;
    function OpenRecordset: Recordset; overload;
    function OpenRecordset(Type_: OleVariant): Recordset; overload;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; overload;
    procedure RefreshLink;
    function CreateField: Field; overload;
    function CreateField(Name: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; overload;
    function CreateIndex: Index; overload;
    function CreateIndex(Name: OleVariant): Index; overload;
    function CreateProperty: Property_; overload;
    function CreateProperty(Name: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; overload;
    property DefaultInterface: _TableDef read GetDefaultInterface;
    property DateCreated: OleVariant read Get_DateCreated;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property Updatable: WordBool read Get_Updatable;
    property RecordCount: Integer read Get_RecordCount;
    property Fields: Fields read Get_Fields;
    property Indexes: Indexes read Get_Indexes;
    property ConflictTable: WideString read Get_ConflictTable;
    property ReplicaFilter: OleVariant read Get_ReplicaFilter write Set_ReplicaFilter;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property Connect1: WideString read Get_Connect write Set_Connect;
    property Name: WideString read Get_Name write Set_Name;
    property SourceTableName: WideString read Get_SourceTableName write Set_SourceTableName;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTableDefProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTableDef
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTableDefProperties = class(TPersistent)
  private
    FServer:    TTableDef;
    function    GetDefaultInterface: _TableDef;
    constructor Create(AServer: TTableDef);
  protected
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_Connect: WideString;
    procedure Set_Connect(const pbstr: WideString);
    function Get_DateCreated: OleVariant;
    function Get_LastUpdated: OleVariant;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_SourceTableName: WideString;
    procedure Set_SourceTableName(const pbstr: WideString);
    function Get_Updatable: WordBool;
    function Get_ValidationText: WideString;
    procedure Set_ValidationText(const pbstr: WideString);
    function Get_ValidationRule: WideString;
    procedure Set_ValidationRule(const pbstr: WideString);
    function Get_RecordCount: Integer;
    function Get_Fields: Fields;
    function Get_Indexes: Indexes;
    function Get_ConflictTable: WideString;
    function Get_ReplicaFilter: OleVariant;
    procedure Set_ReplicaFilter(pFilter: OleVariant);
  public
    property DefaultInterface: _TableDef read GetDefaultInterface;
  published
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property Connect1: WideString read Get_Connect write Set_Connect;
    property Name: WideString read Get_Name write Set_Name;
    property SourceTableName: WideString read Get_SourceTableName write Set_SourceTableName;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoField provides a Create and CreateRemote method to          
// create instances of the default interface _Field exposed by              
// the CoClass Field. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoField = class
    class function Create: _Field;
    class function CreateRemote(const MachineName: string): _Field;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TField
// Help String      : 
// Default Interface: _Field
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TFieldProperties= class;
{$ENDIF}
  TField = class(TOleServer)
  private
    FIntf: _Field;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TFieldProperties;
    function GetServerProperties: TFieldProperties;
{$ENDIF}
    function GetDefaultInterface: _Field;
  protected
    procedure InitServerData; override;
    function Get_CollatingOrder: Integer;
    function Get_type_: Smallint;
    procedure Set_type_(ps: Smallint);
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Size: Integer;
    procedure Set_Size(pl: Integer);
    function Get_SourceField: WideString;
    function Get_SourceTable: WideString;
    function Get_Value: OleVariant;
    procedure Set_Value(pvar: OleVariant);
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_OrdinalPosition: Smallint;
    procedure Set_OrdinalPosition(ps: Smallint);
    function Get_ValidationText: WideString;
    procedure Set_ValidationText(const pbstr: WideString);
    function Get_ValidateOnSet: WordBool;
    procedure Set_ValidateOnSet(pb: WordBool);
    function Get_ValidationRule: WideString;
    procedure Set_ValidationRule(const pbstr: WideString);
    function Get_DefaultValue: OleVariant;
    procedure Set_DefaultValue(pvar: OleVariant);
    function Get_Required: WordBool;
    procedure Set_Required(pb: WordBool);
    function Get_AllowZeroLength: WordBool;
    procedure Set_AllowZeroLength(pb: WordBool);
    function Get_DataUpdatable: WordBool;
    function Get_ForeignName: WideString;
    procedure Set_ForeignName(const pbstr: WideString);
    function Get_CollectionIndex: Smallint;
    function Get_OriginalValue: OleVariant;
    function Get_VisibleValue: OleVariant;
    function Get_FieldSize: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Field);
    procedure Disconnect; override;
    procedure AppendChunk(Val: OleVariant);
    function GetChunk(Offset: Integer; Bytes: Integer): OleVariant;
    function CreateProperty: Property_; overload;
    function CreateProperty(Name: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; overload;
    property DefaultInterface: _Field read GetDefaultInterface;
    property CollatingOrder: Integer read Get_CollatingOrder;
    property SourceField: WideString read Get_SourceField;
    property SourceTable: WideString read Get_SourceTable;
    property Value: OleVariant read Get_Value write Set_Value;
    property DefaultValue: OleVariant read Get_DefaultValue write Set_DefaultValue;
    property DataUpdatable: WordBool read Get_DataUpdatable;
    property CollectionIndex: Smallint read Get_CollectionIndex;
    property OriginalValue: OleVariant read Get_OriginalValue;
    property VisibleValue: OleVariant read Get_VisibleValue;
    property FieldSize: Integer read Get_FieldSize;
    property type_: Smallint read Get_type_ write Set_type_;
    property Name: WideString read Get_Name write Set_Name;
    property Size: Integer read Get_Size write Set_Size;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property OrdinalPosition: Smallint read Get_OrdinalPosition write Set_OrdinalPosition;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidateOnSet: WordBool read Get_ValidateOnSet write Set_ValidateOnSet;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property Required: WordBool read Get_Required write Set_Required;
    property AllowZeroLength: WordBool read Get_AllowZeroLength write Set_AllowZeroLength;
    property ForeignName: WideString read Get_ForeignName write Set_ForeignName;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TFieldProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TField
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TFieldProperties = class(TPersistent)
  private
    FServer:    TField;
    function    GetDefaultInterface: _Field;
    constructor Create(AServer: TField);
  protected
    function Get_CollatingOrder: Integer;
    function Get_type_: Smallint;
    procedure Set_type_(ps: Smallint);
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Size: Integer;
    procedure Set_Size(pl: Integer);
    function Get_SourceField: WideString;
    function Get_SourceTable: WideString;
    function Get_Value: OleVariant;
    procedure Set_Value(pvar: OleVariant);
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_OrdinalPosition: Smallint;
    procedure Set_OrdinalPosition(ps: Smallint);
    function Get_ValidationText: WideString;
    procedure Set_ValidationText(const pbstr: WideString);
    function Get_ValidateOnSet: WordBool;
    procedure Set_ValidateOnSet(pb: WordBool);
    function Get_ValidationRule: WideString;
    procedure Set_ValidationRule(const pbstr: WideString);
    function Get_DefaultValue: OleVariant;
    procedure Set_DefaultValue(pvar: OleVariant);
    function Get_Required: WordBool;
    procedure Set_Required(pb: WordBool);
    function Get_AllowZeroLength: WordBool;
    procedure Set_AllowZeroLength(pb: WordBool);
    function Get_DataUpdatable: WordBool;
    function Get_ForeignName: WideString;
    procedure Set_ForeignName(const pbstr: WideString);
    function Get_CollectionIndex: Smallint;
    function Get_OriginalValue: OleVariant;
    function Get_VisibleValue: OleVariant;
    function Get_FieldSize: Integer;
  public
    property DefaultInterface: _Field read GetDefaultInterface;
  published
    property type_: Smallint read Get_type_ write Set_type_;
    property Name: WideString read Get_Name write Set_Name;
    property Size: Integer read Get_Size write Set_Size;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property OrdinalPosition: Smallint read Get_OrdinalPosition write Set_OrdinalPosition;
    property ValidationText: WideString read Get_ValidationText write Set_ValidationText;
    property ValidateOnSet: WordBool read Get_ValidateOnSet write Set_ValidateOnSet;
    property ValidationRule: WideString read Get_ValidationRule write Set_ValidationRule;
    property Required: WordBool read Get_Required write Set_Required;
    property AllowZeroLength: WordBool read Get_AllowZeroLength write Set_AllowZeroLength;
    property ForeignName: WideString read Get_ForeignName write Set_ForeignName;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoIndex provides a Create and CreateRemote method to          
// create instances of the default interface _Index exposed by              
// the CoClass Index. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIndex = class
    class function Create: _Index;
    class function CreateRemote(const MachineName: string): _Index;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TIndex
// Help String      : 
// Default Interface: _Index
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TIndexProperties= class;
{$ENDIF}
  TIndex = class(TOleServer)
  private
    FIntf: _Index;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TIndexProperties;
    function GetServerProperties: TIndexProperties;
{$ENDIF}
    function GetDefaultInterface: _Index;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Foreign: WordBool;
    function Get_Unique: WordBool;
    procedure Set_Unique(pb: WordBool);
    function Get_Clustered: WordBool;
    procedure Set_Clustered(pb: WordBool);
    function Get_Required: WordBool;
    procedure Set_Required(pb: WordBool);
    function Get_IgnoreNulls: WordBool;
    procedure Set_IgnoreNulls(pb: WordBool);
    function Get_Primary: WordBool;
    procedure Set_Primary(pb: WordBool);
    function Get_DistinctCount: Integer;
    function Get_Fields: OleVariant;
    procedure Set_Fields(pv: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Index);
    procedure Disconnect; override;
    function CreateField: Field; overload;
    function CreateField(Name: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; overload;
    function CreateProperty: Property_; overload;
    function CreateProperty(Name: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; overload;
    property DefaultInterface: _Index read GetDefaultInterface;
    property Foreign: WordBool read Get_Foreign;
    property DistinctCount: Integer read Get_DistinctCount;
    property Fields: OleVariant read Get_Fields write Set_Fields;
    property Name: WideString read Get_Name write Set_Name;
    property Unique: WordBool read Get_Unique write Set_Unique;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property Required: WordBool read Get_Required write Set_Required;
    property IgnoreNulls: WordBool read Get_IgnoreNulls write Set_IgnoreNulls;
    property Primary: WordBool read Get_Primary write Set_Primary;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TIndexProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TIndex
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TIndexProperties = class(TPersistent)
  private
    FServer:    TIndex;
    function    GetDefaultInterface: _Index;
    constructor Create(AServer: TIndex);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Foreign: WordBool;
    function Get_Unique: WordBool;
    procedure Set_Unique(pb: WordBool);
    function Get_Clustered: WordBool;
    procedure Set_Clustered(pb: WordBool);
    function Get_Required: WordBool;
    procedure Set_Required(pb: WordBool);
    function Get_IgnoreNulls: WordBool;
    procedure Set_IgnoreNulls(pb: WordBool);
    function Get_Primary: WordBool;
    procedure Set_Primary(pb: WordBool);
    function Get_DistinctCount: Integer;
    function Get_Fields: OleVariant;
    procedure Set_Fields(pv: OleVariant);
  public
    property DefaultInterface: _Index read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property Unique: WordBool read Get_Unique write Set_Unique;
    property Clustered: WordBool read Get_Clustered write Set_Clustered;
    property Required: WordBool read Get_Required write Set_Required;
    property IgnoreNulls: WordBool read Get_IgnoreNulls write Set_IgnoreNulls;
    property Primary: WordBool read Get_Primary write Set_Primary;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoQueryDef provides a Create and CreateRemote method to          
// create instances of the default interface _QueryDef exposed by              
// the CoClass QueryDef. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoQueryDef = class
    class function Create: _QueryDef;
    class function CreateRemote(const MachineName: string): _QueryDef;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TQueryDef
// Help String      : 
// Default Interface: _QueryDef
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TQueryDefProperties= class;
{$ENDIF}
  TQueryDef = class(TOleServer)
  private
    FIntf: _QueryDef;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TQueryDefProperties;
    function GetServerProperties: TQueryDefProperties;
{$ENDIF}
    function GetDefaultInterface: _QueryDef;
  protected
    procedure InitServerData; override;
    function Get_DateCreated: OleVariant;
    function Get_LastUpdated: OleVariant;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_ODBCTimeout: Smallint;
    procedure Set_ODBCTimeout(ps: Smallint);
    function Get_type_: Smallint;
    function Get_SQL: WideString;
    procedure Set_SQL(const pbstr: WideString);
    function Get_Updatable: WordBool;
    function Get_Connect: WideString;
    procedure Set_Connect(const pbstr: WideString);
    function Get_ReturnsRecords: WordBool;
    procedure Set_ReturnsRecords(pb: WordBool);
    function Get_RecordsAffected: Integer;
    function Get_Fields: Fields;
    function Get_Parameters: Parameters;
    function Get_hStmt: Integer;
    function Get_MaxRecords: Integer;
    procedure Set_MaxRecords(pMxRecs: Integer);
    function Get_StillExecuting: WordBool;
    function Get_CacheSize: Integer;
    procedure Set_CacheSize(lCacheSize: Integer);
    function Get_Prepare: OleVariant;
    procedure Set_Prepare(pb: OleVariant);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _QueryDef);
    procedure Disconnect; override;
    procedure Close;
    procedure Execute; overload;
    procedure Execute(Options: OleVariant); overload;
    function CreateProperty: Property_; overload;
    function CreateProperty(Name: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_; overload;
    function CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; DDL: OleVariant): Property_; overload;
    function OpenRecordset: Recordset; overload;
    function OpenRecordset(Type_: OleVariant): Recordset; overload;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset; overload;
    function OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset; overload;
    procedure Cancel;
    property DefaultInterface: _QueryDef read GetDefaultInterface;
    property DateCreated: OleVariant read Get_DateCreated;
    property LastUpdated: OleVariant read Get_LastUpdated;
    property type_: Smallint read Get_type_;
    property Updatable: WordBool read Get_Updatable;
    property RecordsAffected: Integer read Get_RecordsAffected;
    property Fields: Fields read Get_Fields;
    property Parameters: Parameters read Get_Parameters;
    property hStmt: Integer read Get_hStmt;
    property StillExecuting: WordBool read Get_StillExecuting;
    property Prepare: OleVariant read Get_Prepare write Set_Prepare;
    property Name: WideString read Get_Name write Set_Name;
    property ODBCTimeout: Smallint read Get_ODBCTimeout write Set_ODBCTimeout;
    property SQL: WideString read Get_SQL write Set_SQL;
    property Connect1: WideString read Get_Connect write Set_Connect;
    property ReturnsRecords: WordBool read Get_ReturnsRecords write Set_ReturnsRecords;
    property MaxRecords: Integer read Get_MaxRecords write Set_MaxRecords;
    property CacheSize: Integer read Get_CacheSize write Set_CacheSize;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TQueryDefProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TQueryDef
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TQueryDefProperties = class(TPersistent)
  private
    FServer:    TQueryDef;
    function    GetDefaultInterface: _QueryDef;
    constructor Create(AServer: TQueryDef);
  protected
    function Get_DateCreated: OleVariant;
    function Get_LastUpdated: OleVariant;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_ODBCTimeout: Smallint;
    procedure Set_ODBCTimeout(ps: Smallint);
    function Get_type_: Smallint;
    function Get_SQL: WideString;
    procedure Set_SQL(const pbstr: WideString);
    function Get_Updatable: WordBool;
    function Get_Connect: WideString;
    procedure Set_Connect(const pbstr: WideString);
    function Get_ReturnsRecords: WordBool;
    procedure Set_ReturnsRecords(pb: WordBool);
    function Get_RecordsAffected: Integer;
    function Get_Fields: Fields;
    function Get_Parameters: Parameters;
    function Get_hStmt: Integer;
    function Get_MaxRecords: Integer;
    procedure Set_MaxRecords(pMxRecs: Integer);
    function Get_StillExecuting: WordBool;
    function Get_CacheSize: Integer;
    procedure Set_CacheSize(lCacheSize: Integer);
    function Get_Prepare: OleVariant;
    procedure Set_Prepare(pb: OleVariant);
  public
    property DefaultInterface: _QueryDef read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property ODBCTimeout: Smallint read Get_ODBCTimeout write Set_ODBCTimeout;
    property SQL: WideString read Get_SQL write Set_SQL;
    property Connect1: WideString read Get_Connect write Set_Connect;
    property ReturnsRecords: WordBool read Get_ReturnsRecords write Set_ReturnsRecords;
    property MaxRecords: Integer read Get_MaxRecords write Set_MaxRecords;
    property CacheSize: Integer read Get_CacheSize write Set_CacheSize;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRelation provides a Create and CreateRemote method to          
// create instances of the default interface _Relation exposed by              
// the CoClass Relation. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRelation = class
    class function Create: _Relation;
    class function CreateRemote(const MachineName: string): _Relation;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRelation
// Help String      : 
// Default Interface: _Relation
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRelationProperties= class;
{$ENDIF}
  TRelation = class(TOleServer)
  private
    FIntf: _Relation;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRelationProperties;
    function GetServerProperties: TRelationProperties;
{$ENDIF}
    function GetDefaultInterface: _Relation;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Table: WideString;
    procedure Set_Table(const pbstr: WideString);
    function Get_ForeignTable: WideString;
    procedure Set_ForeignTable(const pbstr: WideString);
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_Fields: Fields;
    function Get_PartialReplica: WordBool;
    procedure Set_PartialReplica(pfPartialReplica: WordBool);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Relation);
    procedure Disconnect; override;
    function CreateField: Field; overload;
    function CreateField(Name: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant): Field; overload;
    function CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field; overload;
    property DefaultInterface: _Relation read GetDefaultInterface;
    property Fields: Fields read Get_Fields;
    property Name: WideString read Get_Name write Set_Name;
    property Table: WideString read Get_Table write Set_Table;
    property ForeignTable: WideString read Get_ForeignTable write Set_ForeignTable;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property PartialReplica: WordBool read Get_PartialReplica write Set_PartialReplica;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRelationProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRelation
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRelationProperties = class(TPersistent)
  private
    FServer:    TRelation;
    function    GetDefaultInterface: _Relation;
    constructor Create(AServer: TRelation);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    function Get_Table: WideString;
    procedure Set_Table(const pbstr: WideString);
    function Get_ForeignTable: WideString;
    procedure Set_ForeignTable(const pbstr: WideString);
    function Get_Attributes: Integer;
    procedure Set_Attributes(pl: Integer);
    function Get_Fields: Fields;
    function Get_PartialReplica: WordBool;
    procedure Set_PartialReplica(pfPartialReplica: WordBool);
  public
    property DefaultInterface: _Relation read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
    property Table: WideString read Get_Table write Set_Table;
    property ForeignTable: WideString read Get_ForeignTable write Set_ForeignTable;
    property Attributes: Integer read Get_Attributes write Set_Attributes;
    property PartialReplica: WordBool read Get_PartialReplica write Set_PartialReplica;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUser provides a Create and CreateRemote method to          
// create instances of the default interface _User exposed by              
// the CoClass User. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUser = class
    class function Create: _User;
    class function CreateRemote(const MachineName: string): _User;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUser
// Help String      : 
// Default Interface: _User
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUserProperties= class;
{$ENDIF}
  TUser = class(TOleServer)
  private
    FIntf: _User;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUserProperties;
    function GetServerProperties: TUserProperties;
{$ENDIF}
    function GetDefaultInterface: _User;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    procedure Set_PID(const Param1: WideString);
    procedure Set_Password(const Param1: WideString);
    function Get_Groups: Groups;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _User);
    procedure Disconnect; override;
    procedure NewPassword(const bstrOld: WideString; const bstrNew: WideString);
    function CreateGroup: Group; overload;
    function CreateGroup(Name: OleVariant): Group; overload;
    function CreateGroup(Name: OleVariant; PID: OleVariant): Group; overload;
    property DefaultInterface: _User read GetDefaultInterface;
    property PID: WideString write Set_PID;
    property Password: WideString write Set_Password;
    property Groups: Groups read Get_Groups;
    property Name: WideString read Get_Name write Set_Name;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUserProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUser
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUserProperties = class(TPersistent)
  private
    FServer:    TUser;
    function    GetDefaultInterface: _User;
    constructor Create(AServer: TUser);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    procedure Set_PID(const Param1: WideString);
    procedure Set_Password(const Param1: WideString);
    function Get_Groups: Groups;
  public
    property DefaultInterface: _User read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoGroup provides a Create and CreateRemote method to          
// create instances of the default interface _Group exposed by              
// the CoClass Group. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGroup = class
    class function Create: _Group;
    class function CreateRemote(const MachineName: string): _Group;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TGroup
// Help String      : 
// Default Interface: _Group
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (6) CanCreate Licensed
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TGroupProperties= class;
{$ENDIF}
  TGroup = class(TOleServer)
  private
    FIntf: _Group;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TGroupProperties;
    function GetServerProperties: TGroupProperties;
{$ENDIF}
    function GetDefaultInterface: _Group;
  protected
    procedure InitServerData; override;
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    procedure Set_PID(const Param1: WideString);
    function Get_Users: Users;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Group);
    procedure Disconnect; override;
    function CreateUser: User; overload;
    function CreateUser(Name: OleVariant): User; overload;
    function CreateUser(Name: OleVariant; PID: OleVariant): User; overload;
    function CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User; overload;
    property DefaultInterface: _Group read GetDefaultInterface;
    property PID: WideString write Set_PID;
    property Users: Users read Get_Users;
    property Name: WideString read Get_Name write Set_Name;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TGroupProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TGroup
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TGroupProperties = class(TPersistent)
  private
    FServer:    TGroup;
    function    GetDefaultInterface: _Group;
    constructor Create(AServer: TGroup);
  protected
    function Get_Name: WideString;
    procedure Set_Name(const pbstr: WideString);
    procedure Set_PID(const Param1: WideString);
    function Get_Users: Users;
  public
    property DefaultInterface: _Group read GetDefaultInterface;
  published
    property Name: WideString read Get_Name write Set_Name;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDBEngine provides a Create and CreateRemote method to          
// create instances of the default interface _DBEngine exposed by              
// the CoClass DBEngine. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDBEngine = class
    class function Create: _DBEngine;
    class function CreateRemote(const MachineName: string): _DBEngine;
  end;

// *********************************************************************//
// The Class CoPrivDBEngine provides a Create and CreateRemote method to          
// create instances of the default interface _DBEngine exposed by              
// the CoClass PrivDBEngine. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPrivDBEngine = class
    class function Create: _DBEngine;
    class function CreateRemote(const MachineName: string): _DBEngine;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoTableDef.Create: _TableDef;
begin
  Result := CreateComObject(CLASS_TableDef) as _TableDef;
end;

class function CoTableDef.CreateRemote(const MachineName: string): _TableDef;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TableDef) as _TableDef;
end;

procedure TTableDef.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000103-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000049-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTableDef.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TableDef;
  end;
end;

procedure TTableDef.ConnectTo(svrIntf: _TableDef);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTableDef.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTableDef.GetDefaultInterface: _TableDef;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TTableDef.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTableDefProperties.Create(Self);
{$ENDIF}
end;

destructor TTableDef.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTableDef.GetServerProperties: TTableDefProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTableDef.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TTableDef.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TTableDef.Get_Connect: WideString;
begin
    Result := DefaultInterface.Connect;
end;

procedure TTableDef.Set_Connect(const pbstr: WideString);
  { Warning: The property Connect has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Connect := pbstr;
end;

function TTableDef.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TTableDef.Get_LastUpdated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LastUpdated;
end;

function TTableDef.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TTableDef.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TTableDef.Get_SourceTableName: WideString;
begin
    Result := DefaultInterface.SourceTableName;
end;

procedure TTableDef.Set_SourceTableName(const pbstr: WideString);
  { Warning: The property SourceTableName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SourceTableName := pbstr;
end;

function TTableDef.Get_Updatable: WordBool;
begin
    Result := DefaultInterface.Updatable;
end;

function TTableDef.Get_ValidationText: WideString;
begin
    Result := DefaultInterface.ValidationText;
end;

procedure TTableDef.Set_ValidationText(const pbstr: WideString);
  { Warning: The property ValidationText has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationText := pbstr;
end;

function TTableDef.Get_ValidationRule: WideString;
begin
    Result := DefaultInterface.ValidationRule;
end;

procedure TTableDef.Set_ValidationRule(const pbstr: WideString);
  { Warning: The property ValidationRule has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationRule := pbstr;
end;

function TTableDef.Get_RecordCount: Integer;
begin
    Result := DefaultInterface.RecordCount;
end;

function TTableDef.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TTableDef.Get_Indexes: Indexes;
begin
    Result := DefaultInterface.Indexes;
end;

function TTableDef.Get_ConflictTable: WideString;
begin
    Result := DefaultInterface.ConflictTable;
end;

function TTableDef.Get_ReplicaFilter: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ReplicaFilter;
end;

procedure TTableDef.Set_ReplicaFilter(pFilter: OleVariant);
begin
  DefaultInterface.Set_ReplicaFilter(pFilter);
end;

function TTableDef.OpenRecordset: Recordset;
begin
  Result := DefaultInterface.OpenRecordset(EmptyParam, EmptyParam);
end;

function TTableDef.OpenRecordset(Type_: OleVariant): Recordset;
begin
  Result := DefaultInterface.OpenRecordset(Type_, EmptyParam);
end;

function TTableDef.OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset;
begin
  Result := DefaultInterface.OpenRecordset(Type_, Options);
end;

procedure TTableDef.RefreshLink;
begin
  DefaultInterface.RefreshLink;
end;

function TTableDef.CreateField: Field;
begin
  Result := DefaultInterface.CreateField(EmptyParam, EmptyParam, EmptyParam);
end;

function TTableDef.CreateField(Name: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, EmptyParam, EmptyParam);
end;

function TTableDef.CreateField(Name: OleVariant; Type_: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, EmptyParam);
end;

function TTableDef.CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, Size);
end;

function TTableDef.CreateIndex: Index;
begin
  Result := DefaultInterface.CreateIndex(EmptyParam);
end;

function TTableDef.CreateIndex(Name: OleVariant): Index;
begin
  Result := DefaultInterface.CreateIndex(Name);
end;

function TTableDef.CreateProperty: Property_;
begin
  Result := DefaultInterface.CreateProperty(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TTableDef.CreateProperty(Name: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, EmptyParam, EmptyParam, EmptyParam);
end;

function TTableDef.CreateProperty(Name: OleVariant; Type_: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, EmptyParam, EmptyParam);
end;

function TTableDef.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, EmptyParam);
end;

function TTableDef.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; 
                                  DDL: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, DDL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTableDefProperties.Create(AServer: TTableDef);
begin
  inherited Create;
  FServer := AServer;
end;

function TTableDefProperties.GetDefaultInterface: _TableDef;
begin
  Result := FServer.DefaultInterface;
end;

function TTableDefProperties.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TTableDefProperties.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TTableDefProperties.Get_Connect: WideString;
begin
    Result := DefaultInterface.Connect;
end;

procedure TTableDefProperties.Set_Connect(const pbstr: WideString);
  { Warning: The property Connect has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Connect := pbstr;
end;

function TTableDefProperties.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TTableDefProperties.Get_LastUpdated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LastUpdated;
end;

function TTableDefProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TTableDefProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TTableDefProperties.Get_SourceTableName: WideString;
begin
    Result := DefaultInterface.SourceTableName;
end;

procedure TTableDefProperties.Set_SourceTableName(const pbstr: WideString);
  { Warning: The property SourceTableName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SourceTableName := pbstr;
end;

function TTableDefProperties.Get_Updatable: WordBool;
begin
    Result := DefaultInterface.Updatable;
end;

function TTableDefProperties.Get_ValidationText: WideString;
begin
    Result := DefaultInterface.ValidationText;
end;

procedure TTableDefProperties.Set_ValidationText(const pbstr: WideString);
  { Warning: The property ValidationText has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationText := pbstr;
end;

function TTableDefProperties.Get_ValidationRule: WideString;
begin
    Result := DefaultInterface.ValidationRule;
end;

procedure TTableDefProperties.Set_ValidationRule(const pbstr: WideString);
  { Warning: The property ValidationRule has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationRule := pbstr;
end;

function TTableDefProperties.Get_RecordCount: Integer;
begin
    Result := DefaultInterface.RecordCount;
end;

function TTableDefProperties.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TTableDefProperties.Get_Indexes: Indexes;
begin
    Result := DefaultInterface.Indexes;
end;

function TTableDefProperties.Get_ConflictTable: WideString;
begin
    Result := DefaultInterface.ConflictTable;
end;

function TTableDefProperties.Get_ReplicaFilter: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.ReplicaFilter;
end;

procedure TTableDefProperties.Set_ReplicaFilter(pFilter: OleVariant);
begin
  DefaultInterface.Set_ReplicaFilter(pFilter);
end;

{$ENDIF}

class function CoField.Create: _Field;
begin
  Result := CreateComObject(CLASS_Field) as _Field;
end;

class function CoField.CreateRemote(const MachineName: string): _Field;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Field) as _Field;
end;

procedure TField.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000104-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000051-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TField.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Field;
  end;
end;

procedure TField.ConnectTo(svrIntf: _Field);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TField.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TField.GetDefaultInterface: _Field;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TField.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TFieldProperties.Create(Self);
{$ENDIF}
end;

destructor TField.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TField.GetServerProperties: TFieldProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TField.Get_CollatingOrder: Integer;
begin
    Result := DefaultInterface.CollatingOrder;
end;

function TField.Get_type_: Smallint;
begin
    Result := DefaultInterface.type_;
end;

procedure TField.Set_type_(ps: Smallint);
begin
  DefaultInterface.Set_type_(ps);
end;

function TField.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TField.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TField.Get_Size: Integer;
begin
    Result := DefaultInterface.Size;
end;

procedure TField.Set_Size(pl: Integer);
begin
  DefaultInterface.Set_Size(pl);
end;

function TField.Get_SourceField: WideString;
begin
    Result := DefaultInterface.SourceField;
end;

function TField.Get_SourceTable: WideString;
begin
    Result := DefaultInterface.SourceTable;
end;

function TField.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TField.Set_Value(pvar: OleVariant);
begin
  DefaultInterface.Set_Value(pvar);
end;

function TField.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TField.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TField.Get_OrdinalPosition: Smallint;
begin
    Result := DefaultInterface.OrdinalPosition;
end;

procedure TField.Set_OrdinalPosition(ps: Smallint);
begin
  DefaultInterface.Set_OrdinalPosition(ps);
end;

function TField.Get_ValidationText: WideString;
begin
    Result := DefaultInterface.ValidationText;
end;

procedure TField.Set_ValidationText(const pbstr: WideString);
  { Warning: The property ValidationText has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationText := pbstr;
end;

function TField.Get_ValidateOnSet: WordBool;
begin
    Result := DefaultInterface.ValidateOnSet;
end;

procedure TField.Set_ValidateOnSet(pb: WordBool);
begin
  DefaultInterface.Set_ValidateOnSet(pb);
end;

function TField.Get_ValidationRule: WideString;
begin
    Result := DefaultInterface.ValidationRule;
end;

procedure TField.Set_ValidationRule(const pbstr: WideString);
  { Warning: The property ValidationRule has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationRule := pbstr;
end;

function TField.Get_DefaultValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DefaultValue;
end;

procedure TField.Set_DefaultValue(pvar: OleVariant);
begin
  DefaultInterface.Set_DefaultValue(pvar);
end;

function TField.Get_Required: WordBool;
begin
    Result := DefaultInterface.Required;
end;

procedure TField.Set_Required(pb: WordBool);
begin
  DefaultInterface.Set_Required(pb);
end;

function TField.Get_AllowZeroLength: WordBool;
begin
    Result := DefaultInterface.AllowZeroLength;
end;

procedure TField.Set_AllowZeroLength(pb: WordBool);
begin
  DefaultInterface.Set_AllowZeroLength(pb);
end;

function TField.Get_DataUpdatable: WordBool;
begin
    Result := DefaultInterface.DataUpdatable;
end;

function TField.Get_ForeignName: WideString;
begin
    Result := DefaultInterface.ForeignName;
end;

procedure TField.Set_ForeignName(const pbstr: WideString);
  { Warning: The property ForeignName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ForeignName := pbstr;
end;

function TField.Get_CollectionIndex: Smallint;
begin
    Result := DefaultInterface.CollectionIndex;
end;

function TField.Get_OriginalValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OriginalValue;
end;

function TField.Get_VisibleValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.VisibleValue;
end;

function TField.Get_FieldSize: Integer;
begin
    Result := DefaultInterface.FieldSize;
end;

procedure TField.AppendChunk(Val: OleVariant);
begin
  DefaultInterface.AppendChunk(Val);
end;

function TField.GetChunk(Offset: Integer; Bytes: Integer): OleVariant;
begin
  Result := DefaultInterface.GetChunk(Offset, Bytes);
end;

function TField.CreateProperty: Property_;
begin
  Result := DefaultInterface.CreateProperty(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TField.CreateProperty(Name: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, EmptyParam, EmptyParam, EmptyParam);
end;

function TField.CreateProperty(Name: OleVariant; Type_: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, EmptyParam, EmptyParam);
end;

function TField.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, EmptyParam);
end;

function TField.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; 
                               DDL: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, DDL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TFieldProperties.Create(AServer: TField);
begin
  inherited Create;
  FServer := AServer;
end;

function TFieldProperties.GetDefaultInterface: _Field;
begin
  Result := FServer.DefaultInterface;
end;

function TFieldProperties.Get_CollatingOrder: Integer;
begin
    Result := DefaultInterface.CollatingOrder;
end;

function TFieldProperties.Get_type_: Smallint;
begin
    Result := DefaultInterface.type_;
end;

procedure TFieldProperties.Set_type_(ps: Smallint);
begin
  DefaultInterface.Set_type_(ps);
end;

function TFieldProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TFieldProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TFieldProperties.Get_Size: Integer;
begin
    Result := DefaultInterface.Size;
end;

procedure TFieldProperties.Set_Size(pl: Integer);
begin
  DefaultInterface.Set_Size(pl);
end;

function TFieldProperties.Get_SourceField: WideString;
begin
    Result := DefaultInterface.SourceField;
end;

function TFieldProperties.Get_SourceTable: WideString;
begin
    Result := DefaultInterface.SourceTable;
end;

function TFieldProperties.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TFieldProperties.Set_Value(pvar: OleVariant);
begin
  DefaultInterface.Set_Value(pvar);
end;

function TFieldProperties.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TFieldProperties.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TFieldProperties.Get_OrdinalPosition: Smallint;
begin
    Result := DefaultInterface.OrdinalPosition;
end;

procedure TFieldProperties.Set_OrdinalPosition(ps: Smallint);
begin
  DefaultInterface.Set_OrdinalPosition(ps);
end;

function TFieldProperties.Get_ValidationText: WideString;
begin
    Result := DefaultInterface.ValidationText;
end;

procedure TFieldProperties.Set_ValidationText(const pbstr: WideString);
  { Warning: The property ValidationText has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationText := pbstr;
end;

function TFieldProperties.Get_ValidateOnSet: WordBool;
begin
    Result := DefaultInterface.ValidateOnSet;
end;

procedure TFieldProperties.Set_ValidateOnSet(pb: WordBool);
begin
  DefaultInterface.Set_ValidateOnSet(pb);
end;

function TFieldProperties.Get_ValidationRule: WideString;
begin
    Result := DefaultInterface.ValidationRule;
end;

procedure TFieldProperties.Set_ValidationRule(const pbstr: WideString);
  { Warning: The property ValidationRule has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ValidationRule := pbstr;
end;

function TFieldProperties.Get_DefaultValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DefaultValue;
end;

procedure TFieldProperties.Set_DefaultValue(pvar: OleVariant);
begin
  DefaultInterface.Set_DefaultValue(pvar);
end;

function TFieldProperties.Get_Required: WordBool;
begin
    Result := DefaultInterface.Required;
end;

procedure TFieldProperties.Set_Required(pb: WordBool);
begin
  DefaultInterface.Set_Required(pb);
end;

function TFieldProperties.Get_AllowZeroLength: WordBool;
begin
    Result := DefaultInterface.AllowZeroLength;
end;

procedure TFieldProperties.Set_AllowZeroLength(pb: WordBool);
begin
  DefaultInterface.Set_AllowZeroLength(pb);
end;

function TFieldProperties.Get_DataUpdatable: WordBool;
begin
    Result := DefaultInterface.DataUpdatable;
end;

function TFieldProperties.Get_ForeignName: WideString;
begin
    Result := DefaultInterface.ForeignName;
end;

procedure TFieldProperties.Set_ForeignName(const pbstr: WideString);
  { Warning: The property ForeignName has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ForeignName := pbstr;
end;

function TFieldProperties.Get_CollectionIndex: Smallint;
begin
    Result := DefaultInterface.CollectionIndex;
end;

function TFieldProperties.Get_OriginalValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.OriginalValue;
end;

function TFieldProperties.Get_VisibleValue: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.VisibleValue;
end;

function TFieldProperties.Get_FieldSize: Integer;
begin
    Result := DefaultInterface.FieldSize;
end;

{$ENDIF}

class function CoIndex.Create: _Index;
begin
  Result := CreateComObject(CLASS_Index) as _Index;
end;

class function CoIndex.CreateRemote(const MachineName: string): _Index;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Index) as _Index;
end;

procedure TIndex.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000105-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000059-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TIndex.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Index;
  end;
end;

procedure TIndex.ConnectTo(svrIntf: _Index);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TIndex.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TIndex.GetDefaultInterface: _Index;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TIndex.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TIndexProperties.Create(Self);
{$ENDIF}
end;

destructor TIndex.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TIndex.GetServerProperties: TIndexProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TIndex.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TIndex.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TIndex.Get_Foreign: WordBool;
begin
    Result := DefaultInterface.Foreign;
end;

function TIndex.Get_Unique: WordBool;
begin
    Result := DefaultInterface.Unique;
end;

procedure TIndex.Set_Unique(pb: WordBool);
begin
  DefaultInterface.Set_Unique(pb);
end;

function TIndex.Get_Clustered: WordBool;
begin
    Result := DefaultInterface.Clustered;
end;

procedure TIndex.Set_Clustered(pb: WordBool);
begin
  DefaultInterface.Set_Clustered(pb);
end;

function TIndex.Get_Required: WordBool;
begin
    Result := DefaultInterface.Required;
end;

procedure TIndex.Set_Required(pb: WordBool);
begin
  DefaultInterface.Set_Required(pb);
end;

function TIndex.Get_IgnoreNulls: WordBool;
begin
    Result := DefaultInterface.IgnoreNulls;
end;

procedure TIndex.Set_IgnoreNulls(pb: WordBool);
begin
  DefaultInterface.Set_IgnoreNulls(pb);
end;

function TIndex.Get_Primary: WordBool;
begin
    Result := DefaultInterface.Primary;
end;

procedure TIndex.Set_Primary(pb: WordBool);
begin
  DefaultInterface.Set_Primary(pb);
end;

function TIndex.Get_DistinctCount: Integer;
begin
    Result := DefaultInterface.DistinctCount;
end;

function TIndex.Get_Fields: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Fields;
end;

procedure TIndex.Set_Fields(pv: OleVariant);
begin
  DefaultInterface.Set_Fields(pv);
end;

function TIndex.CreateField: Field;
begin
  Result := DefaultInterface.CreateField(EmptyParam, EmptyParam, EmptyParam);
end;

function TIndex.CreateField(Name: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, EmptyParam, EmptyParam);
end;

function TIndex.CreateField(Name: OleVariant; Type_: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, EmptyParam);
end;

function TIndex.CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, Size);
end;

function TIndex.CreateProperty: Property_;
begin
  Result := DefaultInterface.CreateProperty(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TIndex.CreateProperty(Name: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, EmptyParam, EmptyParam, EmptyParam);
end;

function TIndex.CreateProperty(Name: OleVariant; Type_: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, EmptyParam, EmptyParam);
end;

function TIndex.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, EmptyParam);
end;

function TIndex.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; 
                               DDL: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, DDL);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TIndexProperties.Create(AServer: TIndex);
begin
  inherited Create;
  FServer := AServer;
end;

function TIndexProperties.GetDefaultInterface: _Index;
begin
  Result := FServer.DefaultInterface;
end;

function TIndexProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TIndexProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TIndexProperties.Get_Foreign: WordBool;
begin
    Result := DefaultInterface.Foreign;
end;

function TIndexProperties.Get_Unique: WordBool;
begin
    Result := DefaultInterface.Unique;
end;

procedure TIndexProperties.Set_Unique(pb: WordBool);
begin
  DefaultInterface.Set_Unique(pb);
end;

function TIndexProperties.Get_Clustered: WordBool;
begin
    Result := DefaultInterface.Clustered;
end;

procedure TIndexProperties.Set_Clustered(pb: WordBool);
begin
  DefaultInterface.Set_Clustered(pb);
end;

function TIndexProperties.Get_Required: WordBool;
begin
    Result := DefaultInterface.Required;
end;

procedure TIndexProperties.Set_Required(pb: WordBool);
begin
  DefaultInterface.Set_Required(pb);
end;

function TIndexProperties.Get_IgnoreNulls: WordBool;
begin
    Result := DefaultInterface.IgnoreNulls;
end;

procedure TIndexProperties.Set_IgnoreNulls(pb: WordBool);
begin
  DefaultInterface.Set_IgnoreNulls(pb);
end;

function TIndexProperties.Get_Primary: WordBool;
begin
    Result := DefaultInterface.Primary;
end;

procedure TIndexProperties.Set_Primary(pb: WordBool);
begin
  DefaultInterface.Set_Primary(pb);
end;

function TIndexProperties.Get_DistinctCount: Integer;
begin
    Result := DefaultInterface.DistinctCount;
end;

function TIndexProperties.Get_Fields: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Fields;
end;

procedure TIndexProperties.Set_Fields(pv: OleVariant);
begin
  DefaultInterface.Set_Fields(pv);
end;

{$ENDIF}

class function CoQueryDef.Create: _QueryDef;
begin
  Result := CreateComObject(CLASS_QueryDef) as _QueryDef;
end;

class function CoQueryDef.CreateRemote(const MachineName: string): _QueryDef;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_QueryDef) as _QueryDef;
end;

procedure TQueryDef.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000108-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000079-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TQueryDef.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _QueryDef;
  end;
end;

procedure TQueryDef.ConnectTo(svrIntf: _QueryDef);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TQueryDef.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TQueryDef.GetDefaultInterface: _QueryDef;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TQueryDef.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TQueryDefProperties.Create(Self);
{$ENDIF}
end;

destructor TQueryDef.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TQueryDef.GetServerProperties: TQueryDefProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TQueryDef.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TQueryDef.Get_LastUpdated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LastUpdated;
end;

function TQueryDef.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TQueryDef.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TQueryDef.Get_ODBCTimeout: Smallint;
begin
    Result := DefaultInterface.ODBCTimeout;
end;

procedure TQueryDef.Set_ODBCTimeout(ps: Smallint);
begin
  DefaultInterface.Set_ODBCTimeout(ps);
end;

function TQueryDef.Get_type_: Smallint;
begin
    Result := DefaultInterface.type_;
end;

function TQueryDef.Get_SQL: WideString;
begin
    Result := DefaultInterface.SQL;
end;

procedure TQueryDef.Set_SQL(const pbstr: WideString);
  { Warning: The property SQL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SQL := pbstr;
end;

function TQueryDef.Get_Updatable: WordBool;
begin
    Result := DefaultInterface.Updatable;
end;

function TQueryDef.Get_Connect: WideString;
begin
    Result := DefaultInterface.Connect;
end;

procedure TQueryDef.Set_Connect(const pbstr: WideString);
  { Warning: The property Connect has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Connect := pbstr;
end;

function TQueryDef.Get_ReturnsRecords: WordBool;
begin
    Result := DefaultInterface.ReturnsRecords;
end;

procedure TQueryDef.Set_ReturnsRecords(pb: WordBool);
begin
  DefaultInterface.Set_ReturnsRecords(pb);
end;

function TQueryDef.Get_RecordsAffected: Integer;
begin
    Result := DefaultInterface.RecordsAffected;
end;

function TQueryDef.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TQueryDef.Get_Parameters: Parameters;
begin
    Result := DefaultInterface.Parameters;
end;

function TQueryDef.Get_hStmt: Integer;
begin
    Result := DefaultInterface.hStmt;
end;

function TQueryDef.Get_MaxRecords: Integer;
begin
    Result := DefaultInterface.MaxRecords;
end;

procedure TQueryDef.Set_MaxRecords(pMxRecs: Integer);
begin
  DefaultInterface.Set_MaxRecords(pMxRecs);
end;

function TQueryDef.Get_StillExecuting: WordBool;
begin
    Result := DefaultInterface.StillExecuting;
end;

function TQueryDef.Get_CacheSize: Integer;
begin
    Result := DefaultInterface.CacheSize;
end;

procedure TQueryDef.Set_CacheSize(lCacheSize: Integer);
begin
  DefaultInterface.Set_CacheSize(lCacheSize);
end;

function TQueryDef.Get_Prepare: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Prepare;
end;

procedure TQueryDef.Set_Prepare(pb: OleVariant);
begin
  DefaultInterface.Set_Prepare(pb);
end;

procedure TQueryDef.Close;
begin
  DefaultInterface.Close;
end;

procedure TQueryDef.Execute;
begin
  DefaultInterface.Execute(EmptyParam);
end;

procedure TQueryDef.Execute(Options: OleVariant);
begin
  DefaultInterface.Execute(Options);
end;

function TQueryDef.CreateProperty: Property_;
begin
  Result := DefaultInterface.CreateProperty(EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

function TQueryDef.CreateProperty(Name: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, EmptyParam, EmptyParam, EmptyParam);
end;

function TQueryDef.CreateProperty(Name: OleVariant; Type_: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, EmptyParam, EmptyParam);
end;

function TQueryDef.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, EmptyParam);
end;

function TQueryDef.CreateProperty(Name: OleVariant; Type_: OleVariant; Value: OleVariant; 
                                  DDL: OleVariant): Property_;
begin
  Result := DefaultInterface.CreateProperty(Name, Type_, Value, DDL);
end;

function TQueryDef.OpenRecordset: Recordset;
begin
  Result := DefaultInterface.OpenRecordset(EmptyParam, EmptyParam, EmptyParam);
end;

function TQueryDef.OpenRecordset(Type_: OleVariant): Recordset;
begin
  Result := DefaultInterface.OpenRecordset(Type_, EmptyParam, EmptyParam);
end;

function TQueryDef.OpenRecordset(Type_: OleVariant; Options: OleVariant): Recordset;
begin
  Result := DefaultInterface.OpenRecordset(Type_, Options, EmptyParam);
end;

function TQueryDef.OpenRecordset(Type_: OleVariant; Options: OleVariant; LockEdit: OleVariant): Recordset;
begin
  Result := DefaultInterface.OpenRecordset(Type_, Options, LockEdit);
end;

procedure TQueryDef.Cancel;
begin
  DefaultInterface.Cancel;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TQueryDefProperties.Create(AServer: TQueryDef);
begin
  inherited Create;
  FServer := AServer;
end;

function TQueryDefProperties.GetDefaultInterface: _QueryDef;
begin
  Result := FServer.DefaultInterface;
end;

function TQueryDefProperties.Get_DateCreated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.DateCreated;
end;

function TQueryDefProperties.Get_LastUpdated: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.LastUpdated;
end;

function TQueryDefProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TQueryDefProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TQueryDefProperties.Get_ODBCTimeout: Smallint;
begin
    Result := DefaultInterface.ODBCTimeout;
end;

procedure TQueryDefProperties.Set_ODBCTimeout(ps: Smallint);
begin
  DefaultInterface.Set_ODBCTimeout(ps);
end;

function TQueryDefProperties.Get_type_: Smallint;
begin
    Result := DefaultInterface.type_;
end;

function TQueryDefProperties.Get_SQL: WideString;
begin
    Result := DefaultInterface.SQL;
end;

procedure TQueryDefProperties.Set_SQL(const pbstr: WideString);
  { Warning: The property SQL has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.SQL := pbstr;
end;

function TQueryDefProperties.Get_Updatable: WordBool;
begin
    Result := DefaultInterface.Updatable;
end;

function TQueryDefProperties.Get_Connect: WideString;
begin
    Result := DefaultInterface.Connect;
end;

procedure TQueryDefProperties.Set_Connect(const pbstr: WideString);
  { Warning: The property Connect has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Connect := pbstr;
end;

function TQueryDefProperties.Get_ReturnsRecords: WordBool;
begin
    Result := DefaultInterface.ReturnsRecords;
end;

procedure TQueryDefProperties.Set_ReturnsRecords(pb: WordBool);
begin
  DefaultInterface.Set_ReturnsRecords(pb);
end;

function TQueryDefProperties.Get_RecordsAffected: Integer;
begin
    Result := DefaultInterface.RecordsAffected;
end;

function TQueryDefProperties.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TQueryDefProperties.Get_Parameters: Parameters;
begin
    Result := DefaultInterface.Parameters;
end;

function TQueryDefProperties.Get_hStmt: Integer;
begin
    Result := DefaultInterface.hStmt;
end;

function TQueryDefProperties.Get_MaxRecords: Integer;
begin
    Result := DefaultInterface.MaxRecords;
end;

procedure TQueryDefProperties.Set_MaxRecords(pMxRecs: Integer);
begin
  DefaultInterface.Set_MaxRecords(pMxRecs);
end;

function TQueryDefProperties.Get_StillExecuting: WordBool;
begin
    Result := DefaultInterface.StillExecuting;
end;

function TQueryDefProperties.Get_CacheSize: Integer;
begin
    Result := DefaultInterface.CacheSize;
end;

procedure TQueryDefProperties.Set_CacheSize(lCacheSize: Integer);
begin
  DefaultInterface.Set_CacheSize(lCacheSize);
end;

function TQueryDefProperties.Get_Prepare: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Prepare;
end;

procedure TQueryDefProperties.Set_Prepare(pb: OleVariant);
begin
  DefaultInterface.Set_Prepare(pb);
end;

{$ENDIF}

class function CoRelation.Create: _Relation;
begin
  Result := CreateComObject(CLASS_Relation) as _Relation;
end;

class function CoRelation.CreateRemote(const MachineName: string): _Relation;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Relation) as _Relation;
end;

procedure TRelation.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000109-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000089-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRelation.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Relation;
  end;
end;

procedure TRelation.ConnectTo(svrIntf: _Relation);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRelation.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRelation.GetDefaultInterface: _Relation;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TRelation.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRelationProperties.Create(Self);
{$ENDIF}
end;

destructor TRelation.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRelation.GetServerProperties: TRelationProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TRelation.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TRelation.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TRelation.Get_Table: WideString;
begin
    Result := DefaultInterface.Table;
end;

procedure TRelation.Set_Table(const pbstr: WideString);
  { Warning: The property Table has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Table := pbstr;
end;

function TRelation.Get_ForeignTable: WideString;
begin
    Result := DefaultInterface.ForeignTable;
end;

procedure TRelation.Set_ForeignTable(const pbstr: WideString);
  { Warning: The property ForeignTable has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ForeignTable := pbstr;
end;

function TRelation.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TRelation.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TRelation.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TRelation.Get_PartialReplica: WordBool;
begin
    Result := DefaultInterface.PartialReplica;
end;

procedure TRelation.Set_PartialReplica(pfPartialReplica: WordBool);
begin
  DefaultInterface.Set_PartialReplica(pfPartialReplica);
end;

function TRelation.CreateField: Field;
begin
  Result := DefaultInterface.CreateField(EmptyParam, EmptyParam, EmptyParam);
end;

function TRelation.CreateField(Name: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, EmptyParam, EmptyParam);
end;

function TRelation.CreateField(Name: OleVariant; Type_: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, EmptyParam);
end;

function TRelation.CreateField(Name: OleVariant; Type_: OleVariant; Size: OleVariant): Field;
begin
  Result := DefaultInterface.CreateField(Name, Type_, Size);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRelationProperties.Create(AServer: TRelation);
begin
  inherited Create;
  FServer := AServer;
end;

function TRelationProperties.GetDefaultInterface: _Relation;
begin
  Result := FServer.DefaultInterface;
end;

function TRelationProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TRelationProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

function TRelationProperties.Get_Table: WideString;
begin
    Result := DefaultInterface.Table;
end;

procedure TRelationProperties.Set_Table(const pbstr: WideString);
  { Warning: The property Table has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Table := pbstr;
end;

function TRelationProperties.Get_ForeignTable: WideString;
begin
    Result := DefaultInterface.ForeignTable;
end;

procedure TRelationProperties.Set_ForeignTable(const pbstr: WideString);
  { Warning: The property ForeignTable has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.ForeignTable := pbstr;
end;

function TRelationProperties.Get_Attributes: Integer;
begin
    Result := DefaultInterface.Attributes;
end;

procedure TRelationProperties.Set_Attributes(pl: Integer);
begin
  DefaultInterface.Set_Attributes(pl);
end;

function TRelationProperties.Get_Fields: Fields;
begin
    Result := DefaultInterface.Fields;
end;

function TRelationProperties.Get_PartialReplica: WordBool;
begin
    Result := DefaultInterface.PartialReplica;
end;

procedure TRelationProperties.Set_PartialReplica(pfPartialReplica: WordBool);
begin
  DefaultInterface.Set_PartialReplica(pfPartialReplica);
end;

{$ENDIF}

class function CoUser.Create: _User;
begin
  Result := CreateComObject(CLASS_User) as _User;
end;

class function CoUser.CreateRemote(const MachineName: string): _User;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_User) as _User;
end;

procedure TUser.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000107-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000069-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUser.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _User;
  end;
end;

procedure TUser.ConnectTo(svrIntf: _User);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUser.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUser.GetDefaultInterface: _User;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUserProperties.Create(Self);
{$ENDIF}
end;

destructor TUser.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUser.GetServerProperties: TUserProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TUser.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TUser.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

procedure TUser.Set_PID(const Param1: WideString);
  { Warning: The property PID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PID := Param1;
end;

procedure TUser.Set_Password(const Param1: WideString);
  { Warning: The property Password has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Password := Param1;
end;

function TUser.Get_Groups: Groups;
begin
    Result := DefaultInterface.Groups;
end;

procedure TUser.NewPassword(const bstrOld: WideString; const bstrNew: WideString);
begin
  DefaultInterface.NewPassword(bstrOld, bstrNew);
end;

function TUser.CreateGroup: Group;
begin
  Result := DefaultInterface.CreateGroup(EmptyParam, EmptyParam);
end;

function TUser.CreateGroup(Name: OleVariant): Group;
begin
  Result := DefaultInterface.CreateGroup(Name, EmptyParam);
end;

function TUser.CreateGroup(Name: OleVariant; PID: OleVariant): Group;
begin
  Result := DefaultInterface.CreateGroup(Name, PID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUserProperties.Create(AServer: TUser);
begin
  inherited Create;
  FServer := AServer;
end;

function TUserProperties.GetDefaultInterface: _User;
begin
  Result := FServer.DefaultInterface;
end;

function TUserProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TUserProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

procedure TUserProperties.Set_PID(const Param1: WideString);
  { Warning: The property PID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PID := Param1;
end;

procedure TUserProperties.Set_Password(const Param1: WideString);
  { Warning: The property Password has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Password := Param1;
end;

function TUserProperties.Get_Groups: Groups;
begin
    Result := DefaultInterface.Groups;
end;

{$ENDIF}

class function CoGroup.Create: _Group;
begin
  Result := CreateComObject(CLASS_Group) as _Group;
end;

class function CoGroup.CreateRemote(const MachineName: string): _Group;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Group) as _Group;
end;

procedure TGroup.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{00000106-0000-0010-8000-00AA006D2EA4}';
    IntfIID:   '{00000061-0000-0010-8000-00AA006D2EA4}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TGroup.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Group;
  end;
end;

procedure TGroup.ConnectTo(svrIntf: _Group);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TGroup.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TGroup.GetDefaultInterface: _Group;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TGroupProperties.Create(Self);
{$ENDIF}
end;

destructor TGroup.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TGroup.GetServerProperties: TGroupProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TGroup.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TGroup.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

procedure TGroup.Set_PID(const Param1: WideString);
  { Warning: The property PID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PID := Param1;
end;

function TGroup.Get_Users: Users;
begin
    Result := DefaultInterface.Users;
end;

function TGroup.CreateUser: User;
begin
  Result := DefaultInterface.CreateUser(EmptyParam, EmptyParam, EmptyParam);
end;

function TGroup.CreateUser(Name: OleVariant): User;
begin
  Result := DefaultInterface.CreateUser(Name, EmptyParam, EmptyParam);
end;

function TGroup.CreateUser(Name: OleVariant; PID: OleVariant): User;
begin
  Result := DefaultInterface.CreateUser(Name, PID, EmptyParam);
end;

function TGroup.CreateUser(Name: OleVariant; PID: OleVariant; Password: OleVariant): User;
begin
  Result := DefaultInterface.CreateUser(Name, PID, Password);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TGroupProperties.Create(AServer: TGroup);
begin
  inherited Create;
  FServer := AServer;
end;

function TGroupProperties.GetDefaultInterface: _Group;
begin
  Result := FServer.DefaultInterface;
end;

function TGroupProperties.Get_Name: WideString;
begin
    Result := DefaultInterface.Name;
end;

procedure TGroupProperties.Set_Name(const pbstr: WideString);
  { Warning: The property Name has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Name := pbstr;
end;

procedure TGroupProperties.Set_PID(const Param1: WideString);
  { Warning: The property PID has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.PID := Param1;
end;

function TGroupProperties.Get_Users: Users;
begin
    Result := DefaultInterface.Users;
end;

{$ENDIF}

class function CoDBEngine.Create: _DBEngine;
begin
  Result := CreateComObject(CLASS_DBEngine) as _DBEngine;
end;

class function CoDBEngine.CreateRemote(const MachineName: string): _DBEngine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DBEngine) as _DBEngine;
end;

class function CoPrivDBEngine.Create: _DBEngine;
begin
  Result := CreateComObject(CLASS_PrivDBEngine) as _DBEngine;
end;

class function CoPrivDBEngine.CreateRemote(const MachineName: string): _DBEngine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PrivDBEngine) as _DBEngine;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TTableDef, TField, TIndex, TQueryDef, 
    TRelation, TUser, TGroup]);
end;

end.
