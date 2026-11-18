<?php
// Koneksi database (PDO). Sesuaikan jika XAMPP-mu memakai password MySQL.
$DB_HOST = "localhost";
$DB_USER = "root";
$DB_PASS = "";
$DB_NAME = "cortis_db";

try {
  $pdo = new PDO(
    "mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4",
    $DB_USER,
    $DB_PASS,
    [
      PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
      PDO::ATTR_EMULATE_PREPARES   => false,
    ]
  );
} catch (PDOException $e) {
  die("Koneksi database gagal: " . htmlspecialchars($e->getMessage()) .
      "<br>Pastikan MySQL di XAMPP menyala dan database <b>$DB_NAME</b> sudah diimpor.");
}
