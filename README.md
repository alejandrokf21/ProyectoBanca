# ProyectoBanca

<!-- ABOUT THE PROJECT -->
## About The Project

1. ___Página principal del banco:___ Deberá contar con un encabezado con logo y nombre del banco, y cuatro enlaces:
    * Inicio de sesión de administrador (5 pts): Pantalla para ingreso de usuario y clave de administrador. Si laautenticación es exitosa, deberá de dirigir al administrador al panel de administrador.
    * Inicio de sesión de usuario (5 pts): Pantalla para ingreso de usuario y clave de usuario cliente del sistema. Si la autenticación es exitosa, deberá de dirigir al usuario al panel de usuario.
    * Iniciar sesión de cajero (5 pts): Pantalla para ingreso de usuario y clave de cajero. Si la autenticación esexitosa, deberá de dirigir al administrador al panel de cajero.
    * Registro de nuevo usuario (5 pts): Deberá mostrar un formulario para el registro de un nuevo usuario con  la siguiente información:
      1. No. Cuenta
      2. Correo Electrónico (el correo electrónico se utilizará como el nombre de usuario)
      3. No. De Teléfono
      4. Contraseña
      5. Confirmación de Contraseña
      * Nota: El formulario deberá validar que la cuenta bancaria exista, y que no existe ningún otro usuario registrado para esa cuenta. El sistema deberá enviar un correo electrónico al usuario en el cual se muestre un enlace para confirmar el registro. Al hacer clic en el enlace, el usuario deberá ser dirigido al sitio para confirmar el registro (El sistema no deberá permitir el inicio de sesión si el registro no ha sido confirmado).

2. ___Panel de administrador:___ Para poder ingresar al panel de administrador, el usuario administrador deberá iniciar sesión en el sistema. Una vez iniciada la sesión de administrador, podrá realizar las siguientes funciones:
    * Gestión de usuarios de cajeros (5 pts): Presentará un listado de usuarios de cajeros, con la opción de poder bloquear/desbloquear un usuario, y de poder agregar nuevos usuarios. Para agregar un nuevo usuario el sistema deberá solicitar:
      1. Nombre Completo
      2. Usuario
      3. Clave
      4. Confirmación de Clave
    * Monitor de transferencias (10 pts): Presentará una gráfica de barras la cantidad de transacciones realizadas en el día, la cantidad de usuarios que han realizado transacciones y el monto acumulado de transacciones en el día. 
    * Salir: Cerrar sesión y salir del sistema.


3. ___Panel de cajero:___ Para poder ingresar al panel de cajero, el usuario cajero deberá iniciar sesión en el sistema. Una vez iniciada la sesión de cajero, podrá realizar las siguientes funciones:
    * Crear cuenta monetaria (5 pts): Deberá presentar un formulario para agregar nuevas cuentas con la siguiente información:
      1. Nombre de la cuenta
      2. No. Cuenta
      3. Identificación (DPI)
      4. Monto Inicial
   
    * Depósito monetario (5 pts): Deberá presentar un formulario para realizar un depósito monetario a una cuenta. El formulario deberá solicitar número de cuenta y cantidad a depositar.
    * Retiro monetario (5 pts): Deberá presenta un formulario para realizar un debito monetario de una cuenta. El formulario deberá solicitar número de cuenta y cantidad a debitar.
4. ___Panel de usuario:___ Para poder ingresar al panel de usuario, el usuario deberá iniciar sesión en el sistema. Una vez iniciada la sesión podrá realizar las siguientes funciones:
      1. Agregar cuentas de terceros (10 pts): Una cuenta de tercero es otra cuenta bancaria a la cual el usuario conectado puede transferir dinero. Antes de poder realizar una transferencia monetaria, se debe de agregar el número de cuenta al listado de cuentas de terceros. El formulario de adición de cuentas de terceros deberá solicitar: 
          1. No. Cuenta: se debe de validar que la cuenta bancaria exista. 
          2. Monto Máximo: Monto máximo que se puede transferir a esta cuenta en una operación de transferencia. 
          3. Cantidad máxima de transacciones diarias: Cantidad máxima de transferencias diarias que se pueden realizar a la cuenta. 
          4. Alias: Alias de la cuenta.
      2. Transferencia a cuenta de tercero (10 pts): Presentará un formulario en el que se debe seleccionar la cuenta de terceros a la cual se desea realizar la transferencia y la cantidad monetaria a transferir. El sistema deberá validar:
          1. Que el monto de transferencia ingresado no supere el monto máximo permitido a transferir para la cuenta seleccionada.
          2. Que la cantidad de transacciones no sobrepasen el máximo establecido por dia para la cuenta seleccionada.
          * Nota: La operación de transferencia, una vez se hayan realizado todas las validaciones, deberá de realizarse bajo un contexto de transacción.
      3. Estado de cuenta (10 pts): Reporte con todas las operaciones realizadas (transferencias, débitos y créditos).



## Herramientas Utilizadas
<p align="left"> <a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a> <a href="https://www.php.net" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/php/php-original.svg" alt="php" width="40" height="40"/> </a> </p>
