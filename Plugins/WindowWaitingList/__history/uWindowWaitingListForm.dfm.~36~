object WindowWaitingListForm: TWindowWaitingListForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowWaitingListForm'
  ClientHeight = 320
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object dbgWaitingList: TDBGridEh
    Left = 0
    Top = 0
    Width = 344
    Height = 320
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.EndEllipsis = True
    ColumnDefValues.Title.EndEllipsis = True
    ColumnDefValues.Title.TitleButton = True
    DataGrouping.GroupLevels = <>
    DataSource = dsWaitingList
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
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghRowHighlight, dghShowRecNo, dghColumnResize, dghColumnMove, dghHotTrack]
    ParentShowHint = False
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_CALL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_FREQ'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_MODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_BAND'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_DATE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_QTH'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_IOTA'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_COMMENT'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_STATE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'WAITINGLIST_NAME'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cdsWaitingList: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'WAITINGLIST_CALL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'WAITINGLIST_FREQ'
        DataType = ftFloat
      end
      item
        Name = 'WAITINGLIST_MODE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'WAITINGLIST_BAND'
        DataType = ftFloat
      end
      item
        Name = 'WAITINGLIST_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'WAITINGLIST_QTH'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'WAITINGLIST_STATE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'WAITINGLIST_IOTA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'WAITINGLIST_COMMENT'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'WAITINGLIST_NAME'
        DataType = ftString
        Size = 100
      end>
    Left = 144
    Top = 248
    object cdsWaitingListWAITINGLIST_CALL: TStringField
      FieldName = 'WAITINGLIST_CALL'
      Size = 50
    end
    object cdsWaitingListWAITINGLIST_FREQ: TFloatField
      FieldName = 'WAITINGLIST_FREQ'
    end
    object cdsWaitingListWAITINGLIST_MODE: TStringField
      FieldName = 'WAITINGLIST_MODE'
      Size = 50
    end
    object cdsWaitingListWAITINGLIST_BAND: TFloatField
      FieldName = 'WAITINGLIST_BAND'
    end
    object cdsWaitingListWAITINGLIST_DATE: TDateTimeField
      FieldName = 'WAITINGLIST_DATE'
      DisplayFormat = 'hh:mm:ss'
    end
    object cdsWaitingListWAITINGLIST_QTH: TStringField
      FieldName = 'WAITINGLIST_QTH'
      Size = 50
    end
    object cdsWaitingListWAITINGLIST_STATE: TStringField
      FieldName = 'WAITINGLIST_STATE'
      Size = 50
    end
    object cdsWaitingListWAITINGLIST_IOTA: TStringField
      FieldName = 'WAITINGLIST_IOTA'
      Size = 50
    end
    object cdsWaitingListWAITINGLIST_COMMENT: TStringField
      FieldName = 'WAITINGLIST_COMMENT'
      Size = 256
    end
    object cdsWaitingListWAITINGLIST_NAME: TStringField
      FieldName = 'WAITINGLIST_NAME'
      Size = 100
    end
  end
  object dsWaitingList: TDataSource
    DataSet = cdsWaitingList
    Left = 48
    Top = 248
  end
  object alWaitingList: TActionList
    Left = 96
    Top = 224
    object aWaitingListCallAdd: TAction
      Tag = -1
      Caption = 'aWaitingListCallAdd'
      OnExecute = aWaitingListCallAddExecute
    end
    object aWaitingListCallDelete: TAction
      Tag = -1
      Caption = 'aWaitingListCallDelete'
      OnExecute = aWaitingListCallDeleteExecute
    end
    object aWaitingListSetCall: TAction
      Tag = -1
      Caption = 'aWaitingListSetCall'
      OnExecute = aWaitingListSetCallExecute
    end
  end
  object FormStorage: TJvFormStorage
    Active = False
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 208
    Top = 224
  end
  object alWaitingListItems: TActionList
    Left = 104
    Top = 128
  end
end
