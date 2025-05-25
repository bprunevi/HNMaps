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

function convert_array($array) {
  if ($array == []) {
    return '';
  }
  return '(\''. implode('\',\'', $array) . '\')';
}

// Check if decoding was successful
if (json_last_error() === JSON_ERROR_NONE) {
    // Access the data
  $one = convert_array($data['list_places']);
  //$two = convert_array($data['list_people']);
  $sql = "SELECT idLieu, description, coordonnees FROM lieu WHERE true";
  if ($one != '') {
    $sql = $sql . " AND description IN " . $one;
  }
  if ($two != '') {
    $sql = $sql . " AND description IN " . $two;
  }
} else {
  $sql = "SELECT idLieu, description, coordonnees FROM lieu";
  $sql = $sql . ";";
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
        "name": "' . $row["description"] .'",
        "url": "http://web.mta.info/nyct/service/",
        "line": "FIELD",
        "objectid": "' . $row["idLieu"]. '",
        "notes": "FIELD"
      },
      "geometry": {
        "type": "Point",
        "coordinates": ['. $row["coordonnees"] .']
      }
    }';
    $comma = 1;
  }
  // geojson footer
  echo '
  ]
}';
} else {
  echo "error : sql rows empty";
}
// Close connection
$conn->close();
?>