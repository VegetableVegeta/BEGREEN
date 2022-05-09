# Installation de l'environnement ! 

- Lancer votre IDE et cloner ce repository ! N'oubliez pas de vous cd à l'intérieur du dossier `begreen` 

- Lancer le docker `docker-compose up -d`

* vérifier que tout les containers sont run 



# Voici à quoi devrait ressembler votre docker compose dans Docker Desktop 

![GitHub Logo](/compose.PNG)



Votre espace de travail sera : root/app



# Configuration de nos containers ! 


# 📦 Container begreen-plant-mysql

- Ouvrir le container begreeen-plant-mysql et au terminal entrer- `mysql -u root -p`

- entrer le password (root)

- `USE plant_db;` → indiquer la db a utiliser

- source /api-schema.sql; → lancer le fichier de config sql (création des tables et hydratations)

- `\q` → exit la CLI mysql



* Vérifier la DB à l’aide du container begreeen-adminer- se connecter http://localhost:8080

* Dans l’ensemble les infos de connection sont dans le docker-compose.yml

* serveur : le nom du container, ici c’est  mysqlapi

* user soit root, soit le user définie dans le docker-compose

* mot de passe : le mot de passe du user choisi

* base de données : le nom de la base de données, ici c’est  plant_db



# 📦 Container begreen-user-mysql



* Ouvrir le container begreeen-user-mysql et au terminal entrer- mysql -u root -p

- entrer le password (root)

- `USE user_db;` → indiquer la db a utiliser

- `source /user-schema.sql;` → lancer le fichier de config sql (création des tables et hydratations)

- `\q` → exit la CLI mysql

* Vérifier la DB à l’aide du container begreeen-adminer répéter les étapes décrites pour le container begreen-plant-mysql avec les bon identifiants




# 📦 Container begreen-user-backend-node



Afin de connecter ce container à la db associée, container begreeen-user-mysql

au terminal docker inspect begreeen-user-mysql

noter "IPAddress" du container,  par ex : "192.168.176.2"

dans le container begreeen-user-backend-node ouvrir le fichier .env

remplacer MSQL_DB_HOST par l’IPAddress

tester en lancer npm start



# 📦 Container begreen-plant-backend-node



Afin de connecter ce container à la db associée, container begreeen-plant-mysql

au terminal `docker inspect begreeen-plant-mysql`

noter "IPAddress" du container,  par ex : "192.168.176.2"

dans le container begreeen-plant-backend-node ouvrir le fichier .env

remplacer MSQL_DB_HOST par l’IPAddress

tester en lancer npm start


# 📦 Container begreen-react-front

Son rôle va être l'affichage et la mise en place de l'interface utilisateur. Notre container est équipé de REACT et de certaines librairies comme axios (pour faciliter la mise en place de nos requêtes), data-aos, react-toastify ou bootstrap.  


### Installation :

* Avant de lancer react il faut vérifier que tout a bien été installé. Donc, vérifiez dans package.json et package-lock.json que React est bien en version 17.0.2 et react-router-dom en version 6.3.0. Vérifiez que vous avez bien les librairies Reacttoastify et aos. 


### Lancement : 

* Pour lancer react -> `npm i` -> `npm start`



