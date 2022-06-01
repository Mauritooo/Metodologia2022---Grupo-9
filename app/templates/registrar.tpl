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
                <ion-img src="img/logo.png"></ion-img>
                <ion-title style="color: #7B61FF; font-weight: bold; font-size: 48px">Nombre</ion-title>
                <ion-title style="color: #3880FF; font-weight: bold; font-size: 48px">Institución</ion-title>

                <p>Tu calendario medicinal de la institución: <b>Nombre Institución.</b></p>
                <p>¿No tienes cuenta? Crea una:</p>
            </span>
            
        </ion-header> 

        <ion-content id="content-container">

            <ion-card>
                <ion-card-content>
                    <form method="post" action="registrarusuario">
                        <ion-item>
                            <ion-label>Nombre y Apellido: </ion-label>
                            <ion-input type="text" name="name_apellido" placeholder="Nombre Apellido"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>DNI: </ion-label>
                            <ion-input type="text" name="dni" placeholder="45233545"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Direccion: </ion-label>
                            <ion-input type="text" name="direccion" placeholder="Calle falsa 432"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>telefono: </ion-label>
                            <ion-input type="number" name="telefono" placeholder="44567890"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Email: </ion-label>
                            <ion-input type="text" name="email" placeholder="nombre@gmail.com"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Obra social: </ion-label>
                            <ion-input type="text" name="obraSocial" placeholder="Osecac"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Numero de afiliado: </ion-label>
                            <ion-input type="number" name="nro_afiliado" placeholder="12345567788"></ion-input>
                        </ion-item>

                        <a href="/tpe/login">¿Ya tienes una cuenta? Ingresa aqui.</a>

                        <ion-button type="submit" class="login-button" expand="block">CONTINUAR</ion-button>
                    </form>
                </ion-card-content>
            </ion-card>

        </ion-content>

    </ion-app>

{include file="footer.tpl"}