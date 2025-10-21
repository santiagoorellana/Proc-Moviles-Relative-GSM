object FormCoincidenciasEntreDos: TFormCoincidenciasEntreDos
  Left = 329
  Top = 119
  Width = 535
  Height = 215
  BorderStyle = bsSizeToolWin
  Caption = 'Coincidencias entre dos m'#243'viles'
  Color = clBtnFace
  Constraints.MinHeight = 215
  Constraints.MinWidth = 535
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
    527
    181)
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
    Width = 180
    Height = 41
    Caption = 'N'#250'mero del m'#243'vil'
    TabOrder = 1
    DesignSize = (
      180
      41)
    object EditNumeroMovilA: TEdit
      Left = 4
      Top = 15
      Width = 172
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = EditNumeroMovilAKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 48
    Width = 519
    Height = 129
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Funcionamiento'
    TabOrder = 2
    DesignSize = (
      519
      129)
    object Label1: TLabel
      Left = 5
      Top = 17
      Width = 509
      Height = 106
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'Muestra las coincidencias entre dos dispositivos m'#243'viles, buscan' +
        'do la aparici'#243'n de ambos dispositivos en una misma medici'#243'n. El ' +
        'resultado es la lista de las mediciones en las que aparecen ambo' +
        's dispositivos, lo que significa que han estado en la misma zona' +
        ' de cobertura del hardware, en el mismo instante de tiempo.'
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
  object GroupBox4: TGroupBox
    Left = 266
    Top = 4
    Width = 177
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'N'#250'mero del m'#243'vil'
    TabOrder = 3
    DesignSize = (
      177
      41)
    object EditNumeroMovilB: TEdit
      Left = 4
      Top = 15
      Width = 169
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = EditNumeroMovilBKeyPress
    end
  end
  object BitBtn1: TBitBtn
    Left = 447
    Top = 10
    Width = 73
    Height = 33
    Action = ActionBuscar
    Anchors = [akTop, akRight]
    Caption = 'Buscar'
    TabOrder = 4
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
    Top = 80
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
