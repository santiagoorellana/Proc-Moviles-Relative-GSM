unit UCoincidenciasEntreDos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UBase, ActnList, Buttons;

type
  TFormCoincidenciasEntreDos = class(TForm)
    GroupBox1: TGroupBox;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    EditNumeroMovilA: TEdit;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    EditNumeroMovilB: TEdit;
    ActionList1: TActionList;
    ActionCerrar: TAction;
    ActionPegar: TAction;
    ActionBuscar: TAction;
    BitBtn1: TBitBtn;
    procedure EditNumeroMovilAKeyPress(Sender: TObject; var Key: Char);
    procedure EditNumeroMovilBKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCerrarExecute(Sender: TObject);
    procedure ActionPegarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionBuscarExecute(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FormCoincidenciasEntreDos: TFormCoincidenciasEntreDos;

implementation

uses Unit1;

{$R *.dfm}
//-----------------------------------------------------------------------------
// Filtra los caracteres que se introducen en el Edit.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasEntreDos.EditNumeroMovilAKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TFormCoincidenciasEntreDos.EditNumeroMovilBKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

//-----------------------------------------------------------------------------
// Ejecuta la búsqueda.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasEntreDos.ActionBuscarExecute(Sender: TObject);
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
        FormPrincipal.Buscar(CoincidenciasDeIMSI(EditNumeroMovilA.Text, EditNumeroMovilB.Text));
        FormPrincipal.Memo1.Clear;
        msg := 'Coincidencias en la base de datos del IMSI ' + EditNumeroMovilA.Text + ' con el IMSI ' + EditNumeroMovilB.Text;
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     tIMEI:
        begin
        FormPrincipal.Buscar(CoincidenciasDeIMEI(EditNumeroMovilA.Text, EditNumeroMovilB.Text));
        FormPrincipal.Memo1.Clear;
        msg := 'Coincidencias en la base de datos del IMEI ' + EditNumeroMovilA.Text + ' con el IMEI ' + EditNumeroMovilB.Text;
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     else Exit;
     end;
Close;
end;

//-----------------------------------------------------------------------------
// Cierra el formulario.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasEntreDos.ActionCerrarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Pega el texto del portapapeles en el Exit.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasEntreDos.ActionPegarExecute(Sender: TObject);
begin
try
   with EditNumeroMovilA do if Focused then PasteFromClipboard;
   with EditNumeroMovilB do if Focused then PasteFromClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Inicia el formulario.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasEntreDos.FormCreate(Sender: TObject);
begin
ComboBoxTipo.ItemIndex := 0;
ClientHeight := GroupBox3.Top + GroupBox3.Height + 8;
ClientWidth := GroupBox3.Left + GroupBox3.Width + 8;
end;


end.
