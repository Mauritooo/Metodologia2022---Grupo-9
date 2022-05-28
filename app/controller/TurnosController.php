<?php
require_once  "./view/TurnosView.php";
require_once  "./model/UsuarioModel.php";

class TurnosController
{
  private $view;
  private $modelusuarios;

  function __construct()
  {
    $this->view = new TurnosView();
    $this->modelusuarios = new UsuarioModel();
  }

  function Home(){
    session_start();
    if(isset($_SESSION["User"])) {
      $dni = $_SESSION["User"];
      $usuario = $this->modelusuarios->getUser($dni);
      
      //si no existe el dni en base se redirecciona a registro
      if ($usuario[0] == NULL) {
        HEADER(REGISTER);
      } else {
        $this->view->Mostrar($usuario);
      }
    }else{
      HEADER(LOGIN);
    }
  }

}

?>
