<?php

echo '<h1>pdo + mysqli:</h1>';

try {
    $db_pdo = new PDO('mysql:host=db;dbname=my_db', 'root', 'root');
    echo "<h2>db_pdo ok</h2>";
} catch (\Throwable $th) {
    echo "fucking fuck: $th";
}

try {
    $mysqli = new mysqli('db', 'root', 'root', 'my_db');
    echo "<h2>mysqli ok</h2>";
} catch (\Throwable $th) {
    echo "fucking fuck: $th";
}

// echo phpinfo();

$result = $db_pdo->query('SELECT * FROM my_table');

foreach ($result as $_) {
    echo "$_[id] $_[value]<br>";
}

echo '<hr>';
