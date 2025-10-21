unit ULevantamientosConOcurrenciasDeMovil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UBase, ActnList, Buttons;

type
  TFormLevantamientosConOcurrenciaDeMovil = class(TForm)
    GroupBox1: TGroupBox;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    EditNumero: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    ActionList1: TActionList;
    ActionCerrar: TAction;
    ActionPegar: TAction;
    ActionBuscar: TAction;
    BitBtn1: TBitBtn;
    procedure EditNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCerrarExecute(Sender: TObject);
    procedure ActionPegarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionBuscarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLevantamientosConOcurrenciaDeMovil: TFormLevantamientosConOcurrenciaDeMovil;

implementation

uses Unit1;

{$R *.dfm}

//-----------------------------------------------------------------------------
// Filtra los caracteres que se introducen en el Edit.
//-----------------------------------------------------------------------------
procedure TFormLevantamientosConOcurrenciaDeMovil.EditNumeroKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

//-----------------------------------------------------------------------------
// Ejecuta la búsqueda.
//-----------------------------------------------------------------------------
procedure TFormLevantamientosConOcurrenciaDeMovil.ActionBuscarExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
case ComboBoxTipo.ItemIndex of
     tIMSI:
        begin
        FormPrincipal.Buscar(LevantamientosConOcurrenciaDeIMSI(EditNumero.Text));
        FormPrincipal.Memo1.Clear;
        msg := 'Ocurrencias del IMSI ' + EditNumero.Text + ' en la base de datos.';
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     tIMEI:
        begin
        FormPrincipal.Buscar(LevantamientosConOcurrenciaDeIMEI(EditNumero.Text));
        FormPrincipal.Memo1.Clear;
        msg := 'Ocurrencias del IMEI ' + EditNumero.Text + ' en la base de datos.';
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     else Exit;
     end;
Close;
end;

//-----------------------------------------------------------------------------
// Cierra el formulario.
//-----------------------------------------------------------------------------
procedure TFormLevantamientosConOcurrenciaDeMovil.ActionCerrarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Pega el texto del portapapeles en el Exit.
//-----------------------------------------------------------------------------
procedure TFormLevantamientosConOcurrenciaDeMovil.ActionPegarExecute(Sender: TObject);
begin
try
   with EditNumero do if Focused then PasteFromClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Inicia el formulario.
//-----------------------------------------------------------------------------
procedure TFormLevantamientosConOcurrenciaDeMovil.FormCreate(Sender: TObject);
begin
ComboBoxTipo.ItemIndex := 0;
ClientHeight := GroupBox3.Top + GroupBox3.Height + 8;
ClientWidth := GroupBox3.Left + GroupBox3.Width + 8;
end;


end.
