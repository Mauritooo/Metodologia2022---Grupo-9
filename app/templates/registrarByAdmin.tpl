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
            <span class="portada_admin">

                <h3>Hola</b></h3>
                <h1><strong>Admin! <ion-icon name="hand-left-outline"></ion-icon></strong></h1>
                <h3>Eres administrador</h3>
                <p>Crea cuentas para el personal</p>
            </span>

        <ion-content id="content-container">

            <ion-card class="form_admin">
                <ion-card-content>
                    <form method="post" action="registrarUserByAdmin">
                        <ion-item>
                            <ion-label>Usario: </ion-label>
                            <ion-input type="text" name="user" placeholder="UsuarioMedico"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Contraseña: </ion-label>
                            <ion-input type="password" name="password" placeholder="*******"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Confirmar contraseña: </ion-label>
                            <ion-input type="password" name="confirmPassword" placeholder="*******"></ion-input>
                        </ion-item>
                        <ion-item>
                            <ion-label>Tipo de usuario: </ion-label>
                            <ion-select name="tipo">
                                <ion-select-option value="m">Medico</ion-select-option>
                                <ion-select-option value="s">Secretaria</ion-select-option>
                            </ion-select>
                        </ion-item>
                        </ion-item>

                        <ion-button type="submit" class="buttonAdmin" expand="block">Crear Usuario</ion-button>
                    </form>
                </ion-card-content>
            </ion-card>

        </ion-content>

    </ion-app>

{include file="footer.tpl"}