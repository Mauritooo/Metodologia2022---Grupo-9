<br>
<ion-card-title>Médicos a mi cargo</ion-card-title>

{foreach from=$medicos_S item=medico}
    {if {$medico.rol} eq "m"}
        <ion-card>
            <ion-card-header class="header-card-turno">
                <ion-avatar class="avatar-medico">
                    <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
                </ion-avatar>

                <span class="info-turno">
                    <ion-card-title style="font-size: 16px">{$medico['nombre_apellido']}</ion-card-title>
                    <ion-card-subtitle style="font-size: 14px">{$medico['especialidad']} | {$medico['obra_social']}</ion-card-subtitle>
                </span>

            </ion-card-header>
            <ion-card-content class="bottom-card-turno">
                <h4><a href="getformpaciente"><ion-button>
                Agendar Turno
                </ion-button></a></h4>
            </ion-card-content>

        </ion-card>
    {/if}
{/foreach}