

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SCAZATOR_COMPLET_1_BIT is
	port (A, B, BIN: in STD_LOGIC;
	D, BOUT: out STD_LOGIC;
	ES: in STD_LOGIC); 
end SCAZATOR_COMPLET_1_BIT;

--}} End of automatically maintained section

architecture SCAZATOR_COMPLET_1_BIT of SCAZATOR_COMPLET_1_BIT is

signal INTER_D: STD_LOGIC;
signal INTER_B1, INTER_B2, INTER_B3, INTER_B4: STD_LOGIC;

begin
	
	INTER_D <= A xor B;
	D <= INTER_D xor BIN when ES = '1';
	
	INTER_B1 <= not A;
	INTER_B2 <= INTER_B1 and BIN;
	INTER_B3 <= B and BIN; 
	INTER_B4 <= INTER_B1 and B;
	BOUT <= INTER_B2 or INTER_B3 or INTER_B4 when ES = '1';
	 -- enter your statements here --

end SCAZATOR_COMPLET_1_BIT;
