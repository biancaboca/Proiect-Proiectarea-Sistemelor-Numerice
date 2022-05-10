

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ORGANIGRAMA is
	port (clk, rst: in STD_LOGIC;
		validare_pin, verificare_existenta_suma_cont, chitanta, verificare_existenta_suma_bancomat: in STD_LOGIC;
		alegere_optiune: in STD_LOGIC_VECTOR(1 downto 0);
		eliberare_chitanta, afisare_sold, schimba_pin, en_verif_suma, en_validare_pin, CS_PINURI, CS_BANCNOTE, CS_SUME, EA, ES: out STD_LOGIC);
end ORGANIGRAMA;

--}} End of automatically maintained section

architecture ORGANIGRAMA of ORGANIGRAMA is
type type_state is (introducere_pin, introducere_suma_retragere, introducere_suma_depunere, actualizare_cont_retragere, actualizare_cont_depunere, schimbare_pin);
signal state, nx_state: type_state;

begin

	
	ACTUALIZARE_STARE: process(clk, rst)
	begin 
		if rst = '1' then 
			state <= introducere_pin;
		elsif clk'event and clk = '1' then 
			state <= nx_state;
		end if;
	end process;  
	
	TRANSITIONS: process (state, validare_pin, verificare_existenta_suma_cont, verificare_existenta_suma_bancomat, chitanta, alegere_optiune)
	begin 
		eliberare_chitanta <= '0';
		afisare_sold <= '0';
		schimba_pin <= '0';
		CS_PINURI <= '0';
		CS_BANCNOTE <= '0';
		CS_SUME <= '0';	 
		EA <= '0';
		ES <= '0';	 
		en_verif_suma <= '0';
		en_validare_pin  <= '0';
		
		case state is
			
			when introducere_pin =>
				CS_PINURI <= '1';
				en_validare_pin <= '1';
				if validare_pin = '0' then 
					nx_state <= introducere_pin;
				elsif alegere_optiune = "00" then nx_state <= introducere_suma_retragere;
				elsif alegere_optiune = "01" then nx_state <= introducere_suma_depunere;
				elsif alegere_optiune = "10" then 
					afisare_sold <= '1';
					nx_state <= introducere_pin;
				else nx_state <= schimbare_pin;
				end if;	
			
			when introducere_suma_retragere =>
				en_verif_suma <= '1';
				if verificare_existenta_suma_cont = '0' or verificare_existenta_suma_bancomat = '0' then 
					nx_state <= introducere_pin;  
				else nx_state <= actualizare_cont_retragere;
				end if;
			
			when actualizare_cont_retragere =>
				ES <= '1';
				CS_SUME <= '1';
				CS_BANCNOTE <= '1';
				if chitanta = '1' then 
					eliberare_chitanta <= '1';
					nx_state <= introducere_pin;
				else
					nx_state <= introducere_pin;
				end if;
			
			when introducere_suma_depunere => nx_state <= actualizare_cont_depunere;
			
			when actualizare_cont_depunere =>
				EA <= '1';
				CS_SUME <= '1';	
				if chitanta = '1' then 
					eliberare_chitanta <= '1';
					nx_state <= introducere_pin;
				else  
					nx_state <= introducere_pin;
				end if;
			
			when schimbare_pin =>
				CS_PINURI <= '1';
				schimba_pin <= '1';
				if chitanta = '1' then 
					eliberare_chitanta <= '1';
					nx_state <= introducere_pin;
				else 
					nx_state <= introducere_pin;
				end if;
		end case;
	end process;
end ORGANIGRAMA;
