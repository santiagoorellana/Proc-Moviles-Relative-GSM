object FormLevantamientosConOcurrenciaDeMovil: TFormLevantamientosConOcurrenciaDeMovil
  Left = 191
  Top = 114
  BorderStyle = bsToolWindow
  Caption = 'Mediciones con ocurrencia de:'
  ClientHeight = 125
  ClientWidth = 340
  Color = clBtnFace
  Constraints.MinHeight = 159
  Constraints.MinWidth = 348
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    340
    125)
  PixelsPerInch = 96
  TextHeight = 13
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
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
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
    Width = 177
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'N'#250'mero del m'#243'vil'
    TabOrder = 1
    DesignSize = (
      177
      41)
    object EditNumero: TEdit
      Left = 4
      Top = 15
      Width = 169
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = EditNumeroKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 48
    Width = 332
    Height = 73
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Funcionamiento'
    TabOrder = 2
    DesignSize = (
      332
      73)
    object Label1: TLabel
      Left = 5
      Top = 17
      Width = 322
      Height = 50
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'Devuelve una lista con las mediciones en las que aparece el m'#243'vi' +
        'l especificado. '
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
    Left = 261
    Top = 10
    Width = 74
    Height = 33
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
    Left = 28
    Top = 72
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
