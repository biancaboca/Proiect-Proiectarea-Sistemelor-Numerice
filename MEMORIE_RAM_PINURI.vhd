

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MEMORIE_RAM_PINURI is
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC;
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		schimba_pin: in STD_LOGIC;
		pin_nou: in STD_LOGIC_VECTOR (15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR (1 downto 0));
end MEMORIE_RAM_PINURI;

--}} End of automatically maintained section

architecture MEMORIE_RAM_PINURI of MEMORIE_RAM_PINURI is

type RAM_TYPE is array(0 to 3) of STD_LOGIC_VECTOR (15 downto 0);
signal RAM: RAM_TYPE := (0 => "0010001101000110", --2346	
1 => "0000001100110101",  --0335
2 => "0010010001101000",  --2468
3 => "0000000110010111"); --0197

signal pin_nou_semnal: STD_LOGIC_VECTOR (15 downto 0);

begin
	
	SCHIMBARE_PIN: process (schimba_pin, poz_pin, pin_nou_semnal, pin_nou)
	begin 
		if schimba_pin  = '1' then
			pin_nou_semnal <= pin_nou;
			RAM(conv_integer(poz_pin)) <= pin_nou_semnal;
		end if;
	end process; 
	
	D_RAM <= RAM(conv_integer(A_RAM)) when (CS_RAM = '1' and WE = '0');
	
	--RAM(conv_integer(A_RAM)) <= D_RAM when (WE = '1' and CS_RAM = '1');
	
	 -- enter your statements here --

end MEMORIE_RAM_PINURI;
