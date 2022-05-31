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
      if (is_numeric($_SESSION["User"])) {
        $dni = $_SESSION["User"];
        $usuario = $this->modelusuarios->getUser($dni);
      } else {
        $nombre_usuario = $_SESSION["User"];
        $usuario = $this->modelusuarios->getUserStaff($nombre_usuario);
      }

      //si no existe el dni en base se redirecciona a registro
      if ($usuario[0] == NULL) {
        HEADER(REGISTER);
      } else {
        $turnosP = $this->modelusuarios->GetTurnosUsuario($usuario[0]['id']);
        foreach ($turnosP as $clave => $turno) {
          $medico = $this->modelusuarios->GetMedicoId($turno['id_medico']);
          $turnosP[$clave]['nombre_medico'] = $medico[0]['nombre_apellido'];
        }
        $turnosM = $this->modelusuarios->ListarTurnosMedicos($usuario[0]['id']);
        #echo($turnos[0]['fecha']);
        #$turnos = null;
        $this->view->Mostrar($usuario,$turnosP,$turnosM);
      }
    }else{
      HEADER(LOGIN);
    }
  }

  function GetMedicos(){
    session_start();
    if(isset($_SESSION["User"])) {
      if (is_numeric($_SESSION["User"])) {
        $dni = $_SESSION["User"];
        $usuario = $this->modelusuarios->getUser($dni);
      } else {
        $nombre_usuario = $_SESSION["User"];
        $usuario = $this->modelusuarios->getUserStaff($nombre_usuario);
      }
      
      //si no existe el dni en base se redirecciona a registro
      if ($usuario[0] == NULL) {
        HEADER(REGISTER);
      } else {
        $bus = $_POST["nombre"];
        $medicos = $this->modelusuarios->GetMedicos($bus);
        
        $this->view->MostrarMedicos($medicos,$usuario);
      }
    }else{
      HEADER(LOGIN);
    }
    
  }
//--------------------
function registrarTurnoBySecretaria(){
  $this->view->mostrarConfirmarTurno();
  /*$id_user = $_POST["id_user"];
  $id_autor = $_POST["id_autor"];
  $fecha = $_POST["fecha"];
  $hora = $_POST["hora"];
  $razon_consulta = $_POST["razon_consulta"];
  $id_medico = $_POST["id_medico"];

    $this->model->InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico);*/
}

function confirmarTurnoSecretaria()
{
  $id_user = $_POST["id_user"];
  $id_autor = $_POST["id_autor"];
  $fecha = $_POST["fecha"];
  $hora = $_POST["hora"];
  $razon_consulta = $_POST["razon_consulta"];
  $id_medico = $_POST["id_medico"];
  
  if($id_user && $id_autor && $id_medico)
    $this->modelusuarios->InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico);
}

}

?>
