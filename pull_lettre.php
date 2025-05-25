<?php
// PHP code to parse JSON data from a POST request
header('Content-Type: application/json; charset=utf-8');


/* CACHE FEATURES */
//header('Cache-Control: public, max-age=31536000'); // Cache for 1 year (in seconds)
//header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 31536000) . ' GMT'); // Set an expiration date 1 year in the future

// Get the raw POST data
$json = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($json, true);
$idLettre = $data['idLettre'];

// Check if decoding was successful
if (json_last_error() === JSON_ERROR_NONE AND $idLettre != '') {
  $sql ="SELECT contenu FROM lettres WHERE idLettre = '". $idLettre ."'";
} else {
  die("Connection failed: " . $conn->connect_error);
};

// Create connection
require 'config.php';
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$conn -> set_charset("utf8");

$result = $conn->query($sql);

if ($result->num_rows == 1) {
  while($row = $result->fetch_assoc()) {
    echo $row['contenu'];
  }
}
// Close connection
$conn->close();
?>