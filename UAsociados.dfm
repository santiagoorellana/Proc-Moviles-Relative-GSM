object FormAsociados: TFormAsociados
  Left = 191
  Top = 114
  Width = 348
  Height = 247
  BorderStyle = bsSizeToolWin
  Caption = 'Asociaci'#243'n entre l'#237'neas y dispositivos'
  Color = clBtnFace
  Constraints.MinHeight = 247
  Constraints.MinWidth = 348
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    340
    213)
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 76
    Height = 41
    Caption = 'Tipo'
    TabOrder = 0
    DesignSize = (
      76
      41)
    object ComboBoxTipo: TComboBox
      Left = 4
      Top = 15
      Width = 68
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = 'IMSI'
      Items.Strings = (
        'IMSI'
        'IMEI')
    end
  end
  object GroupBox2: TGroupBox
    Left = 82
    Top = 4
    Width = 165
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'N'#250'mero del m'#243'vil'
    TabOrder = 1
    DesignSize = (
      165
      41)
    object EditNumero: TEdit
      Left = 4
      Top = 15
      Width = 157
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = EditNumeroKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 48
    Width = 332
    Height = 161
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Funcionamiento'
    TabOrder = 2
    DesignSize = (
      332
      161)
    object Label1: TLabel
      Left = 5
      Top = 17
      Width = 322
      Height = 138
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'Busca las asociaciones entre los dispositivos (IMEI) y las l'#237'nea' +
        's (IMSI). Permite obtener las l'#237'neas (IMSI) que ha tenido el dis' +
        'positivo (IMEI) especificado. Tambi'#233'n permite obtener los dispos' +
        'itivos (IMEI) que se han utilizado con la l'#237'nea (IMSI) especific' +
        'ada.'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 251
    Top = 12
    Width = 83
    Height = 30
    Action = ActionBuscar
    Anchors = [akTop, akRight]
    Caption = 'Buscar'
    TabOrder = 3
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000800000008000000080000000800000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00008000000080000000800000008000000080000000800000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000800000008000000080000000800000008000000080000000800000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00008000000080000000800000FF00FF000080000000800000008000000080
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      00000080000000800000FF00FF00FF00FF00FF00FF0000800000008000000080
      000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008000000080
      00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00008000000080
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      00000080000000800000FF00FF00FF00FF00FF00FF00FF00FF0000800000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00008000000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF000080000000800000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000080000000800000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000080000000800000}
  end
  object ActionList1: TActionList
    Images = FormPrincipal.ImageList1
    Left = 44
    Top = 104
    object ActionCerrar: TAction
      Caption = 'Cerrar'
      ShortCut = 27
      OnExecute = ActionCerrarExecute
    end
    object ActionPegar: TAction
      Caption = 'Pegar'
      ShortCut = 16470
      OnExecute = ActionPegarExecute
    end
    object ActionBuscar: TAction
      Caption = 'Buscar'
      Hint = 'Buscar'
      ImageIndex = 31
      OnExecute = ActionBuscarExecute
    end
  end
end
