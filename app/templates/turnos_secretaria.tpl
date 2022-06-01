<br>
<ion-card-title style="font-size:24px">Mis Turnos</ion-card-title>

{foreach from=$turnos_S item=turno}
    <ion-card>
        <ion-card-header class="header-card-turno">
            <ion-avatar class="avatar-medico">
                <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
            </ion-avatar>

            <span class="info-turno">
                <ion-card-title style="font-size: 16px">{$turno['nombre_medico']}</ion-card-title>
                <ion-card-subtitle style="font-size: 14px">{$turno['razon_consulta']}</ion-card-subtitle>
            </span>

        </ion-card-header>
        <ion-card-content style="flex-direction: column;" class="bottom-card-turno">
            <h5>{$turno['fecha']} - {$turno['hora']}</h5>
        <h4><a href="borrarturno/{$turno['id_turno']}"><ion-button color="danger">
                Borrar Turno
        </ion-button></a></h4>
        </ion-card-content>
    </ion-card>
{/foreach}