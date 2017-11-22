library ieee;
use ieee.std_logic_1164.all;

ENTITY gestionnaireES IS
	PORT(
			clk : 			IN 		std_logic;							-- horloge
			valeurLecture : OUT 	std_logic_vector(7 DOWNTO 0);		-- valeur à éventuellement retourner
			valeurEcriture: IN 		std_logic_vector(7 DOWNTO 0);		-- valeur à éventuellement écrire
			PortCom : 		INOUT	std_logic_vector(15 DOWNTO 0);		-- bus de communication
			RD :			OUT 	std_logic;							-- indicateur de lecture
			WR :			OUT 	std_logic;							-- indicateur d'écriture
			Ready :			IN 		std_logic;							-- demande d'attente
			ALE :			OUT 	std_logic;							-- indique le type de donnée sur l'octet de poids faible
			adresse :		IN 		std_logic_vector(15 DOWNTO 0)		-- adresse à utiliser
		);
END gestionnaireES;

ARCHITECTURE base OF gestionnaireES IS
SIGNAL etat : std_logic := '0';
BEGIN
	PROCESS(clk)
	BEGIN
		IF(rising_edge(clk) AND etat = '0') THEN						-- Adresse à donner
			PortCom <= adresse;
			ALE <= '0';
			etat <= '1';
		ELSIF(rising_edge(clk) AND etat = '1') THEN						-- Lecture/écriture à faire
			IF(valeurEcriture = "UUUUUUUU") THEN						-- Valeur à lire
				valeurLecture <= PortCom(7 DOWNTO 0);
			END IF;
			IF(not(valeurEcriture = "UUUUUUUU")) THEN					-- Valeur à écrire
				PortCom(7 DOWNTO 0) <= valeurEcriture;
			END IF;
			IF(Ready = '0') THEN
				etat <= '1';
			ELSE
				etat <= '0';
			END IF;
		END IF;
	END PROCESS;
END base;