library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";
library work;
use work.valeursMemoires.all;

ENTITY rom IS
	GENERIC(
		taille : integer := 64
		);
	PORT(
		CS : 		IN std_logic;																-- Sélectionner la puce
		OE : 		IN std_logic;																-- Activer la sortie
		adresse : 	IN std_ulogic_vector(integer(ceil(log2(real(taille)))) DOWNTO 0);
		sortie : 	OUT std_logic_vector(7 DOWNTO 0)
		);
END rom;

ARCHITECTURE base OF rom IS
	TYPE VecteurDeRegistre IS ARRAY (0 TO (taille-1)) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL memoire : VecteurDeRegistre := (
												5  => "10101010",								-- valeur exemple
												10 => "01010101",								-- valeur exemple
												32 => "11111111",								-- valeur exemple
												OTHERS => "UUUUUUUU"							-- valeur exemple
										  );
	SIGNAL sortieInterieure : std_logic_vector(7 DOWNTO 0);										-- Sortie intermédiaire pour faire cohabiter l'OE et le temps d'accès

BEGIN
	PROCESS(CS, OE, adresse, sortieInterieure)
	BEGIN
		IF CS = '0' THEN																		-- Puce sélectionnée
			sortieInterieure <= memoire(to_integer(unsigned(adresse))) AFTER TEMPS_ACCES_ROM;
		END IF;
		IF OE = '1' THEN																		-- Sortie non activée
			sortie <= "UUUUUUUU";
		END IF;
		IF OE = '0' THEN																		-- Puce sélectionnée et sortie activée
			sortie <= sortieInterieure;
		END IF;
	END PROCESS;
END base;