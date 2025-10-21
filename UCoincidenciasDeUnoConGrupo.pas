unit UCoincidenciasDeUnoConGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UBase, ActnList, Buttons;

type
  TFormCoincidenciasConGrupo = class(TForm)
    GroupBox1: TGroupBox;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    EditNumeroMovilA: TEdit;
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
    ActionMostrarCoincidencias: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
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
    procedure ActionMostrarCoincidenciasExecute(Sender: TObject);
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
  FormCoincidenciasConGrupo: TFormCoincidenciasConGrupo;

implementation

uses Unit1;

{$R *.dfm}

//-----------------------------------------------------------------------------
// Filtra los caracteres que se introducen en el Edit.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.EditNumeroMovilAKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TFormCoincidenciasConGrupo.EditParaInsertarKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

//-----------------------------------------------------------------------------
// Agrega un nuevo número a la lista.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionAgregarExecute(Sender: TObject);
begin
if EditParaInsertar.Text <> '' then
   ListBoxGrupo.Items.Add(FiltrarNumeros(EditParaInsertar.Text));
EditParaInsertar.Text := '';
end;

//-----------------------------------------------------------------------------
// Para hacer salvas en ficheros del grupo.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionCargarExecute(Sender: TObject);
begin
if OpenDialog1.Execute then
   ListBoxGrupo.Items.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFormCoincidenciasConGrupo.ActionGuardarExecute(Sender: TObject);
begin
if SaveDialog1.Execute then
   ListBoxGrupo.Items.SaveToFile(SaveDialog1.FileName);
end;

//-----------------------------------------------------------------------------
// Para borrar elementos del grupo. 
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionBorrarSeleccionExecute(Sender: TObject);
begin
ListBoxGrupo.Items.Delete(ListBoxGrupo.ItemIndex);
end;

procedure TFormCoincidenciasConGrupo.ActionBorrarTodoExecute(Sender: TObject);
begin
ListBoxGrupo.Clear;
end;

//-----------------------------------------------------------------------------
// Cierra el diálogo.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionCerrarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Ejecuta la búsqueda.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionContabilizarCoincidenciasExecute(Sender: TObject);
var msg: String;
    n: Integer;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
if ListBoxGrupo.Items.Count = 0 then Exit;
case ComboBoxTipo.ItemIndex of
     tIMSI:
        begin
        FormPrincipal.Buscar(CantidadDeCoincidenciasConGrupoDeIMSI(EditNumeroMovilA.Text, ListBoxGrupo.Items));
        FormPrincipal.Memo1.Clear;
        msg := '';
        For n := 0 to ListBoxGrupo.Items.Count - 1 do
            msg := msg + ' ' + ListBoxGrupo.Items[n] + ',';
        msg := Copy(msg, 1, Length(msg) - 1);
        msg := 'Cantidad de coincidencias en la base de datos del IMSI ' + EditNumeroMovilA.Text + ' con los IMSI' + msg;
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     tIMEI:
        begin
        FormPrincipal.Buscar(CantidadDeCoincidenciasConGrupoDeIMEI(EditNumeroMovilA.Text, ListBoxGrupo.Items));
        FormPrincipal.Memo1.Clear;
        msg := '';
        For n := 0 to ListBoxGrupo.Items.Count - 1 do
            msg := msg + ' ' + ListBoxGrupo.Items[n] + ',';
        msg := Copy(msg, 1, Length(msg) - 1);
        msg := 'Cantidad de coincidencias en la base de datos del IMEI ' + EditNumeroMovilA.Text + ' con los IMEI' + msg;
        FormPrincipal.Memo1.Lines.Add(msg);
        end;
     else Exit;
     end;
Close;
end;

procedure TFormCoincidenciasConGrupo.ActionMostrarCoincidenciasExecute(Sender: TObject);
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
if ListBoxGrupo.Items.Count = 0 then Exit;
case ComboBoxTipo.ItemIndex of
     tIMSI: FormPrincipal.Buscar(CoincidenciasConGrupoDeIMSI(EditNumeroMovilA.Text, ListBoxGrupo.Items));
     tIMEI: FormPrincipal.Buscar(CoincidenciasConGrupoDeIMEI(EditNumeroMovilA.Text, ListBoxGrupo.Items));
     else Exit;
     end;
Close;
end;

//-----------------------------------------------------------------------------
// Pega en el Edit el texto del portapapeles.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionPegarExecute(Sender: TObject);
begin
try
   with EditNumeroMovilA do if Focused then PasteFromClipboard;
   with EditParaInsertar do if Focused then PasteFromClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Copia el texto de los edits.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.ActionCopiarExecute(Sender: TObject);
begin
try
   with EditNumeroMovilA do if Focused then CopyToClipboard;
   with EditParaInsertar do if Focused then CopyToClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Inicia el formulario.
//-----------------------------------------------------------------------------
procedure TFormCoincidenciasConGrupo.FormCreate(Sender: TObject);
begin
ComboBoxTipo.ItemIndex := 0;
ClientHeight := GroupBox3.Top + GroupBox3.Height + 8;
ClientWidth := GroupBox5.Left + GroupBox5.Width + 8;
end;


end.
