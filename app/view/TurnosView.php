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
  
  function mostrarFormulario() {
    $this->Smarty->display('templates/cargar_turno.tpl');
  }
}

?>
