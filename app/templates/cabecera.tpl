<!DOCTYPE html>
<html lang="en">

<head>
<base href="http://{$smarty.server.SERVER_NAME}:{$smarty.server.SERVER_PORT}{dirname($smarty.server.PHP_SELF)}/" target="_self">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ionic</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/style.css">
</head>

<body style="background-color: #E5E5E5;">
  <ion-app id="app-container">
    <ion-header>
      <ion-avatar>
        <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
      </ion-avatar>
      <br>
      <br>
      <span class="mensaje-bienvenida">
        <h3>Hola,</h3>
        <h2><b>{{$usuario[0].nombre_apellido}}! <ion-icon name="hand-left" color="yellow"></ion-icon></b></h2>
        {if {$usuario[0].rol} eq "p"}
          <h3>¿Queres sacar un turno? <ion-icon name="arrow-down-sharp"></ion-icon></h3>
        {elseif {$usuario[0].rol} eq "m"}
          <h3>¡Tus pacientes estan esperando! <ion-icon name="arrow-down-sharp"></ion-icon></h3>
        {elseif {$usuario[0].rol} eq "s"}
          <h3>Carga disponibilidad para tus médicos <ion-icon name="arrow-down-sharp"></ion-icon></h3>
        {elseif {$usuario[0].rol} eq "a"}
          <h2>Eres Administrador <ion-icon name="warning"></ion-icon></h2>
          <h3>Crea cuentas para el personal <ion-icon name="arrow-down-sharp"></ion-icon></h3>
        {/if}
      </span>

      {if {$usuario[0].rol} eq "s" || {$usuario[0].rol} eq "p"}
        <div class="barra-busqueda">
        <form method="post" action="GetMedicos">
          <ion-item>
            <ion-label>Nombre del médico:</ion-label>
            <ion-input type="text" name="nombre"></ion-input>
          </ion-item>

          <ion-button type="submit" class="login-button" expand="block">Buscar</ion-button>
          
        </form>

      </div>
      {/if}
      
    </ion-header>

    
