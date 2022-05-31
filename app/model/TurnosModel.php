<?php

class TurnosModel
{
  private $db;

  function __construct()
  {
    $this->db = $this->Connect();
  }

  function Connect(){
    return new PDO('mysql:host='.HOST.'; dbname='.DBNOMBRE.';charset=utf8', USER, PASS);
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

  function ListarTurnosSecretaria($id_autor){
    $sentencia = $this->db->prepare("select * from turno where id_autor=?");
    $sentencia->execute(array($id_autor));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function ListarMedicosAcargo($id){
    $sentencia = $this->db->prepare("select * from usuario join a_cargo on id = id_medico where id_secretaria = ?");
    $sentencia->execute(array($id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function DeleteTurno($id){
    $sentencia = $this->db->prepare("delete from turno where id_turno=?");
    $sentencia->execute(array($id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
}

?>