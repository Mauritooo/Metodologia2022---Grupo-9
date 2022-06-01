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

    <ion-card-title style="padding-left: 12px;">Ingresa datos del paciente:</ion-card-title>

    <ion-card>
        
        <ion-card-header class="header-card-turno">
            <ion-avatar class="avatar-medico">
                <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
            </ion-avatar>

            <span class="info-turno">
                {* <ion-card-title style="font-size: 16px">{$nombre_apellido}</ion-card-title> *}
                <ion-card-subtitle style="font-size: 14px">Paciente</ion-card-subtitle>
            </span>

        </ion-card-header>
        
        <ion-card-content class="bottom-card-turno">
            <form method="post" action="confirmardatos">
                <ion-item>
                    <ion-label>DNI: </ion-label>
                    <ion-input type="number" name="dni"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Nombre y Apellido: </ion-label>
                    <ion-input type="text" name="nombre_apellido"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Dirección: </ion-label>
                    <ion-input type="text" name="direcicon"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Teléfono: </ion-label>
                    <ion-input type="text" name="telefono"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Email: </ion-label>
                    <ion-input type="text" name="email"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Obra social: </ion-label>
                    <ion-input type="text" name="obra_social"></ion-input>
                </ion-item>
                <ion-item>
                    <ion-label>Numero de afiliado: </ion-label>
                    <ion-input type="number" name="num_afiliado"></ion-input>
                </ion-item>
                
                <ion-item style="display: none">
                    <ion-input type="text" name="id_medico" value="{$id_medico}"></ion-input>
                    <ion-input type="text" name="fecha" value="{$fecha}"></ion-input>
                    <ion-input type="text" name="hora" value="{$hora}"></ion-input>
                    <ion-input type="text" name="razon_consulta" value="{$razon_consulta}"></ion-input>
                    <ion-input type="text" name="id_autor" value="{$id_autor}"></ion-input>
                </ion-item>

                <ion-button style="float: right; padding-top: 6px;" type="submit">Confirmar</ion-button>
            </form> 
        </ion-card-content>
        
    </ion-card>

</ion-content>

   
    

{include file="footer.tpl"}