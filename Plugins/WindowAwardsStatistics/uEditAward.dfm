object EditAward: TEditAward
  Left = 0
  Top = 0
  ActiveControl = AWARDSSTATISTICS_leAwardName
  Caption = 'EditAward'
  ClientHeight = 542
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 585
    Height = 508
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = AWARDSSTATISTICS_tsAward
    Align = alClient
    TabOrder = 0
    object AWARDSSTATISTICS_tsAward: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'AWARDSSTATISTICS_tsAward'
      object AWARDSSTATISTICS_gbAward: TGroupBox
        Left = 0
        Top = 0
        Width = 577
        Height = 121
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        Caption = 'AWARDSSTATISTICS_gbAward'
        TabOrder = 0
        object sbUrl: TJvSpeedButton
          Left = 377
          Top = 85
          Width = 25
          Height = 25
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF002525250339663B72474E47F6616461FE686A68FF696A69FF3E6B
            40EF3B6E3DCE696A69F76A6A6AF7636363F4494949DF3E3E3E30FFFFFF00FFFF
            FF004093460D38783CC249554AFE8D908DFFAAABA8FFADADADFF969696FF7070
            70FF777777FF969696FFADADADFFA8A9A8EF8C8C8CEF4C4C4CD7FFFFFF0048A0
            510D459A4CD1537D60FF6A6E6CFFD3D3CEFF716C5EFF434241FF454545FF5050
            50FF505050FF454545FF414241FF485B49F5C3C3C3FF666666EFFFFFFF004DA7
            56B175BF8CFF607D6CFF818381FFD3D3CEFFC0A468FF454340FFBCBCBCFFCECE
            CEFFC1C1C1FFACACACFF414442FF65A478FFC3C3C3FF818181F755B3604652AE
            5CFBB4EAD3FF57905FFF727672FFD3D3CEFF776C58FF4C4B4AFF646464FF9191
            91FF787878FF646464FF4A4B4AFF6D7D75FFC3C3C3FF717271F559B965B291D7
            AEFF9FDEB3FF81C26EFF758863FF909090FFE8E8E8FFDDDDDDFFC0C0C0FF8983
            79FF897E6EFFD8D7D5FFDDDDDDFFC3C3C3FF909090FF405D41E25DBE69E4AFE9
            CFFF82D48FFFBEDC89FFBCC47EFF9E875EFF8A8781FF9D9D9DFF847F75FFAC7F
            4BFFAF8146FF837F75FF9D9D9DFF828683FF87A596FF2F7632E95FC26CF6BDEF
            DDFF72D17CFF8FD16BFFBBE09DFFC7A65DFFD3AF5DFFC59852FFC5BB6DFFAED1
            79FFB3C36CFFAEA85EFF7AA856FF59A266FFB0E3CEFF307D34F760C36DF5BDF0
            DCFF80D882FF76DB6CFFBEE599FFCCDFA6FFCAA75CFFC1BC6BFFB7DA8AFFA5D8
            5FFF76D13EFF69D045FF58BB4FFF62AA6BFFB1E4CEFF348138F660C36DE2B2EC
            D2FF9AE2A1FF9CEA8CFFD4EDB6FFD0EAC7FFCFB86DFFCCB065FFCBC974FF75DB
            66FF65D94CFF64D74CFF6BD35CFF72BA7DFFA4DBC1FF38873DE660C36DAD97DE
            B4FFB4EBCCFFB0EFA6FFC9EEA8FFD1EAC9FFD5CF8CFFD9CB8AFFCDB365FFBBBB
            66FF99D670FF81DE72FF79DC70FF90D0A2FF87C8A3FF3C8E42B960C36D3C60C3
            6DFABFF3E2FFB4EFB3FFB4F0ABFFC0EDB6FFD4E3B6FFD9D89BFFDAD394FFCDB4
            6CFFC7B26CFFB4CB83FF93DF99FFAEE7CDFF459A4CFC4195484FFFFFFF0060C3
            6DA586D79FFFBFF2DEFFC7F2D6FFD5EFD5FFD0E9CFFFD5DBA5FFDCDEAAFFDBCD
            8FFFD7C88AFFC9C08DFFBCD5AEFF79C790FF49A252B6FFFFFF00FFFFFF0060C3
            6D0560C36DC48BD8A1FFCDF5E8FFD4EDDAFFCEEDD3FFCFDFAEFFD6DEB4FFD4D4
            A1FFCED0A0FFC3D0A9FF86C990FF52AE5CD14EA9580FFFFFFF00FFFFFF00FFFF
            FF0060C36D0460C36DA460C36DF8A4E1BAFFB9EACCFFC4E0BDFFC4DAB3FFBCD7
            AFFFA5D7ABFF5CBD68FB59B965B656B5610CFFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0060C36D3D60C36DAA60C36DDF60C36DF460C36DF860C3
            6DE960C36DB25FC16C48FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -13
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          OnClick = sbUrlClick
        end
        object AWARDSSTATISTICS_leAwardName: TLabeledDBEdit
          Left = 7
          Top = 39
          Width = 395
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'AWARD_NAME'
          DataSource = dsAwards
          TabOrder = 0
          OnChange = AWARDSSTATISTICS_leAwardNameChange
          EditLabel.Width = 211
          EditLabel.Height = 16
          EditLabel.Margins.Left = 2
          EditLabel.Margins.Top = 2
          EditLabel.Margins.Right = 2
          EditLabel.Margins.Bottom = 2
          EditLabel.Caption = 'AWARDSSTATISTICS_leAwardName'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object AWARDSSTATISTICS_leAwardUrl: TLabeledDBEdit
          Left = 7
          Top = 86
          Width = 371
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'AWARD_URL'
          DataSource = dsAwards
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          EditLabel.Width = 194
          EditLabel.Height = 16
          EditLabel.Margins.Left = 2
          EditLabel.Margins.Top = 2
          EditLabel.Margins.Right = 2
          EditLabel.Margins.Bottom = 2
          EditLabel.Caption = 'AWARDSSTATISTICS_leAwardUrl'
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object AWARDSSTATISTICS_lmAwardDescription: TLabeledDBMemo
          Left = 460
          Top = 24
          Width = 58
          Height = 72
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'AWARD_RULES'
          DataSource = dsAwards
          TabOrder = 2
          Visible = False
          EditLabel.Width = 245
          EditLabel.Height = 16
          EditLabel.Margins.Left = 2
          EditLabel.Margins.Top = 2
          EditLabel.Margins.Right = 2
          EditLabel.Margins.Bottom = 2
          EditLabel.Caption = 'AWARDSSTATISTICS_lmAwardDescription'
          EditLabel.Visible = False
          LabelPosition = lpAbove
          LabelSpacing = 3
        end
      end
      object AWARDSSTATISTICS_gbAwardRule: TGroupBox
        Left = 0
        Top = 121
        Width = 577
        Height = 356
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Caption = 'AWARDSSTATISTICS_gbAwardRule'
        TabOrder = 1
        object AWARDSSTATISTICS_lbPeriod: TLabel
          Left = 7
          Top = 94
          Width = 177
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_lbPeriod'
        end
        object AWARDSSTATISTICS_lbDataField: TLabel
          Left = 7
          Top = 142
          Width = 177
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_lbPeriod'
        end
        object AWARDSSTATISTICS_lbFilterField: TLabel
          Left = 201
          Top = 142
          Width = 177
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_lbPeriod'
        end
        object AWARDSSTATISTICS_lbAwardFilterDXCC: TLabel
          Left = 7
          Top = 203
          Width = 177
          Height = 16
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_lbPeriod'
        end
        object JvSpeedButton2: TJvSpeedButton
          Left = 184
          Top = 224
          Width = 25
          Height = 25
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0040914D233C8E487D398B43DB35883FF331863BF32E83
            36DB2B80327D277E2F23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0048985753449552E640984FFF7CC18EFF95D0A5FF95CFA5FF77BD
            88FF358C41FF2B8033E6287E2F53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00509E60534C9B5CF463B377FFA7DBB4FF86CC97FF65BB7CFF63B97BFF85CB
            97FFA4D9B3FF57A96AFF2B8033F4287E2F53FFFFFF00FFFFFF00FFFFFF0058A5
            6A2255A265E569B87CFFA7DBB1FF5FBB76FF5BB972FF58B76FFF58B46EFF57B4
            6EFF5AB673FFA4D9B2FF59A96BFF2B8133E5287E2F22FFFFFF00FFFFFF005CA8
            6F7E52AA67FFA9DDB3FF63C078FF5EBD70FF5FBB76FFFFFFFFFFFFFFFFFF58B7
            6FFF57B46DFF5BB673FFA5DAB3FF378E42FF2B81337EFFFFFF00FFFFFF0060AB
            74DB89CC97FF88D395FF6AC579FF62C06FFF54AA64FFFFFFFFFFFFFFFFFF58B7
            6FFF58B76FFF5AB871FF84CC96FF7ABD8CFF2F8438DBFFFFFF00FFFFFF0064AE
            79F6A8DDB2FF7CCF89FF74CC80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF58B76FFF66BD7CFF9BD4AAFF33873CF6FFFFFF00FFFFFF0068B1
            7DF6B5E2BDFF8AD596FF79C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF58B76FFF68C07DFF9CD4A9FF378A41F6FFFFFF00FFFFFF006CB4
            82DBABDDB5FFA5DFAEFF80CB8BFF7BC985FF6DBC78FFFFFFFFFFFFFFFFFF5AAB
            69FF5FBB76FF5BB972FF8AD198FF7FC491FF3B8D46DBFFFFFF00FFFFFF006FB7
            867E84C796FFD2EED7FF94D99FFF89D393FF7EC888FFFFFFFFFFFFFFFFFF78CD
            84FF6AC27BFF6EC77DFFABDFB4FF449D56FF3F904B7EFFFFFF00FFFFFF0072B9
            89226FB786E5A9DAB6FFD8F1DCFF91D89CFF87CD92FF83CC8DFF8AD495FF89D4
            94FF82D28DFFAEE0B6FF6AB87CFF479755E543935022FFFFFF00FFFFFF00FFFF
            FF0072BA8A536FB786F4AEDCBAFFDCF2E0FFB5E4BCFF9ADBA4FF95D99FFFA4DF
            AEFFBFE8C4FF78C189FF4F9D5EF44B9A5A53FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF0072BA8A5370B786E693CEA3FFC2E6CBFFCFEBD4FFC9E9CEFFAEDD
            B7FF6CB87EFF57A468E653A06453FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0073BA8A2370B8877D6DB583DB69B27FF366B07BF362AD
            76DB5FAA727D5BA76D23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -13
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          OnClick = JvSpeedButton2Click
        end
        object JvSpeedButton3: TJvSpeedButton
          Left = 184
          Top = 256
          Width = 25
          Height = 25
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF003E53C223394FC17D3752BDDB3450BCF32F4ABBF32D4D
            B7DB2A4BB67D2647B423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF004557C8534154C5E63B51CCFF7479E8FF8E91EEFF8E91EEFF7077
            E4FF324CC0FF2A49B6E6284AB453FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF004C59CD534858CBF45B64E0FFA0A5F5FF7D85EFFF5A62E9FF585CE7FF7C83
            EEFF9D9FF4FF505CD7FF2A49B6F4284AB453FFFFFF00FFFFFF00FFFFFF00535E
            D2225260CFE5606AE3FFA0ABF5FF535EECFF4F5BEAFF4C58E9FF4D58E6FF4B55
            E6FF4F55E6FF9DA1F4FF535FD6FF2949B7E5284AB422FFFFFF00FFFFFF00575F
            D47E4A55DBFFA1AAF6FF5563F0FF5165EEFF4C58E9FF4C58E9FF4C58E9FF4C58
            E9FF4B57E6FF5159E6FF9EA2F5FF334FC3FF2949B77EFFFFFF00FFFFFF005B61
            D7DB808BEEFF7D90F7FF5C72F3FF4C58E9FF4C58E9FF4C58E9FF4C58E9FF4C58
            E9FF4C58E9FF4E5AE9FF7A82F0FF747AE2FF2D4AB9DBFFFFFF00FFFFFF005E62
            DAF6A0AAF7FF6F85F8FF6781F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF4C58E9FF5B65EAFF959BF1FF314FBBF6FFFFFF00FFFFFF006368
            DBF6AEB8F9FF7E92FAFF6F84F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF4C58E9FF5D69EEFF959CF1FF354EBDF6FFFFFF00FFFFFF006669
            DEDBA4AEF5FF9CAAFAFF768BF0FF535EECFF535EECFF535EECFF535EECFF535E
            ECFF535EECFF6276F2FF808DF4FF777EE9FF3952BFDBFFFFFF00FFFFFF006968
            E07E7C82EAFFCDD4FCFF8A9CFAFF7D92F7FF7489EEFF6B83F6FF6B83F6FF6B83
            F6FF6B83F6FF6278F3FFA3AEF8FF3D4ED0FF3D53C17EFFFFFF00FFFFFF006B6B
            E1226968E0E5A2A6F3FFD4DBFDFF8699FAFF7E90F0FF798DF1FF7E93F8FF7D91
            F9FF758BF8FFA7B5F8FF626DE3FF4456C7E54055C422FFFFFF00FFFFFF00FFFF
            FF006C6BE3536968E0F4A9ACF2FFD8DCFDFFADB9FAFF90A2FAFF8A9CFAFF9BA8
            FBFFB9C7FCFF6F7AE9FF4B5ACCF44757CA53FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF006C6BE3536969DFE68D92EDFFBDC2F8FFCCD3F9FFC3CBF9FFA9B3
            F4FF656FE2FF525DD1E64F5CCE53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF006C6CE2236A69E17D6769DDDB6263DCF36063DAF35C62
            D9DB5A62D67D5761D423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -13
          HotTrackFont.Name = 'Tahoma'
          HotTrackFont.Style = []
          OnClick = JvSpeedButton3Click
        end
        object AWARDSSTATISTICS_dtpStart: TDateTimePickerEx
          Left = 7
          Top = 113
          Width = 175
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Date = 2.000000000000000000
          Time = 2.000000000000000000
          TabOrder = 3
          FormatString = 'dd.MM.yyyy HH:mm:ss'
          FormatBlank = #39#39
          DateTime = 2.000000000000000000
        end
        object AWARDSSTATISTICS_dtpEnd: TDateTimePickerEx
          Left = 202
          Top = 113
          Width = 174
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Date = 402133.000008773200000000
          Time = 402133.000008773200000000
          TabOrder = 4
          FormatString = 'dd.MM.yyyy HH:mm:ss'
          FormatBlank = #39#39
          DateTime = 402133.000008773200000000
        end
        object AWARDSSTATISTICS_cbActive: TDBCheckBox
          Left = 7
          Top = 26
          Width = 369
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_cbActive'
          DataField = 'AWARD_ACTIVE'
          DataSource = dsAwards
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object AWARDSSTATISTICS_leAwardFilterDXCC: TLabeledDBEdit
          Left = 469
          Top = 42
          Width = 174
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          DataField = 'AWARD_FILTER_DXCC'
          DataSource = dsAwards
          TabOrder = 9
          Visible = False
          EditLabel.Width = 87
          EditLabel.Height = 16
          EditLabel.Margins.Left = 2
          EditLabel.Margins.Top = 2
          EditLabel.Margins.Right = 2
          EditLabel.Margins.Bottom = 2
          EditLabel.Caption = 'LabeledDBEdit3'
          EditLabel.Visible = False
          LabelPosition = lpAbove
          LabelSpacing = 3
          Latin = False
        end
        object AWARDSSTATISTICS_cbQuickStats: TDBCheckBox
          Left = 7
          Top = 48
          Width = 369
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_cbActive'
          DataField = 'AWARD_QUICK_STATS'
          DataSource = dsAwards
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbDataField: TComboBox
          Left = 7
          Top = 162
          Width = 175
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Style = csDropDownList
          TabOrder = 5
        end
        object AWARDSSTATISTICS_gbQSLType: TGroupBox
          Left = 381
          Top = 94
          Width = 188
          Height = 131
          Caption = 'AWARDSSTATISTICS_gbQSLType'
          TabOrder = 10
          object AWARDSSTATISTICS_cbQSL: TDBCheckBox
            Left = 11
            Top = 20
            Width = 126
            Height = 18
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'AWARDSSTATISTICS_cbActive'
            DataField = 'AWARD_QSL'
            DataSource = dsAwards
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object AWARDSSTATISTICS_cbEQSL: TDBCheckBox
            Left = 11
            Top = 44
            Width = 126
            Height = 18
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'AWARDSSTATISTICS_cbActive'
            DataField = 'AWARD_EQSL'
            DataSource = dsAwards
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object AWARDSSTATISTICS_cbLoTW: TDBCheckBox
            Left = 11
            Top = 68
            Width = 126
            Height = 18
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'AWARDSSTATISTICS_cbActive'
            DataField = 'AWARD_LOTW'
            DataSource = dsAwards
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object AWARDSSTATISTICS_cbDQSL: TDBCheckBox
            Left = 11
            Top = 92
            Width = 126
            Height = 18
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'AWARDSSTATISTICS_cbActive'
            DataField = 'AWARD_DQSL'
            DataSource = dsAwards
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object AWARDSSTATISTICS_cbQuickStatsForAll: TDBCheckBox
          Left = 7
          Top = 70
          Width = 369
          Height = 18
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'AWARDSSTATISTICS_cbActive'
          DataField = 'AWARD_STATS_FOR_ALL'
          DataSource = dsAwards
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbFilterField: TComboBox
          Left = 201
          Top = 162
          Width = 175
          Height = 24
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Style = csDropDownList
          TabOrder = 6
        end
        object lbDXCC: TListBox
          Left = 7
          Top = 256
          Width = 175
          Height = 94
          TabOrder = 8
        end
        object dblCountry: TJvDBLookupCombo
          Left = 7
          Top = 224
          Width = 175
          Height = 26
          LookupField = 'ADIF_ID'
          LookupDisplay = 'TERRITORY_NAME'
          LookupSource = dsTerritory
          TabOrder = 7
        end
      end
    end
    object AWARDSSTATISTICS_tsData: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'AWARDSSTATISTICS_tsData'
      ImageIndex = 1
      object dbgAwardsData: TDBGridEh
        Left = 0
        Top = 33
        Width = 577
        Height = 444
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        ColumnDefValues.EndEllipsis = True
        ColumnDefValues.Title.Alignment = taCenter
        ColumnDefValues.Title.EndEllipsis = True
        ColumnDefValues.Title.TitleButton = True
        DataGrouping.GroupLevels = <>
        DataSource = dsAwardsData
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
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghColumnResize, dghColumnMove, dghHotTrack]
        RowDetailPanel.Color = clBtnFace
        STFilter.InstantApply = True
        STFilter.Local = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_FIELD_VALUE'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_FIELD_DESCRIPTION'
            Footers = <>
            Width = 118
          end
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_FILTER_VALUE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_START_DATE'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_END_DATE'
            Footers = <>
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'AWARD_DATA_SCORE'
            Footers = <>
            Width = 68
          end>
        object RowDetailData: TRowDetailPanelControlEh
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          object lbSSTFilterListItem_All: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbSSTFilterListItem_ClearFilter: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbSSTFilterListItem_ApplyFilter: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbSSTFilterListItem_CustomFilter: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbFilterCaption: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbShowRecordsWhere: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbAnd: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
          object lbOr: TLabel
            Left = -113
            Top = -13
            Width = 139
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = 'msgConfirmPluginDelete'
            Visible = False
          end
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 577
        Height = 33
        ButtonHeight = 32
        ButtonWidth = 32
        Caption = 'ToolBar1'
        Images = ilAwardStatisticsEdit
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = AwardsStatistics_aAddAwardStatisctic
        end
        object ToolButton2: TToolButton
          Left = 32
          Top = 0
          Action = AwardsStatistics_aEditAwardStatistic
        end
        object ToolButton3: TToolButton
          Left = 64
          Top = 0
          Action = AwardsStatistics_aDeleteAwardStatistic
        end
        object ToolButton4: TToolButton
          Left = 96
          Top = 0
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 104
          Top = 0
          Action = AwardsStatistics_aPostAwardStatistic
        end
        object ToolButton6: TToolButton
          Left = 136
          Top = 0
          Action = AwardsStatistics_aCancelAwardStatistic
        end
      end
    end
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 508
    Width = 585
    Height = 34
    Align = alBottom
    BevelVisible = True
    object AWARDSSTATISTICS_btnOk: TButton
      Left = 449
      Top = 4
      Width = 58
      Height = 26
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'AWARDSSTATISTICS_btnOk'
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
      OnClick = AWARDSSTATISTICS_btnOkClick
    end
    object AWARDSSTATISTICS_btnCancel: TButton
      Left = 511
      Top = 4
      Width = 62
      Height = 26
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'AWARDSSTATISTICS_btnCancel'
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
  object qryAwards: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'AWARDS'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'AWARD_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AWARD_NAME'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'AWARD_DATA_FIELD'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'AWARD_RULES'
        DataType = ftMemo
      end
      item
        Name = 'AWARD_DATE_START'
        DataType = ftDateTime
      end
      item
        Name = 'AWARD_DATE_END'
        DataType = ftDateTime
      end
      item
        Name = 'AWARD_URL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AWARD_QUICK_STATS'
        DataType = ftInteger
      end
      item
        Name = 'AWARD_ACTIVE'
        DataType = ftInteger
      end
      item
        Name = 'AWARD_DATA_FIELD_CAPTION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'AWARD_FILTER_DXCC'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AWARD_FILTER_CALL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AWARD_QSL'
        DataType = ftSmallint
      end
      item
        Name = 'AWARD_EQSL'
        DataType = ftSmallint
      end
      item
        Name = 'AWARD_LOTW'
        DataType = ftSmallint
      end
      item
        Name = 'AWARD_DQSL'
        DataType = ftSmallint
      end
      item
        Name = 'AWARD_STATS_FOR_ALL'
        DataType = ftSmallint
      end
      item
        Name = 'AWARD_FILTER_FIELD'
        DataType = ftString
        Size = 25
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
    Left = 424
    Top = 320
    object qryAwardsAWARD_ID: TAutoIncField
      FieldName = 'AWARD_ID'
      ReadOnly = True
      Visible = False
    end
    object qryAwardsAWARD_NAME: TStringField
      FieldName = 'AWARD_NAME'
      Size = 150
    end
    object qryAwardsAWARD_DATA_FIELD: TStringField
      FieldName = 'AWARD_DATA_FIELD'
      Visible = False
      Size = 25
    end
    object qryAwardsAWARD_RULES: TMemoField
      FieldName = 'AWARD_RULES'
      Visible = False
      BlobType = ftMemo
    end
    object qryAwardsAWARD_DATE_START: TDateTimeField
      FieldName = 'AWARD_DATE_START'
      Visible = False
    end
    object qryAwardsAWARD_DATE_END: TDateTimeField
      FieldName = 'AWARD_DATE_END'
      Visible = False
    end
    object qryAwardsAWARD_URL: TStringField
      FieldName = 'AWARD_URL'
      Size = 255
    end
    object qryAwardsAWARD_ACTIVE: TIntegerField
      FieldName = 'AWARD_ACTIVE'
    end
    object qryAwardsAWARD_DATA_FIELD_CAPTION: TStringField
      FieldName = 'AWARD_DATA_FIELD_CAPTION'
      Size = 50
    end
    object qryAwardsAWARD_QUICK_STATS: TIntegerField
      FieldName = 'AWARD_QUICK_STATS'
    end
    object qryAwardsAWARD_FILTER_DXCC: TStringField
      FieldName = 'AWARD_FILTER_DXCC'
    end
    object qryAwardsAWARD_FILTER_CALL: TStringField
      FieldName = 'AWARD_FILTER_CALL'
    end
    object qryAwardsAWARD_QSL: TSmallintField
      FieldName = 'AWARD_QSL'
    end
    object qryAwardsAWARD_EQSL: TSmallintField
      FieldName = 'AWARD_EQSL'
    end
    object qryAwardsAWARD_LOTW: TSmallintField
      FieldName = 'AWARD_LOTW'
    end
    object qryAwardsAWARD_DQSL: TSmallintField
      FieldName = 'AWARD_DQSL'
    end
    object qryAwardsAWARD_STATS_FOR_ALL: TSmallintField
      FieldName = 'AWARD_STATS_FOR_ALL'
    end
    object qryAwardsAWARD_FILTER_FIELD: TStringField
      FieldName = 'AWARD_FILTER_FIELD'
      Size = 25
    end
  end
  object qryAwardsData: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'AWARDS_DATA'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'AWARD_DATA_ID'
        DataType = ftAutoInc
      end
      item
        Name = 'AWARD_ID'
        DataType = ftInteger
      end
      item
        Name = 'AWARD_DATA_FIELD_VALUE'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'AWARD_DATA_FIELD_DESCRIPTION'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'AWARD_DATA_START_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'AWARD_DATA_END_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'AWARD_DATA_SCORE'
        DataType = ftInteger
      end
      item
        Name = 'AWARD_DATA_FILTER_VALUE'
        DataType = ftString
        Size = 25
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
    OnNewRecord = qryAwardsDataNewRecord
    Left = 416
    Top = 288
    object qryAwardsDataAWARD_DATA_ID: TAutoIncField
      FieldName = 'AWARD_DATA_ID'
      Visible = False
    end
    object qryAwardsDataAWARD_ID: TIntegerField
      FieldName = 'AWARD_ID'
      Visible = False
    end
    object qryAwardsDataAWARD_DATA_FIELD_VALUE: TStringField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_FIELD_VALUE'
      FieldName = 'AWARD_DATA_FIELD_VALUE'
      Size = 25
    end
    object qryAwardsDataAWARD_DATA_FIELD_DESCRIPTION: TStringField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_FIELD_DESCRIPTION'
      FieldName = 'AWARD_DATA_FIELD_DESCRIPTION'
      Size = 255
    end
    object qryAwardsDataAWARD_DATA_START_DATE: TDateTimeField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_START_DATE'
      FieldName = 'AWARD_DATA_START_DATE'
    end
    object qryAwardsDataAWARD_DATA_END_DATE: TDateTimeField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_END_DATE'
      FieldName = 'AWARD_DATA_END_DATE'
    end
    object qryAwardsDataAWARD_DATA_SCORE: TIntegerField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_SCORE'
      FieldName = 'AWARD_DATA_SCORE'
      Visible = False
    end
    object qryAwardsDataAWARD_DATA_FILTER_VALUE: TStringField
      DisplayLabel = 'AWARDSSTATISTICS_AWARD_DATA_FILTER_VALUE'
      FieldName = 'AWARD_DATA_FILTER_VALUE'
      Size = 25
    end
  end
  object dsAwardsData: TDataSource
    DataSet = qryAwardsData
    Left = 256
    Top = 152
  end
  object dsAwards: TDataSource
    DataSet = qryAwards
    Left = 440
    Top = 192
  end
  object ilAwardStatisticsEdit: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 368
    Top = 72
    Bitmap = {
      494C01010500F0001C0710001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003434
      3F41070707080000000000000000000000000000000000000000000000000707
      070832323E410000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000035343F414C49
      F2FF3F3DEBFD0707070800000000000000000000000000000000070707082422
      E1FC2E2CEAFF32323E4100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000035353F415553F5FF605E
      FAFF5552F6FF403FEAFC070707080000000000000000070707082C2AE3FC3E3C
      F1FF4947F6FF2E2CEAFF32323E41000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000026262A2B5855F6FF625F
      FAFF6E6DFFFF5653F6FF403FEBFC07070708070707083532E6FC4442F2FF605F
      FFFF4745F4FF2C2AE9FF24242A2B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000026262A2B5856
      F6FF6360FAFF716EFFFF5755F6FF4140EBFC3D3BEAFD4D4AF4FF6564FFFF4D4B
      F5FF3331EBFF24242A2B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002626
      2A2B5957F6FF6461FAFF716FFFFF706DFFFF6D6BFFFF6B69FFFF5452F7FF3C3A
      EEFF25242A2B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000026262A2B5A58F7FF7673FFFF5653FFFF5451FFFF6F6DFFFF4543F0FF2525
      2A2B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000070707085A57F4FD7A76FFFF5B58FFFF5855FFFF7371FFFF4542EDFD0707
      0708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      07086461F6FC6D6AFBFF7D7BFFFF7B78FFFF7976FFFF7674FFFF5B59F7FF4542
      ECFC070707080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000070707086C69
      F9FC7471FDFF8581FFFF7370FCFF615FF8FF5D5AF7FF6A67FAFF7876FFFF5D5A
      F7FF4643ECFC0707070800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000007070808716EFCFD7A77
      FEFF8986FFFF7976FDFF6966FBFF26262A2B26262A2B5E5BF8FF6B69FAFF7A77
      FFFF5E5CF7FF4744EDFC04040405000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1C1F1F7774FFFF807B
      FFFF807BFEFF716EFDFF26262A2B000000000000000026262A2B5F5CF8FF6C6A
      FBFF7B79FFFF5F5CF8FF4C4B6B6F010101020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1F1F7774
      FFFF7673FEFF26262A2B0000000000000000000000000000000026262A2B615E
      F8FF6765F9FF5D5BA2A824242829000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      1F1F26262B2B0000000000000000000000000000000000000000000000002626
      2A2B4F4F6D6F34333D3E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000909090A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000465D4E88216A
      3CF2166834FF216A3CF2465D4E88000000000000000000000000000000000000
      0000173E55F7295E86FB4887BAFB537F99C11E1F202200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000045526A781D4F
      A8DF0340BAFE1A4EABE3404F697A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB896FC4CB956CF4D195
      65FFCE9160FFCB8D5BFFC98958FFC78653FFC2834FFF687441FF258B50FF61B9
      8CFF94D2B1FF61B98CFF258B50FF465E4F8C00000000AB896FC4CB956CF4D195
      65FF2B6381FF93C7F9FF90C9F9FF3E84C9FF2163A5FFA78162FFC2834FFFC283
      4FFFC2834FFFC2834FFF8F6E54B00000000000000000AB896FC4CB956CF4D195
      65FFCE9160FFCB8D5BFFC98958FFC78653FFC2834FFF6B6A8AFF2462C7FF1E74
      E6FF0376EAFF0061DDFF044BBAFE404F697A0000000000000000000000000000
      0000000000000909090A06060607000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7A072FFF8F2EDFFF7F0
      EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FF1F6D3BFF5FB98AFF5DB9
      86FFFFFFFFFF5DB886FF64BB8EFF1D6A39F700000000D7A072FFF8F2EDFFF7F0
      EAFF4088A9FFE0F2FFFF5199D8FF1777BDFF4697C4FF448BC2FFD0D2D7FFF0E2
      D8FFF0E2D8FFF0E2D8FFC2895AFD0000000000000000D7A072FFF8F2EDFFF7F0
      EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FF1A53BBFF609CF4FF157C
      FFFF0073F8FF0073EEFF0165E1FF194DABE40000000000000000000000000000
      00000909090A34823AFF327836FB060606070000000000000000000000000000
      00000000000000000000000000000000000000000000D9A377FFF9F3EEFFEBD2
      BDFFFFFFFFFFEBD3BEFFFFFFFFFFFFFFFFFFFFFFFFFF2E7849FF9BD4B5FFFFFF
      FFFFFFFFFFFFFFFFFFFF94D2B1FF166834FF00000000D9A377FFF9F3EEFFEBD2
      BDFFA6C4D9FF77B5D5FF8FB6D1FF52C9E4FF58DFF5FF75D0EDFF4E9CDDFFE4F0
      FAFFFFFFFFFFF0E2D8FFC58B5CFF0000000000000000D9A377FFF9F3EEFFEBD2
      BDFFFFFFFFFFEBD3BEFFFFFFFFFFFFFFFFFFFFFFFFFF0340BBFFADCDFEFFFFFF
      FFFFFFFFFFFFFFFFFFFF157CEFFF0340BAFE0000000000000000000000000909
      090A3D8D44FF51A259FF4C9E54FF307A36FE0707070800000000000000000000
      00000000000000000000000000000000000000000000DDA77BFFF9F3EFFFEBD0
      B9FFEBD0BAFFEBD0BAFFEBD0BAFFEBD0BAFFEBD1BCFF46885DFF8FD3B0FF91D6
      B0FFFFFFFFFF62BB8BFF64BB8EFF1D6A39F700000000DDA77BFFF9F3EFFFEBD0
      B9FFEBD0BAFFA6B6B8FF73B8D5FFC1F6FDFF60DFF7FF5AE2F8FF76D3F0FF4696
      DAFFD4C4B8FFF0E2D8FFC58959FF0000000000000000DDA77BFFF9F3EFFFEBD0
      B9FFEBD0BAFFEBD0BAFFEBD0BAFFEBD0BAFFEBD1BCFF1F53B7FF8CB4F6FF4A91
      FFFF0F74FFFF1E85FFFF3D89EBFF1E4EA8DE00000000000000000909090A4699
      4EFF58AB61FF74CA81FF71C87BFF4E9F56FF317B37FE07070708000000000000
      00000000000000000000000000000000000000000000DFA981FFF9F3EFFFEACE
      B6FFFFFFFFFFEBD0BAFFFFFFFFFFFFFFFFFFFFFFFFFF9CAE90FF5EAA80FF94D4
      B3FFB9E6D0FF67BA8EFF2A8E54FF465E4F8C00000000DFA981FFF9F3EFFFEACE
      B6FFFFFFFFFFEBD0BAFFB0D6E7FF74CBE7FFC7F7FDFF5BDCF5FF57E1F7FF78D4
      F1FF4999DEFFCAD0D8FFC88C5CFF0000000000000000DFA981FFF9F3EFFFEACE
      B6FFFFFFFFFFEBD0BAFFFFFFFFFFFFFFFFFFFFFFFFFF8A96BEFF3A73D2FF8CB4
      F7FFB7D6FEFF6FA7F5FF2C68CAFF3F4A606D000000000909090A4EA557FF60B4
      6AFF7BCE88FF78CC86FF73CA80FF73C980FF4FA157FF327C38FE070707080000
      00000000000000000000000000000000000000000000E1AD86FFFAF4F0FFEACB
      B1FFEACCB2FFEACCB2FFEACCB2FFEACCB2FFEACEB6FFE8C7ABFFA1AD8DFF5C96
      6EFF4C8D63FF46885CFF787C4CFF0000000000000000E1AD86FFFAF4F0FFEACB
      B1FFEACCB2FFEACCB2FFEACCB2FFAFC3BEFF76D3EEFFC7F7FDFF5CDCF5FF58E2
      F7FF77D6F2FF4D9FDEFFAB8668FF0000000000000000E1AD86FFFAF4F0FFEACB
      B1FFEACCB2FFEACCB2FFEACCB2FFEACCB2FFEACEB6FFE8C7ABFF8892B6FF2558
      BDFF0340BBFF1B54BCFF666483FF000000000808080956AF60FF68BC73FF83D2
      8FFF77C984FF5DB167FF60B36AFF75C982FF75CB81FF50A259FF337C39FD0707
      07080000000000000000000000000000000000000000E3B08BFFFAF6F1FFEAC9
      ADFFFFFFFFFFEAC9AFFFFFFFFFFFFFFFFFFFFFFFFFFFE8C7ABFFFFFFFFFFFFFF
      FFFFFFFFFFFFF1E5DBFFC58552FF0000000000000000E3B08BFFFAF6F1FFEAC9
      ADFFFFFFFFFFEAC9AFFFFFFFFFFFFFFFFFFFC0EBF7FF7AD4EDFFC3F6FDFF69DD
      F6FF6ACAEDFF60A2D7FF6298C9FF2123242600000000E3B08BFFFAF6F1FFEAC9
      ADFFFFFFFFFFEAC9AFFFFFFFFFFFFFFFFFFFFFFFFFFFE8C7ABFFFFFFFFFFFFFF
      FFFFFFFFFFFFF1E5DBFFC58552FF0000000039403A465FA867E476C985FF7DCE
      8CFF4FA458FC4C5C4E6F546D568B59AC64FF79CC85FF76CB84FF51A35AFF357E
      3BFC0707070800000000000000000000000000000000E5B38EFFFAF6F2FFE9C5
      A9FFE9C5ABFFEAC7ABFFE9C7ACFFE9C9ADFFE9C9AFFFE8C7ABFFE9C9AFFFE8C8
      AFFFE8CCB4FFF2E7DEFFC88956FF0000000000000000E5B38EFFFAF6F2FFE9C5
      A9FFE9C5ABFFEAC7ABFFE9C7ACFFE9C9ADFFE9C9AFFFA5C0BDFF80D5EDFFB1E3
      F9FF8ABFE7FFADD3F6FFC3E0FCFF659CCDF700000000E5B38EFFFAF6F2FFE9C5
      A9FFE9C5ABFFEAC7ABFFE9C7ACFFE9C9ADFFE9C9AFFFE8C7ABFFE9C9AFFFE8C8
      AFFFE8CCB4FFF2E7DEFFC88956FF00000000000000003338333C5FA967E66ABF
      76FF4E5E506F0000000000000000567058915BAD65FF7ACD88FF79CD86FF53A4
      5CFF367F3CFC07070708000000000000000000000000E7B693FFFBF7F4FFE9C2
      A5FFFFFFFFFFE8C3A8FFFFFFFFFFFFFFFFFFFFFFFFFFE8C7ABFFFFFFFFFFFFFF
      FFFFFFFFFFFFF7F1EBFFCB8E5CFF0000000000000000E7B693FFFBF7F4FFE9C2
      A5FFFFFFFFFFE8C3A8FFFFFFFFFFFFFFFFFFFFFFFFFFE8C7ABFFB0E6F5FF74BD
      E7FFB3D2F0FFE5F3FFFFABD2EFFF4E87B9E800000000E7B693FFFBF7F4FFE9C2
      A5FFFFFFFFFFE8C3A8FFFFFFFFFFFFFFFFFFFFFFFFFFE8C7ABFFFFFFFFFFFFFF
      FFFFFFFFFFFFF7F1EBFFCB8E5CFF000000000000000000000000373E38434A59
      4C6500000000000000000000000000000000567158915CAE66FF7CCE89FF7BCE
      88FF54A55DFF37803DFC070707080000000000000000E9B997FFFBF7F4FFE9C2
      A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2
      A5FFE9C2A5FFFBF7F4FFCE9261FF0000000000000000E9B997FFFBF7F4FFE9C2
      A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFACBC
      B7FF55A4D8FF84B0DBFF439CD0FF404F575E00000000E9B997FFFBF7F4FFE9C2
      A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2A5FFE9C2
      A5FFE9C2A5FFFBF7F4FFCE9261FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000567159915DAF67FF80CF
      8CFF7CCF8AFF55A65EFF36843DFF0707070800000000EBBC9AFFFBF7F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFBF7F4FFD19667FF0000000000000000EBBC9AFFFBF7F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFBF7F4FFD19667FF0000000000000000EBBC9AFFFBF7F4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFBF7F4FFD19667FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000567159915FB1
      69FF81D18EFF77C884FF54A55DFF4C5E4D7B00000000ECBE9DFFFBF7F4FF9BD5
      A4FF97D3A0FF93D09CFF8FCE97FF8ACB92FF86C98DFF81C588FF7BC283FF77C0
      7DFF73BD79FFFBF7F4FFD49A6CFF0000000000000000ECBE9DFFFBF7F4FF9BD5
      A4FF97D3A0FF93D09CFF8FCE97FF8ACB92FF86C98DFF81C588FF7BC283FF77C0
      7DFF73BD79FFFBF7F4FFD49A6CFF0000000000000000ECBE9DFFFBF7F4FF9BD5
      A4FF97D3A0FF93D09CFF8FCE97FF8ACB92FF86C98DFF81C588FF7BC283FF77C0
      7DFF73BD79FFFBF7F4FFD49A6CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005772
      5A9160B26AFF5CAE66FF4D5F4F790000000000000000DCB59AEBFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFD29D72F80000000000000000DCB59AEBFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFD29D72F80000000000000000DCB59AEBFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
      F4FFFBF7F4FFFBF7F4FFD29D72F8000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000057725A915166537F0000000000000000000000007A6E677ED5B198E3EDBF
      9EFFEBBD9CFFEBBB99FFE9B995FFE7B692FFE6B48FFFE4B18BFFE2AE87FFE0AB
      83FFDDA87DFFDCA47AFFB28F75CA00000000000000007A6E677ED5B198E3EDBF
      9EFFEBBD9CFFEBBB99FFE9B995FFE7B692FFE6B48FFFE4B18BFFE2AE87FFE0AB
      83FFDDA87DFFDCA47AFFB28F75CA00000000000000007A6E677ED5B198E3EDBF
      9EFFEBBD9CFFEBBB99FFE9B995FFE7B692FFE6B48FFFE4B18BFFE2AE87FFE0AB
      83FFDDA87DFFDCA47AFFB28F75CA000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFF000000000000E7E7000000000000
      C3C300000000000081810000000000008001000000000000C003000000000000
      E007000000000000F00F000000000000F00F000000000000E007000000000000
      C00300000000000080010000000000008180000000000000C3C1000000000000
      E7E3000000000000FFF7000000000000FFC1F07FFFC1FFFF800080018000F9FF
      800080018000F0FF800080018000E07F800080018000C03F800080018000801F
      800180018001000F80018000800100078001800080018603800180008001CF01
      800180008001FF80800180018001FFC0800180018001FFE1800180018001FFF3
      800180018001FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object alAwardsStatisticsEdit: TActionList
    Images = ilAwardStatisticsEdit
    Left = 416
    Top = 72
    object AwardsStatistics_aAddAwardStatisctic: TAction
      Tag = -1
      Caption = 'AwardsStatistics_aAddAwardStatisctic'
      ImageIndex = 0
      OnExecute = AwardsStatistics_aAddAwardStatiscticExecute
      OnUpdate = AwardsStatistics_aAddAwardStatiscticUpdate
    end
    object AwardsStatistics_aEditAwardStatistic: TAction
      Tag = -1
      Caption = 'aCWEngineEditMacros'
      ImageIndex = 1
      OnUpdate = AwardsStatistics_aEditAwardStatisticUpdate
    end
    object AwardsStatistics_aDeleteAwardStatistic: TAction
      Tag = -1
      Caption = 'aCWEngineDeleteMacros'
      ImageIndex = 2
      OnUpdate = AwardsStatistics_aDeleteAwardStatisticUpdate
    end
    object AwardsStatistics_aPostAwardStatistic: TAction
      Tag = -1
      Caption = 'AwardsStatistics_aPostAwardStatistic'
      ImageIndex = 3
      OnUpdate = AwardsStatistics_aPostAwardStatisticUpdate
    end
    object AwardsStatistics_aCancelAwardStatistic: TAction
      Tag = -1
      Caption = 'AwardsStatistics_aCancelAwardStatistic'
      ImageIndex = 4
      OnUpdate = AwardsStatistics_aCancelAwardStatisticUpdate
    end
  end
  object qryTerritory: TKADaoTable
    AutoFindIndex = True
    ComponentVersion = '2009.1'
    CacheBlobs = False
    CacheMemos = False
    CacheLookups = False
    Database = dmMain.DAODatabase
    ExportMethod = VisibleFields
    RefreshSorted = False
    TableName = 'TERRITORY'
    QueryDefSQLModify = False
    QueryDefODBCMaxRecords = 0
    ShowGUID = False
    TableType = 2
    Translation = False
    LockType = 3
    OpenOptions = []
    FieldDefs = <
      item
        Name = 'TERRITORY_ID'
        DataType = ftInteger
      end
      item
        Name = 'TERRITORY_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ADIF_ID'
        DataType = ftInteger
      end
      item
        Name = 'CONTINENT_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'TERRITORY_NAME ASC'
        Expression = 'TERRITORY_NAME'
        Options = [ixExpression]
      end>
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
    Left = 304
    Top = 392
    object qryTerritoryTERRITORY_ID: TIntegerField
      FieldName = 'TERRITORY_ID'
    end
    object qryTerritoryTERRITORY_NAME: TStringField
      FieldName = 'TERRITORY_NAME'
      Size = 100
    end
    object qryTerritoryADIF_ID: TIntegerField
      FieldName = 'ADIF_ID'
    end
    object qryTerritoryCONTINENT_ID: TIntegerField
      FieldName = 'CONTINENT_ID'
    end
  end
  object dsTerritory: TDataSource
    DataSet = qryTerritory
    Left = 368
    Top = 408
  end
  object FormStorage: TJvFormStorage
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    OnSavePlacement = FormStorageSavePlacement
    StoredValues = <>
    Left = 248
    Top = 384
  end
end
