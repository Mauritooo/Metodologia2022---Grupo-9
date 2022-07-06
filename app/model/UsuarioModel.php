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
    //Se utiliza para verificar el usuario logueado
    //Recibe el nombre y apellido
    //Retorna los datos del usuario
    $sentencia = $this->db->prepare("select * from usuario where nombre_apellido=? limit 1");
    $sentencia->execute(array($usuario));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function InsertarUsuario($dni, $nombre_apellido, $num_afiliado, $obra_social, $email){
    //Se crea un usuario tipo paciente
    //Recibe el dni, nombre y apellido, el numero de afiliado, la obra social y el email
    $sentencia = $this->db->prepare("INSERT INTO usuario(dni, pass, rol, nombre_apellido, num_afiliado, obra_social, email) VALUES(?,?,?,?,?,?,?)");
    $sentencia->execute(array($dni, '', 'p', $nombre_apellido, $num_afiliado, $obra_social, $email));
  }

  function InsertarUsuarioByAdmin($nombre_apellido,$pass,$rol,$especialidad = '',$obra_social = ''){
    //El admin crea un usuario tipo secretaria y medico
    //recibe el nombre y apellido, la contraseña, el rol, y si las requiere, especialidad y obra social
    $sentencia = $this->db->prepare("INSERT INTO usuario(dni, nombre_apellido, pass, rol, especialidad, obra_social) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array(0, $nombre_apellido, $pass, $rol, $especialidad, $obra_social));
  }
//INSERTAR TURNO POR SECRETARIA.
  function InsertarTurno($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico){
    //Guarda un turno en la base de datos
    //Recibe el id del usaurio, id del autor del turno, la fecha, la hora, la razon de la consutla y el medico
    $sentencia = $this->db->prepare("INSERT INTO turno(id_usuario, id_autor, fecha, hora, razon_consulta, id_medico) VALUES(?,?,?,?,?,?)");
    $sentencia->execute(array($id_user, $id_autor, $fecha, $hora, $razon_consulta, $id_medico));
  }

  function GetMedicos($bus,$os,$esp){
    //Medicos por busqueda de filtrado
    //Recibe un tipo busqueda, una obra social y especialidad
    //Retorna los médicos por obra social y especialidad
    $sentencia = $this->db->prepare("select * from usuario where rol=? and nombre_apellido like concat('%',?,'%') and especialidad like concat('%',?,'%') and obra_social like concat('%',?,'%') ");
    $sentencia->execute(array('m',$bus,$esp,$os));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetMedicoId($id_medico){
    //Medico en especifico
    //Recibe el id de un medico en particular
    //Retorna el medico con sus datos
    $sentencia = $this->db->prepare("select * from usuario where id=? limit 1");
    $sentencia->execute(array($id_medico));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetTurnosUsuario($id_usuario){
    //Turnos de un usuario en especifico
    //Recibe el id de un usuario en particular
    //Retorna una lista de turnos de un usuario especifico
    $sentencia = $this->db->prepare("select * from turno where id_usuario=?");
    $sentencia->execute(array($id_usuario));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetEspecialidades(){
    //Todas las especialidades de los medicos
    //Retorna todas las especialidades de los médicos en la tabla usuario
    $sentencia = $this->db->prepare("select distinct especialidad as esp from usuario");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  function GetObraSociales(){
    //Todas las obras sociales disponibles
    ////Retorna todas las obras sociales con las que atiede un médico en la tabla usuario
    $sentencia = $this->db->prepare("select distinct obra_social as os from usuario");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }


  
}

?>
