object MainForm: TMainForm
  Left = 402
  Top = 182
  Width = 913
  Height = 478
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 352
    Top = 8
    Width = 105
    Height = 105
    Stretch = True
  end
  object Grid: TStringGrid
    Left = 776
    Top = 8
    Width = 169
    Height = 89
    DefaultColWidth = 10
    FixedCols = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    Visible = False
    OnDblClick = GridDblClick
    OnDrawCell = GridDrawCell
    OnMouseDown = GridMouseDown
    OnSelectCell = GridSelectCell
  end
  object Grid1: TStringGrid
    Left = 8
    Top = 32
    Width = 713
    Height = 353
    DefaultColWidth = 10
    FixedCols = 3
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnDblClick = GridDblClick
    OnDrawCell = GridDrawCell
    OnMouseDown = GridMouseDown
    OnSelectCell = GridSelectCell
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Button2: TButton
    Left = 744
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 744
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 584
    Top = 32
    Width = 257
    Height = 369
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object MainMenu1: TMainMenu
    Left = 736
    object N1: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N7: TMenuItem
        Caption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
      end
      object N8: TMenuItem
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1042#1086#1076#1080#1090#1077#1083#1080
        OnClick = N9Click
      end
    end
    object N3: TMenuItem
      Caption = #1044#1086#1083#1078#1085#1080#1082#1080
    end
    object N4: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088
      object N10: TMenuItem
        Caption = #1057#1095#1077#1090#1072
      end
      object N11: TMenuItem
        Caption = #1057#1095#1077#1090#1072'-'#1092#1072#1082#1090#1091#1088#1099
      end
      object N12: TMenuItem
        Caption = #1040#1082#1090#1099' '#1074#1099#1087'. '#1088#1072#1073#1086#1090
      end
      object N13: TMenuItem
        Caption = #1047#1072#1103#1074#1082#1080
      end
    end
    object N5: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      object N14: TMenuItem
        Caption = #1042#1080#1076
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1077
        OnClick = N15Click
      end
    end
    object N6: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    end
  end
  object Client1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 11245
    OnConnect = Client1Connect
    OnRead = Client1Read
    OnError = Client1Error
    Left = 736
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    Left = 736
    Top = 32
    object N16: TMenuItem
      Caption = '0'
      OnClick = popupClick
    end
    object qwe1: TMenuItem
      Caption = '1'
      OnClick = popupClick
    end
    object wer1: TMenuItem
      Caption = '2'
      OnClick = popupClick
    end
    object N31: TMenuItem
      Caption = '3'
      OnClick = popupClick
    end
    object N41: TMenuItem
      Caption = '4'
      OnClick = popupClick
    end
    object N51: TMenuItem
      Caption = '5'
      OnClick = N51Click
    end
  end
  object Client2: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 11246
    OnRead = Client2Read
    Left = 736
    Top = 96
  end
  object Client3: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 11247
    OnRead = Client3Read
    Left = 736
    Top = 128
  end
end
