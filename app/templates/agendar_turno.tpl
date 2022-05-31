<ion-card class="form_secretary">
    <ion-card-content>
        <ion-title>Agendar Turno con: </ion-title>
        {*<div class="grid-item">*}
            <ion-button id="open-modal">Abrir Almanaque</ion-button>
            <ion-modal trigger="open-modal">
            <ion-content force-overscroll="false">
            <ion-datetime></ion-datetime>
        {*</div>*}
        <form method="post" action="registrarTurnoBySecretary">
        {*<ion-datetime displayFormat="MMMM" value="2012-12-15T13:47:20.789"></ion-datetime>
        <ion-item>
                <ion-label>Razon de consulta: </ion-label>
                <ion-input type="text" name="razon_consulta" placeholder="indique afeccion"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>fecha </ion-label>
                <ion-input type="date" name="fecha"></ion-input>
            </ion-item>*}    
            <ion-button type="submit" class="buttonSecretary" >Agendar</ion-button>
        </form>
    </ion-card-content>
</ion-card>