object EditShortCut: TEditShortCut
  Left = 0
  Top = 0
  ActiveControl = edShortCut
  BorderStyle = bsDialog
  Caption = 'EditShortCut'
  ClientHeight = 123
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object lbActionCaption: TLabel
    Left = 8
    Top = 16
    Width = 88
    Height = 16
    Caption = 'lbActionCaption'
  end
  object lbShortCut: TLabel
    Left = 8
    Top = 40
    Width = 60
    Height = 16
    Caption = 'lbShortCut'
  end
  object JvFooter1: TJvFooter
    Left = 0
    Top = 89
    Width = 239
    Height = 34
    Align = alBottom
    BevelVisible = True
    object btnOk: TButton
      Left = 105
      Top = 4
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
    end
    object btnCancel: TButton
      Left = 170
      Top = 4
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
    end
  end
  object edShortCut: TJvHotKey
    Left = 8
    Top = 60
    Width = 121
    Height = 23
    InvalidKeys = []
    Modifiers = []
    TabOrder = 1
    ParentColor = False
    OnKeyUp = edShortCutKeyUp
  end
  object JvXPButton1: TJvXPButton
    Left = 132
    Top = 60
    Width = 23
    Height = 23
    TabOrder = 2
    Glyph.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF610000000473424954080808087C0864880000001974
      455874536F667477617265007777772E696E6B73636170652E6F72679BEE3C1A
      000003574944415478DA5D536B6C5365187EBEF6945ED65D89AB165DB7B2C1A0
      1D9D0E300831918B4609FBC10F6EC9B804107031511C44511C414C8410A27F8C
      319AE80FE21F499CE8C66DC0B88CB18D8D711D2B191D58BBD31E4EDBB3D3AE3B
      A7E71CBF9ED2B9F0255FCE792FCF73DEF7797288A669C89D8EC6CFDF7B79D992
      9D973FDCBF6E73B0378929E7EFFA2DB5E5F52B3EEB693EB68BD6F85C9EE4082E
      EEF8B47ED1A1A616C662C6E3CE1BD1DF1A1ACBF685EF8A99DA9FEF36D42E3EF8
      498F81E799082F082D1FEDAFDAC3DE0E4F125CD8B667E5EBCD1F9F64A631441D
      13A1AA2A1E750F702DBBBFACF0F87C3317ECDDD1631C1931C9211642DF006273
      BD5CE74FC7BD4DEC6D96B46F6D7A7BFEDE5D6D669BC5A0086350C5049444022A
      080283C35CD1F4A27C0B17312B4F79247AFB317E7F08C4E944646655F8FAC953
      D5A4EFC8F7BFCC59BB6A93128D65C1CF6EF69D4E93C8C6698E47FCFC25D0F1F4
      95533E1F0E9F6E5B437E75D6D966356E1CAC7E73E12B5A5CC882E91A4A8EE0D9
      53ECEE83128BEBE078C90B38CBB26D5F07FA9B750D8E3A3CF6DAD5AB6E7916D7
      5518C4E7C109A41EF82105433A38AC18D02EC4FE3AC2F98F65B49F74E1DB173D
      76EF3BCBEECCA9AE706557C81265844B3D1CD67B64AB15AD2C77FA003B783803
      A6586D92A075DE528F73F9926BC50CC9CF8D2D4738488127D05405A06DAACD8A
      FB1286FCDCE8820361BF3069E359DF524FC9FC79574B8AF30B35EA84964C428D
      46A184466903C5D21E5551904E2B90CC16F879E116CDBDB1E1C940829CAF7D6B
      6EB1CFD3996FB7146A62122495028418406D331A0D2084E8040A05A7E534A409
      19E3691581944449B088F4AC5CFF5581D3F105A17665BE4CA23C9889094C339B
      60AAACA47ED175A80E6959812CC99052927E451AFFC8871AC815775D09299BD1
      57C0185D46FE29CC8C0166AB19A8F1E2C2DDC14B55AEF27237E4323518D48113
      E31284B1247AC7848E0FFE1DDAAD6BF087ABA6B49061AE95E659DD79761B3447
      29DA471E9FD9DE7FF59BEF5EAABCB1F0D5D7BA5D26CCD60401D1A888EB9148C7
      FBC107FBA8B45DFFBB5051E328624C5D45765BF96521DEBA73F8CED19C55ED6E
      5F9EA9A0A0CBC118BCDD2CDBB1E59F2C98965432F5773EE1F2149F13A3CB7FE0
      43011AF66A538AE7DC3EDBEFF1C8EA9FF9D17B69683733E04CFE3F6D31F8F50F
      9A14DC0000000049454E44AE426082}
    OnClick = JvXPButton1Click
  end
end
