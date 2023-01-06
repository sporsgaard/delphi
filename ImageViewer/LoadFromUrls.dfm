object ViewFromUrls: TViewFromUrls
  Left = 0
  Top = 0
  Caption = 'ViewFromUrls'
  ClientHeight = 411
  ClientWidth = 513
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 513
    Height = 43
    Align = alBottom
    TabOrder = 0
    object cbActive: TCheckBox
      Left = 367
      Top = 8
      Width = 50
      Height = 17
      Caption = 'Active'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = cbActiveClick
    end
    object ebInterval: TLabeledEdit
      Left = 296
      Top = 6
      Width = 65
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Interval (ms) '
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 1
      OnExit = ebIntervalExit
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 5
      Width = 192
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 2
    end
    object bClose: TButton
      Left = 423
      Top = 6
      Width = 75
      Height = 21
      Caption = 'Close'
      TabOrder = 3
      OnClick = bCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 368
    Align = alClient
    TabOrder = 1
    ExplicitTop = -6
    ExplicitWidth = 579
    ExplicitHeight = 344
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 511
      Height = 263
      Align = alClient
      Proportional = True
      Stretch = True
      ExplicitLeft = 0
      ExplicitTop = 0
    end
    object sgImages: TStringGrid
      Left = 1
      Top = 264
      Width = 511
      Height = 103
      Align = alBottom
      ColCount = 3
      DefaultRowHeight = 18
      Enabled = False
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goFixedRowDefAlign]
      TabOrder = 0
      OnClick = sgImagesClick
      ExplicitTop = 240
      ExplicitWidth = 577
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 472
    Top = 16
  end
end
