-- noinspection SqlNoDataSourceInspectionForFile

USE quiz;

drop table if exists info;
drop table if exists results;
drop table if exists questions;
drop table if exists programingAnswers;

CREATE TABLE `info` (
  `option` varchar(11) NOT NULL,
  `value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `answer` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `results` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `solved` int NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table programingAnswers
(
    id int not null primary key,
    answer int not null
);

ALTER TABLE `info`
  ADD PRIMARY KEY (`option`);

ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solved` (`solved`);

ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`solved`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

INSERT INTO `info` (`option`, `value`) VALUES
('ciutat', 'Banyoles'),
('despedida', '
Ho has aconseguit. Has vençut i has aconseguit el PHD, que demostra la teva valentia i resiliència, i el que t''obre les portes de la sortida.
O encara no.
Darrere teu, sents unes passes. Et gires i veus la teva mare, amb un gran ganivet, apropant-se a una velocitat vertiginosa. Saps que això no és un videojoc, i que no tens res a fer contra ella. Intentes córrer, sense mirar enrere, per perdre-la de vista, però no serveix de res. Abans de poder processar el que acaba de passar, ja la tens a tocar. No tens escapatòria, i de mica en mica, cada cop t''arracona més contra els murs del maleït soterrani. Però de cop i volta, com si es tractés d''una intervenció divina, els teus ulls albiren l''esperança. D''una de les estanteries podrides, cau una Bíblia, en un cop sec, sobre el cap de la teva mare. Ella cau desplomada. L''Isaac, contra tot pronòstic, ha sortit triomfant.
Malgrat això, està passant alguna cosa. El teu cap dona voltes, i les llàgrimes que et cauen per les galtes no s''assequen. La teva visió es torna borrosa, i la imatge que projecten els teus ulls canvia completament. Aquest desenllaç només havia estat una de les històries que havies escrit sol, a la teva habitació, quan estaves perdut en pensaments negatius. La teva memòria estava evocant records dels teus desitjos més profunds.
Aquests miratges s''esvaeixen, i deixen darrere seu la realitat que tant vols eludir. La porta s''obre estrepitosament amb un cop de peu. Entreveus la figura de la teva mare, sorgint progressivament d''entre la penombra, amb el ganivet alçat entre les seves mans.
'),
('introduccio', '
Ets l''Isaac, un nen que viu en una casa petita amb la seva mare. El teu pare us va abandonar, i tu trobes refugi dibuixant i jugant amb les teves joguines. Mentrestant, la teva mare es comença a obsessionar ràpidament per la Bíblia, passant-se el dia mirant programes cristians a la televisió.
De cop i volta, la teva mare comença a sentir una veu divina, que li diu que el seu fill està corromput pel pecat. Per aconseguir la teva salvació, et treu totes les joguines, els dibuixos, la consola i fins i tot la teva roba.
La veu torna a aparèixer, exigint que has de ser aïllat de tot el mal present al món, i la teva mare compleix les ordres, i et tanca a la teva habitació.
Tot i això, la veu divina intervé una vegada més, felicitant la teva mare per complir la voluntat de Déu, però encara dubtant de la seva fe. Com a prova inapel·lable, li demana el teu sacrifici. Sense qüestionar-se les paraules del missatger, es dirigeix a la cuina a agafar un ganivet, i seguidament pren rumb cap a la teva habitació.
Tu, que has vist tota la seqüència a través de l''escletxa de la porta, entres en pànic i comences a buscar desesperadament la trapa sota la catifa que du al soterrani. Apuradament, hi saltes a dins per escapar de la teva mare, que ha estat consumida pels seus deliris.
');

INSERT INTO `questions` (`id`, `question`, `answer`) VALUES
(1, '
Desubicat, et trobes envoltat de monstres grotescos que volen acabar amb tu. El soterrani, dividit en plantes, és el reflex de la teva complicada infància i els teus traumes: el rebuig per part de la teva mare, l''assetjament escolar, l''abandonament del teu pare i l''odi que sents per tu mateix. En aquesta situació, no saps quines memòries són reals o no, ni tampoc si és un somni o si tan sols estàs viu.
En qualsevol cas, has de fer tot el possible per seguir descendint en aquell indret. \n
Al cap d''una estona esprintant, amb prou feines capaç d''esquivar les bèsties, i perdent-te entre laberíntics murs humits, et topes amb un ordinador obsolet, amb una pantalla empolsegada i pampalluguejant, encès en un racó.
Enganxat a la pantalla, hi trobes un paperet descolorit amb les instruccions d''entrar en un servidor de PuTTY amb l''usuari "isaac", de contrasenya homònima. Has de trobar un arxiu anomenat ''Delirium'' i inspeccionar el seu contingut.
\nIntrodueix el nom del item obtingut:',
'Broken Modem'),
(
2, '\n
Has aconseguit superar la primera prova, i amb l''ajuda de l''objecte que se t''ha atorgat has obtingut accés a un usuari d''Active Directory. El nom d''usuari és Isaac, però la contrasenya sembla estar xifrada en el següent codi;
idBrokenModem + 144 141 165 163 + 1100100 1100101 110010 110000 100001

En descendir al pròxim nivell, les parets del llarg passadís en què et trobes tenen escrites de manera tètrica les instruccions del següent repte.
Per obtenir una pista que et pot dur cap a la teva escapatòria, has d''entrar en un client d''Isard amb la contrasenya obtinguda i configurar la seva IP correctament (dins el rang 10.0.60.X), un cop fet això, entra al recurs compartit per xarxa (\\SERVER\Users\Administrador\Documents\Isaac). Allà hi trobaràs la teva següent pista.
\nIntrodueix el nom de l''item obtingut:'
, 'Missing No.'
),
(3, '\n
Guiat pel paper que acabes de trobar, ja saps a quina prova t''has d''enfrontar.
\nIntrodueix el nom de l''item obtingut:'
, 'Sharp Plug'),
(4, '\n
Sembla que qui fos que t''hagués deixat les indicacions, tenia raó.
Tens un breu instant d''alegria, que s''esvaeix tan bon punt t''adones que estàs completament perdut. No saps què fer. Comences a intentar recordar tota la informació que has recaptat des del moment en què has caigut en aquest forat.
Durant un instant, se t''il·lumina el camí davant dels teus ulls. Una de les pistes que havies aconseguit menciona la utilitat de The Server of Isaac Wiki, a la que ja has accedit. Allà hi deu haver una forma de trobar un nou objecte. Hi ha alguna cosa que se t''escapa. Hauries de fer un cop d''ull al codi font de la pàgina, potser hi ha un missatge ocult amb l''item que busques...
\nIntrodueix el nom de l''item obtingut:'
, 'The Gamekid'),
(5, '\n
Després d''aconseguir aquest objecte, ja gairebé pots veure l''escapatòria d''aquest profund soterrani. Només has d''obrir el joc que trobaràs a l''escriptori i aconseguir passar-te''l. El joc és una simulació d''aquest mateix soterrani, on tenen lloc uns combats contra monstres i, finalment, la teva mare. Venç per aconseguir l''objecte final, el que et traurà d''aquest malson.
\nIntrodueix el nom de l''item obtingut:'
, 'PHD');

INSERT INTO quiz.programingAnswers values
(1, 549);
INSERT INTO quiz.programingAnswers values
(2, 774);

UPDATE `initializeDatabase` SET `initialized` = 1;