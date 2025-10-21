unit UOcurrenciasDeLosMovilesDeLaMedicion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UBase, ActnList, Spin, Buttons;

type
  TFormOcurrenciasEnLaMedicion = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    ActionList1: TActionList;
    ActionCerrar: TAction;
    ActionPegar: TAction;
    GroupBox4: TGroupBox;
    SpinEdit1: TSpinEdit;
    ActionMostrar: TAction;
    ActionContar: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure EditNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCerrarExecute(Sender: TObject);
    procedure ActionPegarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionMostrarExecute(Sender: TObject);
    procedure ActionContarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOcurrenciasEnLaMedicion: TFormOcurrenciasEnLaMedicion;

implementation

uses Unit1;

{$R *.dfm}


//-----------------------------------------------------------------------------
// Filtra los caracteres que se introducen en el Edit.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.EditNumeroKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then Key := #0;
end;

//-----------------------------------------------------------------------------
// Cierra el formulario.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.ActionCerrarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Pega el texto del portapapeles en el Exit.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.ActionPegarExecute(Sender: TObject);
begin
try
   with SpinEdit1 do if Focused then PasteFromClipboard;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Inicia el formulario.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.FormCreate(Sender: TObject);
begin
ClientHeight := GroupBox3.Top + GroupBox3.Height + 8;
ClientWidth := GroupBox3.Left + GroupBox3.Width + 8;
end;

//-----------------------------------------------------------------------------
// Muestra las coincidencias de los móviles de la medición.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.ActionMostrarExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
FormPrincipal.Buscar(MostrarTodasLasOcurrenciasDeLosMovilesDeLaMedicion(SpinEdit1.Value));
FormPrincipal.Memo1.Clear;
msg := 'Ocurrencias en la base de datos de cada uno de los móviles de la medición ' + IntToStr(SpinEdit1.Value);
FormPrincipal.Memo1.Lines.Add(msg);
Close;
end;

//-----------------------------------------------------------------------------
// Contabiliza las coincidencias de los móviles de la medición.
//-----------------------------------------------------------------------------
procedure TFormOcurrenciasEnLaMedicion.ActionContarExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end;
FormPrincipal.Buscar(TodasLasOcurrenciasDeLosMovilesDeLaMedicionIMSI(SpinEdit1.Value));
FormPrincipal.Memo1.Clear;
msg := 'Cantidad de ocurrencias en la base de datos de cada uno de los móviles de la medición ' + IntToStr(SpinEdit1.Value);
FormPrincipal.Memo1.Lines.Add(msg);
Close;
end;

end.
