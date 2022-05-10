

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity VERIFICARE_EXISTANTE_BANI_CONT is 
	port(poz_pin: in STD_LOGIC_VECTOR  (1 downto 0);
	suma_retragere: in STD_LOGIC_VECTOR (15 downto 0);
	en_verif_suma: in STD_LOGIC;
	verificare_existenta_suma_cont: out STD_LOGIC);
end VERIFICARE_EXISTANTE_BANI_CONT;

--}} End of automatically maintained section

architecture VERIFICARE_EXISTANTE_BANI_CONT of VERIFICARE_EXISTANTE_BANI_CONT is

component MEMORIE_RAM_SUME_CARDURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC; 
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		suma_finala_depunere, suma_finala_retragere: in STD_LOGIC_VECTOR(15 downto 0);
		ES, EA: in STD_LOGIC);
end component; 

signal suma_cont_curent , suma_depunere_semnal, suma_retragere_semnal: STD_LOGIC_VECTOR(15 downto 0); 
signal poz_pin_semnal: STD_LOGIC_VECTOR(1 downto 0);
begin	
	
	SUMA_DIN_CONT: MEMORIE_RAM_SUME_CARDURI port map(poz_pin, '1', '0', suma_cont_curent, poz_pin_semnal, suma_depunere_semnal, suma_retragere_semnal, '0', '0');
	
	VERIFICARE_SUMA_EXISTENTA_CONT: process(suma_retragere, suma_cont_curent)
	begin
		if en_verif_suma = '1' then 
			if  suma_cont_curent >= suma_retragere then
				verificare_existenta_suma_cont <= '1';
			else
				verificare_existenta_suma_cont <= '0';
			end if;
		end if;
	end process; 

	 -- enter your statements here --

end VERIFICARE_EXISTANTE_BANI_CONT;
