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

  function MostrarMedicos($medicos,$usuario){
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->assign('medicos',$medicos);
    $this->Smarty->display('templates/medicos.tpl');
  }

<<<<<<< HEAD
  function mostrarConfirmarTurno() {
    $this->Smarty->display('templates/confirmar_turno.tpl');
  }

  function mostrarMensajeConfirmacion(){
    $this->Smarty->display('templates/mensaje_confirmacion.tpl');
  }

  function mostrarError(){
    $this->Smarty->display("templates/mensaje_error.tpl");
  }
=======
  function mostrarFormulario() {
    $this->Smarty->display('templates/cargar_turno.tpl');
  }

>>>>>>> b2e228a04db23546fb77a028fce4f1e02a3547ca
}

?>
