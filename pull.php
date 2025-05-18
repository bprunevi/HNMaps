<?php
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

$sql = "SELECT idLieu, description, coordonnees FROM lieu";
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
  echo "errror";
}
// Close connection
$conn->close();
?>