library ieee;
use ieee.std_logic_1164.all;

PACKAGE tempsAcces IS
	CONSTANT TEMPS_ACCES_ROM : time := 250 ns;
	CONSTANT TEMPS_ACCES_RAM : time := 200 ns;
END tempsAcces;