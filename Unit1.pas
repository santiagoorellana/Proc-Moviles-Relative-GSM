unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, FMTBcd,
  SqlExpr, ADODB, StdCtrls, ComCtrls, ToolWin, ActnList, Menus, DBCtrls,
  ExtCtrls, ImgList, DBTables, Clipbrd, ComObj, UBase;

const Sep = ';';

type
  TFormPrincipal = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Inicio1: TMenuItem;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    OpenDialog2: TOpenDialog;
    ActionOcurrencias: TAction;
    ActionAsociaciones: TAction;
    ActionLevantamientosDondeAparece: TAction;
    ActionCoincidenciasEntreDos: TAction;
    ActionCoincidenciasConVarios: TAction;
    ActionTodasLasCoincidencias: TAction;
    Timer1: TTimer;
    Buscar1: TMenuItem;
    Asociacionesentrelineasydispositivos1: TMenuItem;
    Ocurrencias1: TMenuItem;
    Levantamientosdondeapareceelmvil1: TMenuItem;
    Coincidenciasentredosmviles1: TMenuItem;
    Cantiadadecoincidenciasdeunmvilconvarios1: TMenuItem;
    odaslascoincidenciasdeunmvil1: TMenuItem;
    ImageList1: TImageList;
    ActionCargarBD: TAction;
    Cargarbasededatos1: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ActionUtilizacion: TAction;
    ActionProcedencia: TAction;
    Ayuda1: TMenuItem;
    ActionProcedencia1: TMenuItem;
    Utilizacin1: TMenuItem;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ActionCopiarCelda: TAction;
    ActionMediciones: TAction;
    ActionMovilesDetectados: TAction;
    ActionTodosLosDatos: TAction;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton16: TToolButton;
    abladeMediciones1: TMenuItem;
    abladeMvilesDetectados1: TMenuItem;
    odoslosDatos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ActionGuardarComoTXT: TAction;
    Resultados1: TMenuItem;
    StatusBar1: TStatusBar;
    ActionGuardarComoCSV: TAction;
    GuardarcomoTXT1: TMenuItem;
    GuardarcomoCSV1: TMenuItem;
    ActionAgregarDatos: TAction;
    ActionCopiarTodo: TAction;
    Copiartodoalportapapeles1: TMenuItem;
    N5: TMenuItem;
    ActionGuardarComoXLS: TAction;
    GuardarcomoXLS1: TMenuItem;
    ActionGuardarComoHTML: TAction;
    GuardarcomoHTML1: TMenuItem;
    Agregardatosalabase1: TMenuItem;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton5: TToolButton;
    ActionContarRegistrosActuales: TAction;
    ToolButton12: TToolButton;
    Contarregistrosactuales1: TMenuItem;
    ActionOcurrenciasDeLosDeUnaMedicion: TAction;
    ActionCoincidenciasEntreMediciones: TAction;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    Coincidenciasentrevariasmediciones1: TMenuItem;
    Mostrarcoincidenciasdeunmvilconvarios1: TMenuItem;
    ActionVerColoresAlternados: TAction;
    ActionVerFilasConTextoSeleccionado: TAction;
    Ver1: TMenuItem;
    Vercoloresalternados1: TMenuItem;
    Verfilascontextoseleccionado1: TMenuItem;
    Memo1: TMemo;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    procedure ActionOcurrenciasExecute(Sender: TObject);
    procedure ActionAsociacionesExecute(Sender: TObject);
    procedure ActionLevantamientosDondeApareceExecute(Sender: TObject);
    procedure ActionCoincidenciasEntreDosExecute(Sender: TObject);
    procedure ActionCoincidenciasConVariosExecute(Sender: TObject);
    procedure ActionTodasLasCoincidenciasExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCargarBDExecute(Sender: TObject);
    procedure ActionUtilizacionExecute(Sender: TObject);
    procedure ActionProcedenciaExecute(Sender: TObject);
    procedure ActionCopiarCeldaExecute(Sender: TObject);
    procedure ActionMedicionesExecute(Sender: TObject);
    procedure ActionMovilesDetectadosExecute(Sender: TObject);
    procedure ActionTodosLosDatosExecute(Sender: TObject);
    procedure ActionGuardarComoCSVExecute(Sender: TObject);
    procedure ActionGuardarComoTXTExecute(Sender: TObject);
    procedure ActionAgregarDatosExecute(Sender: TObject);
    procedure ADOQuery1FetchProgress(DataSet: TCustomADODataSet; Progress,
      MaxProgress: Integer; var EventStatus: TEventStatus);
    procedure ActionCopiarTodoExecute(Sender: TObject);
    procedure ActionGuardarComoXLSExecute(Sender: TObject);
    procedure ActionGuardarComoHTMLExecute(Sender: TObject);
    procedure ActionOcurrenciasUpdate(Sender: TObject);
    procedure ActionContarRegistrosActualesExecute(Sender: TObject);
    procedure ActionOcurrenciasDeLosDeUnaMedicionExecute(Sender: TObject);
    procedure ActionCoincidenciasEntreMedicionesExecute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ActionVerColoresAlternadosExecute(Sender: TObject);
    procedure ActionVerFilasConTextoSeleccionadoExecute(Sender: TObject);
    procedure ActionVerColoresAlternadosUpdate(Sender: TObject);
    procedure ActionVerFilasConTextoSeleccionadoUpdate(Sender: TObject);
  private
    FilasLeidas: Integer;
    RutaParaLosResultados: String;

    //Para el coloreado de las filas del DBGrid.
    CampoSeleccionado: String;
    TextoSeleccionado: String;
    MostrarColoresAlternados: Boolean;
    MostrarFilasConTextoSeleccionado: Boolean;

    procedure ExtrearCamposDeMovil(Fila: String);
    procedure ExtrearCamposDeLevantamiento(Fila: String);
    function CrearCadenaDeConeccion(NombreRuta: String): String;
    procedure AgregarMovilesDetectados;
    procedure AgregarLevantamientosRealizados;

    procedure InsertarCelda(Stream: TStream; Columna, Fila: Integer; Valor: string);
    procedure GuardarResultados(Tipo: TTiposDeFichero);
    procedure GuardarFicheroDelimitado(DBGrid: TDBGrid; Nombre, Delimitador: String);
    procedure GuardarResultadosComoTXT(Nombre: String; Datos: TDBGrid);
    procedure GuardarResultadosComoCSV(Nombre: String; Datos: TDBGrid);
    procedure GuardarResultadosComoXLS(Nombre: String; Datos: TDBGrid);
    procedure GuardarResultadosComoHTML(Nombre: String; Datos: TDBGrid);
  public
    Anterior: String;
    procedure Buscar(Cadena: String);
  end;


var
  FormPrincipal: TFormPrincipal;

implementation

uses UOcurrencias, UAsociados, ULevantamientosConOcurrenciasDeMovil,
  UCoincidenciasEntreDos, UCoincidenciasDeUnoConGrupo, UContarTodaslasCoincidenciasDeMovil,
  UAgregarDatos, UProcedencia, UOcurrenciasDeLosMovilesDeLaMedicion,
  UCoincidenciasEntreVariasMediciones;

{$R *.dfm}

//-----------------------------------------------------------------------------
procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
//Desactiva el diálogo de autentificación que pone el MS Access.
ADOConnection1.LoginPrompt := False;

//DBComboBox1.DataField := 'IMEI';
FilasLeidas := 0;
Timer1.Enabled := False;

CampoSeleccionado := 'IMSI';
TextoSeleccionado := '';
MostrarColoresAlternados := True;
MostrarFilasConTextoSeleccionado := True;
end;

//-----------------------------------------------------------------------------
// Crea la cadena de conexión para la base de datos indicada.
// La base de datos debe ser de Microsoft Access con extensión MDB.
//-----------------------------------------------------------------------------
function TFormPrincipal.CrearCadenaDeConeccion(NombreRuta: String): String;
begin
Result := 'Provider=Microsoft.Jet.OLEDB.4.0;' +
          'User ID=Admin;' +
          'Password="";' +
          'Data Source=' + NombreRuta + ';' +
          'Mode=Share Deny None;' +
          'Extended Properties="";' +
          'Jet OLEDB:System database="";' +
          'Jet OLEDB:Registry Path="";' +
          'Jet OLEDB:Database Password="";' +
          'Jet OLEDB:Engine Type=5;' +
          'Jet OLEDB:Database Locking Mode=1;' +
          'Jet OLEDB:Global Partial Bulk Ops=2;' +
          'Jet OLEDB:Global Bulk Transactions=1;' +
          'Jet OLEDB:New Database Password="";' +
          'Jet OLEDB:Create System Database=False;' +
          'Jet OLEDB:Encrypt Database=False;' +
          'Jet OLEDB:Don''t Copy Locale on Compact=False;' +
          'Jet OLEDB:Compact Without Replica Repair=False;' +
          'Jet OLEDB:SFP=True;' +
          'Persist Security Info=True';
end;

//-----------------------------------------------------------------------------
// Extraer campos de la tabla CSV de móviles detectados.
//
// Devuelve un registro que contiene los datos extraidos de la
// cadena de texto "Fila" luego de ser parseada.
// Se utiliza para agregar datos a la tabla de móviles detectados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ExtrearCamposDeMovil(Fila: String);
var s: Integer;
    Medicion: String;
begin
if not ADOQuery1.CanModify then
   begin
   Application.MessageBox('No se pueden agregar datos a la tabla.', 'Error', MB_ICONERROR);
   Exit;
   end;
ADOQuery1.Edit;                                 //Ativa la edición.
ADOQuery1.Append;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   begin
   Medicion := Copy(Fila, 1, s - 1);           //Copia la cadena desde el inicio hasta el separador.
   Delete(Fila, 1, s);                         //Luego borra la cadena incluyendo al separador.
   try
      ADOQuery1.Fields[0].Value := StrToInt(FiltrarNumeros(Medicion));
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end;
   end;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   try
      ADOQuery1.Fields[1].Value := FiltrarNumeros(Copy(Fila, 1, s - 1));
      Delete(Fila, 1, s);
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end;

ADOQuery1.Fields[2].Value := FiltrarNumeros(Fila);
end;

//-----------------------------------------------------------------------------
// Extraer campos de la tabla CSV de levantamientos realizados (mediciones)
//
// Devuelve un registro que contiene los datos extraidos de la
// cadena de texto "Fila" luego de ser parseada.
// Se utiliza para agregar datos a la tabla de mediciones.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ExtrearCamposDeLevantamiento(Fila: String);
var s: Integer;
    Medicion: String;

    function Cambiar(cadena: String; Esto, EsteOtro: Char): String;
    var p: Integer;
    begin
    if Length(cadena) > 0 then
       for p := 1 to Length(cadena) do
           if cadena[p] = Esto then cadena[p] := EsteOtro;
    Result := cadena;
    end;

begin
if not ADOQuery1.CanModify then
   begin
   Application.MessageBox('No se pueden agregar datos a la tabla.', 'Error', MB_ICONERROR);
   Exit;
   end;
ADOQuery1.Edit;                                 //Ativa la edición.
ADOQuery1.Append;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   begin
   Medicion := Copy(Fila, 1, s - 1);           //Copia la cadena desde el inicio hasta el separador.
   Delete(Fila, 1, s);                         //Luego borra la cadena incluyendo al separador.
   try
      ADOQuery1.Fields[0].Value := StrToInt(FiltrarNumeros(Medicion));
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end;
   end;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   try
      if s > 1 then ADOQuery1.Fields[1].Value := Copy(Fila, 1, s - 1);
      Delete(Fila, 1, s);
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end
else
   begin
   if Length(Fila) > 0 then ADOQuery1.Fields[1].Value := Fila;
   Exit;
   end;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   try
      if s > 1 then ADOQuery1.Fields[2].Value := Cambiar(Copy(Fila, 1, s - 1), '-', '/');
      Delete(Fila, 1, s);
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end
else
   begin
   if Length(Fila) > 0 then ADOQuery1.Fields[2].Value := Cambiar(Fila, '-', '/');
   Exit;
   end;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   try
      if s > 1 then ADOQuery1.Fields[3].Value := Cambiar(Cambiar(Copy(Fila, 1, s - 1), '/', '-'), '.', ':');
      Delete(Fila, 1, s);
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end
else
   begin
   if Length(Fila) > 0 then ADOQuery1.Fields[3].Value := Cambiar(Cambiar(Fila, '/', '-'), '.', ':');
   Exit;
   end;

s := Pos(Sep, Fila);                         //Busca la posición del separador.
if s > 0 then                                //Si encuentra el separador:
   try
      if s > 1 then ADOQuery1.Fields[4].Value := Copy(Fila, 1, s - 1);
      Delete(Fila, 1, s);
   except
      Application.MessageBox('Error agregando datos a la tabla.', 'Error', MB_ICONERROR);
   end
else
   begin
   if Length(Fila) > 0 then ADOQuery1.Fields[4].Value := Fila;
   Exit;
   end;
end;

//-----------------------------------------------------------------------------
// Se utiliza para agregar datos a la tabla de móviles detectados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.AgregarMovilesDetectados;
var Fila: String;
    FicheroCSV: TextFile;
begin
FilasLeidas := 0;
Timer1.Enabled := True;
if OpenDialog2.Execute then
   if FileExists(OpenDialog2.FileName) then
      with ADOConnection1 do
           begin
           AssignFile(FicheroCSV, OpenDialog2.FileName);
           Reset(FicheroCSV);
           while not Eof(FicheroCSV) do
                 begin
                 Readln(FicheroCSV, Fila);                 //Lee una linea del fichero.
                 ExtrearCamposDeMovil(Fila);               //Parsea los datos de la String.

                 ADOQuery1.Post;                           //Guarda los cambios.
                 ADOQuery1.Next;

                 Inc(FilasLeidas);
                 Application.ProcessMessages;
                 end;
           CloseFile(FicheroCSV);                          //Cerramos el fichero de la base de Datos.
           end;
Timer1.Enabled := False;
end;

//-----------------------------------------------------------------------------
// Se utiliza para agregar datos a la tabla de móviles detectados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.AgregarLevantamientosRealizados;
var Fila: String;
    FicheroCSV: TextFile;
begin
FilasLeidas := 0;
Timer1.Enabled := True;
if OpenDialog2.Execute then
   if FileExists(OpenDialog2.FileName) then
      with ADOConnection1 do
           begin
           AssignFile(FicheroCSV, OpenDialog2.FileName);
           Reset(FicheroCSV);
           while not Eof(FicheroCSV) do
                 begin
                 Readln(FicheroCSV, Fila);                 //Lee una linea del fichero.
                 ExtrearCamposDeLevantamiento(Fila);       //Parsea los datos de la String.

                 ADOQuery1.Post;                           //Guarda los cambios.
                 ADOQuery1.Next;

                 Inc(FilasLeidas);
                 Application.ProcessMessages;
                 end;
           CloseFile(FicheroCSV);                          //Cerramos el fichero de la base de Datos.
           end;
Timer1.Enabled := False;
end;

//-----------------------------------------------------------------------------
// Ejecuta la búsqueda indicada.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.Buscar(Cadena: String);
begin
if Cadena = '' then Exit;
try
   StatusBar1.Panels[1].Text := 'Buscando en la base de datos...';
   Application.ProcessMessages;
   ADOQuery1.CacheSize := 1;
   ADOQuery1.SQL.Text := Cadena;
   ADOQuery1.Active := True;
   StatusBar1.Panels[0].Text := 'Registros: ' + IntToStr(ADOQuery1.RecordCount);
   StatusBar1.Panels[1].Text := '';
except
   Application.MessageBox('Es posible que la base de datos contenga errores', 'Error', MB_OK);
end;
end;

//-----------------------------------------------------------------------------
// Activa o desactiva los botones que dependen de la carga de la base de datos.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionOcurrenciasUpdate(Sender: TObject);
begin
TAction(Sender).Enabled := FormPrincipal.ADOConnection1.Connected;
end;

//-----------------------------------------------------------------------------
// Busca las ocurrencias en la base de datos.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionOcurrenciasExecute(Sender: TObject);
begin
with TFormOcurrencias.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Busca las asociaciones entre IMSI e IMEIs.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionAsociacionesExecute(Sender: TObject);
begin
with TFormAsociados.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Cuenta las ocurrencias en la base de datos de los móviles de la medición.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionOcurrenciasDeLosDeUnaMedicionExecute(Sender: TObject);
begin
with TFormOcurrenciasEnLaMedicion.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Muestra y contabiliza las coincidencias de móviles entre mediciones.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCoincidenciasEntreMedicionesExecute(Sender: TObject);
begin
with TFormOcurrenciasEntreVariasMediciones.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Busca los levantamientos con ocurrencias del IMSI o IMEI.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionLevantamientosDondeApareceExecute(Sender: TObject);
begin
with TFormLevantamientosConOcurrenciaDeMovil.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Busca los levantamientos con ocurrencias ambos móviles.
// Busca la coincidencia entre dos móviles.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCoincidenciasEntreDosExecute(Sender: TObject);
begin
with TFormCoincidenciasEntreDos.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Cuenta las coincidencias de un móvil con un grupo de móviles.
// Busca las coincidencias de un móvil con un grupo de móviles.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCoincidenciasConVariosExecute(Sender: TObject);
begin
with TFormCoincidenciasConGrupo.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Cuenta todas las coincidencias de un móvil.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionTodasLasCoincidenciasExecute(Sender: TObject);
begin
with TFormContarTodasLasCoincidencias.Create(Self) do Show;
end;

//-----------------------------------------------------------------------------
// Muestra la tabla de mediciones.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionMedicionesExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end
else
   begin
   Buscar(TablaDeMediciones);
   Memo1.Clear;
   msg := 'Mediciones realizadas con el hardware.';
   Memo1.Lines.Add(msg);
   end;
end;

//-----------------------------------------------------------------------------
// Muestra la tabla de los móviles detectados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionMovilesDetectadosExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end
else
   begin
   Buscar(TablaDeMovilesDetectados);
   Memo1.Clear;
   msg := 'Móviles detectados en las mediciones realizadas con el hardware.';
   Memo1.Lines.Add(msg);
   end;
end;

//-----------------------------------------------------------------------------
// Muestra todos los datos de ambas tablas combinados a
// partir del campo "Medición".
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionTodosLosDatosExecute(Sender: TObject);
var msg: String;
begin
if not FormPrincipal.ADOConnection1.Connected then
   begin
   Application.MessageBox('Primero debe cargar la base de datos', '', MB_OK);
   Exit;
   end
else
   begin
   Buscar(TablasCombinadas);
   Memo1.Clear;
   msg := 'Datos completos de los móviles detectados en las mediciones realizadas con el hardware.';
   Memo1.Lines.Add(msg);
   end;
end;

//-----------------------------------------------------------------------------
// Cuenta la cantidad de registros que tiene la tabla.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionContarRegistrosActualesExecute(Sender: TObject);
var n: String;
begin
n := 'La tabla contiene ' + IntToStr(ADOQuery1.RecordCount) + ' registros.';
Application.MessageBox(PChar(n), '', MB_OK);
end;

//-----------------------------------------------------------------------------
// Permite seleccionar la base de datos con la que se trabajará.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCargarBDExecute(Sender: TObject);
begin
if OpenDialog1.Execute then
   if FileExists(OpenDialog1.FileName) then
      with ADOConnection1 do
           begin
           StatusBar1.Panels[1].Text := 'Cargando la base de datos...';
           Application.ProcessMessages;
           Close;
           Connected := False;
           ConnectionString := CrearCadenaDeConeccion(OpenDialog1.FileName);
           Open;
           Buscar(TablasCombinadas);
           end;
end;

//-----------------------------------------------------------------------------
// Abre un formulario que permite agregarle datos a la base de datos.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionAgregarDatosExecute(Sender: TObject);
begin
with TFormAgregarDatos.Create(Self) do ShowModal;
end;

//-----------------------------------------------------------------------------
// Muestra la ventana de procedencia del programa.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionProcedenciaExecute(Sender: TObject);
begin
with TFormProcedencia.Create(Self) do ShowModal;
end;

//-----------------------------------------------------------------------------
// Guarda los datos en un fichero separado por el
// tipo de caracter especificado.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarFicheroDelimitado(DBGrid: TDBGrid; Nombre, Delimitador: String);
var n, r: integer;
    Linea: string;
    f: TextFile;
begin
DBGrid.Enabled := False;
r := 0;
StatusBar1.Panels[1].Text := 'Guardando registros. Presione la tecla ESCAPE si desea abortar.';
AssignFile(f, Nombre);
Rewrite(f);
with DBGrid.DataSource.DataSet do
     begin
     //Copia los nombres de los campos de la tabla.
     Linea := '';
     for n := 0 to FieldCount - 1 do
         Linea := Linea + Delimitador + Fields[n].FieldName;
     Linea := Copy(Linea, 2, Length(Linea) - 1);
     Writeln(f, Linea);

     //Copia los registros de la tabla uno por uno.
     First;
     while not Eof do
           begin
           Linea := '';
           for n := 0 to FieldCount - 1 do
               begin
               if (Fields[n] is TBlobField) or
                  (Fields[n] is TGraphicField) or
                  (Fields[n] is TMemoField) or
                  (Fields[n].IsNull) then
                  Linea := Linea + Delimitador
               else
                  Linea := Linea + Delimitador + Fields[n].AsString;
           end;
           Linea := Copy(Linea, 2, Length(Linea) - 1);
           Writeln(f, Linea);
           Next;
           StatusBar1.Panels[1].Text := 'Guardando registro ' + IntToStr(r) + '. Presione la tecla ESCAPE si desea abortar.';
           Application.ProcessMessages;
           if GetKeyState(VK_Escape) and 128 = 128 then break;
           Inc(r);
           end;
     end;
CloseFile(f);
DBGrid.Enabled := True;
DBGrid.SetFocus;
DBGrid.Invalidate;
StatusBar1.Panels[1].Text := 'Registros guardados: ' + IntToStr(r);
end;

//-----------------------------------------------------------------------------
// Guarda los resultados como un fichero TXT con los
// parámetros separados por tabulaciones.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarResultadosComoTXT(Nombre: String; Datos: TDBGrid);
begin
GuardarFicheroDelimitado(Datos, Nombre, #9);
end;

//-----------------------------------------------------------------------------
// Guarda los resultados como un fichero CSV con los
// parámetros separados por punto y coma.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarResultadosComoCSV(Nombre: String; Datos: TDBGrid);
begin
GuardarFicheroDelimitado(Datos, Nombre, ';');
end;

//-----------------------------------------------------------------------------
// Escribe el valor de una celda indicada por su columna y fila.
// Se utiliza para guardar los datos en un fichero EXCEL.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.InsertarCelda(Stream: TStream; Columna, Fila: Integer; Valor: string);
const {$J+} CXlsLabel: array[0..5] of Word = ($204, 0, 0, 0, 0, 0); {$J-}
var L: Word;
begin
L := Length(Valor);
CXlsLabel[1] := 8 + L;
CXlsLabel[2] := Fila;
CXlsLabel[3] := Columna;
CXlsLabel[5] := L;
Stream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
Stream.WriteBuffer(Pointer(Valor)^, L);
end;

//-----------------------------------------------------------------------------
// Guarda los datos de la tabla como un documento XLS (Fichero de Ecel).
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarResultadosComoXLS(Nombre: String; Datos: TDBGrid);
const {$J+} CXlsBof: array[0..5] of Word = ($809, 8, 00, $10, 0, 0); {$J-}
      CXlsEof: array[0..1] of Word = ($0A, 00);
var FStream: TFileStream;
    Valor: String;
    x, y, r: Integer;
begin
Datos.Enabled := False;
r := 0;
StatusBar1.Panels[1].Text := 'Guardando registros. Presione la tecla ESCAPE si desea abortar.';
with Datos.DataSource.DataSet do
     begin
     FStream := TFileStream.Create(PChar(Nombre), fmCreate or fmOpenWrite); //Crea un stream de fichero.
     try
        //Pone el inicio del fichero.
        CXlsBof[4] := 0;
        FStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));                          //Escribe la marca de inicio en el stream.

        //Copia los nombres de los campos de la tabla.
        for x := 0 to FieldCount - 1 do
            InsertarCelda(FStream, x, 0, Fields[x].FieldName);

        //Copia los registros de la tabla uno por uno.
        y := 1;
        First;
        while not Eof do
              begin
              for x := 0 to FieldCount - 1 do
                  begin
                  if (Fields[x] is TBlobField) or
                     (Fields[x] is TGraphicField) or
                     (Fields[x] is TMemoField) or
                     (Fields[x].IsNull) then
                     Valor := ''
                  else
                     Valor := Fields[x].AsString;
                  InsertarCelda(FStream, x, y, Valor);
                  end;
              Next;
              Inc(y);
              StatusBar1.Panels[1].Text := 'Guardando registro ' + IntToStr(r) + '. Presione la tecla ESCAPE si desea abortar.';
              Application.ProcessMessages;
              if GetKeyState(VK_Escape) and 128 = 128 then break;
              Inc(r);
              end;

        //Pone el final del fichero.
        FStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));                          //Escribe la marca de final en el stream.
     finally
        FStream.Free;
     end;
     end;
Datos.Enabled := True;
Datos.SetFocus;
Datos.Invalidate;
StatusBar1.Panels[1].Text := 'Registros guardados: ' + IntToStr(r);
end;

//-----------------------------------------------------------------------------
// Guarda los datos de la tabla como una página web (fichero HTML).
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarResultadosComoHTML(Nombre: String; Datos: TDBGrid);
var n, r: integer;
    Linea: string;
    f: TextFile;
begin
Datos.Enabled := False;
r := 0;
StatusBar1.Panels[1].Text := 'Guardando registros. Presione la tecla ESCAPE si desea abortar.';
AssignFile(f, Nombre);
Rewrite(f);
with Datos.DataSource.DataSet do
     begin
     //Inicia la página y la cabecera de la tabla.
     Writeln(f, '<HTML><HEAD><TITLE>Marcas operativas</TITLE></HEAD>');
     Writeln(f, '<BODY bgcolor = "#E0E0E0">');
     Writeln(f, '<TABLE  borderColor="#000000" cellSpacing="0" cellPadding="2" width="95%" align="left" bgColor="#ffffff" border="1">');

     //Copia los nombres de los campos de la tabla.
     Writeln(f, '<TR bgcolor = "#0000FF" style="color:#ffffff;font-weight:bold">');
     Linea := '';
     for n := 0 to FieldCount - 1 do
         Writeln(f, '<TD>' + Fields[n].FieldName + '</TD>');
     Linea := Copy(Linea, 2, Length(Linea) - 1);
     Writeln(f, Linea);
     Writeln(f, '</TR>');

     //Copia los registros de la tabla uno por uno.
     First;
     while not Eof do
           begin
           Writeln(f, '<TR>');
           Linea := '';
           for n := 0 to FieldCount - 1 do
               begin
               if (Fields[n] is TBlobField) or
                  (Fields[n] is TGraphicField) or
                  (Fields[n] is TMemoField) or
                  (Fields[n].IsNull) then
                  Writeln(f, '<TD></TD>')
               else
                  Writeln(f, '<TD>' + Fields[n].AsString + '</TD>');
           end;
           Next;
           Writeln(f, '</TR>');
           StatusBar1.Panels[1].Text := 'Guardando registro ' + IntToStr(r) + '. Presione la tecla ESCAPE si desea abortar.';
           Application.ProcessMessages;
           if GetKeyState(VK_Escape) and 128 = 128 then break;
           Inc(r);
           end;
     end;
CloseFile(f);
Datos.Enabled := True;
Datos.SetFocus;
Datos.Invalidate;
StatusBar1.Panels[1].Text := 'Registros guardados: ' + IntToStr(r);
end;

//-----------------------------------------------------------------------------
// Abre un diálogo para guardar el fichero de resultados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.GuardarResultados(Tipo: TTiposDeFichero);
var dlg: TSaveDialog;
    msg: String;
begin
msg := 'Ya existe un fichero con el mismo nombre.' + #13 + '¿Desea sobrescribirlo?';
dlg := TSaveDialog.Create(Self);
case Tipo of
     TXT: begin
          dlg.Title := 'Exportar como Fichero de Texto';
          dlg.DefaultExt := 'txt';
          dlg.Filter := 'Ficheros de texto TXT|*.txt|Todos los ficheros|*.*';
          end;
     CSV: begin
          dlg.Title := 'Exportar como Fichero CSV';
          dlg.DefaultExt := 'csv';
          dlg.Filter := 'Ficheros delimitado por comas CSV|*.csv|Todos los ficheros|*.*';
          end;
     XLS: begin
          dlg.Title := 'Exportar como Fichero MS Excel';
          dlg.DefaultExt := 'xls';
          dlg.Filter := 'Ficheros MS Excel XLS|*.xls|Todos los ficheros|*.*';
          end;
    HTML: begin
          dlg.Title := 'Exportar como Página Web';
          dlg.DefaultExt := 'html';
          dlg.Filter := 'Ficheros MS Excel HTML|*.html|Todos los ficheros|*.*';
          end;
     end;
dlg.InitialDir := RutaParaLosResultados;
while true do                                                      //Solo se sale de este ciclo si el usuario guarda el fichero.
      begin                                                        //Abre un diálogo para guardar el fichero y:
      if dlg.Execute then                                          //Si el fichero ya existe, pide una confirmación para sobrescribirlo.
         begin
         if FileExists(dlg.FileName) then
            case Application.MessageBox(PChar(msg), 'Confirme su acción', MB_YESNOCANCEL) of
                 IDNO: Continue;                                   //Abre nuevamente el diálogo de guardar.
                 IDCANCEL: Break;                                  //Sale de la función sin guardar.
                 end;
         RutaParaLosResultados := ExtractFilePath(dlg.FileName);   //Guarda la ruta de los resultados.
         case Tipo of
              TXT:  GuardarResultadosComoTXT(dlg.FileName, DBGrid1);
              CSV:  GuardarResultadosComoCSV(dlg.FileName, DBGrid1);
              XLS:  GuardarResultadosComoXLS(dlg.FileName, DBGrid1);
              HTML: GuardarResultadosComoHTML(dlg.FileName, DBGrid1);
              end;
         break;
         end
      else
         Break;
      end;
dlg.Free;
end;

//-----------------------------------------------------------------------------
// Guarda el fichero de resultados.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionGuardarComoTXTExecute(Sender: TObject);
begin
GuardarResultados(TXT);
end;

procedure TFormPrincipal.ActionGuardarComoCSVExecute(Sender: TObject);
begin
GuardarResultados(CSV);
end;

procedure TFormPrincipal.ActionGuardarComoXLSExecute(Sender: TObject);
begin
GuardarResultados(XLS);
end;

procedure TFormPrincipal.ActionGuardarComoHTMLExecute(Sender: TObject);
begin
GuardarResultados(HTML);
end;

//-----------------------------------------------------------------------------
// Copia en el portapapeles el texto de la selda seleccionada.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCopiarCeldaExecute(Sender: TObject);
begin
try
   Clipboard.AsText := DBGrid1.Fields[TStringGrid(DBGrid1).Col - 1].Value;
except
   MessageBeep(MB_ICONMASK);
end;
end;

//-----------------------------------------------------------------------------
// Copia en el portapapeles Toda la tabla.
// Recorre uno a uno los registros de la tabla y si se
// presiona Escape, la copia se detiene donde se quedó.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionCopiarTodoExecute(Sender: TObject);
const Delim = #9;
var Linea: String;
    n, r: Integer;
    TextoCompleto: String;
begin
if DBGrid1.Columns.Count = 0 then Exit;
DBGrid1.Enabled := False;
r := 0;
StatusBar1.Panels[1].Text := 'Copiando registros. Presione la tecla ESCAPE si desea abortar.';
TextoCompleto := '';
Linea := '';
for n := 0 to DBGrid1.Columns.Count - 1 do
    Linea := Linea + TColumn(DBGrid1.Columns[n]).FieldName + Delim;
Linea := Linea + CHR(13);
TextoCompleto := TextoCompleto + Linea;
Application.ProcessMessages;
DBGrid1.DataSource.DataSet.First;
while not DBGrid1.DataSource.DataSet.EOF do
      begin
      Linea := '';
      for n := 0 to DBGrid1.Columns.Count - 1 do
          Linea := Linea + TColumn(DBGrid1.Columns[n]).Field.AsString + Delim;
      Linea := Linea + CHR(13);
      TextoCompleto := TextoCompleto + Linea;
      DBGrid1.DataSource.DataSet.Next();
      StatusBar1.Panels[1].Text := 'Copiando registro ' + IntToStr(r) + '. Presione la tecla ESCAPE si desea abortar.';
      Application.ProcessMessages;
      if GetKeyState(VK_Escape) and 128 = 128 then break;
      Inc(r);
      end;
try
   Clipboard.AsText := TextoCompleto;
except
   MessageBeep(MB_ICONMASK);
end;
StatusBar1.Panels[1].Text := '';
DBGrid1.Enabled := True;
DBGrid1.Invalidate;
end;

//-----------------------------------------------------------------------------
// Copia el texto de la celda que se selecciona.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.DBGrid1CellClick(Column: TColumn);
begin
CampoSeleccionado := Column.FieldName;        //Copia el nombre del campo de texto.
TextoSeleccionado := Column.Field.AsString;   //Copia el texto.
DBGrid1.Invalidate;                           //Dibuja nuevamente la tabla.
end;

//-----------------------------------------------------------------------------
// Dibuja las filas alternadamente para que se diferencien una de la otra.
// Si hay un texto seleccionado, dibuja la fila que contenga dicho texto.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if MostrarColoresAlternados then
   if Odd(DBGrid1.DataSource.DataSet.RecNo) then
      DBGrid1.Canvas.Brush.Color := TColor($CCEECC)
   else
      DBGrid1.Canvas.Brush.Color := TColor($CCCCEE);

if MostrarFilasConTextoSeleccionado then
   if ADOQuery1.FieldList.IndexOf(CampoSeleccionado) >= 0 then
      if ADOQuery1.FieldByName(CampoSeleccionado).AsString = TextoSeleccionado then
         DBGrid1.Canvas.Brush.Color := TColor($FF8888);

DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
end;

//-----------------------------------------------------------------------------
// para el control de la visualización de las alternacias de colores.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionVerColoresAlternadosExecute(Sender: TObject);
begin
MostrarColoresAlternados := not MostrarColoresAlternados;
DBGrid1.Invalidate;
end;

procedure TFormPrincipal.ActionVerColoresAlternadosUpdate(Sender: TObject);
begin
ActionVerColoresAlternados.Checked := MostrarColoresAlternados;
ActionVerColoresAlternados.Enabled := FormPrincipal.ADOConnection1.Connected;
end;

//-----------------------------------------------------------------------------
// Para el control de la visualización de las filas con el texto seleccionado.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionVerFilasConTextoSeleccionadoExecute(Sender: TObject);
begin
MostrarFilasConTextoSeleccionado := not MostrarFilasConTextoSeleccionado;
DBGrid1.Invalidate;
end;

procedure TFormPrincipal.ActionVerFilasConTextoSeleccionadoUpdate(Sender: TObject);
begin
ActionVerFilasConTextoSeleccionado.Checked := MostrarFilasConTextoSeleccionado;
ActionVerFilasConTextoSeleccionado.Enabled := FormPrincipal.ADOConnection1.Connected;
end;

//-----------------------------------------------------------------------------
// Muestra el progreso de la consulta SQL.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ADOQuery1FetchProgress(DataSet: TCustomADODataSet; Progress, MaxProgress: Integer; var EventStatus: TEventStatus);
begin
StatusBar1.Panels[1].Text := 'Progreso: ' + IntToStr(Trunc(Progress / MaxProgress * 100)) + '%';
Application.ProcessMessages;
end;

//-----------------------------------------------------------------------------
// Muestra cómo utilizar el programa.
//-----------------------------------------------------------------------------
procedure TFormPrincipal.ActionUtilizacionExecute(Sender: TObject);
var msg: String;
begin
msg :=       'Este programa se emplea para el procesamiento de la información obtenida mediante las ' + #13;
msg := msg + 'mediciones de un hardware de supervisión. Para más información contacte directamente' + #13;
msg := msg + 'con el programador de la aplicación.';
Application.MessageBox(PChar(msg), 'Utilización', MB_OK);
end;


end.
