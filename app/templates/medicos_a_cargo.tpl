<br>
<ion-card-title style="font-size:24px">Médicos a mi cargo</ion-card-title>

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
                <form method="post" action="agendarturnocon">
                    <ion-item style="display: none">
                        <ion-input type="text" name="id_medico" value="{$medico['id']}"></ion-input>
                        <ion-input type="text" name="nombre_apellido" value="{$medico['nombre_apellido']}"></ion-input>
                        <ion-input type="text" name="especialidad" value="{$medico['especialidad']}"></ion-input>
                    </ion-item>

                    <ion-button type="submit">Agendar Turno</ion-button>
                </form>
            </ion-card-content>

        </ion-card>
    {/if}
{/foreach}