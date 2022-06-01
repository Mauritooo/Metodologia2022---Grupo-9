var tipo_select = document.getElementById("select_tipo");
var campo_especialidad = document.getElementById("campo_especialidad");
var campo_obra_social = document.getElementById("campo_obra_social");

tipo_select.onchange = function(){
    if (tipo_select.value == 'm') {
        campo_especialidad.style.display = "block";
        campo_obra_social.style.display = "block";
    } else {
        campo_especialidad.style.display = "none";
        campo_obra_social.style.display = "none";
    }
};