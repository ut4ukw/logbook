object WindowQSLInfoForm: TWindowQSLInfoForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WindowQSLInfoForm'
  ClientHeight = 574
  ClientWidth = 662
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
    Width = 662
    Height = 574
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object pgQSL: TPageControl
      Left = 0
      Top = 0
      Width = 662
      Height = 574
      ActivePage = tsLOTW
      Align = alClient
      TabOrder = 0
      object tsQSL: TTabSheet
        Caption = 'tsQSL'
        object lbSentTypeY: TLabel
          Left = 16
          Top = 312
          Width = 71
          Height = 16
          Caption = 'lbSentTypeY'
          Visible = False
        end
        object lbSentTypeN: TLabel
          Left = 16
          Top = 334
          Width = 72
          Height = 16
          Caption = 'lbSentTypeN'
          Visible = False
        end
        object lbSentTypeI: TLabel
          Left = 16
          Top = 378
          Width = 68
          Height = 16
          Caption = 'lbSentTypeI'
          Visible = False
        end
        object lbSentTypeR: TLabel
          Left = 16
          Top = 356
          Width = 72
          Height = 16
          Caption = 'lbSentTypeR'
          Visible = False
        end
        object lbSentTypeV: TLabel
          Left = 16
          Top = 400
          Width = 72
          Height = 16
          Caption = 'lbSentTypeV'
          Visible = False
        end
        object lbSentViaB: TLabel
          Left = 16
          Top = 432
          Width = 61
          Height = 16
          Caption = 'lbSentViaB'
          Visible = False
        end
        object lbSentViaD: TLabel
          Left = 16
          Top = 454
          Width = 62
          Height = 16
          Caption = 'lbSentViaD'
          Visible = False
        end
        object lbSentViaE: TLabel
          Left = 16
          Top = 476
          Width = 61
          Height = 16
          Caption = 'lbSentViaE'
          Visible = False
        end
        object lbSentViaM: TLabel
          Left = 16
          Top = 498
          Width = 64
          Height = 16
          Caption = 'lbSentViaM'
          Visible = False
        end
        object lbSentTypeQ: TLabel
          Left = 16
          Top = 410
          Width = 68
          Height = 16
          Caption = 'lbSentTypeI'
          Visible = False
        end
        object gbQSLSent: TGroupBox
          Left = 0
          Top = 0
          Width = 195
          Height = 543
          Align = alLeft
          Caption = 'gbQSLSent'
          TabOrder = 0
          object lbQSLSentType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbQSLSentDate: TLabel
            Left = 30
            Top = 80
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object lbQSLSentVia: TLabel
            Left = 3
            Top = 51
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbQSLSentViaRoute: TLabel
            Left = 30
            Top = 107
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbQSLSentType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_QSL_SENT'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsQSLSentType
            TabOrder = 0
          end
          object dbQSLSentViaRoute: TDBEdit
            Left = 70
            Top = 104
            Width = 120
            Height = 24
            DataField = 'LOG_QSL_VIA'
            Enabled = False
            TabOrder = 1
          end
          object dbdQSLSentDate: TJvDBDateTimePicker
            Left = 70
            Top = 76
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 2
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_QSLSDATE'
          end
          object dbQSLSentVia: TJvDBLookupCombo
            Left = 70
            Top = 48
            Width = 120
            Height = 24
            DataField = 'LOG_QSL_SENT_VIA'
            Enabled = False
            LookupField = 'QSL_SENT_VIA_ID'
            LookupDisplay = 'QSL_SENT_VIA_NAME'
            LookupSource = dsQSLSentVia
            TabOrder = 3
          end
        end
        object gbQSLRcv: TGroupBox
          Left = 195
          Top = 0
          Width = 459
          Height = 543
          Align = alClient
          Caption = 'gbQSLSend'
          TabOrder = 1
          object lbQSLRcvType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbQSLRcvDate: TLabel
            Left = 30
            Top = 80
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object lbQSLRcvVia: TLabel
            Left = 3
            Top = 51
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object dbQSLRcvType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_QSL_RCVD'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsQSLRcvType
            TabOrder = 0
          end
          object dbQSLRcvVia: TJvDBLookupCombo
            Left = 70
            Top = 48
            Width = 120
            Height = 24
            DataField = 'LOG_QSL_RCVD_VIA'
            Enabled = False
            LookupField = 'QSL_SENT_VIA_ID'
            LookupDisplay = 'QSL_SENT_VIA_NAME'
            LookupSource = dsQSLRcvVia
            TabOrder = 1
          end
          object dbdQSLRcvDate: TJvDBDateTimePicker
            Left = 70
            Top = 76
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 2
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_QSLRDATE'
          end
        end
      end
      object tsEQSL: TTabSheet
        Caption = 'tsEQSL'
        ImageIndex = 1
        object gbEQSLSent: TGroupBox
          Left = 0
          Top = 0
          Width = 195
          Height = 543
          Align = alLeft
          Caption = 'gbQSLSend'
          TabOrder = 0
          object lbEQSLSentType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbEQSLSentDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbEQSLSentType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_EQSL_QSL_SENT'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsEQSLSentType
            TabOrder = 0
          end
          object dbdEQSLSentDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_EQSL_QSLSDATE'
          end
        end
        object gbEQSLRcv: TGroupBox
          Left = 195
          Top = 0
          Width = 459
          Height = 543
          Align = alClient
          Caption = 'gbQSLSend'
          TabOrder = 1
          object lbEQSLRcvType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbEQSLRcvDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbEQSLRcvType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_EQSL_QSL_RCVD'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsEQSLRcvType
            TabOrder = 0
          end
          object dbdEQSLRcvDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_EQSL_QSLRDATE'
          end
        end
      end
      object tsDQSL: TTabSheet
        Caption = 'tsDQSL'
        ImageIndex = 3
        object gbDQSLSent: TGroupBox
          Left = 0
          Top = 0
          Width = 195
          Height = 543
          Align = alLeft
          Caption = 'gbQSLSend'
          TabOrder = 0
          object lbDQSLSentType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbDQSLSentDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbDQSLSentType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_DQSL_QSL_SENT'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsDQSLSentType
            TabOrder = 0
          end
          object dbdDQSLSentDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_DQSL_QSLSDATE'
          end
        end
        object gbDQSLRcv: TGroupBox
          Left = 195
          Top = 0
          Width = 459
          Height = 543
          Align = alClient
          Caption = 'gbQSLSend'
          TabOrder = 1
          object lbDQSLRcvType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbDQSLRcvDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbDQSLRcvType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_DQSL_QSL_RCVD'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsDQSLRcvType
            TabOrder = 0
          end
          object dbdDQSLRcvDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_DQSL_QSLRDATE'
          end
        end
      end
      object tsLOTW: TTabSheet
        Caption = 'tsLOTW'
        ImageIndex = 2
        object gbLQSLSent: TGroupBox
          Left = 0
          Top = 0
          Width = 195
          Height = 543
          Align = alLeft
          Caption = 'gbQSLSend'
          TabOrder = 0
          object lbLQSLSentType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbLQSLSentDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbLQSLSentType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_LOTW_QSL_SENT'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsLQSLSentType
            TabOrder = 0
          end
          object dbdLQSLSentDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_LOTW_QSLSDATE'
          end
        end
        object gbLQSLRcv: TGroupBox
          Left = 195
          Top = 0
          Width = 459
          Height = 543
          Align = alClient
          Caption = 'gbQSLSend'
          TabOrder = 1
          object lbLQSLRcvType: TLabel
            Left = 3
            Top = 24
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'lbContinent'
          end
          object lbLQSLRcvDate: TLabel
            Left = 30
            Top = 51
            Width = 36
            Height = 16
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Alignment = taRightJustify
            Caption = 'lbDate'
          end
          object dbLQSLRcvType: TJvDBLookupCombo
            Left = 70
            Top = 20
            Width = 120
            Height = 24
            DataField = 'LOG_LOTW_QSL_RCVD'
            LookupField = 'QSL_SENT_TYPE_ID'
            LookupDisplay = 'QSL_SENT_TYPE_NAME'
            LookupSource = dsLQSLRcvType
            TabOrder = 0
          end
          object dbdLQSLRcvDate: TJvDBDateTimePicker
            Left = 70
            Top = 48
            Width = 103
            Height = 24
            Date = 40315.641243946760000000
            Time = 40315.641243946760000000
            Enabled = False
            TabOrder = 1
            DropDownDate = 40315.000000000000000000
            DataField = 'LOG_LOTW_QSLRDATE'
          end
        end
      end
    end
  end
  object dsQSLSentType: TDataSource
    DataSet = cdsQSLSentType
    OnDataChange = dsQSLSentTypeDataChange
    Left = 152
    Top = 360
  end
  object dsQSLRcvType: TDataSource
    DataSet = cdsQSLRcvdType
    OnDataChange = dsQSLRcvTypeDataChange
    Left = 248
    Top = 360
  end
  object dsQSLSentVia: TDataSource
    DataSet = cdsQSLSentVia
    Left = 152
    Top = 304
  end
  object dsQSLRcvVia: TDataSource
    DataSet = cdsQSLRcvdVia
    Left = 248
    Top = 304
  end
  object dsEQSLSentType: TDataSource
    DataSet = cdsEQSLSentType
    OnDataChange = dsEQSLSentTypeDataChange
    Left = 152
    Top = 408
  end
  object dsEQSLRcvType: TDataSource
    DataSet = cdsQSLRcvdType
    OnDataChange = dsEQSLRcvTypeDataChange
    Left = 248
    Top = 408
  end
  object dsLQSLSentType: TDataSource
    DataSet = cdsLQSLSentType
    OnDataChange = dsLQSLSentTypeDataChange
    Left = 152
    Top = 520
  end
  object dsLQSLRcvType: TDataSource
    DataSet = cdsLQSLRcvdType
    OnDataChange = dsLQSLRcvTypeDataChange
    Left = 248
    Top = 520
  end
  object cdsQSLSentType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 344
    Top = 360
    object cdsQSLSentTypeQSL_SENT_TYPE_ID: TStringField
      FieldName = 'QSL_SENT_TYPE_ID'
      Size = 1
    end
    object cdsQSLSentTypeQSL_SENT_TYPE_NAME: TStringField
      FieldName = 'QSL_SENT_TYPE_NAME'
      Size = 254
    end
  end
  object cdsQSLRcvdType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 440
    Top = 360
    object cdsQSLRcvdTypeQSL_SENT_TYPE_ID: TStringField
      FieldName = 'QSL_SENT_TYPE_ID'
      Size = 1
    end
    object cdsQSLRcvdTypeQSL_SENT_TYPE_NAME: TStringField
      FieldName = 'QSL_SENT_TYPE_NAME'
      Size = 254
    end
  end
  object cdsEQSLSentType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 344
    Top = 408
    object cdsEQSLSentTypeQSL_SENT_TYPE_ID: TStringField
      FieldName = 'QSL_SENT_TYPE_ID'
    end
    object cdsEQSLSentTypeQSL_SENT_TYPE_NAME: TStringField
      FieldName = 'QSL_SENT_TYPE_NAME'
    end
  end
  object cdsEQSLRcvdType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 408
  end
  object cdsLQSLSentType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 344
    Top = 520
  end
  object cdsLQSLRcvdType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 520
  end
  object cdsQSLSentVia: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_VIA_ID'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QSL_SENT_VIA_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 344
    Top = 304
    object cdsQSLSentViaQSL_SENT_VIA_ID: TStringField
      FieldName = 'QSL_SENT_VIA_ID'
      Size = 1
    end
    object cdsQSLSentViaQSL_SENT_VIA_NAME: TStringField
      FieldName = 'QSL_SENT_VIA_NAME'
      Size = 254
    end
  end
  object cdsQSLRcvdVia: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_VIA_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_VIA_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 304
  end
  object dsDQSLSentType: TDataSource
    DataSet = cdsDQSLSentType
    OnDataChange = dsDQSLSentTypeDataChange
    Left = 152
    Top = 464
  end
  object dsDQSLRcvType: TDataSource
    DataSet = cdsDQSLRcvdType
    OnDataChange = dsDQSLRcvTypeDataChange
    Left = 248
    Top = 464
  end
  object cdsDQSLSentType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 344
    Top = 464
  end
  object cdsDQSLRcvdType: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'QSL_SENT_TYPE_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QSL_SENT_TYPE_NAME'
        DataType = ftString
        Size = 20
      end>
    Left = 440
    Top = 464
  end
end
