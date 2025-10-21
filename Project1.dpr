program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormPrincipal},
  UBase in 'UBase.pas',
  UOcurrencias in 'UOcurrencias.pas' {FormOcurrencias},
  UAsociados in 'UAsociados.pas' {FormAsociados},
  ULevantamientosConOcurrenciasDeMovil in 'ULevantamientosConOcurrenciasDeMovil.pas' {FormLevantamientosConOcurrenciaDeMovil},
  UCoincidenciasEntreDos in 'UCoincidenciasEntreDos.pas' {FormCoincidenciasEntreDos},
  UContarTodaslasCoincidenciasDeMovil in 'UContarTodaslasCoincidenciasDeMovil.pas' {FormContarTodasLasCoincidencias},
  UCoincidenciasDeUnoConGrupo in 'UCoincidenciasDeUnoConGrupo.pas' {FormCoincidenciasConGrupo},
  UAgregarDatos in 'UAgregarDatos.pas' {FormAgregarDatos},
  UProcedencia in 'UProcedencia.pas' {FormProcedencia},
  ULectorDeMediciones in 'ULectorDeMediciones.pas',
  UOcurrenciasDeLosMovilesDeLaMedicion in 'UOcurrenciasDeLosMovilesDeLaMedicion.pas' {TFormOcurrenciasEnLaMedicion},
  UCoincidenciasEntreVariasMediciones in 'UCoincidenciasEntreVariasMediciones.pas' {FormOcurrenciasEntreVariasMediciones};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
