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
            
    </ion-header>

    <ion-content id="content-container">
    <br>
    <ion-card-title>Medicos a mi cargo</ion-card-title>
    
    <form method="post" action="GetMedicos">
    <ion-input type="text" name="nombre" value={$medico}></ion-input>
    
    <ion-list>
        <ion-item>
            <ion-label>Obra Social</ion-label>
            <ion-select name="os"  placeholder="Seleccione una">
                {foreach from=$obra_sociales item=os}
                    {if $os['os'] neq ""} 
                        <ion-select-option>{$os['os']}</ion-select-option>
                    {/if}
                {/foreach}
            </ion-select>
        </ion-item>

        <ion-item>
            <ion-label>Especialidad</ion-label>
            <ion-select name="esp"  placeholder="Seleccione una">
            {foreach from=$especialidades item=esp}
                {if $esp['esp'] neq ""} 
                    <ion-select-option>{$esp['esp']}</ion-select-option>
                {/if}    
            {/foreach}
        </ion-item>

    </ion-list>
    <button ion-button icon-start>
        <ion-icon name="search"></ion-icon>
    </button>
    </form>
   



    {foreach from=$medicos item=medico}
        <ion-card>
            <ion-card-header class="header-card-turno">
                <span class="avatar-medico">
                    <ion-avatar>
                        <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
                    </ion-avatar>
                </span>

                <span class="info-turno">
                    <ion-card-title>{$medico['nombre_apellido']}</ion-card-title>
                    <ion-card-subtitle>{$medico['especialidad']}</ion-card-subtitle>
                </span>

            </ion-card-header>
            <ion-card-content class="bottom-card-turno">
                <h5>Obra Social: {$medico['obra_social']}</h5>
                <div class="buttons_medicos">
                   <h4> <ion-button color="tertiary">Cargar disponibilidad</ion-button></h4>
                    <h4><a href="getformpaciente"><ion-button>
                    Agendar Turno
                    </ion-button></a></h4>
                </div>
            </ion-card-content>
        </ion-card>
    {/foreach}    
{include file="footer.tpl"}

