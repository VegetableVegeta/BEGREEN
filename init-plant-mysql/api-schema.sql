CREATE DATABASE  IF NOT EXISTS `plant_db` /*!40100 DEFAULT CHARACTER SET armscii8 */;

-- `plant_db`.Answer definition

CREATE TABLE `Answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) NOT NULL,
  `is_good` tinyint(1) NOT NULL DEFAULT '0',
  `question_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_FK` (`question_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- `plant_db`.Familly definition

CREATE TABLE `Familly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- `plant_db`.Plant definition

CREATE TABLE `Plant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `latin_name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `origin` varchar(100) DEFAULT NULL,
  `flowering` varchar(255) DEFAULT NULL COMMENT 'Floraison',
  `foliage` varchar(100) DEFAULT NULL COMMENT 'feuillage',
  `plantation_period` varchar(255) DEFAULT NULL,
  `plantation_location` varchar(100) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL COMMENT 'permet de lier, définir le formateur qui a corrigé la fiche d''un apprenant',
  `family_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plantStatus_FK` (`status_id`) USING BTREE,
  KEY `plants_FK` (`family_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- `plant_db`.Plantphoto definition

CREATE TABLE `Plantphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `plant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plantphotos_FK` (`plant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- `plant_db`.Plantstatus definition

CREATE TABLE `Plantstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


-- `plant_db`.Question definition

CREATE TABLE `Question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  `quizz_Id` int(11) NOT NULL,
  `questiontype_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_FK` (`quizz_Id`) USING BTREE,
  KEY `questions_FK_1` (`questiontype_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- `plant_db`.Questiontype definition

CREATE TABLE `Questiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- `plant_db`.Quizz definition

CREATE TABLE `Quizz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photourl` varchar(255) DEFAULT NULL,
  `question_number` int(11) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_FK` (`status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- `plant_db`.Quizzstatus definition

CREATE TABLE `Quizzstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- `plant_db`.Family data

INSERT INTO plant_db.Familly (name,description) VALUES
	 ('Acanthaceae','Les Acanthaceae sont une famille de plantes comprenant environ 250 genres pour plus de 2500 espèces de végétaux. Il s’agit de plantes herbacées, d’arbustes, de plantes grimpantes ou encore d’arbres se trouvant généralement dans un milieu exotique et humide. La famille des Acanthacées est principalement populaire pour ses plantes ornementales, ainsi que sa flore qui possède bien souvent de grandes fleurs jaunes, blanches, pourpres et d’autres coloris particulièrement intéressants au moment de la floraison. Les genres les plus connus de cette famille sont notamment Acanthes, Crossandre et Thunbergia et parmi les espèces de plantes : l’Acanthe molle (Acanthus mollis), la Crossandra en entonnoir ou encore Pachystachys lutea.'),
	 ('Aceraceae','Les Aceraceae sont une famille botanique qui comprend plus de 200 espèces réparties en 2 genres. Les arbres et arbustes de l’hémisphère nord sont les principaux types ligneux caractérisant la famille. Les Acéracées sont principalement connues pour leur feuillage caduque qui revêt de magnifiques couleurs durant les saisons automnales. Parmi les genres les plus représentatifs, on retrouve notamment l’Acer qui comprend de nombreuses espèces comme l’Érable japonais, l’Érable argenté, l’Érable rouge ou encore l’Érable négundo. Il est possible de réaliser un bonsai d’ornement à partir d’un petit arbre de certaines de ses espèces. Il faudra pour cela apporter des soins adaptés au moment de la plantation notamment au niveau de la terre, de l’arrosage ou encore de la taille.'),
	 ('Adiantaceae','Les Adiantaceae sont une famille de fougères et d’épiphytes qui comprend la famille anciennement connue sous le nom Vittariaceae. Il s’agit généralement de plantes de taille petite à moyenne qui poussent généralement à l’ombre sur des roches humides. On les trouve généralement dans les régions tropicales du globe.'),
	 ('Agavaceae','Les Agavaceae représentent une famille botanique. Beaucoup de ces plantes poussent dans les climats chauds et secs notamment dans le désert. Les genres les plus connus de cette famille sont l''agave, et le yucca. La famille comprend plus de 600 espèces réparties en une vingtaine de genres. Elle est très répandue dans les régions tropicales et subtropicales du monde. Certaines espèces de la famille Agavacées sont succulentes. Les feuilles sont généralement parallèles et apparaissent longues et pointues, souvent avec une colonne durcie sur la fin, et parfois avec des épines supplémentaires le long des marges.'),
	 ('Aizoaceae','Les Aizoaceae sont une très grande famille de plantes, en grande partie endémiques à l''Afrique australe (63% de la flore succulente), avec au moins 120 genres et plus de 1800 espèces. Quelques espèces se trouvent en Australie et dans la région du Pacifique. Toutes les espèces sont considérées comme succulentes et sont la plupart du temps des herbes ou des arbustes. Rarement épineuses, les feuilles sont opposées, quelques fois alternes. Les fleurs sont bisexuées, régulières, en inflorescences cymeuses, ce qui représente parfois la plante entière. Le calice est composé de 4 à 6 lobes, formant parfois un tube court au-dessus de l''ovaire. Les Aizoacées servent souvent de plantes de jardin. Leurs fleurs attractives offrent de belles couleurs au printemps et au début de l''été. Dorotheanthus bellidiformis est un des grands favoris, mais beaucoup de genres comme Lampranthus et Drosanthemum proposent également de beaux paysages pour le jardin. Certaines plantes sont comestibles comme Mesembryanthemum crystallinum qui est notamment utilisé en salade.'),
	 ('Alismataceae','La famille des Alismatacées est une famille de plantes en fleur, qui comprennent 11 genres différents résultant entre 85 et 95 espèces différentes. La majorité de ces plantes pousse dans les régions tempérées de l''Hémisphère Nord, mais on peut retrouver certaines espèces également dans les régions tropicales. Elles représentent des plantes herbacées et aquatiques poussant dans les terrains marécageux, boueux ou dans du sable humide. Elles produisent du latex et comportent des pétales qui peuvent être de couleur rose, violette, blanche ou jaune. Certaines espèces sont même comestibles et sont connues pour leurs racines pleines de saveurs, comme l''espèce Sagittaire.'),
	 ('Alliaceae','Les Alliacées sont une famille de plantes faisant partie de la famille des Allium et sont composées de 18 genres différents. Les Allium regroupent également les oignons, les échalottes, les poireaux, l’ail ou encore la ciboulette. On les retrouve dans les régions tempérées chaudes et subtropicales, soit dans les jardins, car elles peuvent être très ornementales, ou alors soit comme mauvaises herbes. La plupart de ces plantes sont des herbacées vivaces possédant un bulbe, mais ne sont pas vertes toute l’année. Les  Alliacées sont hermaphrodites et sont composées de feuilles et sont plutôt simples, rondes ou plates. Les fleurs dégagent généralement un parfum ressemblant à l’oignon, certaines restant inodores.'),
	 ('Aloaceae','La famille des Aloéacées ne comprend qu''un seul genre, l''Aloe comprenant environ 450 espèces. Ces plantes sont herbacées et comportent des rosettes sans tige. Quant aux fleurs, elles sont de couleur orange, jaune ou rouge et peuvent fleurir plusieurs fois dans l''année. Cette famille s''adapte très bien aux climats difficiles recevant peu de précipitations, mais on la retrouve également en Afrique sub-saharienne et à Madagascar. L''Aloe est une plante cultivée depuis des millénaires, puisque les Egyptiens déjà vantaient ses vertus médicinales en recommandant de l''appliquer sur les plaies, les ulcères ou contre la perte de cheveux. De nos jours, on extrait toujours cette plante pour en faire des préparations pharmaceutiques, afin de traiter les problèmes de peau, de brûlures ou pour les problèmes d''indigestion.'),
	 ('Amaranthaceae','Les Amaranthaceae représentent la lignée des espèces de plantes les plus nombreuses puisqu’elles font partie de l’ordre des Caryophyllales, qui comprend environ 175 genres et plus de 2500 espèces différentes. D’ailleurs, le quinoa et la betterave font partie de cette grande famille. La plupart des Amaranthaceae, dont la particularité est de pouvoir pousser partout dans le monde, sont des plantes herbacées, de type annuel ou vivace, d’autres sont des arbustes. Leurs feuilles sont plates ou de forme cylindrique. Quant aux fleurs, elles sont bisexuées et régulières. Les racines, tiges, feuilles ou fleurs sont rouges la plupart du temps en raison de la présence de pigments nommés bétalaïnes. En outre, ces plantes poussent dans des sols salés.'),
	 ('Amaryllidaceae','La famille des Amaryllidacées fait partie de l''ordre des Asparagales, comprenant environ 75 genres réparties en plus de 1600 espèces. Ces plantes, qui ont été découvertes il y a plusieurs centaines d''années sont herbacées et terrestres; elles poussent dans les régions tropicales et subtropicales. Elles possèdent un bulbe et perdent leurs feuilles. Pour la plupart, ce sont des plantes ornementales, les plus connues étant l''Amaryllis et la Belladonne. Leurs feuilles sont linéaires et leurs fleurs sont symmétriques, hermaphrodites et comportent de 3 à 6 pétales. Le fruit qu''elles produisent est soit sec, en forme de capsule, soit charnu comme une baie.');
INSERT INTO plant_db.Familly (name,description) VALUES
	 ('Anacardiaceae','Les Anacardiacées sont une famille d''arbres ou arbustes comprenant environ 70 genres réparties en 650 espèces. Elles poussent en majorité dans les régions tropicales et subtropicales, mais on peut aussi les retrouver dans les régions tempérées, spécialement dans le bassin méditerranéen. Cette famille de plantes inclut, entre autres, les anacardiers, qui produisent les noix de cajou, mais aussi le lierre, les manguiers et les pistaciacées qui produisent les pistaches. La plupart des Anacardiacées produisent de la résine qui est contenue dans leur écorce. Elles comportent aussi des fruits charnus, ainsi que des fleurs n''ayant souvent que des composants féminins ou masculins, mais pas les deux.'),
	 ('Annonaceae','La famille des Annonacées représente des arbres, arbustes et plus rarement des lianes. Composée d''environ 129 genres et de 2200 espèces, cette famille est la plus large des Magnoliales. Elles poussent dans les zone tropicales et subtropicales, quoique l''on peut trouver certaines espèces dans les régions tempérées. Les Annonacées sont sempervirentes. Leur écorce comporte des fibres et peut être odorante. Les feuilles sont disposées sur 2 rangs et présentent des veines. Quant aux fleurs sont bisexuelles et comportent 6 pétales bruns, jaunes ou verts. Ces plantes sont très prisées pour leur bois et leurs larges fruits pulpeux; elles sont également utilisées comme ornements.'),
	 ('Anthericaceae','La famille des Anthéricacées est largement répandue à travers le globe et fait partie de l''ordre des Asparagales, dans lequel on retrouve les orchidées, les asperges, l''agave, le yucca ou encore l''arbre Joshua. Réparties en 640 espèces pour 23 genres, on trouve ces plantes dans les régions tropicales, subtropicales et tempérées chaudes. Elles représentent des arbustes ou plantes herbacées dont les feuilles longues et pointues sont regroupées en rosettes au bout d''une tige boisée. Les Anthéricacées peuvent être de longueurs différentes, de très courtes à longues. En outre, l''agave est particulièrement appréciée pour produire de la tequila, alors que les autres espèces sont privilégiées pour leurs fibres.'),
	 ('Apiaceae','La famille des Apiacées, également appelées Ombellifères, représente des plantes à fleurs, dont font partie le cèleri, la coriandre, le cumin, l''anis, l''aneth, le fenouil, le persil ou la carotte. C''est une grande famille de 3700 espèces réparties en 434 genres qui poussent dans les régions tempérées du globe. Les Apiacées sont représentées par quelques arbres et arbustes, mais pour la plupart, par des plantes herbacées annuelles, bisanuelles ou pérennes. Les feuilles des Apiacées sont charnues, parfois rigides et arrangées de manière alternée. Ecraser les feuilles permet souvent de faire dégager une odeur aromatique ou fétide. Les fleurs sont hermaphrodites, disposées en ombelles et composées de 5 pétales. La pollinisation se fait par des mouches, moustiques, coléoptères ou abeilles. Les fruits produits ne sont pas charnus; les graines sont ensuite dispersées par le vent.'),
	 ('Apocynaceae','Les Apocynaceae sont une famille de plantes eudicotylédones de l’ordre des Gentianales, qui comprend environ 5000 espèces et 350 genres, regroupés dans cinq sous-familles. Ce sont, pour la plupart, des lianes ou des plantes herbacées, quelques arbres ou arbustes, à latex, à feuilles persistantes'),
	 ('Araceae','La famille des Araceae représente une famille de plantes ou arbustes herbacés, la plupart répandus dans les régions tropicales et subtropicales, bien qu''on les trouve également dans les régions tempérées en nombre réduit. Les Araceae comprennent 114 genres répartis en 3750 espèces différentes. Ces plantes ou arbustes sont utilisés comme plantes d''appartement, étant donné leur propriété ornementale, mais on peut aussi cultiver certaines espèces à des fins alimentaires. Les Araceae sont constituées d''un axe sur lequel se trouvent des fleurs minuscules, qui répandent soit un agréable parfum, soit une odeur de fumier. Elles se font pollinisées par des insectes qui fécondent les fleurs femelles. Celles-ci fonctionnent comme une trappe, car elles retiennent les insectes couverts de pollen jusqu''à ce qu''ils les fécondent. Ensuite, elles les libèrent.'),
	 ('Arecaceae','Les Arecaceae représentent une famille de plantes grimpantes, arbustes et arbres plus connus sout le nom de palmiers. Ces plantes herbacées proviennent de 181 genres répartis en environ 2600 espèces qui poussent dans les régions tropicales, subtropicales et tempérées chaudes. Les Arecaceae ont la capacité de s''adapter à des conditions climatiques très diverses, tant dans les forêts tropicales que dans les déserts arides. Les palmiers ne possèdent pas de tronc, mais un stipe, qui est une large tige remplie de fibres. Ils ne sont pas non plus composés de branches, mais de palmes qui sont sempervirentes. Selon les expèces, les palmes peuvent être en éventail ou en forme de plume. Les fleurs ont la propriété d''être hermaphrodites et produisent un fruit fibreux appelé drupe. Les Arecaceae font partie des espèces de plantes les plus anciennes du monde, puisqu''elles y sont présentes depuis plus de 80 millions d''années.'),
	 ('Asteraceae','La famille des Astéracées, également appelées Composées, est une très grande famille de plantes dont font partie les marguerites, les pâquerettes, les tournesols et les dents-de-lion. C’est la plus grande famille de plantes, avec celle des Orchidées, représentée par 32’913 espèces réparties en 1911 genres. Les Astéracées sont des arbustes ou des arbres, mais principalement des plantes herbacées qui poussent partout dans le monde. Ce sont des plantes importantes économiquement, puisqu’elles permettent de produire des huiles, des graines de tournesol et des tisanes. Certaines espèces sont également importantes pour des raisons ornementales. Les Astéracées sont reconnaissables par leurs inflorescences : ce qu’on dirait être une seule fleur est en fait un ensemble de nombreuses petites fleurs qui donnent l’impression d’une tête. Les feuilles contiennent de la résine ou du latex. Elles sont parfois simples, parfois incisées ou lobées.'),
	 ('Berberidaceae','Les Berbéridacées représentent une famille de 14 genres avec plus de 700 espèces répertoriées, que l''on retrouve dans les régions tempérées du globe. Ce sont des arbustes de couleur jaune ou des plantes pérennes plus ou moins herbacées. La plupart des arbustes ont des feuilles épineuses et la fleur varie quant à sa forme. Le genre le plus répandu est le Berberis avec 500 espèces. Il sert d''ornement grâce à son feuillage rouge. Ses baies sont parfois comestibles et servent de condiment. D''autres espèces incluent des arbustes sempervirents, les Mahonia ou des plantes en pot servant à la décoration d''intérieur.'),
	 ('Boraginaceae','Les Boraginacées portent également le nom de Boragacées et sont composées de 148 genres répartis en plus de 2700 espèces. Ce sont des plantes herbacées, des arbres ou des arbustes, parfois même des lianes, que l''on retrouve partout dans le monde, mais plus particulièrement autour du bassin méditerranéen. Les fleurs sont généralement bleues, mais peuvent varier vers les roses ou jaunes selon le pH du sol qui les contient. Quelle que soit leur couleur, elles sont composées de 5 pétales soudés. Les Boraginacées sont connues pour produire de l''huile essentielle. On les retrouve souvent dans les jardins comme plantes ornementales.');
INSERT INTO plant_db.Familly (name,description) VALUES
	 ('Brassicaceae','La famille des Brassicacées, également appelées Crucifères, est une famille de plantes de taille moyenne, dont font partie le chou, le brocoli, le kale ou la moutarde. Le nom Crucifères signifie des pétales en forme de croix. Cette famille contient 372 genres réparties en 4060 espèces différentes. Ce sont des plantes herbacées annuelles, bisanuelles ou pérennes réparties partout dans le monde. Les feuilles des Brassicacées sont disposées de manière alternée, parfois organisées en rosettes. Les pétales sont au nombre de 4 et sont libres. Ils sont composées de 6 étamines, dont 4 sont aussi longues que les pétales, arrangés en croix, comme les pétales. La pollinisation se fait par des insectes. Le fruit produit est une capsule. Les Brassicacées ont une énorme importance économique puisqu''elles représentent de nombreux légumes.');

-- `plant_db`.Status data

INSERT INTO plant_db.Plantstatus (status) VALUES
	 ('Draft'),
	 ('Submit'),
	 ('Published'),
	 ('Update');


-- `plant_db`.Plant data

INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Arbre à perruque','Cotinus coggygria','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Centre de la Chine','Eté','Caduc','Automne','Mi-ombre',NULL,1,'',NULL,1,2),
	 ('Papyrus','Cyperus','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Egypte','Mai à Juin','Tiges herbacées','Annuelle','Soleil',NULL,2,'',NULL,2,1),
	 ('Orge','Hordeum','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Eurasie','Juin à Août','Epis','Hiver','Soleil','2021-12-04',3,'',7,3,3),
	 ('Miscanthus','Miscanthus','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Est asiatique','Automne à Hiver','Epis','Annuelle','Humide','2021-12-12',8,'',7,4,3),
	 ('Cocotier','Cocos','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Tropicales','Tout au long de l''année','Palmiers','Avril à Juin','Humide et Soleil','2021-12-22',22,'',7,5,3),
	 ('Trachycarpus','Trachycarpus','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Nord de l''Inde','Mai à Juin','Palmiers','Mai à Août','Soleil',NULL,23,'',NULL,7,1),
	 ('Fétuque','Festuca','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Europe','Mars à Juin','Fourragères','Printemps','Soleil','2021-02-02',25,'',5,6,3),
	 ('Citronelle','Cymbopognon citratus','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Asie','Août à Septembre','Herbe','Annuelle','Soleil','2021-10-02',14,'',5,5,3),
	 ('Riz','Oryza sativa','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Asie','Juillet à Septembre','Tige dressée','Annuelle','Soleil','2022-12-02',15,'',5,4,3),
	 ('Epeautre','Triticum spelta','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Europe Centrale','Mai à Juillet','Epis grêle','Annuelle','Soleil',NULL,10,'',NULL,2,1);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Avoine','Avena Sativa','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Europe','Juin à Juillet','Feuille plane','Annuelle','Humide et Soleil',NULL,11,'',NULL,1,2),
	 ('Blé','Triticum aestivum','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Europe','Juin à Juillet','Epis gros','Annuelle','Toutes','2018-12-02',40,'',7,3,3),
	 ('Alfa','Stipa tenacissima','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Afrique','Juillet à Août','Tige dressée','Annuelle','Soleil','2017-12-02',41,'',7,4,3),
	 ('Palmier nain','Chamaerops humilis','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Tropicales','Avril à Juin','Palmiers','Annuelle','Mi-ombre',NULL,42,'',NULL,5,2),
	 ('Herbe de la pampa','Cortaderia selloana','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Inde','Août à Septembre','Tiges herbacées','Annuelle','Soleil',NULL,43,'',NULL,4,1),
	 ('Seigle','Secale céréale','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Europe','Mai à Juillet','Tige dressée','Hiver','Soleil','1999-12-02',16,'',7,6,3),
	 ('Oyat','Ammophilia areanario','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Afrique','Juin à Août','Tige raide','Annuelle','Soleil','1999-12-02',17,'',7,5,3),
	 ('Marisque','Cladium mariscus','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Grêce','Juin à Août','Tige robuste','Automne','Mi-ombre','2001-12-02',18,'',7,1,3),
	 ('Danseuse étoile','Rhynchospara colorata','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Savoie','Mai à Octobre','Tige raide','Annuelle','Soleil et Mi-ombre','2002-12-02',19,'',7,5,3),
	 ('Riz Sauvage','Zizania aquatica','Lorem Ipsum Tetris Pacmanus Contrat Ghoulandghoustus marionus ','Montpellier','Juillet à Septembre','Tige raide','Annuelle','Soleil ','2004-12-02',24,'',7,1,3);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Aneth','Anethum graveolens','L''aneth est une plante annuelle qui parfume les plats à base de poisson, les légumes et les marinades d''une saveur anisée. On récolte aussi ses graines pour parfumer les cornichons au vinaigre et les liqueurs. Ses feuilles sont très fines et légèrement bleutées, elle offre des fleurs jaunes en ombelle en été. Apprenez à la cultiver au jardin.','Sud de l''Europe','Juin à Juillet','Caduc','De janvier à mai, de août à décembre','Soleil',NULL,25,'',NULL,13,1),
	 ('Pavot','Papaver','Sous le terme pavot, on désigne toutes les plantes du genre Papaver comme le coquelicot (Papaver rhoeas). Il appartient à la famille des Papaveracées. Plusieurs espèces sont utilisées comme fleurs d''ornement mais d''autres sont utilisées pour leurs vertus sédatives. Quelques variétés de l''espèce Papaver somniferum ne peuvent pas être cultivées en raison de leurs propriétés psychotropes. Découvrez différentes variétés et comment les cultiver.','Sud de l''Europe','Avril à Juin','Semi-persistant','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en juillet, Plantation en août','Soleil',NULL,26,'',NULL,13,2),
	 ('Ciboulette','Allium schœnoprasum','La ciboulette est un incontournable des aromatiques. Elle saupoudre les salades, les poissons et les omelettes. Semis et plantation, entretien et récolte : découvrez comment cultiver la ciboulette.','Sud de l''Europe','Juin à Juillet','Semi-persistant, Caduc','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en juillet, Plantation en août, Plantation en septembre, Plantation en octobre','Soleil, Mi-ombre',NULL,27,'',NULL,13,1),
	 ('Tillandsia','Tillandsia','Aussi appelés filles de l''air ou mousse espagnole, les Tillandsia sont d''originales plantes à la silhouette effilée. Certaines sont épiphytes et n''ont pas besoin de terre pour pousser ! Découvrez comment cultiver ces plantes exotiques dans votre intérieur.','Sud de l''Europe','Juin à Juillet','Persistant','Plantation en avril, Plantation en mai, Plantation en juin','Soleil',NULL,27,'',NULL,13,2),
	 ('Zamioculcas','Zamioculcas zamiifolia','Plante tropicale unique en son genre origine de Tanzanie, le zamioculcas zamiifolia est à la fois sublime et facile d''entretien. Avec ses luisantes feuilles vertes caudales en forme de plume se dressant fièrement, la "plante ZZ" se plaira en intérieur. Si vous l''arrosez comme il se doit et qu''elle bénéficie de lumière, le zamioculcas persistera et signera, pour votre plus grand plaisir.','Sud de l''Europe','','Persistant','Plantation en mars, Plantation en avril','Soleil, Mi-ombre',NULL,27,'',NULL,13,1),
	 ('Rhipsalis','Rhipsalis','Aussi appelé cactus-gui, le Rhipsalis est un cactus épiphyte original, sans épines. Formant une tignasse de tiges chevelues, il est facile à cultiver en intérieur. Rempotage, entretien, bouturage... Découvrez comment cultiver le Rhipsalis chez vous !','Sud de l''Europe','Juin à Juillet','','Plantation en mars, Plantation en avril, Plantation en mai','Mi-ombre',NULL,27,'',NULL,13,2),
	 ('Sedum (Orpin)','Sedum','Jolies plantes vivaces grasses, les Sedums habillent les terrains secs. En pleine terre ou en pot, découvrez quelles variété choisir et comment cultiver l''orpin !','Sud de l''Europe','Avril à Juin','Caduc',' Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en septembre, Plantation en octobre','Soleil',NULL,27,'',NULL,13,2),
	 ('Thym citron','Thymus x citriodorus','Le thym citron est l''une des espèces de thym les plus originales : pressez les feuilles sous vos doigts, il s''en dégagera une odeur délicatement citronnée. Cette plante aromatique est très utilisée en cuisine où elle agrémente de nombreux plats et elle est également ornementale : ses feuilles sont généralement panachées.','Sud de l''Europe','Juin à Août','Persistant','Plantation en mars, Plantation en avril, Plantation en septembre, Plantation en octobre','Soleil',NULL,46,'',NULL,13,1),
	 ('Passiflore','Passiflora','Sorte de liane aux grosses fleurs singulières, la passiflore est parfois surnommée "fleur de passion". Appartenant à la famille des Passifloracées, cette plante est originaire des régions tropicales d''Asie et d''Amérique. Il existe 400 espèces de passiflores dont une, Passiflora incarnata, est utilisée en phytothérapie comme sédatif ou anxiolytique. Une autre espèce, Passiflora edulis, donne les fruits de la passion. Tous nos conseils pour les choisir, les planter, les semer, les cultiver, les entretenir et les multiplier !','Sud de l''Europe','Juin à Juillet','Persistant','Plantation en avril, Plantation en mai, Plantation en juin, Plantation en septembre, Plantation en octobre','Soleil',NULL,46,'',NULL,13,1),
	 ('Stephanotis','Stephanotis floribunda','Le stephanotis, ou marsdenia, est l''une des plantes les plus odorantes au monde : d''où son surnom évocateur de "jasmin de Madagascar" ou de "fleur parfum". Cette liane persistante des forêts tropicales aux effluves envoûtantes se cultive en intérieur sous nos latitudes.','Nord de l''Inde','Juin à Juillet','Persistant','Plantation en mars, Plantation en avril, Plantation en mai','Mi-ombre',NULL,46,'',NULL,13,1);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Thunbergia alata','Acanthacées','Plante grimpante, cultivée comme annuelle ou bien en vivace d''intérieur, la Suzanne aux yeux noirs intrigue par sa fleur marquée d''un large œil sombre central. Son abondante floraison estivale renforce l''aspect de liane luxuriante, originale et graphique. Si la teinte orangée reste la plus connue des coloris de Thunbergia alata, il est possible de trouver des cultivars blancs, roses ou jaunes. Une belle volubile qui a ses aficionados !','Nord de l''Inde','Juin à Juillet','Persistant','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin','Soleil, Mi-ombre',NULL,46,'',NULL,12,1),
	 ('Vigne vierge','','Avec ses feuilles foisonnantes qui se parent de couleurs chatoyantes en automne, la vigne vierge est très prisée des propriétaires de maison. Un bon choix décoratif, puisqu''elle s''entretient très facilement.','Nord de l''Inde','','','Plantation en février, Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en août, Plantation en septembre','Soleil, Mi-ombre (en été)',NULL,46,'',NULL,12,2),
	 ('Radis','Raphanus sativus','Le radis (Raphanus sativus) est une plante potagère à racine comestible, de la famille des crucifères. Ce légume est facile à cultiver et rapide à germer. Cela en fait un favori des jardiniers amateurs. Selon les variétés (rose, blanc, noir, violet, etc.), la saveur est plus ou moins forte ou piquante. Voici toutes les astuces pour semer, cultiver et récolter des radis de tous les mois ou d''hiver.','Nord de l''Inde','Juin à Août','','','',NULL,46,'',NULL,12,1),
	 ('Miscanthus','Miscanthus sinensis','Robuste graminée d''origine asiatique, le miscanthus est une plante majestueuse une fois fleurie. Surnommée "herbe à éléphant", "roseau de Chine" ou encore "Eulalie", elle possède de multiples épis en forme de plumes soyeuses blanches, beiges, argentées à pourpre, et un feuillage ample au design varié. Touffue et hautement décorative, cette vivace est simple à cultiver : un vrai allié dans votre jardin !','Nord de l''Inde','Juin à Juillet','Caduc','Plantation en mars, Plantation en avril','Soleil, Mi-ombre',NULL,46,'',NULL,12,2),
	 ('Acanthe','Acanthus','Mesurant jusqu''à 2 m de haut pour 1 m de large, l''acanthe est une belle vivace volumineuse. Plante de caractère, ses immenses hampes florales en grappes et ses feuilles XXL ne laissent pas indifférent. Variétés, plantation, entretien... Découvrez comment cultiver l''acanthe !','Nord de l''Inde','Juin à Juillet','Semi-persistant, Persistant','Plantation en avril, Plantation en mai','Soleil, Mi-ombre',NULL,46,'',NULL,12,2),
	 ('Alpinia','Alpinia','Plante traditionnelle de la cuisine asiatique, l''Alpinia, ou galanga, peut se cultiver sous nos latitudes pour son feuillage exotique extrêmement décoratif. Facile à conserver en pot, il peut également être intégré au jardin grâce à quelques variétés au rhizome plus rustique.','Nord de l''Inde','Août à Septembre','Caduc, Persistant','Plantation en avril, Plantation en mai, Plantation en juin','Mi-ombre',NULL,34,'',NULL,12,1),
	 ('Chardon','','Le terme chardon désigne de nombreuses plantes épineuses. Ils sont généralement de la famille des Astéracées, comme les genres Carduus et Onopordum (chardon aux ânes), ou bien de la famille des Apiacées, comme le genre Eryngium, plus couramment appelé panicaut.','Ouest de l''Australie','Avril à Juin','Persistant','Plantation en janvier, Plantation en février, Plantation en mars, Plantation en avril, Plantation en septembre, Plantation en octobre, Plantation en novembre, Plantation en décembre','Soleil',NULL,34,'',NULL,12,2),
	 ('Coquelicot','Papaver rhoeas','Fleur des champs par excellence, le coquelicot tapisse les campagnes d''une belle couleur rouge une fois le printemps venu. Cette plante annuelle de la famille des Papavéracées est en fait une variété de pavot.','Ouest de l''Australie','Août à Septembre','Caduc','Plantation en mars, Plantation en septembre','Soleil','2021-05-04',5,'',NULL,12,3),
	 ('Edelweiss','Leontopodium alpinum','arfois surnommée "étoile d''argent" en raison de sa forme et de ses origines, l''edelweiss est avant tout une plante vivace des montagnes. Ses fleurs laineuses et son feuillage argenté s''observent à l''état sauvage principalement dans les Alpes, les Pyrénées ou les Carpates. Bien qu''elle pousse idéalement à une altitude de 2 000-3 000 mètres, elle se cultive aussi dans les jardins de plaine, en potée ou en rocaille. Appartenant à la famille des Astéracées, l''edelweiss se décline en 35 espèces.','Ouest de l''Australie','Avril à Juin','Caduc','Plantation en mars, Plantation en avril','Soleil','2021-05-05',5,'',NULL,12,3),
	 ('Giroflée','Cheiranthus cheirii','Plante vivace de la famille des Brassicacées, la giroflée ravenelle (Cheiranthus cheirii) dévoile des fleurs souvent orangées à quatre pétales. Appréciée pour son parfum, elle est également éphémère car bisannuelle. On dénombre actuellement 80 espèces de giroflées.','Ouest de l''Australie','Juin à Août','Caduc, Semi-persistant','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en octobre, Plantation en novembre','Soleil','2021-05-06',5,'',NULL,12,3);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Heuchère','Heuchera','Originaire du continent américain, l''Heuchera est surnommée "le désespoir du peintre". Les impressionnistes étaient charmés par cette plante, mais il leur était difficile d''en figer sur une toile la reproduction exacte à cause de l''abondance de fleurettes. Aujourd''hui, elle revient à la mode dans les jardins grâce aux coloris multiples de ses feuilles, du doré au pourpre profond.','Ouest de l''Australie','Juin à Août','Persistant','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en septembre, Plantation en octobre','Soleil, Mi-ombre',NULL,34,'',NULL,12,2),
	 ('Lotus','Nelumbo nucifera','Communément appelé "lotus sacré" ou "lotus des Indes", le lotus est une plante vivace aquatique de la famille des Nélumbonacées. D''apparence, on pourrait le confondre avec le nénuphar mais contrairement à celui-ci, ses feuilles sont rondes et non en forme de cœur. De plus, elles sont portées par des tiges plus longues et ne sont jamais à fleur d''eau. Originaire d''Asie, le lotus est une fleur sacré dans la religion bouddhiste. De nombreux cultivars ont été mis au point à partir de l''espèce Nelumbo nucifera. Leur taille varie de 70 cm à 1,5 m et leur couleur va du blanc au rose.','Ouest de l''Australie','Juillet à Septembre','Caduc','Plantation en mai, Plantation en juin, Plantation en juillet','Soleil',NULL,34,'',NULL,12,2),
	 ('Marguerite','Leucanthemum','Plante touffue reconnaissable à ses grandes fleurs blanches, la marguerite appartient à la famille des Astéracées. Elle se trouve communément en Europe dans les prés mais elle peut également se cultiver au jardin.','Ouest de l''Australie','Août à Septembre','Semi-persistant','Plantation en avril, Plantation en mai','Soleil',NULL,34,'',NULL,12,1),
	 ('Oiseau de paradis','Strelitzia','Le strelitzia, ou oiseau de paradis, est une plante tropicale au nom et à l''allure évocateurs. Le strelitzia est connu pour ses grandes fleurs colorées étonnantes. Elles font penser à un oiseau huppé. Voici ce qu''il faut savoir sur cette plante qui se plaira dans des climats doux ou océaniques.','Ouest de l''Australie','Juillet à Septembre','Persistant','Plantation en mars, Plantation en avril, Plantation en mai ','Soleil, Mi-ombre',NULL,36,'',NULL,12,1),
	 ('Pensée','Viola','Parmi le genre Viola qui comprend 500 espèces, on distingue les pensées et les violettes, aux coloris très variés. Originaires d''Europe, les pensées sont des fleurs à cinq pétales faisant partie de la famille des Violacées. Découvrez comment la planter, la semer, l''entretenir et la multiplier.','Ouest de l''Australie','Juillet à Septembre','Persistant','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en juin, Plantation en juillet, Plantation en août, Plantation en septembre, Plantation en octobre, Plantation en novembre','Soleil, Mi-ombre',NULL,36,'',NULL,12,1),
	 ('Potentille','Potentilla','Longtemps considérée comme une mauvaise herbe, la potentille retrouve ses lettres de noblesse dans nos jardins, sous forme de couvre-sol ou de petit arbuste décoratif. Facile à cultiver, cette plante offrira une longue floraison aux couleurs variées. Découvrez nos conseils d''entretien.','Ouest de l''Australie','Juillet à Septembre','Caduc','Plantation en mars, Plantation en avril, Plantation en mai, Plantation en septembre, Plantation en octobre, Plantation en novembre','Soleil, Mi-ombre',NULL,36,'',NULL,12,1),
	 ('Tournesol','Helianthus annuus','Egalement connu sous le nom de soleil, le tournesol est une plante lumineuse avec ses larges fleurs jaunes. De son nom scientifique Helianthus annuus, il s''agit d''une espèce annuelle de la famille des Astéracées. Plantation, semis, entretien, multiplication, bouquet, récolte... Devenez incollable sur les tournesols ! Originaire d''Amérique du Sud et introduit en Europe au XVIe siècle, il est principalement cultivé pour produire de l''huile alimentaire. Plus récemment, il a été introduit dans la fabrication de biocarburants. Certaines variétés de tournesols sont malgré tout cultivées en plante d''ornement. Faciles à vivre, découvrez comment cultiver ces fleurs solaires dans le jardin ou sur la terrasse.','Ouest de l''Australie','Juillet à Septembre','Caduc','Plantation en avril, Plantation en mai','Soleil',NULL,36,'',NULL,12,1),
	 ('Œillet d''Inde','Tagetes patula','L''œillet d''Inde (Tagetes patula) figure parmi les plantes annuelles les plus cultivées. Son nom dérive de la forme de ses fleurs (qui font penser à des œillets) et de son origine (Amérique centrale et Mexique, encore appelés les "Indes" à l''époque). Plante très décorative, ses coloris entre jaune, orange et acajou séduisent à coup sûr.','Ouest de l''Australie','Juillet à Septembre','Caduc','Plantation en février, Plantation en mars (après les premières gelées. La température extérieure doit être supérieure à 18 °C)','Soleil',NULL,36,'',NULL,12,2),
	 ('Arbre à perruque','Cotinus coggygria','Le Fustet commun, Arbre à perruque, Sumac des teinturiers ou Sumac fustet, est une espèce de plantes à fleurs de la famille des Anacardiaceae et du genre Cotinus. C''est un arbuste à feuilles arrondies originaire d''Asie et d''Europe tempérées, souvent planté pour ses qualités de plante ornementale','chine du centre','été','caduc','automne','mi-ombre',NULL,36,'',NULL,12,1),
	 ('Bambou doré','Phyllostachys aurea','Bambou qui s''adapte facilement à tous sols avec une bonne résistance à la sécheresse et une bonne tenue au froid. Exposé au soleil, le chaume peut virer au jaune. S''adapte au bord de mer. Bambou primé par un Award of Garden Merit par la Royal Horticulture Society pour ses qualités ornementales exceptionnelles.','chine de l''est','printemp','caduc','automne','soleil','2021-06-06',1,'',7,3,3);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Acanthe épineuse','Acanthus spinosus','Très belle plante d''allure imposante, Acanthus spinosus a de très grandes feuilles arquées profondément découpées, jusqu''à la nervure ou presque, et à pointes épineuses. En été, de nombreux épis de fleurs en entonnoir, pourpre et blanc, viennent accentuer l''aspect imposant de cette belle vivace.','est méditerranéen','été','persistant','hiver','ombre',NULL,19,'Plus de précision en floraison',7,1,4),
	 ('Sauge sclarée','Salvia sclarea','La sauge sclarée est une plante herbacée bisannuelle ou vivace (de vie courte), très odorante, très velue, de 40-100 cm de hauteur dans la nature mais pouvant atteindre 1,60 m en culture. Les tiges quadrangulaires sont assez robustes, érigées, ramifiées. Elles portent dans la partie supérieure des poils glanduleux (contenant de l''huile essentielle) et sont pubescentes ailleurs.','ouest méditerranéen','printemp','caduc','printemp','mi-soleil',NULL,10,'',NULL,4,1),
	 ('Arnica des montagnes','Arnica montana','L’Arnica des montagnes ou Arnica montana est une espèce de plantes herbacées vivace rhizomateuse du genre Arnica et de la famille des Asteraceae. Cette plante européenne principalement montagnarde est typique des sols acides et pauvres en éléments nutritifs1. Ses populations, fortement malmenées par l''agriculture intensive, deviennent de plus en plus rares. Cette situation lui vaut d''ailleurs d''être nommée dans de nombreux textes de loi la protégeant et particulièrement dans la Directive habitats européenne','ouest oriental','automne','persistant','automne','mi-ombre',NULL,7,'',NULL,15,2),
	 ('Mimosa d''hiver','Acacia dealbata','Acacia dealbata est une espèce d''arbres ou d''arbrisseaux, couramment désignés sous le nom de « mimosa d''hiver » ou « mimosa des fleuristes », appartenant à la sous-famille des Mimosoidées.','est oriental','hiver','caduc','été','soleil',NULL,3,'',NULL,3,1),
	 ('Thym','Thymus','Thymus est un genre de plantes de la famille des Lamiacées. Ce genre comporte plus de 300 espèces. Ce sont des plantes rampantes ou en coussinet portant de petites fleurs rose pâle ou blanches. Ces plantes sont riches en huiles essentielles et à ce titre font partie des plantes aromatiques. ','sud mediterranéen','printemp','caduc','automne','soleil',NULL,16,'',NULL,4,2),
	 ('Millepertuis ','Hypericum perforatum','Le millepertuis (Hypericum perforatum, également appelé « herbe de la Saint-Jean ») est une plante courante des talus et des prés. Son nom vient du fait que, vues à contre-jour, ses feuilles semblent percées d''un grand nombre de petits orifices','nord méditerranéen','hiver','caduc','printemp','mi-ombre',NULL,2,'',NULL,8,1),
	 ('Hortensia','Hydrangea','Hydrangea est un genre d''arbustes et d''arbres appartenant à la famille des Hydrangeaceae dont l''espèce la plus connue est une espèce hybride, appelée Hydrangea ×serratophylla, obtenue par croisement entre Hydrangea macrophylla et Hydrangea serrata (en). Les plantes horticoles connues sous le nom de « Hortensias » se distinguent des plantes issues de la nature par leurs inflorescences composées de fleurs presque toutes stériles, dont l''ensemble forme une boule ou une demi-boule. Les hortensias appartiennent soit à l''espèce hybride Hydrangea × serratophylla, soit à l''espèce Hydrangea macrophylla. Par extension, les espèces du genre Hydrangea sont souvent dénommées « Hortensia » suivi d''un qualificatif, comme « hortensia grimpant » pour Hydrangea anomala. Le nom « hortensia » n''a aucune valeur botanique, il s''agit d''une dénomination purement horticole.','ouest oriental','automne','caduc','été','mi-soleil',NULL,3,'',NULL,11,1),
	 ('Houblon doré','Houdronus doriunus','Si vous préférez un feuillage encore plus décoratif mais tout aussi vigoureux que celui de la vigne vierge, le houblon doré est fait pour vous ! De croissance rapide voire très rapide (après plantation, le houblon va prendre 3 cm la première semaine, puis mesurer 10 cm la semaine suivante, et déjà un mètre après le premier mois si les conditions de culture s''y prêtent !), cette magnifique plante grimpante s''enroule autour de tout support et peut atteindre 6 mètres de haut en même pas un an. Ses feuilles joliment découpées passent du jaune au vert pendant l''été et habillent joliment les grillages, les treilles et autres pergolas. ','sud mediterranéen','été','caduc','printemp','ombre',NULL,9,'',NULL,12,1),
	 ('Vigne vierge','Vignus Viergorum','La vigne vierge est une plante grimpante bien connue des jardiniers pressés ;  avec sa croissance rapide (elle grandit d''environ 2 à 3 mètres par saison) et son feuillage dense, elle n''a pas son pareil pour recouvrir un muret, une pergola ou un treillage en moins de temps qu''il ne faut pour le dire.  Elle est d''ailleurs tellement réputée pour couvrir de grandes surfaces en peu de temps que de nombreux jardiniers, surpris par sa croissance très rapide, la trouvent finalement trop envahissante ! ','nord méditerranéen','automne','caduc','automne','ombre',NULL,10,'',NULL,13,1),
	 ('Jasmin étoilé','Jasminum Starlitghtus','Le jasmin étoilé, aussi appelé faux jasmin, n''a pas grand-chose à voir avec le jasmin classique. Plus résistant, il supporte mieux les basses températures (jusque -15 degrés) et son feuillage dense et persistant permet d''habiller toute l''année murs, grilles et pergolas. ','nord oriental','hiver','caduc','automne','ombre',NULL,10,'',NULL,1,1);
INSERT INTO plant_db.Plant (name,latin_name,description,origin,flowering,foliage,plantation_period,plantation_location,published_date,creator_id,review,reviewer_id,family_id,status_id) VALUES
	 ('Clématite persistante','Clemantitae Persistae','la célèbre clématite peut doubler de taille en à peine un mois et couvrir rapidement les pergolas, les grillages et les treilles dans un jardin. Attention toutefois à choisir une variété de clématite à feuillage persistant (comme par exemple les variétés Armandii, Michiko ou Avalanche) afin d''en profiter toute l''année, surtout si vous souhaitez masquer un vis-à-vis ou cacher un muret disgracieux.
','sud meridionnal','été','caduc','printemp','ombre',NULL,10,'',NULL,2,1),
	 ('Rosier de Banks','Rosace Bankstoum','le rosier de Banks présente de multiples avantages : premièrement, il est sans épine ; deuxièmement, il est très vigoureux, facile d''entretien et exempt de maladies ; troisièmement, il peut atteindre 15 m de haut ; et surtout, il s''agit d''un rosier qui conserve son feuillage même en hiver. Cette plante grimpante est donc parfaite pour couvrir une grille ou une rambarde rapidement, et toute l''année ','ouest asiatique','printemp','caduc','automne','ombre',NULL,15,'',NULL,3,1),
	 ('Passilore','Passiflorae','Avec une croissance très rapide, un feuillage persistant qui peut dépasser les 5 mètres de hauteur et une floraison qui dure de mai à octobre, vous êtes sûr(e) d''étoffer rapidement votre grillage ou votre pergola. Les fruits orangés de la plante, quoique non comestibles, apportent également en été une touche de couleur contrastante. N''hésitez d''ailleurs pas à planter votre passiflore au pied d''un arbre à floraison printanière pour lui apporter de jolies couleurs durant la saison estivale !
 ','est asiatique','automne','persistant','printemp','ombre',NULL,15,'',NULL,4,1),
	 ('Orties','Ortiarae','Le rôle de l''ortie est de nettoyer les sols. Il vaut donc mieux observer l''endroit où elle pousse. Car elle est aussi à l''aise dans une décharge que dans un jardin, à côté du tas de compost. L''ortie est riche en calcium, en fer et en vitamine C. Pour en bénéficier, vous pouvez en manger les têtes ou les feuilles. Le plus simple est de les cuisiner avec des pommes de terre, dans une tarte, une quiche, ou tout autre plat de ce genre. Mais vous pouvez aussi faire un beurre d''ortie.
','ouest méditerranéen','printemp','persistant','été','soleil',NULL,15,'',NULL,5,1),
	 ('Trêfle','Treflus','Le trèfle on le connait tous, on le trouve un peu partout, mais si vous n’en avez jamais goûté, vous risquez d’être surpris. Cette plante est délicieuse, le goût est fin et elle peut parfaitement être mangée en salade pour accompagner des tomates ou une tarte salée. Il suffit d’essayer pour être convaincu.','sud oriental','été','persistant','automne','soleil',NULL,1,'Des modifications doivent être apporter',7,2,4),
	 ('Plantain','Plantatis','Cette plante que l’on trouve un peu partout et souvent à proximité des orties fleurit entre mai et octobre. Elle se déguste en salade avec juste un peu d’huile d’olive au thym et un filet de balsamique. Elle possède diverses vertus, elle peut soulager les piqûres d’ortie et elle contribue à la biodiversité, car les oiseaux en particulier l’aiment beaucoup','nord asiatique','automne','persistant','hiver','mi-ombre','2021-05-03',2,'',5,3,3),
	 ('Asperge sauvage','Apsergum','Elle pousse  de préférence dans les lieux rocailleux et arides et les terrains calcaires dans le bassin méditerranéen. Elle est riche en vitamines de toutes sortes et en minéraux. Les jeunes pousses sont délicieuses et très tendres, elles peuvent être cuites comme les asperges classiques et dégustées de la même manière. Les racines sont également comestibles.','sud-ouest méditerranéen','printemp','caduc','printemp','mi-soleil',NULL,3,'',NULL,5,2),
	 ('Macéron','Acartym acerum','La Macéron est une plante qui pousse sur le bord des routes, dans les bois, les haies d’arbres et qui est fortement odorante. On le récolte avant la floraison en coupant les tiges feuillues les plus proches du sol en privilégiant celles qui sont blanchies par la végétation. Il faut ôter les parties vertes et les faire cuire à la vapeur ou bouillir quelques minutes. L’odeur anisée disparait en cuisant, elle est ensuite consommée comme des asperges. Les jeunes feuilles peuvent être servies en salade ou dans des sauces.','sud asiatique','printemp','caduc','printemp','soleil',NULL,9,'',NULL,6,2);



-- `plant_db`.Plantphoto data

INSERT INTO plant_db.Plantphoto (url,plant_id) VALUES
	 ('https://www.detentejardin.com/sites/art-de-vivre/files/Import/www.iconojardin.fr-dja_plantes_interieur.jpg',21),
	 ('https://img.grouponcdn.com/deal/wPYL48rkmrwfvKUijefM/69-450x300/v1/t600x362.jpg',22),
	 ('https://jardinage.lemonde.fr/images/dossiers/2022-02/mini/rhapis-excelsa-183235-650-325.jpg',23),
	 ('https://www.deco.fr/sites/default/files/styles/article_970x500/public/2019-12/plantes-retombantes.jpg?itok=tIFjciWQ',24),
	 ('https://www.deco.fr/sites/default/files/styles/article_970x500/public/2019-12/plantes-retombantes.jpg?itok=tIFjciWQ',25),
	 ('https://www.18h39.fr/wp-content/uploads/2019/10/plantes-innovation-getty-600x420.jpg',26),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974.jpg',27),
	 ('https://www.rustica.fr/images/chlorophytum-depolluants.jpg',28),
	 ('https://i0.wp.com/jardinierparesseux.com/wp-content/uploads/2018/01/20180126c-aspidistra-www-palmaverde-nl.jpg?resize=699%2C692&ssl=1',29),
	 ('https://www.gammvert.fr/conseils/sites/default/files/styles/main_image/public/2020-06/AdobeStock_272697122-maison.jpg?itok=m9gQkzdF',30);
INSERT INTO plant_db.Plantphoto (url,plant_id) VALUES
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974.jpg',31),
	 ('https://www.18h39.fr/wp-content/uploads/2019/10/plantes-innovation-getty-600x420.jpg',32),
	 ('https://www.18h39.fr/wp-content/uploads/2019/10/plantes-innovation-getty-600x420.jpg',33),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974.jpg',34),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974',35),
	 ('https://www.deco.fr/sites/default/files/styles/article_970x500/public/2019-12/plantes-retombantes.jpg?itok=tIFjciWQ',36),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974',37),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974',38),
	 ('https://www.deco.fr/sites/default/files/styles/article_970x500/public/2019-12/plantes-retombantes.jpg?itok=tIFjciWQ',39),
	 ('https://jardinerfacile.fr/wp-content/uploads/2020/01/iStock-1058638974',40);
INSERT INTO plant_db.Plantphoto (url,plant_id) VALUES
	 ('https://img-3.journaldesfemmes.fr/iXGA8Ml8htrpXaEpyZwjBQ6DFwM=/1500x/smart/8a239fdea8b14727a58dd58234db9932/ccmcms-jdf/16652928.jpg',41),
	 ('https://img-3.journaldesfemmes.fr/aOyasFIaJHTe5n6-mroRkar5G0A=/1500x/smart/133b155cab22411db4828ebd372a9898/ccmcms-jdf/16460624.jpg',42),
	 ('https://img-3.journaldesfemmes.fr/ZoU6sfu72JOPIQQOEB6uVnwA-Aw=/1500x/smart/06b555f74d3c4137a046f6bee6e2871d/ccmcms-jdf/16769440.jpg',43),
	 ('https://img-3.journaldesfemmes.fr/Wv-UWP0HE6yrpawfLlS8ECQuqWM=/1500x/smart/85b319f1fccb457497fe67f3a5f52716/ccmcms-jdf/16652830.jpg',44),
	 ('https://img-3.journaldesfemmes.fr/4bsqCMAfgpmlRqhbZ0n0BNV8-Hc=/1500x/smart/7b52a5c98ffd441baa9322a70355e7da/ccmcms-jdf/16462450.jpg',45),
	 ('https://img-3.journaldesfemmes.fr/rEMmZiOLT0VgaHUwE1uE-mljXt8=/1500x/smart/c20b21486c89437f84aca405c0d16626/ccmcms-jdf/19375809.jpg',46),
	 ('https://img-3.journaldesfemmes.fr/Men2g5uPProm-HaE4dZbtSku0XA=/1500x/smart/798a38a93dd5488893333791556ec032/ccmcms-jdf/10969431.jpg',47),
	 ('https://img-3.journaldesfemmes.fr/fdlo1JElSGZSuMUaN7gpKnETcYE=/1500x/smart/4e3e4765161e46fdb65820abf06e46f5/ccmcms-jdf/17040635.jpg',48),
	 ('https://img-3.journaldesfemmes.fr/C446m9g97ERVRpvmYBBaFOLyf6o=/1500x/smart/3cd6da94109f49218d8e1f5701e8a997/ccmcms-jdf/2306680-tout-savoir-sur-la-vigne-vierge.jpg',49),
	 ('https://img-3.journaldesfemmes.fr/l_kRmDrwujHieAlamW95-GdT3X8=/1500x/smart/eabc652c1f984e959a078dcf338fad1b/ccmcms-jdf/14867174.jpg',50);
INSERT INTO plant_db.Plantphoto (url,plant_id) VALUES
	 ('https://img-3.journaldesfemmes.fr/RJWV4-oDv5qsjdCW3tJjKutfxHg=/1500x/smart/df86b3fdb8c0499e91f8381a977dc771/ccmcms-jdf/16500061.jpg',51),
	 ('https://img-3.journaldesfemmes.fr/JsHxcHQLVtI0lwuC3NtGRTF9XmU=/1500x/smart/d40c97827ee644d5980cd42d322bf4c8/ccmcms-jdf/15306899.jpg',52),
	 ('https://img-3.journaldesfemmes.fr/JqhQrC7-41QYKbetrx7nyOqr8TU=/1500x/smart/3e3205b1da2744cfa6732e06ebb1fac1/ccmcms-jdf/10959378.jpg',53),
	 ('https://img-3.journaldesfemmes.fr/3ckoTtH87Rzpi3BuYpP4grWMk_Y=/1500x/smart/485eb0043f5b4850b658a519c96699c3/ccmcms-jdf/11433864.jpg',54),
	 ('https://img-3.journaldesfemmes.fr/vUFvLkeoxYGDFmF1ZBiPdlHCnoA=/1500x/smart/68ac12ed12f84f99bc0759fdc408dee2/ccmcms-jdf/10960187.jpg',55),
	 ('https://img-3.journaldesfemmes.fr/9jO8zGCGO8djAsqp2AIRqFKydB4=/1500x/smart/800db60b82e24ec4ae16aebf362f7e4d/ccmcms-jdf/10963418.jpg',3),
	 ('https://img-3.journaldesfemmes.fr/ATQBJ5mqAMU60iE7QoO3PBHDB9A=/1500x/smart/cf3a4b57c6c14d78b1a215b4977fa40e/ccmcms-jdf/19331116.jpg',3),
	 ('https://img-3.journaldesfemmes.fr/Iin97FhDVkrPYgOZaXCu114dMqY=/1500x/smart/c807f8e4afd849b98c4225598e447b54/ccmcms-jdf/10964945.jpg',3),
	 ('https://img-3.journaldesfemmes.fr/khF0zsBH8JPStukQFmMBay9Z1J8=/1500x/smart/01a0126b1a9c44f2a1f4b5834401a103/ccmcms-jdf/16116512.jpg',5),
	 ('https://img-3.journaldesfemmes.fr/M5kgWvZCx6bmAM5Lh3t6j2N3Ozs=/1500x/smart/84f8e4eb53534a1a98e9ca86f3a6598a/ccmcms-jdf/10969485.jpg',5);
INSERT INTO plant_db.Plantphoto (url,plant_id) VALUES
	 ('https://img-3.journaldesfemmes.fr/nCNajefHRLHxlcW1GPdLYe0SfBU=/1500x/smart/0480939e7d8c444fadab82862a4bfb7b/ccmcms-jdf/19621092.jpg',5),
	 ('https://img-3.journaldesfemmes.fr/rsQHXTV4HiM3-QyBhLdBRgUfz3o=/1500x/smart/84771b8a93ca44e691a680b4d933d659/ccmcms-jdf/10971137.jpg',20),
	 ('https://img-3.journaldesfemmes.fr/K8OyiwLwignSePC87kyqRUp8jL0=/1500x/smart/1079ac1a7a4d4f40b555617e6e8c134b/ccmcms-jdf/10972244.jpg',20);