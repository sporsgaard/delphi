object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 411
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 1078
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bCreate: TButton
      Left = 16
      Top = 8
      Width = 169
      Height = 25
      Caption = 'Create new Text panel'
      TabOrder = 0
      OnClick = bCreateClick
    end
    object bDel1: TButton
      Left = 191
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete #1'
      TabOrder = 1
      OnClick = bDel1Click
    end
    object bDel2: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete #2'
      TabOrder = 2
      OnClick = bDel2Click
    end
    object bDel3: TButton
      Left = 353
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete #3'
      TabOrder = 3
      OnClick = bDel3Click
    end
    object bDel4: TButton
      Left = 434
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Delete #4'
      TabOrder = 4
      OnClick = bDel4Click
    end
    object bTabCtrl: TButton
      Left = 536
      Top = 6
      Width = 75
      Height = 25
      Caption = 'bTabCtrl'
      TabOrder = 5
      OnClick = bTabCtrlClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1078
    Height = 370
    Align = alClient
    TabOrder = 1
  end
end
