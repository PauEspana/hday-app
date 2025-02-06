-- Us de la base de dades
USE quiz;

drop table info;
drop table results;
drop table questions;

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `option` varchar(11) NOT NULL,
  `value` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`option`, `value`) VALUES
('ciutat', 'Banyoles'),
('despedida', ''),
('introduccio', '
Ets l''Isaac, un nen que viu en una casa petita amb la seva mare. El teu pare us va abandonar, i tu trobes refugi dibuixant i jugant amb les teves joguines. Mentrestant, la teva mare es comença a obsessionar ràpidament per la Bíblia, passant-se el dia mirant programes cristians a la televisió. \n
De cop i volta, la teva mare comença a sentir una veu divina, que li diu que el seu fill està corromput pel pecat. Per aconseguir la teva salvació, et treu totes les joguines, els dibuixos, la consola i fins i tot la teva roba. \n
La veu torna a aparèixer, exigint que has de ser aïllat de tot el mal present al món, i la teva mare compleix les ordres, i et tanca a la teva habitació. \n
Tot i això, la veu divina intervé una vegada més, felicitant la teva mare per complir la voluntat de Déu, però encara dubtant de la seva fe. Com a prova inapel·lable, li demana el teu sacrifici. Sense qüestionar-se les paraules del missatger, es dirigeix a la cuina a agafar un ganivet, i seguidament pren rumb cap a la teva habitació. \n
Tu, que has vist tota la seqüència a través de l''escletxa de la porta, entres en pànic i comences a buscar desesperadament la trapa sota la catifa que du al soterrani. Apuradament, hi saltes a dins per escapar de la teva mare, que ha estat consumida pels seus deliris.
');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `answer` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`) VALUES
(1, 'Introdueix el nom del item obtingut', 'The Missing Poster'),
(
2, '
En descendir al pròxim nivell, les parets del llarg passadís en què et trobes tenen escrites de manera tètrica les instruccions del següent repte. \n
Per obtenir una pista que et pot dur cap a la teva escapatòria, has d''entrar en un client d''Isard amb l''adreça IP pertinent. Un cop dins, has de trobar una impressora amb el nom "TheServerOfIsaac" i accedir a la seva cua d''impressió. Allà hi trobaràs el document amb la informació que pot evitar el teu macabre destí.
Introdueix el nom del item obtingut a aquesta prova
', 'GB Bug'
),
(3, 'Introdueix el nom del item obtingut', 'Sharp Plug'),
(4, 'Introdueix el nom del item obtingut', 'The GameKid'),
(5, 'Introdueix el nom del item obtingut', 'PHD');
-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `solved` int NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`option`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solved` (`solved`);


--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`solved`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

UPDATE `initializeDatabase` SET `initialized` = 1;

COMMIT;
