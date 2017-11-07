library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";
library work;
use work.valeursMemoires.all;

ENTITY decodeurAdresse IS
	PORT(
		adresse : 		IN std_logic_vector(2+integer(ceil(log2(real(taille_ROM)))) DOWNTO 0);
		CSrom	: 		OUT std_logic := '1';
		CSram1	: 		OUT std_logic := '1';
		CSram2	: 		OUT std_logic := '1';
		CSram3	: 		OUT std_logic := '1';
		adresserom : 	OUT std_logic_vector(integer(ceil(log2(real(taille_ROM)))) DOWNTO 0) := (OTHERS => 'U');
		adresseram1 :	OUT std_logic_vector(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0) := (OTHERS => 'U');
		adresseram2 :	OUT std_logic_vector(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0) := (OTHERS => 'U');
		adresseram3 :	OUT std_logic_vector(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0) := (OTHERS => 'U')
		);
END decodeurAdresse;

ARCHITECTURE base OF decodeurAdresse IS
BEGIN
	PROCESS(adresse)
	BEGIN
		IF adresse(2+integer(ceil(log2(real(taille_ROM))))) = '0' THEN
			IF adresse(1+integer(ceil(log2(real(taille_ROM))))) = '0' THEN				-- Bits de poids fort : 00
				CSrom <= '0'; CSram1 <= '1'; CSram2 <= '1'; CSram3 <= '1';				-- ROM
				adresserom <= adresse(integer(ceil(log2(real(taille_ROM)))) DOWNTO 0);
			END IF;
		END IF;

		IF adresse(2+integer(ceil(log2(real(taille_ROM))))) = '0' THEN
			IF adresse(1+integer(ceil(log2(real(taille_ROM))))) = '1' THEN				-- Bits de poids fort : 01
				CSrom <= '1'; CSram1 <= '0'; CSram2 <= '1'; CSram3 <= '1';				-- RAM n°= 1
				adresseram1 <= adresse(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0);
			END IF;
		END IF;

		IF adresse(2+integer(ceil(log2(real(taille_ROM))))) = '1' THEN
			IF adresse(1+integer(ceil(log2(real(taille_ROM))))) = '0' THEN				-- Bits de poids fort : 10
				CSrom <= '1'; CSram1 <= '1'; CSram2 <= '0'; CSram3 <= '1';				-- RAM n°= 2
				adresseram2 <= adresse(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0);
			END IF;
		END IF;

		IF adresse(2+integer(ceil(log2(real(taille_ROM))))) = '1' THEN
			IF adresse(1+integer(ceil(log2(real(taille_ROM))))) = '1' THEN				-- Bits de poids fort : 11
				CSrom <= '1'; CSram1 <= '1'; CSram2 <= '1'; CSram3 <= '0';				-- RAM n°= 3
				adresseram3 <= adresse(integer(ceil(log2(real(taille_RAM)))) DOWNTO 0);
			END IF;
		END IF;

	END PROCESS;
END base;