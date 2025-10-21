unit UBase;

interface

uses Classes, Graphics, DBGrids, ComCtrls, DB;

//-----------------------------------------------------------------------------
const tIMSI     = 0;
const tIMEI     = 1;
const tMedicion = 2;
const tLugar    = 3;

const clPaleGreen = TColor($CCFFCC);
const clPaleRed = TColor($CCCCFF);


type TTipoDeNumero = tIMSI..tIMEI;

type TTiposDeFichero = (TXT, CSV, XLS, HTML);

//-----------------------------------------------------------------------------
function FiltrarNumeros(Numero: String): String;

//Funciones que devuelven una consulta SQL.
function TablaDeMediciones: String;
function TablaDeMovilesDetectados: String;
function TablasCombinadas: String;

function OcurrenciasDeMedicion(n: Integer): String;
function OcurrenciasDeIMEI(n: String): String;
function OcurrenciasDeIMSI(n: String): String;
function OcurrenciasDeLugar(c: String): String;

function AsociadosDeIMSI(n: String): String;
function AsociadosDeIMEI(n: String): String;

function LevantamientosConOcurrenciaDeIMEI(n: String): String;
function LevantamientosConOcurrenciaDeIMSI(n: String): String;

function CoincidenciasDeIMEI(MA, MB: String): String;
function CoincidenciasDeIMSI(MA, MB: String): String;

function CoincidenciasConGrupoDeIMEI(MA: String; GM: TStrings): String;
function CoincidenciasConGrupoDeIMSI(MA: String; GM: TStrings): String;

function CantidadDeCoincidenciasConGrupoDeIMEI(MA: String; GM: TStrings): String;
function CantidadDeCoincidenciasConGrupoDeIMSI(MA: String; GM: TStrings): String;

function TodasLasCoincidenciasDeIMEI(MA: String; Umbral: Integer): String;
function TodasLasCoincidenciasDeIMSI(MA: String; Umbral: Integer): String;

function TodasLasOcurrenciasDeLosMovilesDeLaMedicionIMEI(Medicion: Integer): String;
function TodasLasOcurrenciasDeLosMovilesDeLaMedicionIMSI(Medicion: Integer): String;
function MostrarTodasLasOcurrenciasDeLosMovilesDeLaMedicion(Medicion: Integer): String;

function CoincidenciasEntreVariasMedicionesIMEI(Mediciones: TStrings): String;
function CoincidenciasEntreVariasMedicionesIMSI(Mediciones: TStrings): String;

implementation

uses SysUtils, StrUtils;

//-----------------------------------------------------------------------------
// Filtra una cadena dejando solo los números.
//-----------------------------------------------------------------------------
function FiltrarNumeros(Numero: String): String;
var n: Integer;
begin
Result := '';
if Length(Numero) > 0 then
   for n := 1 to Length(Numero) do
       if Numero[n] in ['0'..'9'] then
          Result := Result + Numero[n];
end;

//-----------------------------------------------------------------------------
// Muestra las tablas de manera independiente o la combinación de ambas.
//-----------------------------------------------------------------------------

function TablaDeMediciones: String;
begin
Result := 'SELECT * FROM Mediciones;';
end;

function TablaDeMovilesDetectados: String;
begin
Result := 'SELECT * FROM MovilesDetectados;';
end;

function TablasCombinadas: String;
begin
Result := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
          'FROM MovilesDetectados, Mediciones ' +
          'WHERE MovilesDetectados.Medicion = Mediciones.Medicion ' +
          'ORDER BY IMSI;'
end;

//-----------------------------------------------------------------------------
// Búsquedas de ocurrencias.
//-----------------------------------------------------------------------------

function OcurrenciasDeMedicion(n: Integer): String;
begin
Result := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
          'FROM MovilesDetectados, Mediciones ' +
          'WHERE Mediciones.Medicion = ' + IntToStr(n) + ' ' +
          'AND Mediciones.Medicion = MovilesDetectados.Medicion' +
          ';';
end;

function OcurrenciasDeIMEI(n: String): String;
begin
Result := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
          'FROM MovilesDetectados, Mediciones ' +
          'WHERE IMEI = ''' + n + ''' ' +
          'AND Mediciones.Medicion = MovilesDetectados.Medicion' +
          ';';
end;

function OcurrenciasDeIMSI(n: String): String;
begin
Result := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
          'FROM MovilesDetectados, Mediciones ' +
          'WHERE IMSI = ''' + n + ''' ' +
          'AND Mediciones.Medicion = MovilesDetectados.Medicion' +
          ';';
end;

function OcurrenciasDeLugar(c: String): String;
begin
c := '%' + AnsiReplaceStr(c, Chr($20), '%') + '%';
Result := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
          'FROM MovilesDetectados, Mediciones ' +
          'WHERE Lugar LIKE ''' + c + ''' ' +
          'AND Mediciones.Medicion = MovilesDetectados.Medicion' +
          ';';          
end;

//-----------------------------------------------------------------------------
// Pra buscar los IMEI asociados al IMSI especificado
// o los IMSI asociados al IMEI especificado.
//-----------------------------------------------------------------------------

function AsociadosDeIMEI(n: String): String;
var s: String;
begin
s := 'SELECT DISTINCT IMSI ' +
     'FROM MovilesDetectados ' +
     'WHERE  IMEI = ''' + n + ''';';
Result := s;
end;

function AsociadosDeIMSI(n: String): String;
var s: String;
begin
s := 'SELECT DISTINCT IMEI ' +
     'FROM MovilesDetectados ' +
     'WHERE  IMSI = ''' + n + ''';';
Result := s;
end;

//-----------------------------------------------------------------------------
// Obtiene una lista de los levantamientos en los que se encuentra
// el móvil especificado por IMEI o por IMSI.
//-----------------------------------------------------------------------------

function LevantamientosConOcurrenciaDeIMEI(n: String): String;
var s: String;
begin
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMEI = ''' + n + ''' ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY Mediciones.Medicion ASC';
Result := s;
end;

function LevantamientosConOcurrenciaDeIMSI(n: String): String;
var s: String;
begin
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMSI = ''' + n + ''' ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY Mediciones.Medicion ASC';
Result := s;
end;

//-----------------------------------------------------------------------------
// Coincidencias entre dos móviles.
//
// Devuelve los registros de los levantamientos en los que
// concurren los dos móviles especificados. Es decir, que
// se devuelven los datos de los levantamientos en los
// que se encuentra el móvil MA y el móvil MB, lo cual
// implica que ambos móviles estubieron el la misma
// zona de cobertura en el momento en que se realizó
// el levantamiento (lectura) con el hardware.
//-----------------------------------------------------------------------------

function CoincidenciasDeIMEI(MA, MB: String): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MB.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMEI = ''' + MB + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMEI = ''' + MA + ''' AND Mediciones.Medicion IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY Mediciones.Medicion ASC';
Result := s;
end;

function CoincidenciasDeIMSI(MA, MB: String): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MA.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMSI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MB,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMSI = ''' + MB + ''' AND Mediciones.Medicion IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY Mediciones.Medicion ASC';
Result := s;
end;

//-----------------------------------------------------------------------------
// Coincidencias entre un móvil y un grupo de móviles.
//
// Devuelve los registros de los levantamientos en los que
// concurren el móvil específico con alguno de los dos móviles
// especificados en la lista. Es decir, que se devuelven los
// datos de los levantamientos en los que se encuentra el móvil
// MA y alguno de los móviles de grupo de móviles GM.
//-----------------------------------------------------------------------------

function CoincidenciasConGrupoDeIMEI(MA: String; GM: TStrings): String;
var s, Lista, Grupo: String;
    n: Integer;
begin
if not Assigned(GM) then Exit;
if GM.Count = 0 then Exit;

//Crea la lista de los móviles con los que se
//desea realizar la comparación.
Grupo := '';
for n := 0 to GM.Count - 1 do
    Grupo := Grupo + '''' + GM[n] + ''',';
Grupo := Copy(Grupo, 0, Length(Grupo) - 1);

//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MB.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMEI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE  IMEI IN(' + Grupo + ') AND Mediciones.Medicion IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY IMEI, Mediciones.Medicion ASC';
Result := s;
end;

function CoincidenciasConGrupoDeIMSI(MA: String; GM: TStrings): String;
var s, Lista, Grupo: String;
    n: Integer;
begin
if not Assigned(GM) then Exit;
if GM.Count = 0 then Exit;

//Crea la lista de los móviles con los que se
//desea realizar la comparación.
Grupo := '';
for n := 0 to GM.Count - 1 do
    Grupo := Grupo + '''' + GM[n] + ''',';
Grupo := Copy(Grupo, 0, Length(Grupo) - 1);

//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MB.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMSI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMSI IN(' + Grupo + ') AND Mediciones.Medicion IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY IMSI, Mediciones.Medicion ASC';
Result := s;
end;

//-----------------------------------------------------------------------------
// Cantidad de coincidencias entre un móvil y un grupo de móviles.
//
// Devuelve la cantidad de coincidencias de los móviles específicados en
// en la lista con el móvi específico. Es decir, que se devuelven la
// cantidad de coincidencias de cada uno de los móviles del grupo de
// móviles GM con el móvil específico MA.
//-----------------------------------------------------------------------------

function CantidadDeCoincidenciasConGrupoDeIMEI(MA: String; GM: TStrings): String;
var s, Lista, Grupo: String;
    n: Integer;
begin
if not Assigned(GM) then Exit;
if GM.Count = 0 then Exit;

//Crea la lista de los móviles con los que se
//desea realizar la comparación.
Grupo := '';
for n := 0 to GM.Count - 1 do
    Grupo := Grupo + '''' + GM[n] + ''',';
Grupo := Copy(Grupo, 0, Length(Grupo) - 1);

//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MB.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMEI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT * ' +
     'FROM MovilesDetectados ' +
     'WHERE  IMEI IN(' + Grupo + ') AND Medicion IN(' + Lista + ') ' +
     'ORDER BY IMEI, Medicion ASC';

//Agrupa el resultado obtenido y cuenta las
//coincidencias por cada uno de los móviles.
s := 'SELECT IMEI, COUNT(IMEI) AS Coincidencias ' +
     'FROM (' + s + ') ' +
     'GROUP BY IMEI ' +
     'ORDER BY COUNT(IMEI) DESC';

Result := s;
end;

function CantidadDeCoincidenciasConGrupoDeIMSI(MA: String; GM: TStrings): String;
var s, Lista, Grupo: String;
    n: Integer;
begin
if not Assigned(GM) then Exit;
if GM.Count = 0 then Exit;

//Crea la lista de los móviles con los que se
//desea realizar la comparación.
Grupo := '';
for n := 0 to GM.Count - 1 do
    Grupo := Grupo + '''' + GM[n] + ''',';
Grupo := Copy(Grupo, 0, Length(Grupo) - 1);

//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MB.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMSI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT * ' +
     'FROM MovilesDetectados ' +
     'WHERE IMSI IN(' + Grupo + ') AND Medicion IN(' + Lista + ') ' +
     'ORDER BY IMSI, Medicion ASC';

//Agrupa el resultado obtenido y cuenta las
//coincidencias por cada uno de los móviles.
s := 'SELECT IMSI, COUNT(IMSI) AS Coincidencias ' +
     'FROM (' + s + ') ' +
     'GROUP BY IMSI ' +
     'ORDER BY COUNT(IMSI) DESC';

Result := s;
end;

//-----------------------------------------------------------------------------
// Muestra todos los móviles que coinciden con el móvil especificado
// y los ordena de mayor a menor según el número de coincidencias. 
//-----------------------------------------------------------------------------

function TodasLasCoincidenciasDeIMEI(MA: String; Umbral: Integer): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MA.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMEI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT * ' +
     'FROM MovilesDetectados ' +
     'WHERE Medicion IN(' + Lista + ') ' +
     'ORDER BY IMEI, Medicion ASC';

//Agrupa el resultado obtenido y cuenta las
//coincidencias por cada uno de los móviles.
s := 'SELECT IMEI, COUNT(IMEI) AS Coincidencias ' +
     'FROM (' + s + ') ' +
     'WHERE  IMEI <> ''' + MA + ''' ' +
     'GROUP BY IMEI ' +
     'ORDER BY COUNT(IMEI) DESC';

s := 'SELECT IMSI, Coincidencias ' +
     'FROM (' + s + ') ' +
     'WHERE  Coincidencias > ' + IntToStr(Umbral);

Result := s;
end;

function TodasLasCoincidenciasDeIMSI(MA: String; Umbral: Integer): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//levantamientos en los que aparece el móvil MA.
Lista := 'SELECT DISTINCT Medicion ' +
         'FROM MovilesDetectados ' +
         'WHERE IMSI = ''' + MA + ''' ' +
         'ORDER BY Medicion ASC';

//Esta consulta devuelve los registros del móvil MA,
//que coinciden con los levantamientos de la lista
//creada por la consulta anidada.
s := 'SELECT * ' +
     'FROM MovilesDetectados ' +
     'WHERE Medicion IN(' + Lista + ') ' +
     'ORDER BY IMSI, Medicion ASC';

//Agrupa el resultado obtenido y cuenta las
//coincidencias por cada uno de los móviles.
s := 'SELECT IMSI, COUNT(IMSI) AS Coincidencias ' +
     'FROM (' + s + ') ' +
     'WHERE  IMSI <> ''' + MA + ''' ' +
     'GROUP BY IMSI ' +
     'ORDER BY COUNT(IMSI) DESC';    

s := 'SELECT IMSI, Coincidencias ' +
     'FROM (' + s + ') ' +
     'WHERE  Coincidencias > ' + IntToStr(Umbral);

Result := s;
end;

//-----------------------------------------------------------------------------
// Muestra la cantidad de ocurrencias en la base de datos, por
// cada uno de los móviles del levantamiento especificado.
//-----------------------------------------------------------------------------

function TodasLasOcurrenciasDeLosMovilesDeLaMedicionIMEI(Medicion: Integer): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//móviles del levantamiento especificado.
Lista := 'SELECT DISTINCT IMEI ' +
         'FROM MovilesDetectados ' +
         'WHERE Medicion = ' + IntToStr(Medicion);

//Esta consulta devuelve los registros donde aparecen
//los móviles del levantamiento especificado.
s := 'SELECT IMEI ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMEI IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion';

//Agrupa el resultado obtenido y cuenta las
//ocurrencias por cada uno de los móviles.
s := 'SELECT IMEI, COUNT(IMEI) AS Ocurrencias ' +
     'FROM (' + s + ') GROUP BY IMEI ' +
     'ORDER BY COUNT(IMEI) DESC';

Result := s;
end;

function TodasLasOcurrenciasDeLosMovilesDeLaMedicionIMSI(Medicion: Integer): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//móviles del levantamiento especificado.
Lista := 'SELECT DISTINCT IMSI ' +
         'FROM MovilesDetectados ' +
         'WHERE Medicion = ' + IntToStr(Medicion);

//Esta consulta devuelve los registros donde aparecen
//los móviles del levantamiento especificado.
s := 'SELECT IMSI ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMSI IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion';

//Agrupa el resultado obtenido y cuenta las
//ocurrencias por cada uno de los móviles.
s := 'SELECT IMSI, COUNT(IMSI) AS Ocurrencias ' +
     'FROM (' + s + ') GROUP BY IMSI ' +
     'ORDER BY COUNT(IMSI) DESC';

Result := s;
end;

//-----------------------------------------------------------------------------
// Muestra las ocurrencias de cada uno de los móviles de las medición especificada.
//-----------------------------------------------------------------------------

function MostrarTodasLasOcurrenciasDeLosMovilesDeLaMedicion(Medicion: Integer): String;
var s, Lista: String;
begin
//Esta es la consulta que crea la lista de los
//móviles del levantamiento especificado.
Lista := 'SELECT DISTINCT IMSI ' +
         'FROM MovilesDetectados ' +
         'WHERE Medicion = ' + IntToStr(Medicion);

//Esta consulta devuelve los registros donde aparecen
//los móviles del levantamiento especificado.
s := 'SELECT Mediciones.Medicion, IMSI, IMEI, Fecha, Hora, Lugar, Observaciones ' +
     'FROM MovilesDetectados, Mediciones ' +
     'WHERE IMSI IN(' + Lista + ') ' +
     'AND Mediciones.Medicion = MovilesDetectados.Medicion ' +
     'ORDER BY IMSI, MovilesDetectados.Medicion';

Result := s;
end;

//-----------------------------------------------------------------------------
// Devuelve los móviles que se encuentran en las Mediciones especificadas.
// pone al lado de cada móvil la cantidad de veces que aparece en las mediciones.
//-----------------------------------------------------------------------------

function CoincidenciasEntreVariasMedicionesIMEI(Mediciones: TStrings): String;
var s, Ocurrencias, GrupoDeMediciones: String;
    n: Integer;
begin
if not Assigned(Mediciones) then Exit;
if Mediciones.Count = 0 then Exit;

//Crea la lista de las Mediciones especificadas.
GrupoDeMediciones := '';
for n := 0 to Mediciones.Count - 1 do
    GrupoDeMediciones := GrupoDeMediciones + Mediciones[n] + ',';
GrupoDeMediciones := Copy(GrupoDeMediciones, 0, Length(GrupoDeMediciones) - 1);

//Obtiene las ocurrencias de móviles en las mediciones especificadas.
Ocurrencias := 'SELECT IMEI ' +
               'FROM MovilesDetectados, Mediciones ' +
               'WHERE MovilesDetectados.Medicion IN(' + GrupoDeMediciones + ') ' +
               'AND Mediciones.Medicion = MovilesDetectados.Medicion';

//Cuenta las ocurrencias de cada móvil.
s := 'SELECT IMEI, COUNT(IMEI) AS Ocurrencias ' +
     'FROM (' + Ocurrencias + ') GROUP BY IMEI ' +
     'ORDER BY COUNT(IMEI) DESC';

Result := s;
end;

function CoincidenciasEntreVariasMedicionesIMSI(Mediciones: TStrings): String;
var s, Ocurrencias, GrupoDeMediciones: String;
    n: Integer;
begin
if not Assigned(Mediciones) then Exit;
if Mediciones.Count = 0 then Exit;

//Crea la lista de las Mediciones especificadas.
GrupoDeMediciones := '';
for n := 0 to Mediciones.Count - 1 do
    GrupoDeMediciones := GrupoDeMediciones + Mediciones[n] + ',';
GrupoDeMediciones := Copy(GrupoDeMediciones, 0, Length(GrupoDeMediciones) - 1);

//Obtiene las ocurrencias de móviles en las mediciones especificadas.
Ocurrencias := 'SELECT IMSI ' +
               'FROM MovilesDetectados, Mediciones ' +
               'WHERE MovilesDetectados.Medicion IN(' + GrupoDeMediciones + ') ' +
               'AND Mediciones.Medicion = MovilesDetectados.Medicion';

//Cuenta las ocurrencias de cada móvil.
s := 'SELECT IMSI, COUNT(IMSI) AS Ocurrencias ' +
     'FROM (' + Ocurrencias + ') GROUP BY IMSI ' +
     'ORDER BY COUNT(IMSI) DESC';

Result := s;
end;



end.




