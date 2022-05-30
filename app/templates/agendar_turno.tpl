<ion-card class="form_secretary">
    <ion-card-content>
        <ion-label>Agendar Turno con: </ion-label>

        <form method="post" action="registrarTurnoBySecretary">
            <ion-item>
                <ion-label>Razon de consulta: </ion-label>
                <ion-input type="text" name="razon_consulta" placeholder="indique afeccion"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>fecha </ion-label>{*modificar - aun no codeado*}
                <ion-input type="date" name="fecha"></ion-input>
            </ion-item>
            
            <ion-button type="submit" class="buttonSecretary" expand="block">Crear Turno</ion-button>
        </form>
    </ion-card-content>
</ion-card>