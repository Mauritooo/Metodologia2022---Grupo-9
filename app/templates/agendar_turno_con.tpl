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

    <ion-card-title style="padding-left: 12px;">Agendar Turno con:</ion-card-title>

    <ion-card>
        
        <ion-card-header class="header-card-turno">
            <ion-avatar class="avatar-medico">
                <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
            </ion-avatar>

            <span class="info-turno">
                <ion-card-title style="font-size: 16px">{$nombre_apellido}</ion-card-title>
                <ion-card-subtitle style="font-size: 14px">{$especialidad}</ion-card-subtitle>
            </span>

        </ion-card-header>
        
        <ion-card-content class="bottom-card-turno">
            <form method="post" action="agendarturnoparapaciente">
                <ion-item>
                    <ion-label>Razon de consulta: </ion-label>
                    <ion-input type="text" name="razon_consulta" placeholder="Indique afección"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Fecha: </ion-label>
                    <ion-input type="date" name="fecha"></ion-input>
                </ion-item>

                <ion-item>
                    <ion-label>Hora: </ion-label>
                    <ion-input type="time" name="hora"></ion-input>
                </ion-item>
                
                <ion-item style="display: none">
                    <ion-input type="text" name="id_medico" value="{$id_medico}"></ion-input>
                </ion-item>

                <ion-button style="float: right; padding-top: 6px;" type="submit">Agendar</ion-button>
            </form> 
        </ion-card-content>
        
    </ion-card>

</ion-content>

   
    

{include file="footer.tpl"}