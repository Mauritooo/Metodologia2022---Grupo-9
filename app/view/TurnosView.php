<?php
require('libs/Smarty.class.php');

class TurnosView
{
  private $Smarty;

  function __construct()
  {
    $this->Smarty = new Smarty();
  }

  function Mostrar($usuario, $turnosP, $turnosM, $turnos_S, $medicos_S){
    $this->Smarty->assign('turnosP',$turnosP);
    $this->Smarty->assign('turnosM',$turnosM);
    $this->Smarty->assign('turnos_S',$turnos_S);
    $this->Smarty->assign('medicos_S',$medicos_S);
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->display('templates/inicio.tpl');
  }

  function MostrarMedicos($medicos,$usuario,$especialidades,$obra_sociales,$bus ){
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->assign('medicos',$medicos);
    $this->Smarty->assign('especialidades',$especialidades);
    $this->Smarty->assign('obra_sociales',$obra_sociales);
    $this->Smarty->assign('medico',$bus);
    $this->Smarty->display('templates/medicos.tpl');
  }

  function mostrarConfirmarTurno() {
    $this->Smarty->display('templates/confirmar_turno.tpl');
  }

  function mostrarMensajeConfirmacion(){
    $this->Smarty->display('templates/mensaje_confirmacion.tpl');
  }

  function mostrarError(){
    $this->Smarty->display("templates/mensaje_error.tpl");
  }
  
  function mostrarAgendarTurnoCon($id_medico, $nombre_apellido, $especialidad) {
    $this->Smarty->assign('id_medico',$id_medico);
    $this->Smarty->assign('nombre_apellido',$nombre_apellido);
    $this->Smarty->assign('especialidad',$especialidad);
    $this->Smarty->display('templates/agendar_turno_con.tpl');
  }

  function mostrarConfirmarDatos($id_medico, $fecha, $hora, $razon_consulta, $id_autor) {
    $this->Smarty->assign('id_medico',$id_medico);
    $this->Smarty->assign('fecha',$fecha);
    $this->Smarty->assign('hora',$hora);
    $this->Smarty->assign('razon_consulta',$razon_consulta);
    $this->Smarty->assign('id_autor',$id_autor);
    $this->Smarty->display('templates/confirmar_datos.tpl');
  }

  function mostrarTurnoRegistrado($fecha, $hora, $email = '') {
    $this->Smarty->assign('fecha',$fecha);
    $this->Smarty->assign('hora',$hora);
    $this->Smarty->assign('email',$email);
    $this->Smarty->display('templates/turno_registrado.tpl');
  }

}

?>
