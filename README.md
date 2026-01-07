![HNmaps](https://github.com/user-attachments/assets/c1614807-51e7-4947-bf2c-3b832e91aa8f)


[Instance officielle ici](http://projet-etudiant.ens-lyon.fr/bprunevielle/HNMaps/)

# Qu'est-ce que ce projet ?

<img width="820" height="775" alt="Screenshot from 2026-01-07 16-30-36" src="https://github.com/user-attachments/assets/89a324d1-9be3-436f-8c46-2c4f9cd7c935" />

Ce projet consiste en l'océrisation d'un nombre important de correspondance du géographe anarchiste [Élisée Reclus](https://fr.wikipedia.org/wiki/%C3%89lis%C3%A9e_Reclus)
Le travail réalisé comprend : 
1. la collecte de ses correspondances disponible [sur Gallica](https://gallica.bnf.fr/services/engine/search/sru??operation=searchRetrieve&version=1.2&query=%28gallica%20all%20%22Correspondance%20et%20papiers%20d%27%C3%89lis%C3%A9e%20Reclus%20%281830-1905%29%22%29&lang=fr&suggest=0#resultat-id-1)
2. La détection automatisée du texte qui y était présent (OCR/HCR)
3. Le formatage du texte obtenu dans des fichiers XML-TEI
4. L'affichage de fichiers XML-TEI dans une carte interactive à partir des métadonnées créées

Ce dépôt contient les fichiers TEI, la base de données qui les comprend intégralement, et du code javascript/php pour afficher une carte interactive qui permet la consultation des lettres selon leur lieux d'envoi/de réception.
Réalisé en 2025 dans le cadre du cursus Humanités Numériques (voir [enssib.fr](https://www.enssib.fr)).

# Installation

Basé sur php 8.1.2.
Supposant que vous avez chargé la base de données dans mysql, puis modifié `config.php` pour permettre la connection à votre instance mysql.
La base de données prête à importée est dans `sql/backup.sql`.
```
git clone https://github.com/bprunevi/HNMaps
cd HNMaps
php -S 127.0.0.1:8889
```

Vous pouvez ensuite consulter les résultats sur [http://127.0.0.1:8889](http://127.0.0.1:8889)
