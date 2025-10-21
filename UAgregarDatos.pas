unit UAgregarDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, Buttons, ActnList, ADODB, UBase;

type
  TFormAgregarDatos = class(TForm)
    EditLugar: TEdit;
    SpinEditMedicion: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePickerFecha: TDateTimePicker;
    DateTimePickerHora: TDateTimePicker;
    EditObservaciones: TEdit;
    Label6: TLabel;
    EditFicheroDeMediciones: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    ActionCancelar: TAction;
    ActionAgregar: TAction;
    ActionSeleccionar: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionAgregarExecute(Sender: TObject);
    procedure ActionSeleccionarExecute(Sender: TObject);
  private
    function AgregarDatos(Medicion: Integer; Fecha: TDate; Hora: TTime; Lugar: String; Observacion: String; Fichero: String): Boolean;
  public
    { Public declarations }
  end;

var
  FormAgregarDatos: TFormAgregarDatos;

implementation

uses Unit1, ULectorDeMediciones;

{$R *.dfm}

//-----------------------------------------------------------------------------
// Selecciona el fichero de mediciones del hardware.
//-----------------------------------------------------------------------------
procedure TFormAgregarDatos.ActionSeleccionarExecute(Sender: TObject);
begin
if OpenDialog1.Execute then
   EditFicheroDeMediciones.Text := OpenDialog1.FileName;
end;

//-----------------------------------------------------------------------------
procedure TFormAgregarDatos.ActionCancelarExecute(Sender: TObject);
begin
Close;
end;

//-----------------------------------------------------------------------------
// Agrega los datos a la Base de Datos.
//-----------------------------------------------------------------------------
function TFormAgregarDatos.AgregarDatos(Medicion: Integer;
                                        Fecha: TDate;
                                        Hora: TTime;
                                        Lugar: String;
                                        Observacion: String;
                                        Fichero: String
                                        ): Boolean;
var Movil: TMoviles;
    n: Integer;
begin
//Agrega los datos en las tablas de Móviles detectados y Mediciones.
SetLength(Movil, 1);
LeerFichero(Fichero, Movil);
if Length(Movil) > 0 then
   begin
   //Agrega los datos en la tabla de Mediciones.
   with FormPrincipal do
        if FormPrincipal.ADOQuery1.CanModify then                   //Si se puede modificar el registro.
           try
              ADOQuery1.SQL.Text := TablaDeMediciones;              //Crea una consulta SQL para obtener la tabla de mediciones.
              ADOQuery1.Open;                                       //Ejecuta la consulta.
              ADOQuery1.Last;                                       //Se coloca en el último registro.
              ADOQuery1.Edit;                                       //Ativa la edición.
              ADOQuery1.Append;                                     //Agrega un registro nuevo a la Base.

              ADOQuery1.Fields[0].Value := Medicion;                //Agrega el número de medición.
              ADOQuery1.Fields[1].Value := Lugar;                   //Pone el lugar de la medición.
              ADOQuery1.Fields[2].Value := DateToStr(Fecha);        //Agrega la fecha.
              ADOQuery1.Fields[3].Value := TimeToStr(Hora);         //Pone la hora.
              ADOQuery1.Fields[4].Value := Observacion;             //Pone la observación sobre la medición.

              ADOQuery1.Post;                                       //Guarda los cambios realizados.
           except
              Exit;                                                //Sale si ha ocurrido un error.
           end;
   Application.ProcessMessages;

   with FormPrincipal do
        if FormPrincipal.ADOQuery1.CanModify then                   //Si se puede modificar el registro.
           try
              ADOQuery1.SQL.Text := TablaDeMovilesDetectados;       //Crea una consulta SQL para obtener la tabla de los móviles.
              ADOQuery1.Open;                                       //Ejecuta la consulta.
              ADOQuery1.Last;                                       //Se coloca en el último registro.

              for n := 0 to Length(Movil) - 1 do                    //Por cada móvil detectado:
                  begin
                  ADOQuery1.Append;                                 //Agrega un registro nuevo a la Base.
                  ADOQuery1.Edit;                                   //Ativa la edición.
                  ADOQuery1.Fields[0].Value := Medicion;            //Agrega el número de medición.
                  ADOQuery1.Fields[1].Value := Movil[n].IMSI;       //Pone el IMSI del móvil.
                  ADOQuery1.Fields[2].Value := Movil[n].IMEI;       //Pone el IMEI del móvil.
                  ADOQuery1.Post;                                   //Guarda los cambios realizados.
                  StatusBar1.SimpleText := 'Agregando registro. Presione la tecla ESCAPE si desea abortar.';
                  Application.ProcessMessages;
                  if GetKeyState(VK_Escape) and 128 = 128 then break;
                  end;
           except
              Exit;                                                 //Sale si ha ocurrido un error.
           end;
   Application.ProcessMessages;

   Result := True;
   end;
end;

//-----------------------------------------------------------------------------
// Si los datos son correctos, los agrega a la Base de Datos.
//-----------------------------------------------------------------------------
procedure TFormAgregarDatos.ActionAgregarExecute(Sender: TObject);
begin
if FormPrincipal.ADOConnection1.Connected then
   begin
   if (EditLugar.Text <> '') and (EditFicheroDeMediciones.Text <> '') then
      if FileExists(EditFicheroDeMediciones.Text) then
         if AgregarDatos(SpinEditMedicion.Value,
                         DateTimePickerFecha.Date,
                         DateTimePickerHora.Time,
                         EditLugar.Text,
                         EditObservaciones.Text,
                         EditFicheroDeMediciones.Text
                         ) then
            Application.MessageBox('Los datos han sido agregados', '', MB_OK)
         else
            Application.MessageBox('Error agregando los datos', '', MB_OK);
   end
else   
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
Close;
end;


end.
