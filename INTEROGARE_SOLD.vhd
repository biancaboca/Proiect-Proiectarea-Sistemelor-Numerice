

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity INTEROGARE_SOLD is
	port (poz_pin: in STD_LOGIC_VECTOR (1 downto 0);
	afisare_sold: in STD_LOGIC;
	sold: out STD_LOGIC_VECTOR (15 downto 0));
end INTEROGARE_SOLD;

--}} End of automatically maintained section

architecture INTEROGARE_SOLD of INTEROGARE_SOLD is	

component MEMORIE_RAM_SUME_CARDURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC; 
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		suma_finala_depunere, suma_finala_retragere: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		ES, EA: in STD_LOGIC);
end component;

signal suma_cont, suma_depunere, suma_retragere: STD_LOGIC_VECTOR (15 downto 0);
signal poz_pin_semnal: STD_LOGIC_VECTOR (1 downto 0);


begin

	SUMA_CONT_CURENT: MEMORIE_RAM_SUME_CARDURI port map (poz_pin, '1', '0', suma_cont, poz_pin_semnal, suma_depunere, suma_retragere, '0', '0');
	
	AFISARE_SOLD_CONT_CURENT: process (suma_cont, afisare_sold)
	begin
		if afisare_sold = '1' then 
			sold <= suma_cont; 
		end if;
	end process;
	
	-- enter your statements here --

end INTEROGARE_SOLD;
