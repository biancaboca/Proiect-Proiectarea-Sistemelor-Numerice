

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity VALIDARE_PIN is
	port (pin: in STD_LOGIC_VECTOR(15 downto 0);
	poz_pin: out STD_LOGIC_VECTOR (1 downto 0);
	en_validare_pin: in STD_LOGIC;
	validare_pin: out STD_LOGIC);
end VALIDARE_PIN;

--}} End of automatically maintained section

architecture VALIDARE_PIN of VALIDARE_PIN is 

component MEMORIE_RAM_PINURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC;
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		schimba_pin: in STD_LOGIC;
		pin_nou: in STD_LOGIC_VECTOR (15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR (1 downto 0));
end component;

signal pin0, pin1, pin2, pin3: STD_LOGIC_VECTOR (15 downto 0); 
signal poz: STD_LOGIC_VECTOR (1 downto 0);
signal pin_signal: STD_LOGIC_VECTOR (15 downto 0);

begin
	
	MEM0: MEMORIE_RAM_PINURI port map ("00", '1', '0', pin0, '0', pin_signal, poz);
	MEM1: MEMORIE_RAM_PINURI port map ("01", '1', '0', pin1, '0', pin_signal, poz);
	MEM2: MEMORIE_RAM_PINURI port map ("10", '1', '0', pin2, '0', pin_signal, poz);
	MEM3: MEMORIE_RAM_PINURI port map ("11", '1', '0', pin3, '0', pin_signal, poz);
	
	
	VALIDARE_PIN_CORECT: process(pin0, pin1, pin2, pin3, pin)
	begin 
		if en_validare_pin  = '1' then 
			if pin = pin0 then
				validare_pin <= '1';
				poz_pin <= "00";
			elsif pin = pin1 then
				validare_pin <= '1';
				poz_pin <= "01";
			elsif pin = pin2 then
				validare_pin <= '1';
				poz_pin <= "10";
			elsif pin = pin3 then
				validare_pin <= '1';
				poz_pin <= "11";
			else
				validare_pin <= '0';
			end if;	
		else 
			validare_pin <= '0';
		end if;
	end process;
	 -- enter your statements here --

end VALIDARE_PIN;
