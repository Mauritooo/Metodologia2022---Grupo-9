<?php

require_once  "./view/LoginView.php";
require_once  "./model/UsuarioModel.php";

class LoginController
{
  private $view;
  private $model;

  function __construct()
  {
    $this->view = new LoginView();
    $this->model = new UsuarioModel();
  }

  function login() {
    $this->view->mostrarLogin();
  }

  function logout() {
    session_start();
    session_destroy();
    header(LOGIN);
  }

  function verificarLogin() {
    $dni = $_POST["dni"];
    $dbUser = $this->model->getUser($dni);
    
    if(isset($dbUser)){
      session_start();
      $_SESSION["User"] = $dni;
      header(INICIO);
      // if ($dbUser[0]["admin"] == 1){
      //   header(ADMIN);
      // }else{
      //   header(HOME);
      // }
        
    }else{
      //si el usuario no existe debe redireccionar al registro
    }
  }

}

?>
