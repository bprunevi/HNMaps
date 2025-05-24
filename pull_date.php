<?php
// PHP code to parse JSON data from a POST request
header('Content-Type: application/json; charset=utf-8');

// Check if decoding was successful
if (json_last_error() === JSON_ERROR_NONE) {
  $sql ="SELECT 
         MIN(dateEnvoi) AS begin_date, 
         MAX(dateEnvoi) AS end_date 
         FROM lettres;";
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

if ($result->num_rows == 1) {
  $dates = [];
  while($row = $result->fetch_assoc()) {
    array_push($dates, $row["begin_date"]);
    array_push($dates, $row["end_date"]);
  }
  echo '{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "date_begin": "' . $dates[0] . '",
        "date_end": "' . $dates[1] .'"
      }
    }
  ]
}';
} else {
  echo "errror";
}
// Close connection
$conn->close();
?>