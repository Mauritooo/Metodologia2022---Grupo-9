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

  function staff() {
    $this->view->mostrarLogin(true);
  }

  function Registrar(){
    $this->view->mostrarRegistrar();
  }

  function logout() {
    session_start();
    session_destroy();
    header(LOGIN);
  }

  function verificarLogin() {
    $dni = $_POST["dni"];
    $dbUser = $this->model->getUser($dni);
    
    if(isset($dbUser[0])) {
      session_start();
      $_SESSION["User"] = $dni;
      header(INICIO);
      // if ($dbUser[0]["admin"] == 1){
      //   header(ADMIN);
      // }else{
      //   header(HOME);
      // }
        
    }else{
      HEADER(REGISTER);
    }
  }

  function verificarStaff() {
    $usuario = $_POST["usuario"];
    $pass = $_POST["pass"];
    $dbUser = $this->model->getUserStaff($usuario);
    
    if(isset($dbUser[0])) {
      if (password_verify($pass, $dbUser[0]["pass"])) {
        session_start();
        $_SESSION["User"] = $usuario;
        header(INICIO);
        // if ($dbUser[0]["admin"] == 1){
        //   header(ADMIN);
        // }else{
        //   header(HOME);
        // }
      } else {
        $this->view->mostrarLogin(true, "Contraseña incorrecta");
      }
    }else{
      $this->view->mostrarLogin(true ,"Ese usuario no existe");
    }
  }

  function registrarUsuario(){
    $nombre_apellido = $_POST["name_apellido"];
    $dni = $_POST["dni"];
    $direccion = $_POST["direccion"];
    $telefono = $_POST["telefono"];
    $email = $_POST["email"];
    $obraSocial = $_POST["obraSocial"];
    $nro_afiliado = $_POST["obraSocial"];

    if($nombre_apellido && $dni && $obraSocial && $nro_afiliado){
      $this->model->InsertarUsuario($dni,$nombre_apellido,$email,$obraSocial, $nro_afiliado);
      $this->verificarLogin();
    }
  }

  function registrarByAdmin(){
    $this->view->registrarByAdmin();
  }

  function registrarUsuarioByAdmin(){
    $user = $_POST["user"];
    $password = $_POST["password"];
    $confirmPassword = $_POST["confirmPassword"];
    $tipo = $_POST["tipo"];
    $hash = password_hash($password, PASSWORD_DEFAULT);

    if($password == $confirmPassword){
      $this->model->InsertarUsuarioByAdmin($user,$hash,$tipo);
      $this->verificarLogin();
    }
  }

}

?>
