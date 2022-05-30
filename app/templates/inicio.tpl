{include file="cabecera.tpl" usuario=$usuario}

<ion-content id="content-container">
{if {$usuario[0].rol} eq "p"}
    {include file="mis_turnos.tpl" turnosP=$turnosP}
{/if}
{if {$usuario[0].rol} eq "m"}
    {include file="turnosMedico.tpl" turnosM=$turnosM}
{/if}
{if {$usuario[0].rol} eq "a"}
    {include file="cargar_usuario.tpl"}
{/if}
</ion-content>

{include file="footer.tpl"}