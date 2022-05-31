{include file="cabecera.tpl" usuario=$usuario}
<ion-content id="content-container">
</br>
<ion-card-title>Medicos</ion-card-title>

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
            <h4><a href="getformpaciente"><ion-button>
                Agendar Turno
        </ion-button></a></h4>
        </ion-card-content>
    </ion-card>
{/foreach}    
{include file="footer.tpl"}
