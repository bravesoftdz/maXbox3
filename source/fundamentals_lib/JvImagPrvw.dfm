object ImageForm: TImageForm
  Left = 201
  Top = 98
  ActiveControl = FileEdit
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select Image'
  ClientHeight = 367
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00044444444400000000000000000000444F7777777744440000000000000044
    7F7F77777777787844000000000004777F7F7777777778788840000000000477
    7F7F97777777787888400000000004777F7F7977777778788840000000000477
    7F7F79117777787888400000000004777F7F7991177778788840000000000477
    7F7F77F91177787888400000000004777F7F779F917778788840000000000477
    7F7F77799907787888400000000004777F7F7777700078788840000000000477
    7F7F77777700087888400000000004777F7F7777777030788840000000000477
    7F7F77779977030988400000000004777F7F7777977770309840000000000477
    7F7E4444944477030840000000000477444E4444444444403040000000000444
    BB4E44444444444903000000000004B70B4E44444494444940300000000004B7
    0B4E44444994444998030000000004B704499999FFFF44499840300000000447
    011999999999FFF9984003000000048770119999999999998840003000000048
    7081111111999888844000030000000470088888888888444400000030000000
    0704444444444470000000000000000007000000000000000000000000000000
    0070000000000700000000000000000000070000000770000000000000000000
    000000777777000000000000000000000000000000000000000000000000FE00
    FFFFF0000FFFC00003FF800001FF800001FF800001FF800001FF800001FF8000
    01FF800001FF800001FF800001FF800001FF800001FF800001FF800001FF8000
    01FF800001FF800001FF800000FF8000007F8000003F8000011F8000018FC000
    01C7E00003E3F8000FF1F9FFDFFBFCFF9FFFFE7E3FFFFF007FFFFFC0FFFF0000}
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PathLabel: TLabel
    Left = 158
    Top = 27
    Width = 146
    Height = 15
    AutoSize = False
    Caption = 'D:\...\mx4_v38\mx4\source'
  end
  object ImageName: TLabel
    Left = 351
    Top = 13
    Width = 57
    Height = 13
    Caption = 'ImageName'
  end
  object Label2: TLabel
    Left = 8
    Top = 296
    Width = 81
    Height = 13
    Caption = 'List files of &type:  '
    FocusControl = FilterCombo
  end
  object Label3: TLabel
    Left = 158
    Top = 295
    Width = 36
    Height = 13
    Caption = 'Dri&ves: '
    FocusControl = DriveCombo
  end
  object Label4: TLabel
    Left = 4
    Top = 8
    Width = 54
    Height = 13
    Caption = 'File &name:  '
    FocusControl = FileEdit
  end
  object Label5: TLabel
    Left = 158
    Top = 8
    Width = 43
    Height = 13
    Caption = '&Folders:  '
    FocusControl = DirectoryList
  end
  object PreviewBtn: TSpeedButton
    Left = 562
    Top = 277
    Width = 34
    Height = 32
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF05710A14A82405710AFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A24B63C1CAF3005710A05710A05
      710A05710A05710A05710A05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A39C6592FBF4C27B7
      3F1FB13318AA2811A6200EA31B0EA31B0EA31B0EA31B05710AFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A4BD575
      44CF693BC85D32C14F29B94321B33618AC2B12A6220EA31B0EA31B0EA31B0571
      0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF05710A4ED77746D16C3DCA5F34C3532BBB4522B4391BAD2E14A824
      0FA31C0EA31B05710AFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
      D51C78D51C78D51C78D51C5996FF00FF05710A4FD87A48D26F05710A05710A05
      710A05710A05710A05710A05710A05710A1C78D51C78D5FF00FF1C78D5A7DAFF
      4EB3FE4CB1FE4AAFFF48ADFF46ABFF44A9FF1C5996FF00FFFF00FF05710A50D9
      7C05710AFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
      78D51C78D5A8DBFF50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C5996FF00FF
      FF00FFFF00FF05710A05710AFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
      FF3499FF3499FF1C78D51C78D5A9DCFF52B7FE50B5FE4EB3FE4CB1FE4AAFFF48
      ADFF1C5996FF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFE4F0FC3499FF
      3499FF3499FF3499FF3499FF3499FF1C78D51C78D5AADDFF54B9FE52B7FE50B5
      FE4EB3FE4CB1FE4AAFFF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C78D51C78D5ABDEFF
      56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE1C5996FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
      78D51C78D5ACDFFF58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C5996FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
      FF3499FF3499FF1C78D51C78D5ADE0FF5ABFFE58BDFE56BBFE54B9FE52B7FE50
      B5FE1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FCE4F0FC
      E4F0FCE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF398DCF388CCF378B
      CF368ACF3589CF3488CF1C59961C59961C59961C59961C59961C59961C59961C
      59961C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5AFE2FF
      5EC3FE5CC1FE5ABFFE58BDFE56BBFE54B9FE3488CF50B5FE4EB3FE4CB1FE4AAF
      FF48ADFF46ABFF44A9FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF1C78D5B0E2FF5FC4FE5EC3FE5CC1FE5ABFFE58BDFE56BBFE3589CF52B7FE
      50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C78D5FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE5FC4FE5DC2FE5CC1FE5ABFFE58
      BDFE368ACF54B9FE52B7FE50B5FE4EB3FE4CB1FE4AAFFF48ADFF1C78D5FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE61C6FE5FC4
      FE5DC2FE5BC0FE59BEFE378BCF56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE4A
      AFFF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF
      61C6FE61C6FE61C6FE5FC4FE5DC2FE5BC0FE388CCF58BDFE56BBFE54B9FE52B7
      FE50B5FE4EB3FE4CB1FE1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF1C78D5BAE6FF61C6FE61C6FE61C6FE61C6FE5FC4FE5DC2FE398DCF59BEFE
      58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C78D5FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF1C78D5E7F3FCBAE6FFB0E3FFB0E3FFB0E3FFB0E2FFAF
      E1FF629DCFADDFFFACDEFFABDEFFAADDFFA9DCFFA8DBFFA7DAFF1C78D5FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
      D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C
      78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    OnClick = PreviewBtnClick
  end
  object DirectoryList: TDirectoryListBox
    Left = 158
    Top = 51
    Width = 171
    Height = 212
    DirLabel = PathLabel
    FileList = FileListBox
    ItemHeight = 16
    TabOrder = 2
    OnChange = FileListBoxClick
  end
  object DriveCombo: TDriveComboBox
    Left = 158
    Top = 320
    Width = 171
    Height = 22
    DirList = DirectoryList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object FileEdit: TEdit
    Left = 4
    Top = 24
    Width = 146
    Height = 21
    TabOrder = 0
    Text = '*.bmp;*.ico;*.wmf'
  end
  object ImagePanel: TPanel
    Left = 350
    Top = 32
    Width = 246
    Height = 236
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 5
    object Image: TImage
      Left = 1
      Top = 1
      Width = 244
      Height = 234
      Align = alClient
      Center = True
      ExplicitLeft = 9
    end
  end
  object FileListBox: TFileListBox
    Left = 4
    Top = 51
    Width = 146
    Height = 212
    FileEdit = FileEdit
    FileType = [ftReadOnly, ftHidden, ftNormal]
    IntegralHeight = True
    ItemHeight = 16
    Mask = '*.bmp;*.ico;*.wmf'
    ShowGlyphs = True
    TabOrder = 1
    OnChange = FileListBoxChange
    OnClick = FileListBoxClick
    OnDblClick = FileListBoxDblClick
  end
  object FilterCombo: TFilterComboBox
    Left = 5
    Top = 320
    Width = 146
    Height = 21
    FileList = FileListBox
    Filter = 
      'Image Files (*.bmp, *.ico, *.wmf)|*.bmp;*.ico;*.wmf|Bitmap Files' +
      ' (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Metafiles (*.wmf)|*.wmf|All f' +
      'iles (*.*)|*.*'
    TabOrder = 3
    OnChange = FileListBoxClick
  end
  object StretchCheck: TCheckBox
    Left = 369
    Top = 278
    Width = 116
    Height = 15
    Caption = ' &Stretch '
    TabOrder = 6
    OnClick = StretchCheckClick
  end
  object OkBtn: TButton
    Left = 414
    Top = 320
    Width = 84
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 7
    OnClick = OkBtnClick
  end
  object CancelBtn: TButton
    Left = 513
    Top = 320
    Width = 84
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
end