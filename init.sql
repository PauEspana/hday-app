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
  `question` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
('despedida', ''),
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
Connectat a aquest mateix servidor amb l''usuari ''isaac'' i contrasenya ''isaac'' i troba un arxiu anomenat ''Delirium''.
Introdueix el nom del item obtingut:',
'The Missing Poster'),
(
2, '
En descendir al pròxim nivell, les parets del llarg passadís en què et trobes tenen escrites de manera tètrica les instruccions del següent repte. \n
Per obtenir una pista que et pot dur cap a la teva escapatòria, has d''entrar en un client d''Isard amb l''adreça IP pertinent. Un cop dins, has de trobar una impressora amb el nom "TheServerOfIsaac" i accedir a la seva cua d''impressió. Allà hi trobaràs el document amb la informació que pot evitar el teu macabre destí.
Introdueix el nom del item obtingut:
', 'GB Bug'
),
(3, '
Introdueix el nom del item obtingut:
', 'Sharp Plug'),
(4, '
Introdueix el nom del item obtingut:
', 'The GameKid'),
(5, '
Has arribat a l''última prova! Aquí hauràs de mostrar el teu nivell d''habilitat, inicia el joc i guanya al boss final!
Introdueix el nom del item obtingut:', 'PHD');

INSERT INTO quiz.programingAnswers values
(1, 549);
INSERT INTO quiz.programingAnswers values
(2, 774);

UPDATE `initializeDatabase` SET `initialized` = 1;