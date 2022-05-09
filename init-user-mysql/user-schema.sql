CREATE DATABASE IF NOT EXISTS `user_db`  /*!40100 DEFAULT CHARACTER SET latin1 */;
-- USE `user_db`;
-- GRANT ALL ON `user_db`.* TO 'user'@'%';

-- `user_db`.Promotion definition

CREATE TABLE `Promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `year` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- `user_db`.`Role` definition

CREATE TABLE `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- `user_db`.`User` definition

CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_connect` tinyint(1) NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `promotion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_FK` (`role_id`),
  KEY `user_FK_1` (`promotion_id`),
  CONSTRAINT `User_FK` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `User_FK_1` FOREIGN KEY (`promotion_id`) REFERENCES `Promotion` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- `user_db`.Favorite definition

CREATE TABLE `Favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_FK` (`user_id`),
  CONSTRAINT `favorites_FK` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- `user_db`.promotions data

INSERT INTO `user_db`.Promotion (title,`year`) VALUES
	 ('garden-1','2020-01-01'),
	 ('garden-2','2021-01-01'),
	 ('floral-1','2021-01-01'),
	 ('floral-2','2022-01-01'),
	 ('garden-3','2022-01-01');

-- `user_db`.roles data

INSERT INTO `user_db`.`Role` (`role`) VALUES
	 ('apprenant'),
	 ('formateur'),
	 ('coordinateur');

INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('kilian','varin','BGN.k.varin@fondespierre.com','1234',0,1,2),
	 ('oscar','werle','BGN.o.werle@fondespierre.com','1234',1,1,2),
	 ('nicolas','giraud','BGN.n.giraud@fondespierre.com','1234',1,1,3),
	 ('nicolas','gautier','BGN.n.gautier@fondespierre.com','1234',0,2,NULL),
	 ('frédéric','dumortier','BGN.f.dumortier@fondespierre.com','1234',1,3,NULL),
	 ('loïc','derrieux','BGN.l.derrieux@fondespierre.com','1234',0,2,NULL),
	 ('sophie','dubois','BGN.s.dubois@fondespierre.com','1234',1,3,NULL),
	 ('jean-louis','david','BGN.j.david@fondespierre.com','1234',1,1,1),
	 ('mélanie','lefebvre','BGN.m.lefebvre@fondespierre.com','1234',1,1,2),
	 ('damien','nguyen','BGN.d.nguyen@fondespierre.com','1234',1,1,5);
INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('jessica','sanchez','BGN.j.sanchez@fondespierre.com','1234',0,2,NULL),
	 ('pedro','boyer','BGN.p.boyer@fondespierre.com','1234',1,1,5),
	 ('amélie','duval','BGN.a.duval@fondespierre.com','1234',1,1,3),
	 ('valentine','joly','BGN.v.joly@fondespierre.com','1234',1,1,4),
	 ('rené','muller','BGN.r.muller@fondespierre.com','1234',1,1,2),
	 ('jeanne','simon','BGN.simon@fondespierre.com','1234',0,1,1),
	 ('alain','moreau','BGN.a.moreau@fondespierre.com','1234',1,1,1),
	 ('guillaume','fournier','BGN.g.fournier@fondespierre.com','1234',1,1,3),
	 ('Anne-marie','morel','BGN.a.morel@fondespierre.com','1234',1,1,2),
	 ('jean-dominique','girard','BGN.j.girard@fondespierre.com','1234',1,1,5);
INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('soraya','morrin','BGN.s.morrin@fondespierre.com','1234',0,1,2),
	 ('julie','perrin','BGN.j.perrin@fondespierre.com','1234',1,1,1),
	 ('julien','perez','BGN.j.perez@fondespierre.com','1234',1,1,2),
	 ('dominique','meunier','BGN.d.meunier@fondespierre.com','1234',0,1,5),
	 ('damien','aubert','BGN.d.aubert@fondespierre.com','1234',1,1,3),
	 ('didier','gonzalez','BGN.d.gonzalez@fondespierre.com','1234',1,1,3),
	 ('liam','carpentier','BGN.l.carpentier@fondespierre.com','1234',1,1,5),
	 ('wiliam','grandjean','BGN.w.grandjean@fondespierre.com','1234',1,1,4),
	 ('nathan','baudry','BGN.n.baudry@fondespierre.com','1234',1,1,4),
	 ('olivia','chauveau','BGN.chauveau@fondespierre.com','1234',1,1,1);
INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('thomas','lelievre','BGN.t.lelievre@fondespierre.com','1234',1,2,NULL),
	 ('léa','toussaint','BGN.l.toussaint@fondespierre.com','1234',1,1,3),
	 ('charlotte','bonneau','BGN.c.bonneau@fondespierre.com','1234',1,1,4),
	 ('édouard','pruvost','BGN.e.pruvost@fondespierre.com','1234',1,1,5),
	 ('jacob','lombard','BGN.j.lombard@fondespierre.com','1234',1,1,5),
	 ('lucas','leconte','BGN.l.leconte@fondespierre.com','1234',1,1,3),
	 ('lucas','prevot','BGN.l.prevot@fondespierre.com','1234',1,1,1),
	 ('alexis','flament','BGN.a.flament@fondespierre.com','1234',1,1,2),
	 ('victoria','merlin','BGN.v.merlin@fondespierre.com','1234',1,1,1),
	 ('arthur','fayolle','BGN.a.fayolle@fondespierre.com','1234',1,1,2);
INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('olivier','deshayes','BGN.o.deshayes@fondespierre.com','1234',1,1,3),
	 ('benjamin','marteau','BGN.b.marteau@fondespierre.com','1234',1,1,4),
	 ('juliette','hamelin','BGN.j.hamelin@fondespierre.com','1234',1,1,5),
	 ('antoine','binet','BGN.a.binet@fondespierre.com','1234',1,1,5),
	 ('pénélope','brochart','BGN.p.brochart@fondespierre.com','1234',1,1,5),
	 ('mila','thevenin','BGN.m.thevenin@fondespierre.com','1234',1,1,5),
	 ('olivier','baudoin','BGN.o.baudoin@fondespierre.com','1234',1,1,2),
	 ('laurence','bordes','BGN.l.bordes@fondespierre.com','1234',1,1,3),
	 ('adele','pouget','BGN.a.pouget@fondespierre.com','1234',1,1,4),
	 ('charles','de gaulle','BGN.c.degaulle@fondespierre.com','1234',1,1,4);
INSERT INTO `user_db`.`User` (first_name,last_name,email,password,first_connect,role_id,promotion_id) VALUES
	 ('charles','saint-andré','BGN.c.saint-andre@fondespierre.com','1234',1,1,1);


-- `user_db`.Favorite data

INSERT INTO `user_db`.Favorite (user_id,plant_id) VALUES
	 (2,12),
	 (2,4),
	 (5,45),
	 (3,38),
	 (7,9),
	 (7,40),
	 (11,12),
	 (13,18),
	 (13,21),
	 (13,32);
INSERT INTO `user_db`.Favorite (user_id,plant_id) VALUES
	 (16,50),
	 (44,2),
	 (44,5),
	 (50,1),
	 (1,39),
	 (3,13),
	 (7,13),
	 (44,13),
	 (3,13),
	 (3,13);