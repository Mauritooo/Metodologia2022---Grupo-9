{include file="cabecera.tpl" usuario=$usuario}
<ion-content id="content-container">
{if {$usuario[0].rol} eq "a"}
    {include file="cargar_usuario.tpl"}
{/if}
</ion-content>
{include file="footer.tpl"}