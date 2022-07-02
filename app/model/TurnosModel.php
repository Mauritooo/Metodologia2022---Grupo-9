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
    //Listado de turnos de un medico en especifico (el que este logueado en el momento)
    //Consulta en la base de datos los turnos que tengan relacionado el id del medico logueado
    //Retorna una lista de turnos
    $sentencia = $this->db->prepare("select * from turno where id_medico=?");
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

  function InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico){
    $sentencia = $this->db->prepare("INSERT INTO turno(id_usuario, id_autor, fecha, hora, razon_consulta, id_medico) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico));
  }

  function DeleteTurno($id){
    $sentencia = $this->db->prepare("delete from turno where id_turno=?");
    $sentencia->execute(array($id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
}

?>