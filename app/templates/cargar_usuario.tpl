 <ion-card class="form_admin">
    <ion-card-content>
        <form method="post" action="registrarUserByAdmin">
            <ion-item>
                <ion-label>Usario: </ion-label>
                <ion-input type="text" name="user" placeholder="UsuarioMedico"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Contraseña: </ion-label>
                <ion-input type="password" name="password" placeholder="*******"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Confirmar contraseña: </ion-label>
                <ion-input type="password" name="confirmPassword" placeholder="*******"></ion-input>
            </ion-item>
            <ion-item>
                <ion-label>Tipo de usuario: </ion-label>
                <ion-select name="tipo">
                    <ion-select-option value="m">Medico</ion-select-option>
                    <ion-select-option value="s">Secretaria</ion-select-option>
                </ion-select>
            </ion-item>
            </ion-item>

            <ion-button type="submit" class="buttonAdmin" expand="block">Crear Usuario</ion-button>
        </form>
    </ion-card-content>
</ion-card>