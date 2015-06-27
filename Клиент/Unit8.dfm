object listForm: TlistForm
  Left = 259
  Top = 168
  Width = 925
  Height = 497
  Caption = 'listForm'
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
    Left = 552
    Top = 120
    Width = 105
    Height = 105
    Stretch = True
  end
  object GridD: TStringGrid
    Left = 24
    Top = 328
    Width = 137
    Height = 113
    DefaultColWidth = 10
    TabOrder = 0
    Visible = False
    OnDrawCell = GridDrawCell
  end
  object GridC: TStringGrid
    Left = 168
    Top = 384
    Width = 121
    Height = 65
    DefaultColWidth = 10
    TabOrder = 1
    Visible = False
    OnDrawCell = GridDrawCell
  end
  object Grid: TStringGrid
    Left = 8
    Top = 32
    Width = 513
    Height = 353
    DefaultColWidth = 10
    TabOrder = 2
    OnDblClick = GridDblClick
    OnDrawCell = GridDrawCell
    OnSelectCell = GridSelectCell
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 185
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'Edit1'
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 200
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 592
    Top = 24
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086
      OnClick = N1Click
    end
  end
end
