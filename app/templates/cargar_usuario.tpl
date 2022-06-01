<ion-card class="form_admin">
    <ion-card-content>
        <form method="post" action="registrarUserByAdmin">
            <ion-item>
                <ion-label>Usario: </ion-label>
                <ion-input type="text" name="user" placeholder="NombreUsuario"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Contraseña: </ion-label>
                <ion-input type="password" name="password" placeholder="*******"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Confirmar contraseña: </ion-label>
                <ion-input type="password" name="confirmPassword" placeholder="*******"></ion-input>
            </ion-item>
            <ion-item id="campo_especialidad" style="display: none;">
                <ion-label>Especialidad: </ion-label>
                <ion-input type="text" name="especialidad" placeholder="Dermatologia"></ion-input>
            </ion-item>
            <ion-item id="campo_obra_social" style="display: none;">
                <ion-label>Obra Social: </ion-label>
                <ion-input type="text" name="obra_social" placeholder="Osecac"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Tipo de usuario: </ion-label>
                <select id="select_tipo" name="tipo" style="border: none;">
                    <option value="m">Medico</option>
                    <option value="s" selected="selected">Secretaria</option>
                </select>
            </ion-item>
            </ion-item>

            <ion-button type="submit" class="buttonAdmin" expand="block">Crear Usuario</ion-button>
        </form>
    </ion-card-content>
</ion-card>