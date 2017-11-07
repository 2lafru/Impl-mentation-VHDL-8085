library ieee;
use ieee.std_logic_1164.all;

ENTITY gestionnaireES IS
	PORT(
			clk : 			IN std_logic;							-- horloge
			valeurLecture : IN std_logic_vector(7 DOWNTO 0);		-- valeur à éventuellement retourner
			valeurEcriture: OUT std_logic_vector(7 DOWNTO 0);		-- valeur à éventuellement écrire
			PortCom : 		INOUT std_logic_vector(15 DOWNTO 0);	-- bus de communication
			RD :			IN std_logic;							-- indicateur de lecture
			WR :			IN std_logic;							-- indicateur d'écriture
			Ready :			IN std_logic;							-- demande d'attente
			ALE :			OUT std_logic							-- indique le type de donnée sur l'octet de poids faible
		);
END gestionnaireES;
	
ARCHITECTURE base OF gestionnaireES IS
SIGNAL stockageAdresse : std_logic_vector(15 DOWNTO 0);
BEGIN
	-- cf chronogrammes page 1-25 de la doc' d'Intel
	-- l'octet de poids faible du bus de com' change de sens en cours de route
	-- attention à ready, qui signale si on doit attendre avant de fournir les données. cf page 1-12 de la doc' d'Intel
	PROCESS(clk)
	BEGIN
		IF( rising_edge(clk)) THEN
			IF( RD = '1' AND WR = '1') THEN						-- Nouveau cycle avec aucun indicateur
				stockageAdresse <= PortCom;
			END IF;
			IF( RD = '0' AND WR = '1') THEN						-- Nouveau cycle avec indicateur de lecture
				PortCom(7 DOWNTO 0) <= valeurLecture;
			END IF;
			IF( RD = '1' AND WR = '0') THEN						-- Nouveau cycle avec indicateur d'écriture
				valeurEcriture <= PortCom(7 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
END base;