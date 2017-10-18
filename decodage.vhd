library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real."ceil";
use ieee.math_real."log2";
library work;
use work.valeursMemoires.all;

ENTITY decodeurAdresse IS
	PORT(
		adresse : 		IN std_logic_vector(integer(ceil(log2(real(taille_RAM*3+taille_ROM)))) DOWNTO 0);
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