library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";
library work;
use work.tempsAcces.all;

ENTITY ram IS
	GENERIC(
		taille : integer := 32
		);
	PORT(
		CS : 		IN std_logic;																-- Sélectionner la puce
		RD : 		IN std_logic;																-- Activer la sortie
		WR : 		IN std_logic;																-- Demander écriture
		adresse : 	IN std_ulogic_vector(integer(ceil(log2(real(taille)))) DOWNTO 0);
		entree : 	IN std_logic_vector(7 DOWNTO 0);
		sortie : 	OUT std_logic_vector(7 DOWNTO 0)
		);
END ram;

ARCHITECTURE base OF ram IS
	TYPE VecteurDeRegistre IS ARRAY (0 TO (taille-1)) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL memoire : VecteurDeRegistre := (
												5  => "10101010",								-- valeur exemple
												10 => "01010101",								-- valeur exemple
												30 => "11111111",								-- valeur exemple
												OTHERS => "UUUUUUUU"							-- valeur exemple
										  );
	SIGNAL sortieInterieure : std_logic_vector(7 DOWNTO 0);										-- Sortie intermédiaire pour faire cohabiter le RD et le temps d'accès

BEGIN
	PROCESS(CS, RD, WR, entree, adresse, sortieInterieure, memoire)
	BEGIN
		IF CS = '0' THEN																		-- Puce sélectionnée
			sortieInterieure <= memoire(to_integer(unsigned(adresse))) AFTER TEMPS_ACCES_RAM;
			IF WR = '0' THEN																	-- Écriture demandée
				memoire(to_integer(unsigned(adresse))) <= entree;
			END IF;
		END IF;
		IF RD = '1' THEN																		-- Sortie non activée
			sortie <= "UUUUUUUU";
		END IF;
		IF RD = '0' THEN																		-- Sortie activée
			sortie <= sortieInterieure;
		END IF;
	END PROCESS;
END base;