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

  //Esta funcion obtiene los turnos de los usuarios de la base de datos ordenados cronológicamente
  function GetTurnosUsuario($id_usuario){
    $sentencia = $this->db->prepare("select * from turno where id_usuario=? and fecha >= now() order by fecha");
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
    //Listado de medicos a cargo de una secretaria
    //Consulta en la base de datos los medicos que tiene asociada la secretaria logueada
    //Retorna una lista de medicos
    $sentencia = $this->db->prepare("select * from usuario join a_cargo on id = id_medico where id_secretaria = ?");
    $sentencia->execute(array($id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico){
    //Se inserta un turno con sus datos correspondiente
    $sentencia = $this->db->prepare("INSERT INTO turno(id_usuario, id_autor, fecha, hora, razon_consulta, id_medico) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico));
  }

  function DeleteTurno($id){
    //Se elimina un turno en especifico
    //Se elimina un turno mediando el id del mismo
    $sentencia = $this->db->prepare("delete from turno where id_turno=?");
    $sentencia->execute(array($id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
}

?>