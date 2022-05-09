# Ce container est à destination du front-end. 

Son rôle va être l'affichage et la mise en place de l'interface utilisateur. Notre container est équipé de REACT et de certaines librairies comme axios (pour faciliter la mise en place de nos requêtes), data-aos, react-toastify ou bootstrap.  


# Installation :

* Avant de lancer react il faut vérifier que tout a bien été installé. Donc, vérifiez dans package.json et package-lock.json que React est bien en version 17.0.2 et react-router-dom en version 6.3.0. Vérifiez que vous avez bien les librairies Reacttoastify et aos. 

* Il faut installer plusieurs extensions qui sont impératives pour bosser sur React: 'Simple React Snippets', 'ReactJs code Snippets', 'Mithril Emmet'. Pour vérifier qu'elles marchent toutes, créez un component et tapez 'rsc'. Si un component s'affiche en auto-complétion, c'est bon, sinon restart VSCode.

* Vérifiez également que votre Emmet Html fonctionne dans un fichier Javascript du style : h1 -> <h1></h1>. Sinon, allez dans paramètres en bas à gauche et tapez 'settings.json' puis modifier. A l'intérieur, rajouter :
-> "emmet.includeLanguages": { "javascript": "javascriptreact" }, "emmet.triggerExpansionOnTab": true 


## Organisation React :

Tout se passe dans le dossier src : 

* Les assets correspondent à nos images et potentielles font. 
* Les components correspondent à nos fonctionnalités et à ce qui va être appeler dans nos pages. 
* Les styles vont permettre de personnaliser nos pages/components. Le index.scss regroupe tous les styles scss et va être appeler dans index.js. Settings lui, sera utiliser pour appliquer des styles globaux à notre application. 


## Conventions de nomage : 

* Pour tous les components et pour toutes les pages crées, on commence avec une majuscule (App.js). 
* Pour les styles components/pages, on commence par un '_' pour faciliter l'importation dans index.scss.


# Lancement : 

* Pour lancer react -> npm i -> npm start


# Using MUI library

https://mui.com




