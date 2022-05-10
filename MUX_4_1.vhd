

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MUX_4_1 is 
	port (operatie1, operatie2, operatie3, operatie4: in STD_LOGIC_VECTOR(1 downto 0);
		sel: in STD_LOGIC_VECTOR(1 downto 0);
		iesire: out STD_LOGIC_VECTOR(1 downto 0);
		E: in STD_LOGIC);
end MUX_4_1;

--}} End of automatically maintained section

architecture MUX_4_1 of MUX_4_1 is
begin
	
	MUX: process(sel, E, operatie1, operatie2, operatie3, operatie4)
	begin 
		case sel is
			when "00" =>
				if E = '1' then 
					iesire <= operatie1;
				end if;
			when "01" => 
				if E = '1' then  
					iesire <= operatie2;
				end if;
			when "10" => 
				if E = '1' then 
					iesire <= operatie3; 
				end if;
			when "11" => 
				if E = '1' then 
					iesire <= operatie4;
				end if;
			when others => iesire <= operatie1;
		end case;
	end process;
	 -- enter your statements here --

end MUX_4_1;
