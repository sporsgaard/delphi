object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 852
    Height = 43
    Align = alBottom
    TabOrder = 0
    object bAdd: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'bAdd'
      TabOrder = 0
      OnClick = bAddClick
    end
    object bClear: TButton
      Left = 105
      Top = 8
      Width = 75
      Height = 25
      Caption = 'bClear'
      TabOrder = 1
      OnClick = bClearClick
    end
    object bSet2: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'bSet2'
      TabOrder = 2
      OnClick = bSet2Click
    end
    object bDel2: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = 'bDel2'
      TabOrder = 3
      OnClick = bDel2Click
    end
  end
end
