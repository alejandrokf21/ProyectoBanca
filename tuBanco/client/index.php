<?php
session_start();

$host_name = 'localhost';
$database = 'banking_db';
$user_name = 'root';
$password = '';

$link = new mysqli($host_name, $user_name, $password, $database);

if ($link->connect_error) {
    die('<p>Failed to connect to MySQL: ' . $link->connect_error . '</p>');
}
?>

<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <h1 class="text-dark">Bienvenido a Tu Banca</h1>
    <?php
    ?>
    <hr>

    <div class="card-deck">

        <?php
        /* --> Agregar id de session <-- */
        $query = "SELECT * FROM cuenta WHERE user_id = 1";
        $result = mysqli_query($link, $query);
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_array($result)) {
        ?>
                <div class="card">
                    <div class="info">
                        <p>Cuenta de <?php echo $row["tipo_cuenta"]; ?></p>
                        <span data-id="<?php echo $row["account_id"]; ?>"><?php echo $row["account_id"]; ?></span>
                        <p>Numero de Cuenta</p>
                        <span>Q <?php echo number_format($row["balance"], 2); ?></span>
                        <p>Balance Actual</p>
                    </div>
                    <a data-id="<?php echo $row["account_id"]; ?> href=" #">Ver Historial</a>
                </div>
        <?php
            }
        }
        ?>

    </div>


</body>

</html>