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
  $lieux = convert_array($data['list_places']);
  $destinataires = convert_array($data['list_people']);
  $mentions = convert_array($data['list_mentions']);
  $date_begin = $data['date_begin'];
  $date_end = $data['date_end'];
  $sql = "
  SELECT DISTINCT l.idLettre, l.titre, ml.qualite, pe.nom, li.idLieu, li.description, li.coordonnees
  FROM lettres l
  INNER JOIN mention_lieu ml ON l.idLettre = ml.idLettre
  INNER JOIN lieu li ON ml.idLieu = li.idLieu
  INNER JOIN mention_personne mp ON l.idLettre = mp.idLettre
  INNER JOIN personne pe ON mp.idPersonne = pe.idPersonne
  WHERE (false";
  if ($lieux != '') {
    $sql = $sql . " OR mp.qualite IN ('reception', 'lesdeux')";
    $sql = $sql . " AND pe.idLieu IN " . $lieux;
  }
  if ($destinataires != '') {
    $sql = $sql . " OR ml.qualite IN ('destinataire', 'lesdeux')";
    $sql = $sql . " AND pe.idPersonne IN " . $destinataires;
  }
  if ($mentions != '') {
    $sql = $sql . " OR ml.qualite IN ('mention', 'lesdeux')";
    $sql = $sql . " AND pe.idPersonne IN " . $mentions;
  }
  if ($date_begin != '' AND $date_end != '') {
  $sql = $sql . ") AND (l.dateEnvoi BETWEEN '". $date_begin ."' AND '". $date_end . "'";
  }
  $sql = $sql . ")";// ORDER BY li.coordonnees ASC";
} else {
  $sql = "
  SELECT DISTINCT l.idLettre, l.titre, ml.qualite, pe.nom, li.idLieu, li.description, li.coordonnees
  FROM lettres l
  INNER JOIN mention_lieu ml ON l.idLettre = ml.idLettre
  INNER JOIN lieu li ON ml.idLieu = li.idLieu
  INNER JOIN mention_personne mp ON l.idLettre = mp.idLettre
  INNER JOIN personne pe ON mp.idPersonne = pe.idPersonne
  WHERE true";
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
        "auteur": "'. $row["nom"] .'",
        "titre": "'. $row["titre"] .'",
        "objectid": "' . $row["idLieu"]. '",
        "idLettre": "'. $row["idLettre"]. '",
        "qualite": "'. $row["qualite"]. '"
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
  echo '
{
  "type": "FeatureCollection",
  "features": []
}';
}
// Close connection
$conn->close();
?>