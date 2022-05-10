

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SCAZATOR_16_BITI is
	port(A, B: in STD_LOGIC_VECTOR (15 downto 0);
		BIN: in STD_LOGIC;
		D: out STD_LOGIC_VECTOR (15 downto 0);
		BOUT: out STD_LOGIC;
		ES: in STD_LOGIC);
end SCAZATOR_16_BITI;

--}} End of automatically maintained section

architecture SCAZATOR_16_BITI of SCAZATOR_16_BITI is
	component SCAZATOR_COMPLET_1_BIT 
		port (A, B, BIN: in STD_LOGIC;
			D, BOUT: out STD_LOGIC;
			ES: in STD_LOGIC);
	end component;	
signal BARROW_TEMP: STD_LOGIC_VECTOR (14 downto 0);	


begin

	D0: SCAZATOR_COMPLET_1_BIT port map(A(0), B(0), BIN, D(0), BARROW_TEMP(0), ES);	
	D1: SCAZATOR_COMPLET_1_BIT port map(A(1), B(1), BARROW_TEMP(0), D(1), BARROW_TEMP(1), ES);
	D2: SCAZATOR_COMPLET_1_BIT port map(A(2), B(2), BARROW_TEMP(1), D(2), BARROW_TEMP(2), ES);
	D3: SCAZATOR_COMPLET_1_BIT port map(A(3), B(3), BARROW_TEMP(2), D(3), BARROW_TEMP(3), ES);
	D4: SCAZATOR_COMPLET_1_BIT port map(A(4), B(4), BARROW_TEMP(3), D(4), BARROW_TEMP(4), ES);
	D5: SCAZATOR_COMPLET_1_BIT port map(A(5), B(5), BARROW_TEMP(4), D(5), BARROW_TEMP(5), ES);
	D6: SCAZATOR_COMPLET_1_BIT port map(A(6), B(6), BARROW_TEMP(5), D(6), BARROW_TEMP(6), ES);
	D7: SCAZATOR_COMPLET_1_BIT port map(A(7), B(7), BARROW_TEMP(6), D(7), BARROW_TEMP(7), ES);
	D8: SCAZATOR_COMPLET_1_BIT port map(A(8), B(8), BARROW_TEMP(7), D(8), BARROW_TEMP(8), ES);
	D9: SCAZATOR_COMPLET_1_BIT port map(A(9), B(9), BARROW_TEMP(8), D(9), BARROW_TEMP(9), ES);
	D10: SCAZATOR_COMPLET_1_BIT port map(A(10), B(10), BARROW_TEMP(9), D(10), BARROW_TEMP(10), ES);
	D11: SCAZATOR_COMPLET_1_BIT port map(A(11), B(11), BARROW_TEMP(10), D(11), BARROW_TEMP(11), ES);
	D12: SCAZATOR_COMPLET_1_BIT port map(A(12), B(12), BARROW_TEMP(11), D(12), BARROW_TEMP(12), ES);
	D13: SCAZATOR_COMPLET_1_BIT port map(A(13), B(13), BARROW_TEMP(12), D(13), BARROW_TEMP(13), ES);
	D14: SCAZATOR_COMPLET_1_BIT port map(A(14), B(14), BARROW_TEMP(13), D(14), BARROW_TEMP(14), ES);
	D15: SCAZATOR_COMPLET_1_BIT port map(A(15), B(15), BARROW_TEMP(14), D(15), BOUT, ES);
	
	-- enter your statements here --

end SCAZATOR_16_BITI;
