<?php
require('libs/Smarty.class.php');

class TurnosView
{
  private $Smarty;

  function __construct()
  {
    $this->Smarty = new Smarty();
  }

  function Mostrar($usuario){
    $this->Smarty->assign('usuario',$usuario);
    $this->Smarty->display('templates/lista_turnos.tpl');
  }
}

?>
