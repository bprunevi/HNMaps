<?php
// PHP code to parse JSON data from a POST request
header('Content-Type: application/json; charset=utf-8');

// Check if decoding was successful
if (json_last_error() === JSON_ERROR_NONE) {
  $sql = "SELECT idPersonne, nom, description FROM personne;";
}

/*
$servername = "localhost";
$username = "bprunevielle";
$password = "REMOVED";
$dbname = "bprunevielle";
*/
$servername = "localhost";
$username = "tocard";
$password = "tocard";
$dbname = "kovacs1";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$conn -> set_charset("utf8");

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  $comma = 0;
  // geojson header
  echo '{
  "type": "FeatureCollection",
  "features": [';
  // geojson content
  while($row = $result->fetch_assoc()) {
    if ($comma == '1') {
      echo ',';
    }
    echo '
    {
      "type": "Feature",
      "properties": {
        "idPersonne": "' . $row["idPersonne"] . '",
        "name": "' . $row["nom"] .' (' . $row["description"] . ')"
      }
    }';
    $comma = 1;
  }
  // geojson footer
  echo '
  ]
}';
} else {
  echo "errror";
}
// Close connection
$conn->close();
?>