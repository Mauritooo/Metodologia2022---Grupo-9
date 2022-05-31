<?php
require_once  "./view/TurnosView.php";
require_once  "./model/UsuarioModel.php";
require_once  "./model/TurnosModel.php";

class TurnosController
{
  private $view;
  private $modelusuarios;
  private $modelturnos;

  function __construct()
  {
    $this->view = new TurnosView();
    $this->modelusuarios = new UsuarioModel();
    $this->modelturnos = new TurnosModel();
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
        $turnosP = $this->modelturnos->GetTurnosUsuario($usuario[0]['id']);
        foreach ($turnosP as $clave => $turno) {
          $medico = $this->modelusuarios->GetMedicoId($turno['id_medico']);
          $turnosP[$clave]['nombre_medico'] = $medico[0]['nombre_apellido'];
        }
        $turnosM = $this->modelturnos->ListarTurnosMedicos($usuario[0]['id']);
        #echo($turnos[0]['fecha']);
        #$turnos = null;
        $turnos_S = $this->modelturnos->ListarTurnosSecretaria($usuario[0]['id']);
        foreach ($turnos_S as $key => $turno) {
          $medico = $this->modelusuarios->GetMedicoId($turno['id_medico']);
          $turnos_S[$key]['nombre_medico'] = $medico[0]['nombre_apellido'];
        }
        $medicos_S = $this->modelturnos->ListarMedicosAcargo($usuario[0]['id']);
        $this->view->Mostrar($usuario,$turnosP,$turnosM,$turnos_S,$medicos_S);
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

  function GetFormPaciente(){
    $this->view->mostrarFormulario();
    
  }

  function AgendarTurnoPaciente(){

    $id_user = $_POST["id_user"];
    $id_autor = $_POST["id_autor"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $razon_consulta = $_POST["razon_consulta"];
    $id_medico = $_POST["id_medico"];
    if(!empty($id_user) && !empty($id_autor) && !empty($id_medico)){
      $this->modelturnos->InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico);
      HEADER(INICIO);
    }
  }

  function BorrarTurno($param){
    $this->modelturnos->DeleteTurno($param[0]);
    HEADER(INICIO);
    
  }


}

?>
