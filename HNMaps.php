<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>HNMaps</title>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
  <link rel="stylesheet" href="style.css" />
  <script src="js/leaflet.js"></script>
  <script src="js/leaflet.ajax.min.js"></script>
</head>

<body>
  <div id="map"></div>
  <div id="box-list">
    <div id="marker-list-box">
      <ul id="marker-list"></ul>
    </div>
      <div id="marker-list-box">
      <?php
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
        // output data of each row
        while($row = $result->fetch_assoc()) {
          echo "id: " . $row["idLieu"]. " - Desc : " . $row["description"]. " " . $row["coordonnees"]. "<br>";
        }
      } else {
        echo "0 results";
      }
      $conn->close();
      ?>
      <p>Bienvenue dans la carte d'élise reclus !</p>
      <p>Actuellement, il la liste de points est <a href="/testing.geojson">générée à partir du geojson disponible ici.</a></p>
      <p>Vous êtes libres d'activer/désactiver l'affichage d'un point via la liste ci-contre.</p>
    </div>
  </div>
  <script>
    var map = L.map("map").setView([40.73, -73.94], 12); // Set initial center and zoom

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(map);

    // Add geoJson
    //var marker = new L.GeoJSON.AJAX("testing.geojson");
    //marker.addTo(map);

    const markers_array = [];

    fetch('testing.geojson')
      .then(response => response.json())
      .then(data => {
        // Loop through each feature in the GeoJSON
        data.features.forEach((feature, index) => {
          if (feature.geometry.type === 'Point') {
            // Create a marker for each point
            const coords = feature.geometry.coordinates;
            const marker = L.marker([coords[1], coords[0]]).addTo(map);

            // Optionally, bind a popup with the feature properties
            if (feature.properties) {
              marker.bindPopup('<a href="' + feature.properties.url + '">' + feature.properties.name + '</a>');
            }

            // Push the marker into the markers array
            marker.name = feature.properties.name;
            markers_array.push(marker);
          }
        });
      })
      .then(make_list => {
            markers_array.forEach((marker) => {
              const listItem = document.createElement('li');
              //listItem.textContent = marker.name; // Set the text to the marker's name

              // Create a checkbox
              const checkbox = document.createElement('input');
              checkbox.type = 'checkbox';
              checkbox.id = marker.name; // Set the id for the checkbox
              //checkbox.name = marker.name; // Set the name for the checkbox
              //checkbox.value = "Afficher/Cacher"; // Set the value for the checkbox

              // Create a label for the checkbox
              const label = document.createElement('label');
              label.htmlFor = marker.name; // Associate the label with the checkbox
              label.appendChild(document.createTextNode(marker.name)); // Set the text for the label

              // Append the checkbox and label to the list item
              listItem.appendChild(checkbox);
              listItem.appendChild(label);

              // Add listener to react on click
              checkbox.addEventListener('click', () => {
                if (checkbox.checked) {
                  map.removeLayer(marker); // Hide the marker
                  console.log(`${marker.name} is checked`);
                } else {
                  marker.addTo(map); // Show the marker
                  console.log(`${marker.name} is unchecked`);
                }
              });

              // Append to the unordered list
              document.getElementById('marker-list').appendChild(listItem); 
            });
          }
      )
      .catch(error => console.error('Error loading GeoJSON:', error));
  </script>
</body>

</html>
