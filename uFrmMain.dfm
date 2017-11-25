object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'CRUD'
  ClientHeight = 365
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlClient: TPanel
    Left = 0
    Top = 57
    Width = 726
    Height = 308
    Align = alClient
    TabOrder = 0
    ExplicitTop = 63
    object grdList: TDBGrid
      Left = 1
      Top = 1
      Width = 724
      Height = 306
      Align = alClient
      DataSource = dsList
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblName: TLabel
      Left = 72
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object lblId: TLabel
      Left = 8
      Top = 8
      Width = 10
      Height = 13
      Caption = 'Id'
    end
    object edtName: TEdit
      Left = 72
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = 'Name'
    end
    object btnInsert: TButton
      Left = 200
      Top = 24
      Width = 75
      Height = 21
      Caption = 'Insert'
      TabOrder = 1
      OnClick = btnInsertClick
    end
    object btnDelete: TButton
      Left = 360
      Top = 24
      Width = 75
      Height = 21
      Caption = 'Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnUpdate: TButton
      Left = 280
      Top = 24
      Width = 75
      Height = 21
      Caption = 'Update'
      TabOrder = 3
      OnClick = btnUpdateClick
    end
    object edtId: TEdit
      Left = 8
      Top = 24
      Width = 58
      Height = 21
      Enabled = False
      TabOrder = 4
      TextHint = 'Id'
    end
    object btnSelectId: TButton
      Left = 440
      Top = 24
      Width = 75
      Height = 21
      Caption = 'Select (Id)'
      TabOrder = 5
      OnClick = btnSelectIdClick
    end
    object btnSelectAll: TButton
      Left = 521
      Top = 24
      Width = 75
      Height = 21
      Caption = 'Select (All)'
      TabOrder = 6
      OnClick = btnSelectAllClick
    end
  end
  object dsList: TDataSource
    OnDataChange = dsListDataChange
    Left = 64
    Top = 128
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Normal')
    Left = 360
    Top = 192
  end
end
