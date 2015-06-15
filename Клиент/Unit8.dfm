object listForm: TlistForm
  Left = 350
  Top = 220
  Width = 925
  Height = 480
  Caption = 'listForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GridD: TStringGrid
    Left = 24
    Top = 304
    Width = 137
    Height = 113
    DefaultColWidth = 10
    TabOrder = 0
    OnDrawCell = GridDrawCell
  end
  object GridC: TStringGrid
    Left = 168
    Top = 352
    Width = 121
    Height = 65
    DefaultColWidth = 10
    TabOrder = 1
    OnDrawCell = GridDrawCell
  end
  object Grid: TStringGrid
    Left = 8
    Top = 16
    Width = 513
    Height = 353
    DefaultColWidth = 10
    TabOrder = 2
    OnDblClick = GridDblClick
    OnDrawCell = GridDrawCell
    OnSelectCell = GridSelectCell
  end
  object Button1: TButton
    Left = 240
    Top = 376
    Width = 89
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
