object FormOcurrencias: TFormOcurrencias
  Left = 341
  Top = 111
  Width = 390
  Height = 194
  BorderStyle = bsSizeToolWin
  Caption = 'B'#250'squeda de ocurrencias'
  Color = clBtnFace
  Constraints.MinHeight = 194
  Constraints.MinWidth = 390
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
    382
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 145
    Height = 41
    Caption = 'Buscar por'
    TabOrder = 0
    DesignSize = (
      145
      41)
    object ComboBoxTipo: TComboBox
      Left = 4
      Top = 15
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      Text = 'IMSI'
      Items.Strings = (
        'IMSI'
        'IMEI'
        'Medicion'
        'Lugar')
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 4
    Width = 154
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Valor a buscar'
    TabOrder = 1
    DesignSize = (
      154
      41)
    object EditNumero: TEdit
      Left = 4
      Top = 15
      Width = 146
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = EditNumeroKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 48
    Width = 374
    Height = 108
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Funcionamiento'
    TabOrder = 2
    DesignSize = (
      374
      108)
    object Label1: TLabel
      Left = 5
      Top = 17
      Width = 364
      Height = 85
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'Muestra todos los registros de la base de datos, en los que apar' +
        'ece una ocurrencia del n'#250'mero especificado. El n'#250'mero puede ser ' +
        'un IMEI, un IMSI o el N'#250'mero de Levantamiento.'
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
    Left = 310
    Top = 10
    Width = 69
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
