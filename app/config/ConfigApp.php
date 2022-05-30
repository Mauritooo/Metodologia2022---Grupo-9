<?php

define('INICIO', 'Location: http://'.$_SERVER["SERVER_NAME"] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]));
define('LOGIN', 'Location: http://'.$_SERVER["SERVER_NAME"] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]). '/login');
//el login para usuarios no pacientes (admin, secretarios, medicos)
define('STAFF', 'Location: http://'.$_SERVER["SERVER_NAME"] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]). '/staff');
define('REGISTER', 'Location: http://'.$_SERVER["SERVER_NAME"] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]). '/registrar');
define('LOGOUT', 'Location: http://'.$_SERVER["SERVER_NAME"] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER["PHP_SELF"]). '/logout');
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '');
define('DBNOMBRE', 'db');

class ConfigApp
{
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      //urls que acceden a las vistas
      ''=> 'TurnosController#Home',
      'login'=> 'LoginController#login',
      'logout'=> 'LoginController#logout',
      'staff'=> 'LoginController#staff',
      'logout'=> 'LoginController#logout',
      'verificarlogin' => 'LoginController#verificarLogin',
      'verificarstaff' => 'LoginController#verificarStaff',
      'registrar'=> 'LoginController#Registrar',
      'registrarusuario' => 'LoginController#registrarUsuario',
      'registrarUserByAdmin' => 'LoginController#registrarUsuarioByAdmin',
      'GetMedicos' => 'TurnosController#GetMedicos'
    ];

}

?>