<?php

class UsuarioModel
{
  private $db;

  function __construct()
  {
    $this->db = $this->Connect();
  }

  function Connect(){
    return new PDO('mysql:host='.HOST.'; dbname='.DBNOMBRE.';charset=utf8', USER, PASS, array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION));
  }

  function GetUser($dni){
    $sentencia = $this->db->prepare("select * from usuario where dni=? limit 1");
    $sentencia->execute(array($dni));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetUserStaff($usuario){
    //vamos a usar nombre_apellido como nombre de usuario para los usuarios staff
    $sentencia = $this->db->prepare("select * from usuario where nombre_apellido=? limit 1");
    $sentencia->execute(array($usuario));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function InsertarUsuario($dni, $nombre_apellido, $num_afiliado, $obra_social, $email){
    $sentencia = $this->db->prepare("INSERT INTO usuario(dni, pass, rol, nombre_apellido, num_afiliado, obra_social, email) VALUES(?,?,?,?,?,?,?)");
    $sentencia->execute(array($dni, '', 'p', $nombre_apellido, $num_afiliado, $obra_social, $email));
  }

  function InsertarUsuarioByAdmin($nombre_apellido,$password,$tipo,$especialidad=NULL,$obra_social=''){
    $sentencia = $this->db->prepare("INSERT INTO usuario(dni, pass, rol, nombre_apellido, especialidad, num_afiliado, obra_social, email) VALUES(?,?,?,?,?,?,?,?)");
    $sentencia->execute(0, $password, $tipo, $nombre_apellido, $especialidad, NULL, $obra_social, '');
  }
//INSERTAR TURNO POR SECRETARIA.
  function InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico){
    $sentencia = $this->db->prepare("INSERT INTO turno(id_usuario, id_autor, fecha, hora, razon_consulta, id_medico) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico));
  }

  function GetMedicos($bus,$os,$esp){
    $sentencia = $this->db->prepare("select * from usuario where rol=? and nombre_apellido like concat('%',?,'%') and especialidad like concat('%',?,'%') and obra_social like concat('%',?,'%') ");
    #$sentencia = $this->db->prepare("select * from usuario where rol='m'" );
    #$sentencia->execute(); 
    $sentencia->execute(array('m',$bus,$esp,$os));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetMedicoId($id_medico){
    $sentencia = $this->db->prepare("select * from usuario where id=? limit 1");
    $sentencia->execute(array($id_medico));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetTurnosUsuario($id_usuario){
    $sentencia = $this->db->prepare("select * from turno where id_usuario=?");
    $sentencia->execute(array($id_usuario));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function ListarTurnosMedicos($id_medico){
    $sentencia = $this->db->prepare("select * from turno where id_medico=? and fecha >= now()");
    $sentencia->execute(array($id_medico));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetEspecialidades(){
    $sentencia = $this->db->prepare("select distinct especialidad as esp from usuario");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetObraSociales(){
    $sentencia = $this->db->prepare("select distinct obra_social as os from usuario");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }


  
}

?>
