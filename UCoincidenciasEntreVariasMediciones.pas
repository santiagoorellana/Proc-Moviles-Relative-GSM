unit UCoincidenciasEntreVariasMediciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UBase, ActnList, Buttons;

type
  TFormOcurrenciasEntreVariasMediciones = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    GroupBox5: TGroupBox;
    ListBoxGrupo: TListBox;
    EditParaInsertar: TEdit;
    BitBtn1: TBitBtn;
    ActionList1: TActionList;
    ActionAgregar: TAction;
    ActionCargar: TAction;
    ActionGuardar: TAction;
    ActionBorrarTodo: TAction;
    ActionContabilizarCoincidencias: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ActionCerrar: TAction;
    ActionBorrarSeleccion: TAction;
    ActionPegar: TAction;
    ActionCopiar: TAction;
    procedure EditNumeroMovilAKeyPress(Sender: TObject; var Key: Char);
    procedure ActionAgregarExecute(Sender: TObject);
    procedure ActionCargarExecute(Sender: TObject);
    procedure ActionGuardarExecute(Sender: TObject);
    procedure ActionBorrarTodoExecute(Sender: TObject);
    procedure ActionContabilizarCoincidenciasExecute(Sender: TObject);
    procedure EditParaInsertarKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCerrarExecute(Sender: TObject);
    procedure ActionBorrarSeleccionExecute(Sender: TObject);
    procedure ActionPegarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCopiarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOcurrenciasEntreVariasMediciones: TFormOcurrenciasEntreVariasMediciones;

implementation

uses Unit1;

{$R *.dfm}

//-----------------------------------------------------------------------------
// Filtra los caracteres que se introducen en el Edit.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.EditNumeroMovilAKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TFormOcurrenciasEntreVariasMediciones.EditParaInsertarKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

//-----------------------------------------------------------------------------
// Agrega un nuevo número a la lista.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionAgregarExecute(Sender: TObject);
begin
if EditParaInsertar.Text <> '' then
   ListBoxGrupo.Items.Add(FiltrarNumeros(EditParaInsertar.Text));
EditParaInsertar.Text := '';
end;

//-----------------------------------------------------------------------------
// Para hacer salvas en ficheros del grupo.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionCargarExecute(Sender: TObject);
begin
if OpenDialog1.Execute then
   ListBoxGrupo.Items.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFormOcurrenciasEntreVariasMediciones.ActionGuardarExecute(Sender: TObject);
begin
if SaveDialog1.Execute then
   ListBoxGrupo.Items.SaveToFile(SaveDialog1.FileName);
end;

//-----------------------------------------------------------------------------
// Para borrar elementos del grupo. 
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionBorrarSeleccionExecute(Sender: TObject);
begin
ListBoxGrupo.Items.Delete(ListBoxGrupo.ItemIndex);
end;

procedure TFormOcurrenciasEntreVariasMediciones.ActionBorrarTodoExecute(Sender: TObject);
begin
ListBoxGrupo.Clear;
end;

//-----------------------------------------------------------------------------
// Cierra el diálogo.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionCerrarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Ejecuta la búsqueda.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionContabilizarCoincidenciasExecute(Sender: TObject);
var msg: String;
    n: Integer;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
if ListBoxGrupo.Items.Count = 0 then Exit;
FormPrincipal.Buscar(CoincidenciasEntreVariasMedicionesIMSI(ListBoxGrupo.Items));
FormPrincipal.Memo1.Clear;
msg := '';
For n := 0 to ListBoxGrupo.Items.Count - 1 do
    msg := msg + ' ' + ListBoxGrupo.Items[n] + ',';
msg := Copy(msg, 1, Length(msg) - 1);    
msg := 'Ocurrencias de cada uno de los móviles de las mediciones' + msg;
FormPrincipal.Memo1.Lines.Add(msg);
msg := 'Muestra la cantidad de ocurrencias de cada móvil de las mediciones especificadas.';
FormPrincipal.Memo1.Lines.Add(msg);
Close;
end;

//-----------------------------------------------------------------------------
// Pega en el Edit el texto del portapapeles.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionPegarExecute(Sender: TObject);
begin
try
   with EditParaInsertar do if Focused then PasteFromClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Copia el texto de los edits.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.ActionCopiarExecute(Sender: TObject);
begin
try
   with EditParaInsertar do if Focused then CopyToClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Inicia el formulario.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEntreVariasMediciones.FormCreate(Sender: TObject);
begin
//ClientHeight := GroupBox3.Top + GroupBox3.Height + 8;
//ClientWidth := GroupBox5.Left + GroupBox5.Width + 8;
end;


end.
