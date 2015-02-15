object Options: TOptions
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 575
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object msgDeleteRecord: TLabel
    Left = 15
    Top = 297
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msgDeleteRecord'
    Visible = False
  end
  object msgLoadPhoto: TLabel
    Left = 15
    Top = 310
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgCancelEdit: TLabel
    Left = 104
    Top = 297
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgCheckeQSLSent: TLabel
    Left = 104
    Top = 309
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgExitProgramm: TLabel
    Left = 185
    Top = 297
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgError: TLabel
    Left = 23
    Top = 316
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgErrorQSLExchange: TLabel
    Left = 31
    Top = 316
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgInformation: TLabel
    Left = 185
    Top = 309
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgInformationQSLExchange: TLabel
    Left = 193
    Top = 316
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msdDeleteRecord'
    Visible = False
  end
  object msgInformationQSLReceive: TLabel
    Left = 23
    Top = 305
    Width = 100
    Height = 16
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'msgDeleteRecord'
    Visible = False
  end
  object msgInformationSetPersonalData: TLabel
    Left = 64
    Top = 336
    Width = 184
    Height = 16
    Caption = 'msgInformationSetPersonalData'
    Visible = False
  end
  object msgConfirmStationDelete: TLabel
    Left = 160
    Top = 16
    Width = 145
    Height = 16
    Caption = 'msgConfirmStationDelete'
    Visible = False
  end
  object msgFieldCallNotNull: TLabel
    Left = 104
    Top = 312
    Width = 112
    Height = 16
    Caption = 'msgFieldCallNotNull'
    Visible = False
  end
  object msgExitOptions: TLabel
    Left = 32
    Top = 8
    Width = 87
    Height = 16
    Caption = 'msgExitOptions'
    Visible = False
  end
  object pnlOptions: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 541
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 204
      Top = 0
      Height = 541
      ExplicitHeight = 522
    end
    object msgConfirmation: TLabel
      Left = 136
      Top = 336
      Width = 97
      Height = 16
      Caption = 'msgConfirmation'
      Visible = False
    end
    object plSettings: TJvPageList
      Left = 207
      Top = 0
      Width = 466
      Height = 541
      ActivePage = pgGeneral
      PropagateEnable = True
      Align = alClient
      object pgGeneral: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'Environment - Interface'
        object pcGeneral: TPageControl
          Left = 0
          Top = 0
          Width = 466
          Height = 520
          ActivePage = tsGeneralInterface
          Align = alClient
          TabOrder = 0
          object tsGeneralInterface: TTabSheet
            Caption = 'tsGeneralInterface'
            object lbColorQSLSent: TLabel
              Left = 3
              Top = 385
              Width = 89
              Height = 16
              Caption = 'lbColorQSLSent'
              Visible = False
            end
            object lbColorQSLQueue: TLabel
              Left = 3
              Top = 407
              Width = 100
              Height = 16
              Caption = 'lbColorQSLQueue'
              Visible = False
            end
            object lbColorQSLIgnore: TLabel
              Left = 3
              Top = 429
              Width = 100
              Height = 16
              Caption = 'lbColorQSLIgnore'
              Visible = False
            end
            object lbColorQSLValidate: TLabel
              Left = 2
              Top = 451
              Width = 109
              Height = 16
              Caption = 'lbColorQSLValidate'
              Visible = False
            end
            object lbColorQSLRcvd: TLabel
              Left = 163
              Top = 407
              Width = 90
              Height = 16
              Caption = 'lbColorQSLRcvd'
              Visible = False
            end
            object lbColorEQSLRcvd: TLabel
              Left = 163
              Top = 429
              Width = 97
              Height = 16
              Caption = 'lbColorEQSLRcvd'
              Visible = False
            end
            object gbGeneralInterface: TGroupBox
              Left = 0
              Top = 0
              Width = 458
              Height = 97
              Align = alTop
              Caption = 'gbGeneralInterface'
              TabOrder = 0
              object lbLang: TLabel
                Left = 20
                Top = 26
                Width = 37
                Height = 16
                Caption = 'lbLang'
              end
              object lbFontSize: TLabel
                Left = 148
                Top = 26
                Width = 37
                Height = 16
                Caption = 'lbLang'
              end
              object cbLang: TComboBox
                Left = 20
                Top = 44
                Width = 115
                Height = 24
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Style = csDropDownList
                TabOrder = 0
              end
              object seFontSize: TSpinEdit
                Left = 148
                Top = 44
                Width = 121
                Height = 26
                MaxValue = 0
                MinValue = 0
                TabOrder = 1
                Value = 8
              end
            end
            object gbGeneralGridColor: TGroupBox
              Left = 0
              Top = 97
              Width = 458
              Height = 136
              Align = alTop
              Caption = 'gbGeneralGridColor'
              TabOrder = 1
              object lbColorCondition: TLabel
                Left = 20
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object lbColorBackground: TLabel
                Left = 208
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object lbColorForeground: TLabel
                Left = 287
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object cbGeneralGridColor: TComboBox
                Left = 20
                Top = 48
                Width = 181
                Height = 24
                Style = csDropDownList
                TabOrder = 0
                OnClick = cbGeneralGridColorClick
              end
              object gbGeneralColorFontStyle: TGroupBox
                Left = 20
                Top = 76
                Width = 420
                Height = 46
                Caption = 'gbGeneralColorFontStyle'
                TabOrder = 1
                object cbFontBold: TCheckBox
                  Left = 15
                  Top = 21
                  Width = 129
                  Height = 17
                  Caption = 'cbFontBold'
                  TabOrder = 0
                  OnClick = cbFontBoldClick
                end
                object cbFontItalic: TCheckBox
                  Left = 150
                  Top = 21
                  Width = 136
                  Height = 17
                  Caption = 'CheckBox1'
                  TabOrder = 1
                  OnClick = cbFontItalicClick
                end
                object cbFontUnderline: TCheckBox
                  Left = 292
                  Top = 21
                  Width = 125
                  Height = 17
                  Caption = 'CheckBox1'
                  TabOrder = 2
                  OnClick = cbFontUnderlineClick
                end
              end
              object cbColorBackground: TJvColorButton
                Left = 208
                Top = 48
                Height = 24
                OtherCaption = '&Other...'
                Options = []
                OnChange = cbColorBackgroundChange
                TabOrder = 2
                TabStop = False
              end
              object cbColorForeground: TJvColorButton
                Left = 287
                Top = 48
                Height = 24
                OtherCaption = '&Other...'
                Options = []
                OnChange = cbColorForegroundChange
                TabOrder = 3
                TabStop = False
              end
            end
            object gbGeneralStatisticsColor: TGroupBox
              Left = 0
              Top = 233
              Width = 458
              Height = 88
              Align = alTop
              Caption = 'gbGeneralStatisticsColor'
              TabOrder = 2
              object lbColorStatisticsCondition: TLabel
                Left = 20
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object lbColorStatisticsBackground: TLabel
                Left = 208
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object lbColorStatisticsForeground: TLabel
                Left = 287
                Top = 30
                Width = 93
                Height = 16
                Caption = 'lbColorCondition'
              end
              object cbGeneralGridColorStatistics: TComboBox
                Left = 20
                Top = 48
                Width = 181
                Height = 24
                Style = csDropDownList
                TabOrder = 0
                OnClick = cbGeneralGridColorStatisticsClick
              end
              object cbColorStatisticsBackground: TJvColorButton
                Left = 208
                Top = 48
                Height = 24
                OtherCaption = '&Other...'
                Options = []
                OnChange = cbColorStatisticsBackgroundChange
                TabOrder = 1
                TabStop = False
              end
              object cbColorStatisticsForeground: TJvColorButton
                Left = 287
                Top = 48
                Height = 24
                OtherCaption = '&Other...'
                Options = []
                OnChange = cbColorStatisticsForegroundChange
                TabOrder = 2
                TabStop = False
              end
            end
          end
          object tsGeneralData: TTabSheet
            Caption = 'tsGeneralData'
            ImageIndex = 1
            object gbGeneralCallInfo: TGroupBox
              Left = 0
              Top = 0
              Width = 458
              Height = 233
              Align = alTop
              Caption = 'gbGeneralCallInfo'
              TabOrder = 0
              object lbTimeCallSecondaryData: TLabel
                Left = 20
                Top = 75
                Width = 146
                Height = 16
                Caption = 'lbTimeCallSecondaryData'
              end
              object lbCallInfoDirectory: TLabel
                Left = 20
                Top = 157
                Width = 104
                Height = 16
                Caption = 'lbCallInfoDirectory'
              end
              object cbAutoGetCallPrimaryData: TCheckBox
                Left = 20
                Top = 26
                Width = 421
                Height = 17
                Caption = 'cbAutoGetCallPrimaryData'
                TabOrder = 0
              end
              object seTimeCallSecondaryData: TSpinEdit
                Left = 20
                Top = 94
                Width = 74
                Height = 26
                MaxValue = 0
                MinValue = 0
                TabOrder = 1
                Value = 0
              end
              object cbAutoGetCalSecondaryDataOnEdit: TCheckBox
                Left = 20
                Top = 49
                Width = 421
                Height = 17
                Caption = 'cbAutoGetCallPrimaryData'
                TabOrder = 2
              end
              object cbCheckNewOneForAllBook: TCheckBox
                Left = 20
                Top = 133
                Width = 421
                Height = 17
                Caption = 'cbAutoGetCallPrimaryData'
                TabOrder = 3
              end
              object deCallInfoDirectory: TJvDirectoryEdit
                Left = 20
                Top = 175
                Width = 421
                Height = 24
                DialogKind = dkWin32
                ButtonWidth = 25
                TabOrder = 4
              end
              object cbLoadManagers: TCheckBox
                Left = 20
                Top = 205
                Width = 421
                Height = 17
                Caption = 'cbLoadManagers'
                TabOrder = 5
              end
            end
            object gbGeneralUpdate: TGroupBox
              Left = 0
              Top = 233
              Width = 458
              Height = 95
              Align = alTop
              Caption = 'gbGeneralUpdate'
              TabOrder = 1
              object cbAutoCheckFlashUpdate: TCheckBox
                Left = 20
                Top = 24
                Width = 421
                Height = 17
                Caption = 'cbAutoCheckFlashUpdate'
                TabOrder = 0
              end
              object cbAutoCheckFullUpdate: TCheckBox
                Left = 20
                Top = 47
                Width = 421
                Height = 17
                Caption = 'cbAutoCheckFlashUpdate'
                TabOrder = 1
              end
              object cbPartnerProgramm: TCheckBox
                Left = 20
                Top = 70
                Width = 421
                Height = 17
                Caption = 'cbAutoCheckFlashUpdate'
                TabOrder = 2
              end
            end
            object gbGeneralBackup: TGroupBox
              Left = 0
              Top = 328
              Width = 458
              Height = 129
              Align = alTop
              Caption = 'gbGeneralBackup'
              TabOrder = 2
              object lbBackupDirectory: TLabel
                Left = 20
                Top = 44
                Width = 131
                Height = 16
                Caption = 'lbDQSLPictureDirectory'
              end
              object deBackupDirectory: TJvDirectoryEdit
                Left = 20
                Top = 62
                Width = 421
                Height = 24
                DialogKind = dkWin32
                ButtonWidth = 25
                TabOrder = 0
              end
              object cbAutoBackupOnExit: TCheckBox
                Left = 20
                Top = 21
                Width = 421
                Height = 17
                Caption = 'cbAutoCheckFlashUpdate'
                TabOrder = 1
              end
              object cbUseDropBox: TCheckBox
                Left = 20
                Top = 96
                Width = 421
                Height = 17
                Caption = 'cbUseDropBox'
                TabOrder = 2
              end
            end
          end
          object tsQSLServices: TTabSheet
            Caption = 'tsQSLServices'
            ImageIndex = 2
            object gbGeneralQSLServicesDQSL: TGroupBox
              Left = 0
              Top = 158
              Width = 458
              Height = 219
              Align = alTop
              Caption = 'gbGeneralQSLServicesDQSL'
              TabOrder = 0
              object lbDQSLPictureDirectory: TLabel
                Left = 20
                Top = 56
                Width = 131
                Height = 16
                Caption = 'lbDQSLPictureDirectory'
              end
              object lbJPEGQuality: TLabel
                Left = 20
                Top = 109
                Width = 76
                Height = 16
                Caption = 'lbJPEGQuality'
              end
              object lbJPEGDPI: TLabel
                Left = 20
                Top = 164
                Width = 76
                Height = 16
                Caption = 'lbJPEGQuality'
              end
              object deDQSLPictureDirectory: TJvDirectoryEdit
                Left = 20
                Top = 75
                Width = 421
                Height = 24
                DialogKind = dkWin32
                ButtonWidth = 25
                TabOrder = 0
                Text = 'deDQSLPictureDirectory'
              end
              object cbDQSLSentIdentifier: TCheckBox
                Left = 20
                Top = 28
                Width = 421
                Height = 17
                Caption = 'cbDQSLSentIdentifier'
                TabOrder = 1
              end
              object seJPEGQuality: TSpinEdit
                Left = 20
                Top = 128
                Width = 78
                Height = 26
                MaxValue = 0
                MinValue = 0
                TabOrder = 2
                Value = 0
              end
              object seJPEGDPI: TSpinEdit
                Left = 20
                Top = 183
                Width = 78
                Height = 26
                MaxValue = 0
                MinValue = 0
                TabOrder = 3
                Value = 0
              end
            end
            object gbGeneralQSLServicesEQSL: TGroupBox
              Left = 0
              Top = 0
              Width = 458
              Height = 158
              Align = alTop
              Caption = 'gbGeneralQSLServicesEQSL'
              TabOrder = 1
              object lbEQSLLastDownload: TLabel
                Left = 20
                Top = 24
                Width = 119
                Height = 16
                Caption = 'lbEQSLLastDownload'
              end
              object lbEQSLPictureDirectory: TLabel
                Left = 20
                Top = 101
                Width = 119
                Height = 16
                Caption = 'lbEQSLLastDownload'
              end
              object dtpEQSLLastDownload: TDateTimePicker
                Left = 20
                Top = 42
                Width = 113
                Height = 24
                Date = 40478.575555231480000000
                Time = 40478.575555231480000000
                TabOrder = 0
              end
              object cbEQSLLoadPictures: TCheckBox
                Left = 20
                Top = 77
                Width = 421
                Height = 17
                Caption = 'cbEQSLLoadPictures'
                TabOrder = 1
              end
              object deEQSLPictureDirectory: TJvDirectoryEdit
                Left = 20
                Top = 120
                Width = 421
                Height = 24
                DialogKind = dkWin32
                ButtonWidth = 25
                TabOrder = 2
                Text = 'deEQSLPictureDirectory'
              end
            end
            object gbGeneralQSLServicesLOTW: TGroupBox
              Left = 0
              Top = 377
              Width = 458
              Height = 112
              Align = alClient
              Caption = 'gbGeneralQSLServicesLOTW'
              TabOrder = 2
              object lbLOTWLastDownload: TLabel
                Left = 20
                Top = 24
                Width = 119
                Height = 16
                Caption = 'lbEQSLLastDownload'
              end
              object dtpLOTWLastDownload: TDateTimePicker
                Left = 20
                Top = 42
                Width = 113
                Height = 24
                Date = 40478.575555231480000000
                Time = 40478.575555231480000000
                TabOrder = 0
              end
            end
          end
        end
      end
      object pgPersonalData: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'pgPersonalData'
        object memRecentReports: TMemo
          Left = 152
          Top = 296
          Width = 185
          Height = 89
          Lines.Strings = (
            'memRecentReports')
          TabOrder = 0
          Visible = False
          WordWrap = False
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 466
          Height = 520
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object ToolBar1: TToolBar
            Left = 0
            Top = 0
            Width = 466
            Height = 34
            ButtonHeight = 32
            ButtonWidth = 32
            Caption = 'ToolBar1'
            Images = ilOptions
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolButton1: TToolButton
              Left = 0
              Top = 0
              Action = aBookAdd
            end
            object ToolButton15: TToolButton
              Left = 32
              Top = 0
              Action = aBookGroupAdd
            end
            object ToolButton2: TToolButton
              Left = 64
              Top = 0
              Action = aBookEdit
            end
            object ToolButton3: TToolButton
              Left = 96
              Top = 0
              Action = aBookDelete
            end
          end
          object dbgStations: TDBGridEh
            Left = 0
            Top = 34
            Width = 466
            Height = 486
            Align = alClient
            AllowedOperations = []
            ColumnDefValues.EndEllipsis = True
            ColumnDefValues.Title.Alignment = taCenter
            ColumnDefValues.Title.EndEllipsis = True
            ColumnDefValues.Title.TitleButton = True
            DataGrouping.GroupLevels = <>
            DataSource = dsStations
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
            OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
            ReadOnly = True
            RowDetailPanel.Color = clBtnFace
            STFilter.InstantApply = True
            STFilter.Local = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = dbgStationsDblClick
            OnGetCellParams = dbgStationsGetCellParams
            Columns = <
              item
                EditButtons = <>
                FieldName = 'STATION_CALL'
                Footers = <>
                Width = 129
              end
              item
                EditButtons = <>
                FieldName = 'STATION_STREET'
                Footers = <>
                Width = 2299
              end
              item
                EditButtons = <>
                FieldName = 'STATION_GRIDSQUARE'
                Footers = <>
                Width = 2299
              end
              item
                EditButtons = <>
                FieldName = 'STATION_LAT'
                Footers = <>
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'STATION_LON'
                Footers = <>
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'STATION_NAME'
                Footers = <>
                Width = 2299
              end
              item
                EditButtons = <>
                FieldName = 'STATION_CITY'
                Footers = <>
                Width = 2299
              end
              item
                EditButtons = <>
                FieldName = 'STATION_ITU_ZONE'
                Footers = <>
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'STATION_CQ_ZONE'
                Footers = <>
                Width = 94
              end
              item
                EditButtons = <>
                FieldName = 'STATION_POSTAL_CODE'
                Footers = <>
                Width = 184
              end
              item
                EditButtons = <>
                FieldName = 'STATION_RIG'
                Footers = <>
                Width = 2299
              end
              item
                EditButtons = <>
                FieldName = 'STATION_BOOK_NAME'
                Footers = <>
                Width = 2290
              end
              item
                EditButtons = <>
                FieldName = 'STATION_BOOK_DESCRIPTION'
                Footers = <>
                Width = 2290
              end>
            object RowDetailData: TRowDetailPanelControlEh
              object lbSSTFilterListItem_All: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbSSTFilterListItem_ClearFilter: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbSSTFilterListItem_ApplyFilter: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbSSTFilterListItem_CustomFilter: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbFilterCaption: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbShowRecordsWhere: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbAnd: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
              object lbOr: TLabel
                Left = -139
                Top = -16
                Width = 139
                Height = 16
                Caption = 'msgConfirmPluginDelete'
                Visible = False
              end
            end
          end
        end
      end
      object pgPluginsPage: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'pgPluginsPage'
      end
      object pgHotKeys: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'pgHotKeys'
        OnShow = pgHotKeysShow
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 466
          Height = 33
          ButtonHeight = 32
          ButtonWidth = 32
          Caption = 'ToolBar1'
          Images = ilOptions
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton5: TToolButton
            Left = 0
            Top = 0
            Action = aShortCutEdit
          end
        end
        object dbgHotKey: TDBGridEh
          Left = 0
          Top = 33
          Width = 466
          Height = 487
          Align = alClient
          AllowedOperations = []
          ColumnDefValues.EndEllipsis = True
          ColumnDefValues.Title.Alignment = taCenter
          ColumnDefValues.Title.EndEllipsis = True
          ColumnDefValues.Title.TitleButton = True
          DataGrouping.GroupLevels = <>
          DataSource = dsHotKeys
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
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
          ReadOnly = True
          RowDetailPanel.Color = clBtnFace
          STFilter.InstantApply = True
          STFilter.Local = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgHotKeyDblClick
          OnGetCellParams = dbgHotKeyGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ACTION_SHORTCUT'
              Footers = <>
              Width = 2290
            end
            item
              EditButtons = <>
              FieldName = 'ACTION_CAPTION'
              Footers = <>
              Width = 2290
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pgManagePlugins: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'pgManagePlugins'
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 466
          Height = 33
          ButtonHeight = 32
          ButtonWidth = 32
          Caption = 'ToolBar1'
          Images = ilOptions
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ToolButton4: TToolButton
            Left = 0
            Top = 0
            Action = aPluginAdd
          end
          object ToolButton6: TToolButton
            Left = 32
            Top = 0
            Action = aPluginEdit
          end
          object ToolButton7: TToolButton
            Left = 64
            Top = 0
            Action = aPluginDelete
          end
          object ToolButton10: TToolButton
            Left = 96
            Top = 0
            Width = 8
            Caption = 'ToolButton10'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object ToolButton11: TToolButton
            Left = 104
            Top = 0
            Action = aPluginUp
          end
          object ToolButton12: TToolButton
            Left = 136
            Top = 0
            Action = aPluginDown
          end
        end
        object dbgManagePlugins: TDBGridEh
          Left = 0
          Top = 33
          Width = 466
          Height = 487
          Align = alClient
          AllowedOperations = []
          ColumnDefValues.EndEllipsis = True
          ColumnDefValues.Title.Alignment = taCenter
          ColumnDefValues.Title.EndEllipsis = True
          ColumnDefValues.Title.TitleButton = True
          DataGrouping.GroupLevels = <>
          DataSource = dsPlugins
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
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
          ReadOnly = True
          RowDetailPanel.Color = clBtnFace
          STFilter.InstantApply = True
          STFilter.Local = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgManagePluginsDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'PLUGIN_CAPTION'
              Footers = <>
              Width = 268
            end
            item
              EditButtons = <>
              FieldName = 'PLUGIN_SCRIPT'
              Footers = <>
              Width = 147
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pgBandMode: TJvStandardPage
        Left = 0
        Top = 17
        Width = 466
        Height = 520
        Caption = 'pgBandMode'
        object pcBandMode: TPageControl
          Left = 0
          Top = 0
          Width = 466
          Height = 520
          ActivePage = tsBand
          Align = alClient
          TabOrder = 0
          object tsBand: TTabSheet
            Caption = 'tsBand'
            object dbgBands: TDBGridEh
              Left = 0
              Top = 0
              Width = 458
              Height = 489
              Align = alClient
              AllowedOperations = []
              ColumnDefValues.EndEllipsis = True
              ColumnDefValues.Title.Alignment = taCenter
              ColumnDefValues.Title.EndEllipsis = True
              ColumnDefValues.Title.TitleButton = True
              DataGrouping.GroupLevels = <>
              DataSource = dsBands
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
              OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
              ReadOnly = True
              RowDetailPanel.Color = clBtnFace
              STFilter.InstantApply = True
              STFilter.Local = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgBandsCellClick
              Columns = <
                item
                  Checkboxes = True
                  EditButtons = <>
                  FieldName = 'BAND_ACTIVE'
                  Footers = <>
                  KeyList.Strings = (
                    '1'
                    '0')
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'BAND_MHZ'
                  Footers = <>
                  Width = 146
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
          object tsMode: TTabSheet
            Caption = 'tsMode'
            ImageIndex = 1
            object dbgModes: TDBGridEh
              Left = 0
              Top = 33
              Width = 458
              Height = 456
              Align = alClient
              AllowedOperations = []
              ColumnDefValues.EndEllipsis = True
              ColumnDefValues.Title.Alignment = taCenter
              ColumnDefValues.Title.EndEllipsis = True
              ColumnDefValues.Title.TitleButton = True
              DataGrouping.GroupLevels = <>
              DataSource = dsModes
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
              OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
              ReadOnly = True
              RowDetailPanel.Color = clBtnFace
              STFilter.InstantApply = True
              STFilter.Local = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgModesCellClick
              OnDblClick = dbgModesDblClick
              OnDrawColumnCell = dbgModesDrawColumnCell
              Columns = <
                item
                  Checkboxes = True
                  EditButtons = <>
                  FieldName = 'MODE_ACTIVE'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'MODE_NAME'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'MODE_TITLE'
                  Footers = <>
                  Width = 59
                end
                item
                  EditButtons = <>
                  FieldName = 'MODE_DEFAULT_REPORT'
                  Footers = <>
                  Width = 2299
                end
                item
                  EditButtons = <>
                  FieldName = 'MODE_BACKGROUND_COLOR'
                  Footers = <>
                  Width = 58
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ToolBar4: TToolBar
              Left = 0
              Top = 0
              Width = 458
              Height = 33
              ButtonHeight = 32
              ButtonWidth = 32
              Caption = 'ToolBar1'
              Images = ilOptions
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              object ToolButton8: TToolButton
                Left = 0
                Top = 0
                Action = aModeEdit
              end
            end
          end
          object tsBandGrid: TTabSheet
            Caption = 'tsBandGrid'
            ImageIndex = 2
            object ToolBar5: TToolBar
              Left = 0
              Top = 0
              Width = 458
              Height = 33
              ButtonHeight = 32
              ButtonWidth = 32
              Caption = 'ToolBar1'
              Images = ilOptions
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object ToolButton9: TToolButton
                Left = 0
                Top = 0
                Action = aBandGridAdd
              end
              object ToolButton13: TToolButton
                Left = 32
                Top = 0
                Action = aBandGridEdit
              end
              object ToolButton14: TToolButton
                Left = 64
                Top = 0
                Action = aBandGridDelete
              end
            end
            object dbgBandGrid: TDBGridEh
              Left = 0
              Top = 33
              Width = 458
              Height = 456
              Align = alClient
              AllowedOperations = []
              ColumnDefValues.EndEllipsis = True
              ColumnDefValues.Title.Alignment = taCenter
              ColumnDefValues.Title.EndEllipsis = True
              ColumnDefValues.Title.TitleButton = True
              DataGrouping.GroupLevels = <>
              DataSource = dsBandGrid
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
              OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
              ReadOnly = True
              RowDetailPanel.Color = clBtnFace
              STFilter.InstantApply = True
              STFilter.Local = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnCellClick = dbgBandsCellClick
              OnDblClick = dbgBandGridDblClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'BANDGRID_BAND_MHZ'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'BANDGRID_MODE_NAME'
                  Footers = <>
                  Width = 454
                end
                item
                  EditButtons = <>
                  FieldName = 'BANDGRID_FREQ_BEGIN'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'BANDGRID_FREQ_END'
                  Footers = <>
                  Width = 94
                end
                item
                  EditButtons = <>
                  FieldName = 'BANDGRID_CAT_MODE'
                  Footers = <>
                  Width = 2299
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
      object JvGroupHeader1: TJvGroupHeader
        Left = 0
        Top = 537
        Width = 466
        Height = 4
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelSpace = 4
        Layout = lCenter
        ExplicitTop = 518
        ExplicitWidth = 465
      end
      object JvGroupHeader2: TJvGroupHeader
        Left = 0
        Top = 0
        Width = 466
        Height = 17
        Align = alTop
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        BevelSpace = 4
        ExplicitWidth = 465
      end
    end
    object ptvOptions: TJvSettingsTreeView
      Left = 0
      Top = 0
      Width = 204
      Height = 541
      AutoExpand = False
      ShowButtons = True
      ShowLines = True
      PageDefault = 1
      PageList = plSettings
      Align = alLeft
      HideSelection = False
      Indent = 19
      TabOrder = 1
      OnChanging = ptvOptionsChanging
      Items.NodeData = {
        030200000034000000010000000100000000000000FFFFFFFF00000000000000
        0005000000010B45006E007600690072006F006E006D0065006E0074002C0000
        00020000000200000000000000FFFFFFFF000000000000000000000000010747
        0065006E006500720061006C0036000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000100000000000000010C50006500720073006F006E0061006C0044
        006100740061002C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000003
        00000000000000010748006F0074004B0065007900730038000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000000400000000000000010D4D0061006E0061
        006700650050006C007500670069006E0073002E000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000000005000000000000000108420061006E0064004D006F
        00640065002C000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000020000
        0000000000010750006C007500670069006E007300}
      Items.Links = {
        0700000000000000000000000100000003000000040000000500000002000000}
    end
  end
  object ftOptions: TJvFooter
    Left = 0
    Top = 541
    Width = 673
    Height = 34
    Align = alBottom
    object msgConfirmPluginDelete: TLabel
      Left = 15
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgRebootWarning: TLabel
      Left = 32
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgPrintQSLQueueEmpty: TLabel
      Left = 49
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgConfirmBandGridDelete: TLabel
      Left = 52
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgHotKeyAssigned: TLabel
      Left = 49
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object lbAllGridVisibleColumns: TLabel
      Left = 8
      Top = 8
      Width = 133
      Height = 16
      Caption = 'lbAllGridVisibleColumns'
      Visible = False
    end
    object lbAllGridSelectAll: TLabel
      Left = 16
      Top = 16
      Width = 133
      Height = 16
      Caption = 'lbAllGridVisibleColumns'
      Visible = False
    end
    object msgCheckPrintedRecords: TLabel
      Left = 16
      Top = 14
      Width = 144
      Height = 16
      Caption = 'msgCheckPrintedRecords'
      Visible = False
    end
    object msgFlashUpdateNotNeed: TLabel
      Left = 23
      Top = 18
      Width = 144
      Height = 16
      Caption = 'msgCheckPrintedRecords'
      Visible = False
    end
    object msgFlashUpdateCompleted: TLabel
      Left = 27
      Top = 6
      Width = 144
      Height = 16
      Caption = 'msgCheckPrintedRecords'
      Visible = False
    end
    object lbSTFilterListItem_Empties: TLabel
      Left = 207
      Top = 18
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object lbSSTFilterListItem_NotEmpties: TLabel
      Left = 197
      Top = -4
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgFlashUpdateFound: TLabel
      Left = 197
      Top = 6
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object msgConfirmStationGroupDelete: TLabel
      Left = 214
      Top = 18
      Width = 139
      Height = 16
      Caption = 'msgConfirmPluginDelete'
      Visible = False
    end
    object lbColorStatisticsWorked: TLabel
      Left = 352
      Top = -4
      Width = 135
      Height = 16
      Caption = 'lbColorStatisticsWorked'
      Visible = False
    end
    object lbColorStatisticsSended: TLabel
      Left = 352
      Top = 6
      Width = 134
      Height = 16
      Caption = 'lbColorStatisticsSended'
      Visible = False
    end
    object lbColorStatisticsConfirmed: TLabel
      Left = 360
      Top = 14
      Width = 150
      Height = 16
      Caption = 'lbColorStatisticsConfirmed'
      Visible = False
    end
    object lbColorStatisticsNotWorked: TLabel
      Left = 360
      Top = 4
      Width = 154
      Height = 16
      Caption = 'lbColorStatisticsNotWorked'
      Visible = False
    end
    object btnOk: TButton
      Left = 538
      Top = 3
      Width = 61
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'btnOk'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 603
      Top = 3
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
      OnClick = btnCancelClick
    end
  end
  object FormStorage: TJvFormStorage
    Active = False
    AppStorage = MainWindow.AppStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    AfterRestorePlacement = FormStorageAfterRestorePlacement
    StoredProps.Strings = (
      'cbLang.ItemIndex'
      'cbAutoCheckFlashUpdate.Checked'
      'cbAutoCheckFullUpdate.Checked'
      'cbAutoGetCallPrimaryData.Checked'
      'seTimeCallSecondaryData.Value'
      'deDQSLPictureDirectory.Text'
      'cbDQSLSentIdentifier.Checked'
      'seJPEGQuality.Value'
      'seJPEGDPI.Value'
      'cbAutoGetCalSecondaryDataOnEdit.Checked'
      'dtpEQSLLastDownload.Date'
      'dtpLOTWLastDownload.Date'
      'cbEQSLLoadPictures.Checked'
      'deEQSLPictureDirectory.Text'
      'cbPartnerProgramm.Checked'
      'deBackupDirectory.Text'
      'cbAutoBackupOnExit.Checked'
      'seFontSize.Value'
      'cbCheckNewOneForAllBook.Checked'
      'deCallInfoDirectory.Text'
      'cbUseDropBox.Checked'
      'cbLoadManagers.Checked')
    StoredValues = <
      item
        Name = 'LangId'
        Value = 0
      end
      item
        Name = 'Desktop'
      end>
    Left = 136
    Top = 416
  end
  object vcPwdCrypt: TJvVigenereCipher
    Key = 'sdh3wjehr43JHSdfaskd43532'
    Left = 128
    Top = 248
  end
  object ilOptions: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 64
    Top = 392
    Bitmap = {
      494C01010600F000F40610001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000001E0000
      003300000033000000330000001E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000266C2BFF236727FF1F6223FF1C5E20FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000001E005E37AC009E
      5DFF009D5CFF009E5DFF005E39AC0000001E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002B7331FF72BC78FF70BC76FF206324FF000000000000
      000000000000000000000000000000000000000000000000000B0000000A0000
      000A0000000A0000000A0000000A0000000A00000008005E31AA00A667FF00BA
      86FF76DFC4FF00BA86FF00A669FF005E39AC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000317B37FF77BF7CFF74BE7AFF246929FF000000000000
      0000000000000000000000000000000000000000002F0E212C5F0E1E295C0E1E
      295C0E1E295C0E1E295C0E1E295C0D1C285A0B162051009E51FF00C08AFF00BB
      82FFFFFFFFFF00BB82FF00C08CFF009E5DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000037843DFF7BC181FF78C07EFF29702EFF000000000000
      0000000000000000000000000000000000004090C4F14298D2FF3F94D0FF3D92
      CFFF3D92CEFF3E92CEFF3E92CEFF3F92D1FF4692DAFF009B4DFF74E5CAFFFFFF
      FFFFFFFFFFFFFFFFFFFF76E5CCFF009C5BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003D8C44FF80C486FF7CC284FF2F7834FF000000000000
      0000000000000000000000000000000000004399D2FF3E94D0FFABFBFFFF9BF3
      FFFF92F1FFFF93F1FFFF93F1FFFF95F1FFFF9EF4FFFF009649FF00CA93FF00C7
      8EFFFFFFFFFF00C88FFF00CC97FF009D5BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043944AFF84C78BFF81C588FF34813BFF000000000000
      0000000000000000000000000000000000004297D1FF55ACDDFF8EDAF5FFA2ED
      FFFF82E5FEFF84E5FEFF84E5FEFF86E6FFFF8DE9FFFF34BA9EFF00A964FF00D2
      99FF73ECD1FF00D29AFF00AE6BFF005B31920000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000489D51FF89CA90FF86C98DFF3A8941FF000000000000
      0000000000000000000000000000000000004196D1FF70C4EAFF6BBCE6FFBBF2
      FFFF74DEFDFF76DEFCFF77DEFCFF7BDFFDFF80E1FFFF89E4FFFF31B89EFF0095
      48FF009549FF00974AFF1E9E91FF000000120000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004EA557FF8DCC94FF8ACB92FF409148FF000000000000
      0000000000000000000000000000000000003F95D0FF90DDF8FF43A0D8FFDDFC
      FFFFDAFAFFFFDBF9FFFFDEFAFFFF73DCFCFF75DBFBFF77DBFEFF7BDDFFFF7EDF
      FFFF7EDFFFFFADECFFFF82C1EEFF163249700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000054AC5DFF92CF99FF8FCE97FF46994EFF000000000000
      0000000000000000000000000000000000003D93CFFFB2F6FFFF50ACDEFF348A
      CAFF348ACAFF348ACAFF358ACAFF5ABDE9FF6DD9FBFF69D6FAFF68D5FBFF68D5
      FBFF67D5FCFF84DEFEFFABE1F8FF2C6C97C80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000059B363FF95D29EFF93D09BFF5BAB63FF0F2211380000
      0000000000000000000000000000000000003C92CFFFB8F3FFFF76DFFEFF7AE0
      FEFF7BE1FEFF7BE1FFFF7CE2FFFF51ABDDFF55B9E8FFDAF8FFFFD6F6FFFFD6F6
      FFFFD5F6FFFFD5F7FFFFDBFCFFFF3D94D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000498E51BB5DB869F777C582FF99D4A2FF97D3A0FF7BC285FF4B9E53F73471
      3AB8000000000000000000000000000000003B92CFFFC0F3FFFF6FD9FBFF72DA
      FBFF73DAFBFF73DAFBFF73DBFBFF75DEFDFF4EA9DCFF358BCAFF348BCBFF328B
      CBFF328CCCFF3690CEFF3C94D0FF2D678FAE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000105030656A660DB7ACA86FF9DD6A6FF9BD4A4FF71BF7BFF46924ED90104
      0106000000000000000000000000000000003A92CFFFCAF6FFFF68D5F9FF6BD5
      F9FF69D4F9FF68D4F9FF68D5F9FF69D6FAFF6AD8FBFF6AD9FCFF6ADAFDFF68DA
      FDFFDAFDFFFF3B93D0FF09161F2F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052A05CD17CCA87FF79C884FF4A9553CF000000000000
      0000000000000000000000000000000000003A92CFFFD5F7FFFF5FD1F9FF60D0
      F8FFB4EBFDFFD9F6FFFFDAF8FFFFDAF8FFFFDAF9FFFFDBF9FFFFDAF9FFFFDAFA
      FFFFDFFEFFFF3C94D0FF0D202C35000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F9B59C94C9454C400000000000000000000
      0000000000000000000000000000000000003C94D0FFDCFCFFFFD8F7FFFFD8F7
      FFFFDBFAFFFF348ECDFF3891CEFF3992CFFF3992CFFF3992CFFF3992CFFF3992
      CFFF3C94D0FF3C8AC0EA00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E8EC4EF3C94D0FF3992CFFF3992
      CFFF3C94D0FF3987BBE40A1A232B0C1E29320D1E2A330D1E2A330D1E2A330D1F
      2A330F212D370000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096969696B5CDC5FF4481
      6BFF166146FF4A856FFFBBD1C9FF969696960000000000000000000000000000
      000000000203255E9CFF21528DD21B4474AE0F264363040A121B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E63D2FF1835
      C4FF1631C3FF4C61D1FF01061D26000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072727272B5CEC5FF1D694DFF1D69
      4DFF89B7A3FF1D694DFF1D694DFFBDD3CBFF0000000000000000000000000000
      00000000000025558FD2C0E1F6FFA6D4F0FF83B8DFFF3978B7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000206141B1736C0F51636C8FF1232
      C7FF1132C6FF1232C7FF1736C5FB03061B230000000000000000000000000000
      00000000000000000000000000001B4F1EC4194D1CC900000000000000000000
      0000000000000000000000000000000000000A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF0D583CFF0D583CFF0D583CFFDDE8E4FF44866DFF257155FF2571
      55FFFFFFFFFF257155FF257155FF4B8B73FF0A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF22637AFFD5E6F5FFD7E9FAFFCBE3F9FF9FD9F4FF458BC3FFE8EF
      F6FF0D583CFF0D583CFF0A4932D4000000000A4932D40D583CFF0D583CFF0D58
      3CFF0D583CFF0D583CFF0D583CFF0D583CFF1949A4FF1C41CFFF1A40CFFF7990
      E3FFF5F7FEFF607BDDFF183FCDFF102A9CC30000000000000000000000000000
      00000000000000000000235D29CF468E4BFF438B48FF1A511ED1000000000000
      000000000000000000000000000000000000135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFFAFDFCFFF7FCFAFFF4FBF9FFFDFDFDFF2E7B5EFF89B7A3FFFFFF
      FFFFFFFFFFFFFFFFFFFF89B7A3FF337E62FF135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFD4E1EDFF7EA7D2FFF9FCFEFFBCE3F9FF37BDE8FF509ACCFF488D
      C5FFE8EFF6FFE1F4EFFF135F42FF00000000135F42FFFFFFFFFFFFFFFFFFFDFE
      FEFFFBFEFDFFFAFDFCFFF7FCFAFFF4FBF9FF2B54D7FF224CD6FF819BE8FF1942
      D2FF7A97E6FFF0F3FCFF1E4AD5FF1A44CFFB0000000000000000000000000000
      0000010301062E6F33D94F9855FF77BF7CFF74BE7AFF448C49FF1D5620DB0101
      0106000000000000000000000000000000001A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FFEDF8F5FFE8F6F2FFFCFEFDFF4E9478FF368666FF3686
      66FFFFFFFFFF368666FF368666FF599B82FF1A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FF6290C2FFC8E4F5FF43D0F4FF00C3F2FF24B8E6FF5098
      CBFF4C91C6FFE8EFF6FF1A6749FF000000001A6749FFFCFDFDFFFCFEFEFFF9FD
      FCFFF6FBFAFFF1FAF7FFEDF8F5FFE8F6F2FF3663E0FF2B5ADDFFF7FAFEFF84A0
      EDFF1D4EDBFF7D9BEBFF2756DCFF204FD6F90000000000000000000000000000
      00002E6934B8398741F763AC6AFF7BC181FF78C07EFF49914EFF246829F7194B
      1DBB00000000000000000000000000000000237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8F6F2FFE3F4EFFFEDF8F5FFBBD7CCFF3E8E6EFF3E8E
      6EFF89B7A3FF3E8E6EFF3E8E6EFFC2DBD1FF237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8EFF6FF5F8FC4FFC2EAF8FF27CBF3FF00C3F2FF24B8
      E6FF5098CBFF5093C8FFE8EFF6FF00000000237051FFFAFCFBFFF9FDFCFFF6FB
      FAFFF1FAF7FFEDF8F5FFE8F6F2FFE3F4EFFF6793E9FF2E63E5FF779BEEFFF5F8
      FDFF85A3EEFF3065E5FF3165E5FF1B42A1B50000000000000000000000000000
      0000000000000E200F384C9953FF80C486FF7CC284FF2F7834FF000000000000
      0000000000000000000000000000000000002B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFECF8F5FFBEDACFFF63A7
      8DFF459675FF68AA90FFC4DED3FF969696962B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFE8EFF6FF6494C5FFC2EBF8FF27CBF3FF00C3
      F2FF24B8E6FF5098CBFF5596CAFF000000002B7959FFF8FCFAFFF6FBFAFFF1FA
      F7FFEDF8F5FFE8F6F2FFE3F4EFFFDDF2ECFFC7E3E9FF4378EBFF336CEAFF336B
      EAFF346CEBFF386FEBFF3971E4FF050C1B1F0000000000000000000000000000
      0000000000000000000043944AFF84C78BFF81C588FF34813BFF000000000000
      000000000000000000000000000000000000358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFDFF3EEFFF5FB
      FAFFFFFFFFFFF7FCFBFF86B5A1FF00000000358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFE8EFF6FF6A97C7FFC2EBF8FF27CB
      F3FF00C3F2FF26B8E6FF5199CCFF6B9DCBFF358461FFF7FBFAFFF1FAF7FFEDF8
      F5FFE8F6F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFC4E5E5FF70A2EAFF4B85
      EEFF4A83EDFF82A8F5FF35836CFF000000000000000000000000000000000000
      00000000000000000000489D51FF89CA90FF86C98DFF3A8941FF000000000000
      0000000000000000000000000000000000003D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6
      DBFFBBE5D9FFD3EEE7FF3D8D69FF000000003D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFE8EFF6FF6F9BCAFFC2EB
      F8FF27CBF3FF00C3F2FF3EBBE6FF5593C7FF3D8D69FFF4FAF8FFEDF8F5FFE8F6
      F2FFE3F4EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6
      DBFFBBE5D9FFD3EEE7FF3D8D69FF000000000000000000000000000000000000
      000000000000000000004EA557FF8DCC94FF8ACB92FF409148FF000000000000
      000000000000000000000000000000000000469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6DBFFBAE5
      D9FFB7E3D7FFD1EEE6FF469671FF00000000469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFE8EFF6FF749E
      CCFFC2EBF8FF41D0F3FF5D9FCEFF2B3F5772469671FFF1F9F7FFE9F6F2FFE3F4
      EFFFDDF2ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBEE6DBFFBAE5
      D9FFB7E3D7FFD1EEE6FF469671FF000000000000000000000000000000000000
      0000000000000000000054AC5DFF92CF99FF8FCE97FF46994EFF000000000000
      0000000000000000000000000000000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFB7E3
      D7FFB4E2D5FFD0EDE5FF4D9E78FF000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFE8EF
      F6FF78A1CEFF7BA4CEFF58989BFF000000004D9E78FFEEF9F5FFE4F4EFFFDDF2
      ECFFD8F0E9FFD2EEE6FFCDECE4FFC8EAE1FFC3E8DEFFBFE6DBFFBBE5D9FFB7E3
      D7FFB4E2D5FFD0EDE5FF4D9E78FF000000000000000000000000000000000000
      0000000000000000000059B363FF95D29EFF93D09BFF4CA155FF000000000000
      00000000000000000000000000000000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFD0EDE5FFD0EDE5FF53A57EFF0000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFC8E6E2FFC5E3E2FF53A57EFF0000000053A57EFFEEF8F5FFEBF7F4FFE8F6
      F2FFE4F5F0FFE1F4EFFFDEF2EDFFDBF1EBFFD8F0E9FFD6EFE8FFD3EEE7FFD1EE
      E6FFD0EDE5FFD0EDE5FF53A57EFF000000000000000000000000000000000000
      000000000000000000005DBA68FF99D4A2FF97D3A0FF51A95BFF000000000000
      00000000000000000000000000000000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF0000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF0000000053A37CFD58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA83FF58AA
      83FF58AA83FF58AA83FF53A47DFF000000000000000000000000000000000000
      0000000000000000000061BF6DFF9DD6A6FF9BD4A4FF57B161FF000000000000
      0000000000000000000000000000000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000004F9E79FB99C9B2FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACAB3FF9ACA
      B3FF9ACAB3FF9ACAB3FF50A17BFF000000000000000000000000000000000000
      0000000000000000000064C470FFA1D8AAFF9FD7A8FF5BB766FF000000000000
      00000000000000000000000000000000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB0000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB0000000052A17CF798C9B1FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9B2FF99C9
      B2FF99C9B2FF99C9B2FF54A37EFB000000000000000000000000000000000000
      0000000000000000000066C772FF65C571FF63C16EFF60BD6BFF000000000000
      000000000000000000000000000000000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B9200000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B9200000000315F498E55A47FF757A781FB57A7
      81FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A781FB57A7
      81FB57A781FB57A781FB32604B92000000000000000000000000000000000000
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
  object alOptions: TActionList
    Images = ilOptions
    Left = 80
    Top = 320
    object aBookAdd: TAction
      Caption = 'aAddBook'
      ImageIndex = 0
      OnExecute = aBookAddExecute
      OnUpdate = aBookAddUpdate
    end
    object aBookEdit: TAction
      Caption = 'aEditBook'
      ImageIndex = 1
      OnExecute = aBookEditExecute
      OnUpdate = aBookEditUpdate
    end
    object aBookDelete: TAction
      Caption = 'aDeleteBook'
      ImageIndex = 2
      OnExecute = aBookDeleteExecute
      OnUpdate = aBookDeleteUpdate
    end
    object aShortCutEdit: TAction
      Caption = 'aEditShortCut'
      ImageIndex = 1
      OnExecute = aShortCutEditExecute
      OnUpdate = aShortCutEditUpdate
    end
    object aPluginAdd: TAction
      Caption = 'aAddPlugin'
      ImageIndex = 0
      OnExecute = aPluginAddExecute
    end
    object aPluginEdit: TAction
      Caption = 'aEditPlugin'
      ImageIndex = 1
      OnExecute = aPluginEditExecute
    end
    object aPluginDelete: TAction
      Caption = 'aDeletePlugin'
      ImageIndex = 2
      OnExecute = aPluginDeleteExecute
    end
    object aPluginUp: TAction
      Caption = 'aUpPlugin'
      ImageIndex = 4
      OnExecute = aPluginUpExecute
    end
    object aPluginDown: TAction
      Caption = 'aDownPlugin'
      ImageIndex = 3
      OnExecute = aPluginDownExecute
    end
    object aModeEdit: TAction
      Caption = 'aModeEdit'
      ImageIndex = 1
      OnExecute = aModeEditExecute
    end
    object aBandGridAdd: TAction
      Caption = 'aBandGridAdd'
      ImageIndex = 0
      OnExecute = aBandGridAddExecute
    end
    object aBandGridEdit: TAction
      Caption = 'aBandGridEdit'
      ImageIndex = 1
      OnExecute = aBandGridEditExecute
    end
    object aBandGridDelete: TAction
      Caption = 'aBandGridDelete'
      ImageIndex = 2
      OnExecute = aBandGridDeleteExecute
    end
    object aBookGroupAdd: TAction
      Caption = 'aBookGroupAdd'
      ImageIndex = 5
      OnExecute = aBookGroupAddExecute
    end
  end
  object dsHotKeys: TDataSource
    DataSet = mdsHotKeys
    Left = 544
    Top = 368
  end
  object FormStorageOnExit: TJvFormStorage
    AppStorage = MainWindow.AppStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    AfterSavePlacement = FormStorageOnExitAfterSavePlacement
    AfterRestorePlacement = FormStorageOnExitAfterRestorePlacement
    StoredProps.Strings = (
      'memRecentReports.Lines')
    StoredValues = <
      item
        Name = 'Band'
        Value = 0.000000000000000000
      end
      item
        Name = 'Mode'
        Value = ''
      end
      item
        Name = 'StationId'
        Value = 0
      end
      item
        Name = 'ExchangeQSLServicesWindowShort'
        Value = False
      end>
    Left = 136
    Top = 360
  end
  object cdsPlugins: TJvMemoryData
    FieldDefs = <
      item
        Name = 'ACTIVE_PLUGIN'
        DataType = ftInteger
      end
      item
        Name = 'NAME_PLUGIN'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SORT_ORDER'
        DataType = ftInteger
      end>
    Left = 488
    Top = 392
    object cdsPluginsNAME_PLUGIN: TStringField
      DisplayWidth = 60
      FieldName = 'PLUGIN_NAME'
      Size = 254
    end
    object cdsPluginsSCRIPT_PLUGIN: TStringField
      DisplayWidth = 60
      FieldName = 'PLUGIN_SCRIPT'
      Size = 254
    end
    object cdsPluginsSORT_ORDER: TIntegerField
      FieldName = 'PLUGIN_SORT_ORDER'
    end
    object cdsPluginsPLUGIN_CAPTION: TStringField
      FieldName = 'PLUGIN_CAPTION'
      Size = 100
    end
  end
  object dsPlugins: TDataSource
    DataSet = cdsPlugins
    Left = 488
    Top = 448
  end
  object cdsColors: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ITEM_INDEX'
        DataType = ftInteger
      end
      item
        Name = 'COLOR_BACKGROUND'
        DataType = ftInteger
      end
      item
        Name = 'COLOR_FOREGROUND'
        DataType = ftInteger
      end
      item
        Name = 'FONT_BOLD'
        DataType = ftInteger
      end
      item
        Name = 'FONT_ITALIC'
        DataType = ftInteger
      end
      item
        Name = 'FONT_UNDERLINE'
        DataType = ftInteger
      end>
    Left = 336
    Top = 432
    object cdsColorsITEM_INDEX: TIntegerField
      FieldName = 'ITEM_INDEX'
    end
    object cdsColorsCOLOR_BACKGROUND: TIntegerField
      FieldName = 'COLOR_BACKGROUND'
    end
    object cdsColorsCOLOR_FOREGROUND: TIntegerField
      FieldName = 'COLOR_FOREGROUND'
    end
    object cdsColorsFONT_BOLD: TIntegerField
      FieldName = 'FONT_BOLD'
    end
    object cdsColorsFONT_ITALIC: TIntegerField
      FieldName = 'FONT_ITALIC'
    end
    object cdsColorsFONT_UNDERLINE: TIntegerField
      FieldName = 'FONT_UNDERLINE'
    end
  end
  object dsBands: TDataSource
    DataSet = qryBands
    Left = 288
    Top = 464
  end
  object dsModes: TDataSource
    DataSet = qryModes
    Left = 416
    Top = 440
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
      end
      item
        Name = 'MODE_DEFAULT_REPORT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'MODE_BACKGROUND_COLOR'
        DataType = ftString
        Size = 6
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
    Left = 360
    Top = 392
    object qryModesMODE_ID: TAutoIncField
      FieldName = 'MODE_ID'
      ReadOnly = True
    end
    object qryModesMODE_NAME: TStringField
      FieldName = 'MODE_NAME'
      Size = 100
    end
    object qryModesMODE_ACTIVE: TIntegerField
      FieldName = 'MODE_ACTIVE'
    end
    object qryModesMODE_TITLE: TStringField
      FieldName = 'MODE_TITLE'
      Size = 50
    end
    object qryModesMODE_DEFAULT_REPORT: TStringField
      FieldName = 'MODE_DEFAULT_REPORT'
      Size = 255
    end
    object qryModesMODE_BACKGROUND_COLOR: TStringField
      FieldName = 'MODE_BACKGROUND_COLOR'
      Size = 6
    end
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
    Left = 288
    Top = 384
    object qryBandsBAND_ID: TAutoIncField
      FieldName = 'BAND_ID'
      ReadOnly = True
    end
    object qryBandsBAND_MHZ: TFloatField
      FieldName = 'BAND_MHZ'
      Precision = 7
    end
    object qryBandsBAND_METER: TFloatField
      FieldName = 'BAND_METER'
      Precision = 7
    end
    object qryBandsBAND_ADIF: TStringField
      FieldName = 'BAND_ADIF'
      Size = 10
    end
    object qryBandsBAND_LOWER_FREQ: TFloatField
      FieldName = 'BAND_LOWER_FREQ'
      Precision = 7
    end
    object qryBandsBAND_UPPER_FREQ: TFloatField
      FieldName = 'BAND_UPPER_FREQ'
      Precision = 7
    end
    object qryBandsBAND_ACTIVE: TIntegerField
      FieldName = 'BAND_ACTIVE'
    end
  end
  object qryBandGrid: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = dmMain.DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'BANDGRID'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
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
      end
      item
        Name = 'BANDGRID_CAT_MODE'
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
    Left = 376
    Top = 472
    object qryBandGridBANDGRID_ID: TAutoIncField
      FieldName = 'BANDGRID_ID'
    end
    object qryBandGridBANDGRID_BAND_MHZ: TFloatField
      FieldName = 'BANDGRID_BAND_MHZ'
    end
    object qryBandGridBANDGRID_MODE_NAME: TStringField
      FieldName = 'BANDGRID_MODE_NAME'
      Size = 50
    end
    object qryBandGridBANDGRID_FREQ_BEGIN: TFloatField
      FieldName = 'BANDGRID_FREQ_BEGIN'
    end
    object qryBandGridBANDGRID_FREQ_END: TFloatField
      FieldName = 'BANDGRID_FREQ_END'
    end
    object qryBandGridBANDGRID_CAT_MODE: TStringField
      FieldName = 'BANDGRID_CAT_MODE'
      Size = 255
    end
  end
  object dsBandGrid: TDataSource
    DataSet = qryBandGrid
    Left = 456
    Top = 512
  end
  object mdsHotKeys: TMemTableEh
    Active = True
    Params = <>
    TreeList.Active = True
    TreeList.KeyFieldName = 'ACTION_WINDOW'
    TreeList.RefParentFieldName = 'ACTION_WINDOW_PARENT'
    TreeList.DefaultNodeExpanded = True
    Left = 408
    Top = 368
    object mdsHotKeysACTION_NAME: TStringField
      DisplayWidth = 254
      FieldName = 'ACTION_NAME'
      Visible = False
      Size = 254
    end
    object mdsHotKeysACTION_SHORTCUT: TStringField
      DisplayWidth = 254
      FieldName = 'ACTION_SHORTCUT'
      Size = 254
    end
    object mdsHotKeysACTION_CAPTION: TStringField
      DisplayWidth = 254
      FieldName = 'ACTION_CAPTION'
      Size = 254
    end
    object mdsHotKeysACTION_FOUND: TIntegerField
      DisplayWidth = 10
      FieldName = 'ACTION_FOUND'
      Visible = False
    end
    object mdsHotKeysACTION_WINDOW: TStringField
      FieldName = 'ACTION_WINDOW'
      Visible = False
      Size = 254
    end
    object mdsHotKeysACTION_WINDOW_PARENT: TStringField
      FieldName = 'ACTION_WINDOW_PARENT'
      Visible = False
      Size = 254
    end
    object mdsHotKeysACTION_POINTER: TIntegerField
      FieldName = 'ACTION_POINTER'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ACTION_NAME: TMTStringDataFieldEh
          FieldName = 'ACTION_NAME'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 254
          Transliterate = False
        end
        object ACTION_SHORTCUT: TMTStringDataFieldEh
          FieldName = 'ACTION_SHORTCUT'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 254
          Transliterate = False
        end
        object ACTION_CAPTION: TMTStringDataFieldEh
          FieldName = 'ACTION_CAPTION'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 254
          Transliterate = False
        end
        object ACTION_FOUND: TMTNumericDataFieldEh
          FieldName = 'ACTION_FOUND'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object ACTION_WINDOW: TMTStringDataFieldEh
          FieldName = 'ACTION_WINDOW'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 254
          Transliterate = False
        end
        object ACTION_WINDOW_PARENT: TMTStringDataFieldEh
          FieldName = 'ACTION_WINDOW_PARENT'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 254
          Transliterate = False
        end
        object ACTION_POINTER: TMTNumericDataFieldEh
          FieldName = 'ACTION_POINTER'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object mdsStations: TMemTableEh
    Active = True
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
    Params = <>
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'STATION_ID'
    TreeList.RefParentFieldName = 'STATION_PARENT_ID'
    TreeList.DefaultNodeExpanded = True
    Left = 600
    Top = 384
    object mdsStationsSTATION_ID: TAutoIncField
      FieldName = 'STATION_ID'
    end
    object mdsStationsSTATION_CALL: TStringField
      FieldName = 'STATION_CALL'
      Size = 100
    end
    object mdsStationsSTATION_STREET: TStringField
      FieldName = 'STATION_STREET'
      Size = 255
    end
    object mdsStationsSTATION_GRIDSQUARE: TStringField
      FieldName = 'STATION_GRIDSQUARE'
      Size = 255
    end
    object mdsStationsSTATION_LAT: TFloatField
      FieldName = 'STATION_LAT'
    end
    object mdsStationsSTATION_LON: TFloatField
      FieldName = 'STATION_LON'
    end
    object mdsStationsSTATION_NAME: TStringField
      FieldName = 'STATION_NAME'
      Size = 255
    end
    object mdsStationsSTATION_CITY: TStringField
      FieldName = 'STATION_CITY'
      Size = 255
    end
    object mdsStationsSTATION_COUNTRY: TIntegerField
      FieldName = 'STATION_COUNTRY'
    end
    object mdsStationsSTATION_ITU_ZONE: TIntegerField
      FieldName = 'STATION_ITU_ZONE'
    end
    object mdsStationsSTATION_CQ_ZONE: TIntegerField
      FieldName = 'STATION_CQ_ZONE'
    end
    object mdsStationsSTATION_POSTAL_CODE: TStringField
      FieldName = 'STATION_POSTAL_CODE'
    end
    object mdsStationsSTATION_RIG: TStringField
      FieldName = 'STATION_RIG'
      Size = 255
    end
    object mdsStationsSTATION_EQSL_LOGIN: TStringField
      FieldName = 'STATION_EQSL_LOGIN'
      Size = 100
    end
    object mdsStationsSTATION_EQSL_PASSWORD: TStringField
      FieldName = 'STATION_EQSL_PASSWORD'
      Size = 100
    end
    object mdsStationsSTATION_BOOK_NAME: TStringField
      FieldName = 'STATION_BOOK_NAME'
      Size = 254
    end
    object mdsStationsSTATION_BOOK_DESCRIPTION: TStringField
      FieldName = 'STATION_BOOK_DESCRIPTION'
      Size = 254
    end
    object mdsStationsSTATION_EQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_EQSL_ACTIVE'
    end
    object mdsStationsSTATION_DQSL_ACTIVE: TIntegerField
      FieldName = 'STATION_DQSL_ACTIVE'
    end
    object mdsStationsSTATION_DQSL_SMTP_HOST: TStringField
      FieldName = 'STATION_DQSL_SMTP_HOST'
      Size = 50
    end
    object mdsStationsSTATION_DQSL_SMTP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_SMTP_PORT'
    end
    object mdsStationsSTATION_DQSL_MAIL_USERNAME: TStringField
      FieldName = 'STATION_DQSL_MAIL_USERNAME'
      Size = 50
    end
    object mdsStationsSTATION_DQSL_MAIL_PASSWORD: TStringField
      FieldName = 'STATION_DQSL_MAIL_PASSWORD'
      Size = 50
    end
    object mdsStationsSTATION_DQSL_DEFAULT_TEMPLATE: TStringField
      FieldName = 'STATION_DQSL_DEFAULT_TEMPLATE'
      Size = 254
    end
    object mdsStationsSTATION_DQSL_POP_HOST: TStringField
      FieldName = 'STATION_DQSL_POP_HOST'
      Size = 50
    end
    object mdsStationsSTATION_DQSL_POP_PORT: TIntegerField
      FieldName = 'STATION_DQSL_POP_PORT'
    end
    object mdsStationsSTATION_CNTY: TStringField
      FieldName = 'STATION_CNTY'
      Size = 100
    end
    object mdsStationsSTATION_IOTA: TStringField
      FieldName = 'STATION_IOTA'
      Size = 100
    end
    object mdsStationsSTATION_IOTA_ISLAND_ID: TStringField
      FieldName = 'STATION_IOTA_ISLAND_ID'
      Size = 100
    end
    object mdsStationsSTATION_SIG: TStringField
      FieldName = 'STATION_SIG'
      Size = 255
    end
    object mdsStationsSTATION_SIG_INFO: TStringField
      FieldName = 'STATION_SIG_INFO'
      Size = 255
    end
    object mdsStationsSTATION_STATE: TStringField
      FieldName = 'STATION_STATE'
      Size = 100
    end
    object mdsStationsSTATION_LOTW_ACTIVE: TIntegerField
      FieldName = 'STATION_LOTW_ACTIVE'
    end
    object mdsStationsSTATION_LOTW_LOGIN: TStringField
      FieldName = 'STATION_LOTW_LOGIN'
      Size = 100
    end
    object mdsStationsSTATION_LOTW_PASSWORD: TStringField
      FieldName = 'STATION_LOTW_PASSWORD'
      Size = 100
    end
    object mdsStationsSTATION_LOTW_HOME: TStringField
      FieldName = 'STATION_LOTW_HOME'
      Size = 100
    end
    object mdsStationsSTATION_HRDLOG_LOGIN: TStringField
      FieldName = 'STATION_HRDLOG_LOGIN'
      Size = 100
    end
    object mdsStationsSTATION_HRDLOG_PASSWORD: TStringField
      FieldName = 'STATION_HRDLOG_PASSWORD'
      Size = 100
    end
    object mdsStationsSTATION_HRDLOG_ACTIVE: TIntegerField
      FieldName = 'STATION_HRDLOG_ACTIVE'
    end
    object mdsStationsSTATION_EQSL_SENT_EVERY: TIntegerField
      FieldName = 'STATION_EQSL_SENT_EVERY'
    end
    object mdsStationsSTATION_HRDLOG_SENT_EVERY: TIntegerField
      FieldName = 'STATION_HRDLOG_SENT_EVERY'
    end
    object mdsStationsSTATION_PARENT_ID: TIntegerField
      FieldName = 'STATION_PARENT_ID'
    end
    object mdsStationsIS_GROUP: TIntegerField
      FieldName = 'IS_GROUP'
    end
    object mdsStationsSTATION_HAMQTH_LOGIN: TStringField
      FieldName = 'STATION_HAMQTH_LOGIN'
      Size = 100
    end
    object mdsStationsSTATION_HAMQTH_PASSWORD: TStringField
      FieldName = 'STATION_HAMQTH_PASSWORD'
      Size = 100
    end
    object mdsStationsSTATION_QRZCOM_LOGIN: TStringField
      FieldName = 'STATION_QRZCOM_LOGIN'
      Size = 100
    end
    object mdsStationsSTATION_QRZCOM_PASSWORD: TStringField
      FieldName = 'STATION_QRZCOM_PASSWORD'
      Size = 100
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object STATION_ID: TMTNumericDataFieldEh
          FieldName = 'STATION_ID'
          NumericDataType = fdtAutoIncEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_ID'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_CALL: TMTStringDataFieldEh
          FieldName = 'STATION_CALL'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_CALL'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_STREET: TMTStringDataFieldEh
          FieldName = 'STATION_STREET'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_STREET'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_GRIDSQUARE: TMTStringDataFieldEh
          FieldName = 'STATION_GRIDSQUARE'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_GRIDSQUARE'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_LAT: TMTNumericDataFieldEh
          FieldName = 'STATION_LAT'
          NumericDataType = fdtFloatEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_LAT'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 7
        end
        object STATION_LON: TMTNumericDataFieldEh
          FieldName = 'STATION_LON'
          NumericDataType = fdtFloatEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_LON'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 7
        end
        object STATION_NAME: TMTStringDataFieldEh
          FieldName = 'STATION_NAME'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_NAME'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_CITY: TMTStringDataFieldEh
          FieldName = 'STATION_CITY'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_CITY'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_COUNTRY: TMTNumericDataFieldEh
          FieldName = 'STATION_COUNTRY'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_COUNTRY'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_ITU_ZONE: TMTNumericDataFieldEh
          FieldName = 'STATION_ITU_ZONE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_ITU_ZONE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_CQ_ZONE: TMTNumericDataFieldEh
          FieldName = 'STATION_CQ_ZONE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_CQ_ZONE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_POSTAL_CODE: TMTStringDataFieldEh
          FieldName = 'STATION_POSTAL_CODE'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_POSTAL_CODE'
          DisplayWidth = 20
          Required = False
          Visible = True
          Size = 20
          Transliterate = False
        end
        object STATION_RIG: TMTStringDataFieldEh
          FieldName = 'STATION_RIG'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_RIG'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_EQSL_LOGIN: TMTStringDataFieldEh
          FieldName = 'STATION_EQSL_LOGIN'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_EQSL_LOGIN'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_EQSL_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_EQSL_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_EQSL_PASSWORD'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_BOOK_NAME: TMTStringDataFieldEh
          FieldName = 'STATION_BOOK_NAME'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_BOOK_NAME'
          DisplayWidth = 254
          Required = False
          Visible = True
          Size = 254
          Transliterate = False
        end
        object STATION_BOOK_DESCRIPTION: TMTStringDataFieldEh
          FieldName = 'STATION_BOOK_DESCRIPTION'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_BOOK_DESCRIPTION'
          DisplayWidth = 254
          Required = False
          Visible = True
          Size = 254
          Transliterate = False
        end
        object STATION_EQSL_ACTIVE: TMTNumericDataFieldEh
          FieldName = 'STATION_EQSL_ACTIVE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_EQSL_ACTIVE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_DQSL_ACTIVE: TMTNumericDataFieldEh
          FieldName = 'STATION_DQSL_ACTIVE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_DQSL_ACTIVE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_DQSL_SMTP_HOST: TMTStringDataFieldEh
          FieldName = 'STATION_DQSL_SMTP_HOST'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_DQSL_SMTP_HOST'
          DisplayWidth = 50
          Required = False
          Visible = True
          Size = 50
          Transliterate = False
        end
        object STATION_DQSL_SMTP_PORT: TMTNumericDataFieldEh
          FieldName = 'STATION_DQSL_SMTP_PORT'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_DQSL_SMTP_PORT'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_DQSL_MAIL_USERNAME: TMTStringDataFieldEh
          FieldName = 'STATION_DQSL_MAIL_USERNAME'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_DQSL_MAIL_USERNAME'
          DisplayWidth = 50
          Required = False
          Visible = True
          Size = 50
          Transliterate = False
        end
        object STATION_DQSL_MAIL_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_DQSL_MAIL_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_DQSL_MAIL_PASSWORD'
          DisplayWidth = 50
          Required = False
          Visible = True
          Size = 50
          Transliterate = False
        end
        object STATION_DQSL_DEFAULT_TEMPLATE: TMTStringDataFieldEh
          FieldName = 'STATION_DQSL_DEFAULT_TEMPLATE'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_DQSL_DEFAULT_TEMPLATE'
          DisplayWidth = 254
          Required = False
          Visible = True
          Size = 254
          Transliterate = False
        end
        object STATION_DQSL_POP_HOST: TMTStringDataFieldEh
          FieldName = 'STATION_DQSL_POP_HOST'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_DQSL_POP_HOST'
          DisplayWidth = 50
          Required = False
          Visible = True
          Size = 50
          Transliterate = False
        end
        object STATION_DQSL_POP_PORT: TMTNumericDataFieldEh
          FieldName = 'STATION_DQSL_POP_PORT'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_DQSL_POP_PORT'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_CNTY: TMTStringDataFieldEh
          FieldName = 'STATION_CNTY'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_CNTY'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_IOTA: TMTStringDataFieldEh
          FieldName = 'STATION_IOTA'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_IOTA'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_IOTA_ISLAND_ID: TMTStringDataFieldEh
          FieldName = 'STATION_IOTA_ISLAND_ID'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_IOTA_ISLAND_ID'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_SIG: TMTStringDataFieldEh
          FieldName = 'STATION_SIG'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_SIG'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_SIG_INFO: TMTStringDataFieldEh
          FieldName = 'STATION_SIG_INFO'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_SIG_INFO'
          DisplayWidth = 255
          Required = False
          Visible = True
          Size = 255
          Transliterate = False
        end
        object STATION_STATE: TMTStringDataFieldEh
          FieldName = 'STATION_STATE'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_STATE'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_LOTW_ACTIVE: TMTNumericDataFieldEh
          FieldName = 'STATION_LOTW_ACTIVE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_LOTW_ACTIVE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_LOTW_LOGIN: TMTStringDataFieldEh
          FieldName = 'STATION_LOTW_LOGIN'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_LOTW_LOGIN'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_LOTW_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_LOTW_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_LOTW_PASSWORD'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_LOTW_HOME: TMTStringDataFieldEh
          FieldName = 'STATION_LOTW_HOME'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_LOTW_HOME'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_HRDLOG_LOGIN: TMTStringDataFieldEh
          FieldName = 'STATION_HRDLOG_LOGIN'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_HRDLOG_LOGIN'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_HRDLOG_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_HRDLOG_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_HRDLOG_PASSWORD'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_HRDLOG_ACTIVE: TMTNumericDataFieldEh
          FieldName = 'STATION_HRDLOG_ACTIVE'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_HRDLOG_ACTIVE'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_EQSL_SENT_EVERY: TMTNumericDataFieldEh
          FieldName = 'STATION_EQSL_SENT_EVERY'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_EQSL_SENT_EVERY'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_HRDLOG_SENT_EVERY: TMTNumericDataFieldEh
          FieldName = 'STATION_HRDLOG_SENT_EVERY'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_HRDLOG_SENT_EVERY'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_PARENT_ID: TMTNumericDataFieldEh
          FieldName = 'STATION_PARENT_ID'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'STATION_PARENT_ID'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object IS_GROUP: TMTNumericDataFieldEh
          FieldName = 'IS_GROUP'
          NumericDataType = fdtIntegerEh
          Alignment = taRightJustify
          DisplayLabel = 'IS_GROUP'
          DisplayWidth = 10
          Required = False
          Visible = True
          currency = False
          Precision = 0
        end
        object STATION_HAMQTH_LOGIN: TMTStringDataFieldEh
          FieldName = 'STATION_HAMQTH_LOGIN'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_HAMQTH_LOGIN'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_HAMQTH_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_HAMQTH_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_HAMQTH_PASSWORD'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_QRZCOM_LOGIN: TMTStringDataFieldEh
          FieldName = 'STATION_QRZCOM_LOGIN'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_QRZCOM_LOGIN'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
        object STATION_QRZCOM_PASSWORD: TMTStringDataFieldEh
          FieldName = 'STATION_QRZCOM_PASSWORD'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayLabel = 'STATION_QRZCOM_PASSWORD'
          DisplayWidth = 100
          Required = False
          Visible = True
          Size = 100
          Transliterate = False
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            19
            'UT4UKW'
            nil
            nil
            nil
            nil
            nil
            nil
            -1
            nil
            nil
            nil
            nil
            '3'
            nil
            '1'
            '2'
            0
            0
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            0
            nil
            nil
            nil
            nil
            nil
            0
            0
            0
            1
            0
            'UT4UKW'
            #1060#1053#1066#8482#1078#1068#1048#1053
            nil
            nil)
          (
            20
            '444'
            nil
            nil
            nil
            nil
            nil
            nil
            -1
            nil
            nil
            nil
            nil
            '444'
            nil
            '444'
            '444'
            0
            0
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            0
            nil
            nil
            nil
            nil
            nil
            0
            0
            0
            1
            0
            nil
            nil
            nil
            nil)
          (
            22
            '5555'
            nil
            nil
            nil
            nil
            nil
            nil
            -1
            nil
            nil
            nil
            nil
            '5555'
            nil
            '555'
            '55'
            0
            0
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            0
            nil
            nil
            nil
            nil
            nil
            0
            0
            0
            1
            0
            nil
            nil
            nil
            nil)
          (
            24
            '777'
            nil
            nil
            nil
            nil
            nil
            nil
            -1
            nil
            nil
            nil
            nil
            '777'
            nil
            '777'
            nil
            0
            0
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            nil
            0
            nil
            nil
            nil
            nil
            nil
            0
            0
            0
            23
            0
            nil
            nil
            nil
            nil))
      end
    end
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
      'SELECT * FROM STATIONS WHERE IS_GROUP=0')
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
    Left = 344
    Top = 216
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
  object dsStations: TDataSource
    DataSet = mdsStations
    Left = 464
    Top = 216
  end
  object cdsColorsStatistics: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ITEM_INDEX'
        DataType = ftInteger
      end
      item
        Name = 'COLOR_BACKGROUND'
        DataType = ftInteger
      end
      item
        Name = 'COLOR_FOREGROUND'
        DataType = ftInteger
      end>
    Left = 568
    Top = 480
    object cdsColorsStatisticsITEM_INDEX: TIntegerField
      FieldName = 'ITEM_INDEX'
    end
    object cdsColorsStatisticsCOLORBACKGROUND: TIntegerField
      FieldName = 'COLOR_BACKGROUND'
    end
    object cdsColorsStatisticsCOLOR_FOREGROUND: TIntegerField
      FieldName = 'COLOR_FOREGROUND'
    end
  end
end
