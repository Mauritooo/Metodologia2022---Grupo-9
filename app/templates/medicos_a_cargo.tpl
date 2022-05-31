<br>
<ion-card-title>Mis Medicos</ion-card-title>

{foreach from=$medicos_S item=medico}
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
                 <ion-card-subtitle>{$medico['obra_social']}</ion-card-subtitle>
            </span>

        </ion-card-header>
        <ion-card-content class="bottom-card-turno">
            <h5>Email: {$medico['email']}</h5>
        </ion-card-content>
    </ion-card>
{/foreach}