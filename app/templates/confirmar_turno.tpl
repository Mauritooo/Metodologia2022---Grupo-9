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
    <link rel="stylesheet" href="css/login.css">
</head>

<body>

<ion-app id="app-container">

        <ion-header>
            <span class="portada">
                <p>Ingresa Datos del Paciente: </p>
            </span>
            
        </ion-header> 

        <ion-content id="content-container">

            <ion-card>
                <ion-card-content>
                    <form method="post" action="confirmarTurno">
                        <ion-item>
                            <ion-label>id medico: </ion-label>
                            <ion-input type="number" name="id_medico" placeholder="id_medico..."></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>id usuario: </ion-label>
                            <ion-input type="text" name="id_user" placeholder="id usuario..."></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>id_autor: </ion-label>
                            <ion-input type="text" name="id_autor" placeholder="id_autor..."></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>fecha: </ion-label>
                            <ion-input type="date" name="fecha"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>hora: </ion-label>
                            <ion-input type="time" name="hora"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>razon consulta: </ion-label>
                            <ion-input type="text" name="razon_consulta" placeholder="razon de la consulta..."></ion-input>
                        </ion-item>


                        <ion-button type="submit" class="confirm-button" expand="block">Finalizar</ion-button>
                        <a href="/..">regresar</a>
                    </form>
                </ion-card-content>
            </ion-card>

        </ion-content>

    </ion-app>
    

{include file="footer.tpl"}