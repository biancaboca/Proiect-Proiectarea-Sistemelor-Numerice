

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SUMATOR_COMPLET_1_BIT is	
	port (A, B, CIN: in STD_LOGIC;
	S, COUT: out STD_LOGIC;
	EA: in STD_LOGIC); 
end SUMATOR_COMPLET_1_BIT;

--}} End of automatically maintained section

architecture SUMATOR_COMPLET_1_BIT of SUMATOR_COMPLET_1_BIT is

signal INTER_S: STD_LOGIC; 
signal INTER_C1, INTER_C2, INTER_C3: STD_LOGIC;

begin
	
	INTER_S <= A xor B;
	S <= INTER_S xor CIN when EA = '1';
	
	INTER_C1 <= A and CIN;
	INTER_C2 <= B and CIN;
	INTER_C3 <= A and B;
	COUT <= INTER_C1 or INTER_C2 or INTER_C3 when EA = '1';
	-- enter your statements here --

end SUMATOR_COMPLET_1_BIT;
