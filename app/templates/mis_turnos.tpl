<br>
<ion-card-title style="font-size:24px">Mis turnos</ion-card-title>

{foreach from=$turnosP item=turno}
    <ion-card>
        <ion-card-header class="header-card-turno">
            <span class="avatar-medico">
                <ion-avatar>
                    <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
                </ion-avatar>
            </span>

            <span class="info-turno">
                <ion-card-title style="font-size: 16px">{$turno['nombre_medico']}</ion-card-title>
                <ion-card-subtitle style="font-size: 14px">{$turno['razon_consulta']}</ion-card-subtitle>
                <h4><a href="borrarturno/{$turno['id_turno']}"><ion-button color="danger">Borrar</ion-button>
            </span>

        </ion-card-header>
        <ion-card-content class="bottom-card-turno">
            <h5>Fecha: {$turno['fecha']}</h5>
            <h5>Hora: {$turno['hora']}</h5>
        </ion-card-content>
        
    </ion-card>
{/foreach}