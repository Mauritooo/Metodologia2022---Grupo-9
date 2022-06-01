<?php
class LoginView
{
  private $Smarty;

  function __construct()
  {
    $this->Smarty = new Smarty();
  }

  function mostrarLogin($es_login_staff = false, $mensaje = '') {
    $this->Smarty->assign('es_login_staff', $es_login_staff);
    $this->Smarty->assign('mensaje', $mensaje);
    $this->Smarty->display('templates/login.tpl');
  }

  function mostrarRegistrar() {
    $this->Smarty->display('templates/registrar.tpl');
  }

}

?>
