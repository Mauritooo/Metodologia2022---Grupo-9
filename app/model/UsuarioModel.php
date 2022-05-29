<?php

class UsuarioModel
{
  private $db;

  function __construct()
  {
    $this->db = $this->Connect();
  }

  function Connect(){
    return new PDO('mysql:host='.HOST.'; dbname='.DBNOMBRE.';charset=utf8', USER, PASS);
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

  function InsertarUsuario($dni,$nombre_apellido,$email,$obraSocial, $nro_afiliado){
    $sentencia = $this->db->prepare("INSERT INTO usuario(dni, rol, nombre_apellido, num_afiliado, obra_social, email) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array($dni, 'p', $nombre_apellido, $nro_afiliado, $obraSocial, $email));
  }

}

?>
