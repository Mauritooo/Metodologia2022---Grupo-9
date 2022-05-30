<ion-card-title>Mis Turnos</ion-card-title>

{foreach from=$turnosM item=turno}
    <ion-card>
        <ion-card-header class="header-card-turno">
            <span class="avatar-medico">
                <ion-avatar>
                    <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
                </ion-avatar>
            </span>

            <span class="info-turno">
                <ion-card-title>{$usuario[0]['nombre_apellido']}</ion-card-title>
                <ion-card-subtitle>{$turno['razon_consulta']}</ion-card-subtitle>
            </span>

        </ion-card-header>
        <ion-card-content class="bottom-card-turno">
            <h5>Fecha: {$turno['fecha']}</h5>
            <h5>Hora: {$turno['hora']}</h5>
        </ion-card-content>
    </ion-card>
{/foreach}    
