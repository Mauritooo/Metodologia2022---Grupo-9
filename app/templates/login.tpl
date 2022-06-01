<!DOCTYPE html>
<html lang="en">

<head>
<base href="http://{$smarty.server.SERVER_NAME}:{$smarty.server.SERVER_PORT}{dirname($smarty.server.PHP_SELF)}/" target="_self">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ionic</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ionic/core/css/ionic.bundle.css" />
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+3' rel='stylesheet' type='text/css'>
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

                {if $es_login_staff}
                    <p>Portal de acceso <b style="color: #FFC409">STAFF</b> para la institución: <b>Nombre Institución.</b></p>
                {else}
                    <p>Tu calendario medicinal de la institución: <b>Nombre Institución.</b></p>
                {/if}
            </span>
            
        </ion-header> 

        <ion-content id="content-container">

            <ion-card>
                <ion-card-content>
                    {if $es_login_staff}
                        <form method="post" action="verificarstaff">
                            <p>Ingresa tus credenciales de acceso para continuar:</p>
                            <p><b style="color: #ff3a3a">{{$mensaje}}</b></p>
                            <ion-item>
                                <ion-label>Usuario:</ion-label>
                                <ion-input type="text" name="usuario"></ion-input>
                            </ion-item>

                            <ion-item>
                                <ion-label>Contraseña:</ion-label>
                                <ion-input type="password" name="pass"></ion-input>
                            </ion-item>

                            <p>¿Olvidaste tu contraseña?</p>

                            <ion-button type="submit" class="login-button" expand="block">INGRESAR</ion-button>
                        </form>
                    {else}
                        <form method="post" action="verificarlogin">
                            <p>Ingresa tu DNI para continuar:</p>
                            <p><b style="color: #ff3a3a">{{$mensaje}}</b></p>
                            <ion-item>
                                <ion-label>DNI:</ion-label>
                                <ion-input type="number" name="dni"></ion-input>
                            </ion-item>

                            <p>¿Olvidaste tu contraseña?</p>

                            <ion-button type="submit" class="login-button" expand="block">CONTINUAR</ion-button>
                        </form>
                    {/if}

                </ion-card-content>
            </ion-card>

        </ion-content>

    </ion-app>
    <script src="js/main.js"></script>
    <script type="module" src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.esm.js"></script>
    <script nomodule src="https://cdn.jsdelivr.net/npm/@ionic/core/dist/ionic/ionic.js"></script>
</body>

</html>