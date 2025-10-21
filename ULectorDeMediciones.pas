unit ULectorDeMediciones;

interface

uses Ubase;

//-----------------------------------------------------------------------------
// Nombre de los campos del fichero de levantamiento TXT.
//-----------------------------------------------------------------------------
const C_Fuente         = 'Fuente';
const C_Prioridad      = 'Prioridad';
const C_Estado         = 'Estado';
const C_Prohibiciones  = 'Prohibiciones';
const C_NumUsuario     = 'Num.usuario';
const C_IMEI           = 'IMEI';
const C_Modelo         = 'Modelo';
const C_IMSI           = 'IMSI';
const C_TMSI           = 'TMSI';
const C_RD             = 'R/D';
const C_T              = 'T';

//-----------------------------------------------------------------------------
type TDatosDeMoviles = record
                       IMEI: String;            //Guarda el IMEI del teléfono.
                       IMSI: String;            //Guarda el IMSI del teléfono.
                       end;

type TFormatoDelFichero = record
                          InicioDelCampoIMEI: Integer;
                          InicioDelCampoIMSI: Integer;

                          LongitudDelCampoIMEI: Integer;
                          LongitudDelCampoIMSI: Integer;
                          end;

type TMoviles = Array of TDatosDeMoviles;

procedure LeerFichero(Nombre: String; var Moviles: TMoviles);
                          
implementation

uses SysUtils;

//-----------------------------------------------------------------------------
// A partir de la línea que contiene los nombres de los campos
// de la tabla del fichero, esta función determina la estructura
// del fichero y devuelve en una estructura las direcciones de
// inicio de cada campo, así como su longitud máxima.
// Esto solo se aplica para los ficheros devueltos por el hardware.
//-----------------------------------------------------------------------------
function CaracterizarFichero(LineaDeCampos: String): TFormatoDelFichero;
begin
Result.InicioDelCampoIMEI := Pos(C_IMEI, LineaDeCampos);
Result.LongitudDelCampoIMEI := Pos(C_Modelo, LineaDeCampos) - Result.InicioDelCampoIMEI;

Result.InicioDelCampoIMSI := Pos(C_IMSI, LineaDeCampos);
Result.LongitudDelCampoIMSI := Pos(C_TMSI, LineaDeCampos) - Result.InicioDelCampoIMSI;
end;

//-----------------------------------------------------------------------------
// Copia los datos de los campos de interés y los devuelve en una estructura.
//-----------------------------------------------------------------------------
function LeerFila(Linea: String; Formato: TFormatoDelFichero): TDatosDeMoviles;
begin
with Formato do
     begin
     Result.IMEI := FiltrarNumeros(Copy(Linea, InicioDelCampoIMEI, LongitudDelCampoIMEI));
     Result.IMSI := FiltrarNumeros(Copy(Linea, InicioDelCampoIMSI, LongitudDelCampoIMSI));
     end;
end;

//-----------------------------------------------------------------------------
// Lee los datos del fichero de medición (Levantamiento).
//-----------------------------------------------------------------------------
procedure LeerFichero(Nombre: String; var Moviles: TMoviles);
var Fila: String;
    Datos: TDatosDeMoviles;
    FormatoDelFichero: TFormatoDelFichero;
    Levantamiento: TextFile;
begin
SetLength(Moviles, 0);
if FileExists(Nombre) then                                       //Si el fichero indicado existe:
   try
      AssignFile(Levantamiento, Nombre);                         //Declara un fichero con el nombre del levantamiento.
      Reset(Levantamiento);                                      //Abre el fichero desde el dispositivo.
      Fila := '';                                                //Inicia la fila como cadena vacía.
      while Fila = '' do Readln(Levantamiento, Fila);            //Lee desde la primera linea del fichero hasta encontrar texto.
      FormatoDelFichero := CaracterizarFichero(Fila);            //Reconoce el formato del fichero.
      while not Eof(Levantamiento) do                            //Mientras haya datos que leer del fichero:
            begin
            Readln(Levantamiento, Fila);                         //Lee una linea del fichero.
            Datos := LeerFila(Fila, FormatoDelFichero);          //Parsea los datos de la String.
            if (Datos.IMEI <> '') and (Datos.IMSI <> '') then    //Si los datos no son nulos:
               begin
               SetLength(Moviles, Length(Moviles) + 1);          //Agranda el arreglo de resultados y
               Moviles[Length(Moviles) - 1] := Datos;            //le coloca un dato de móvil al final.
               end;
            end;
      CloseFile(Levantamiento);                                  //Cerramos el fichero del levantamiento.
   except
      Abort;
   end;
end;


end.
