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
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+3' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/style.css">
</head>

<body style="background-color: #E5E5E5;">
  <ion-app id="app-container">
    <ion-header class="ion-no-border">
      <ion-avatar class="back-arrow">
       <a href=""><img src="img/back-arrow.svg"></a>
      </ion-avatar>
      <br>
    </ion-header>

    




<ion-content id="content-container">

    <ion-card-title style="padding-left: 12px;">Turno Registrado</ion-card-title>

    <ion-card>
        
        <ion-card-header class="header-card-turno">
            <ion-avatar class="check-icon">
                <img src="img/check-icon.svg">
            </ion-avatar>

            <span class="info-turno">
                <h2><b>Felicitaciones!</b></h2>
            </span>

        </ion-card-header>
        
        <ion-card-content class="bottom-card-turno-registrado">
            
            <h3>El turno fue registrado.
            La consulta se llevara a cabo
            en <b>Nombre Institución</b> el
            <b>{$fecha}</b> a
            las <b>{$hora}</b> <h3>
            <br>
            {if $email != ''}
                <h5>Detalles enviados a {$email}<h5>
            {/if}
            <a href=""><ion-button style="float: right; padding-top: 6px;" type="submit">Continuar</ion-button></a>
        </ion-card-content>
        
    </ion-card>

</ion-content>

   
    

{include file="footer.tpl"}