<?php
require('libs/Smarty.class.php');

class TurnosView
{
  private $Smarty;

  function __construct()
  {
    $this->Smarty = new Smarty();
  }

  function Mostrar($usuario, $turnosP, $turnosM){
    $this->Smarty->assign('turnosP',$turnosP);
    $this->Smarty->assign('turnosM',$turnosM);
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->display('templates/inicio.tpl');
  }

  function MostrarMedicos($medicos,$usuario){
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->assign('medicos',$medicos);
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
}

?>
