library ieee;
use ieee.std_logic_1164.all;

ENTITY gestionnaireES IS
	PORT(
			clk : 		IN std_logic;							-- horloge
			PortCom : 	INOUT std_logic_vector(15 DOWNTO 0);	-- bus de communication
			RD :		IN std_logic;							-- indicateur de lecture
			WR :		IN std_logic;							-- indicateur d'écriture
			Ready :		IN std_logic;							-- demande d'attente
		);
END gestionnaireES;
	
ARCHITECTURE base OF gestionnaireES IS
BEGIN
	-- cf chronogrammes page 1-25 de la doc' d'Intel
	-- l'octet de poids faible du bus de com' change de sens en cours de route
END base;