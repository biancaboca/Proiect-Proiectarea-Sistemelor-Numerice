
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MEMORIE_RAM_SUME_CARDURI is
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC; 
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		suma_finala_depunere, suma_finala_retragere: in STD_LOGIC_VECTOR(15 downto 0);
		ES, EA: in STD_LOGIC);
end MEMORIE_RAM_SUME_CARDURI;

--}} End of automatically maintained section

architecture MEMORIE_RAM_SUME_CARDURI of MEMORIE_RAM_SUME_CARDURI is

type RAM_TYPE is array (0 to 3) of STD_LOGIC_VECTOR(15 downto 0);
signal RAM: RAM_TYPE := (0 => "0000011111010000",  --2000
1 => "0000110110101100",   --3500
2 => "0000000110010000",   --400
3 => "0000010010110000");  --1200	   



signal suma_depunere, suma_retragere: STD_LOGIC_VECTOR(15 downto 0);
begin
	 
	
	ACTUALIZARE_MEMORIE: process (poz_pin, suma_depunere, suma_finala_depunere, EA, suma_retragere, suma_finala_retragere, ES)
	begin 
		if EA = '1' then
			suma_depunere <= suma_finala_depunere;
			RAM(conv_integer(poz_pin)) <= suma_depunere;
		elsif ES = '1' then 
			suma_retragere <= suma_finala_retragere;
			RAM(conv_integer(poz_pin)) <= suma_retragere; 
		end if;
	end process;
	
	D_RAM <= RAM(conv_integer(A_RAM)) when (CS_RAM = '1' and WE =  '0'); 
	
	
	--RAM(conv_integer(A_RAM)) <= D_RAM when (WE = '1' and CS_RAM = '1');
	-- enter your statements here --

end MEMORIE_RAM_SUME_CARDURI;
