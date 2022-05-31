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


<body style="background-color: #E5E5E5;">
    <ion-app id="app-container">
    <ion-header>
        <ion-avatar>
            <img src="https://img2.freepng.es/20190416/oxp/kisspng-clip-art-portable-network-graphics-check-mark-free-dronex-5cb660bad911d8.4718128915554561868891.jpg">
        </ion-avatar>
    </ion-header>

{include file="footer.tpl"}