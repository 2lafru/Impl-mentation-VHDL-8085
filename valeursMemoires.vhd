library ieee;
use ieee.std_logic_1164.all;

PACKAGE valeursMemoires IS
	CONSTANT TEMPS_ACCES_ROM : time := 250 ns;
	CONSTANT TEMPS_ACCES_RAM : time := 200 ns;
	CONSTANT taille_ROM : integer := 64;
	CONSTANT taille_RAM : integer := 32;
END valeursMemoires;