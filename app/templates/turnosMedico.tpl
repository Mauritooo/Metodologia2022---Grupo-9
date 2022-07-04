<ion-card-title style="font-size:24px">Turnos Proximos</ion-card-title>

<ion-accordion-group>
    <ion-accordion value="acordeon">
        <ion-item slot="header" color="none">
        <ion-label>Filtros</ion-label>
        </ion-item>
        <div class="filtro-turnos" slot="content">
            <ion-list>
                <ion-item>
                    <ion-select id="turno" placeholder="Selecciona turno">
                        <ion-select-option value="mañana">Mañana</ion-select-option>
                        <ion-select-option value="tarde">Tarde</ion-select-option>
                    </ion-select>
                </ion-item>
            </ion-list>
            <ion-list>
                <ion-item>
                    <ion-select id="desde" placeholder="Desde el dia">
                        {for $foo=1 to 31}
                            <ion-select-option value="{$foo}">{$foo}</ion-select-option>
                        {/for}
                    </ion-select>
                </ion-item>
                <ion-item>
                    <ion-select id="hasta" placeholder="Hasta el dia">
                        {for $foo=1 to 31}
                            <ion-select-option value="{$foo}">{$foo}</ion-select-option>
                        {/for}
                    </ion-select>
                </ion-item>
            </ion-list>
            <ion-button onclick="filtrarTurnosMedico()" expand="block">Aplicar</ion-button>
            <ion-button onclick="limpiar()" color="danger" expand="block">Limpiar</ion-button>
        </div>
    </ion-accordion>
</ion-accordion-group>
{foreach from=$turnosM item=turno}
    <ion-card name="turno-medico" fecha="{$turno['fecha']}" hora="{$turno['hora']}">
        <ion-card-header class="header-card-turno">
            <span class="avatar-medico">
                <ion-avatar>
                    <img src="https://gravatar.com/avatar/dba6bae8c566f9d4041fb9cd9ada7741?d=identicon&f=y">
                </ion-avatar>
            </span>

            <span class="info-turno">
                <ion-card-title style="font-size: 16px">{$usuario[0]['nombre_apellido']}</ion-card-title>
                <ion-card-subtitle style="font-size: 14px">{$turno['razon_consulta']}</ion-card-subtitle>
            </span>

        </ion-card-header>
        <ion-card-content class="bottom-card-turno">
            <h5>Fecha: {$turno['fecha']|truncate:14:""}</h5>
            <h5>Hora: {$turno['hora']}</h5>
        </ion-card-content>
    </ion-card>
{/foreach}

<script language="javascript" type="text/javascript">
//filtrarTurnosMedico
//oculta o muestra los turnos segun los valores en los inputs
//no retorna nada
function filtrarTurnosMedico() {
    let turnos = document.getElementsByName('turno-medico');
    let filtro_turno = document.getElementById('turno').value;
    let desde_dia = document.getElementById('desde').value;
    let hasta_dia = document.getElementById('hasta').value;

    for (const turno of turnos) {
        turno.style.display = "block";
    }

    if (filtro_turno !== undefined) {

        if (filtro_turno == 'mañana') {
            console.log()
            for (const turno of turnos) {
                if (turno.getAttribute('hora').substring(0, 2) > 12) {
                    turno.style.display = "none";
                }
            }

        } else if (filtro_turno == 'tarde') {
            for (const turno of turnos) {
                if (turno.getAttribute('hora').substring(0, 2) < 12) {
                    turno.style.display = "none";
                }
            }
        }
    }

    if (desde_dia !== undefined && hasta_dia !== undefined) {
        for (const turno of turnos) {
            dia_turno = parseInt(turno.getAttribute('fecha').substring(8, 10));
            if (!(dia_turno >= desde_dia && dia_turno <= hasta_dia)) {
                turno.style.display = "none";
            }
        }
    }
}

//limpiar
//pone el valor de los inputs en default y hace que se muestren todos los turnos
//no tiene retorno
function limpiar() {
    let turnos = document.getElementsByName('turno-medico');
    let filtro_turno = document.getElementById('turno');
    let desde_dia = document.getElementById('desde');
    let hasta_dia = document.getElementById('hasta');

    filtro_turno.value = undefined;
    desde_dia.value = undefined;
    hasta_dia.value = undefined;

    for (const turno of turnos) {
        turno.style.display = "block";
    }
}
</script>