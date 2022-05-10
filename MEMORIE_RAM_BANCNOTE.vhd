

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity MEMORIE_RAM_BANCNOTE is
	port (A_RAM: in STD_LOGIC_VECTOR(2 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC;
		D_RAM: inout STD_LOGIC_VECTOR(11 downto 0);
		suma: in STD_LOGIC_VECTOR (15 downto 0);
		existenta_suma_bancomat: out STD_LOGIC;
		en_verif_suma: in STD_LOGIC;
		EA: STD_LOGIC);
end MEMORIE_RAM_BANCNOTE;

--}} End of automatically maintained section

architecture MEMORIE_RAM_BANCNOTE of MEMORIE_RAM_BANCNOTE is

type RAM_TYPE is array (0 to 7) of STD_LOGIC_VECTOR (11 downto 0);
signal RAM, RAM_AUX: RAM_TYPE := (0 => "000001100100",  --100
7 => "000000000000", --0
others => "000001100100"); 

type SUME is array (0 to 6) of STD_LOGIC_VECTOR (15 downto 0);
signal val_banc: SUME := ( 0 =>	"0000000000000101", --5
1 => "0000000000001010", --10
2 => "0000000000010100", --20
3 => "0000000000110010", --50
4 => "0000000001100100", --100
5 => "0000000011001000", --200
6 => "0000000111110100");--500


begin
	
	MODIFICARE_MEMORIE: process (RAM, RAM_AUX, en_verif_suma, EA, val_banc)
	begin
		if EA = '1' then 
			if suma = val_banc(0) then 
				RAM(0) <= RAM_AUX(0) + "000000000001";
			elsif suma = val_banc(1) then 
				RAM(1) <= RAM_AUX(1) + "000000000001";
			elsif suma = val_banc(2) then 
				RAM(2) <= RAM_AUX(2) + "000000000001"; 
			elsif suma = val_banc(3) then 
				RAM(3) <= RAM_AUX(3) + "000000000001";
			elsif suma = val_banc(4) then 
				RAM(4) <= RAM_AUX(4) + "000000000001";
			elsif suma = val_banc(5) then 
				RAM(5) <= RAM_AUX(5) + "000000000001";
			elsif suma = val_banc(6) then 
				RAM(6) <= RAM_AUX(6) + "000000000001";
			end if;
		end if;	
		
		if en_verif_suma = '1' then
			if (suma = val_banc(0)) and (RAM(0) > "000000000000") then 
				RAM(0) <= RAM_AUX(0) - "000000000001"; 
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(1)) and (RAM(1) > "000000000000") then 
				RAM(1) <= RAM_AUX(1) - "000000000001";
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(2)) and (RAM(2) > "000000000000") then 
				RAM(2) <= RAM_AUX(2) - "000000000001";
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(3)) and (RAM(3) > "000000000000") then 
				RAM(3) <= RAM_AUX(3) - "000000000001";
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(4)) and (RAM(4) > "000000000000") then 
				RAM(4) <= RAM_AUX(4) - "000000000001";
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(5)) and (RAM(5) > "000000000000") then 
				RAM(5) <= RAM_AUX(5) - "000000000001";
				existenta_suma_bancomat <= '1';
			elsif (suma = val_banc(6)) and (RAM(6) > "000000000000") then 
				RAM(6) <= RAM_AUX(6) - "000000000001";
				existenta_suma_bancomat <= '1';
			end if;	
		end if;
			
	end process;
	
	--process (suma_retragere, RAM, en_verif_suma)
    
	--type sir is array (0 to 6) of STD_LOGIC_VECTOR (11 downto 0);
    
	--variable suma, rest: STD_LOGIC_VECTOR(15 downto 0); 
   
	--variable nr_banc: sir;
    
	--variable i: integer;

	--type sir2 is array (0 to 6) of STD_LOGIC_VECTOR (15 downto 0);
	--variable val_banc: sir2;
	--variable nr_banc_ramase: STD_LOGIC_VECTOR (11 downto 0);
    
	--begin 
        
		--suma := suma_retragere;
        
		--nr_banc(0) := RAM(conv_integer("000"));
       
		--nr_banc(1) := RAM(conv_integer("001"));
        
		--nr_banc(2) := RAM(conv_integer("010"));
        
		--nr_banc(3) := RAM(conv_integer("011"));
        
		--nr_banc(4) := RAM(conv_integer("100"));
        
		--nr_banc(5) := RAM(conv_integer("101"));
        
		--nr_banc(6) := RAM(conv_integer("110")); 
        
        
	
		--val_banc(0) := "0000000000000101";  --5
        
		--val_banc(1) := "0000000000001010";  --10
        
		--val_banc(2) := "0000000000010100";  --20
       
		--val_banc(3) := "0000000000110010";  --50
        
		--val_banc(4) := "0000000001100100";  --100
        
		--val_banc(5) := "0000000011001000";  --200
        
		--val_banc(6) := "0000000111110100";  --500
        
		--i := 6;
        
        
          
		
		--if en_verif_suma = '1' then
            
			--while ((suma > "0000000000000000") and (i >= 0)) loop 
                
				--while ((suma >= val_banc(i)) and (nr_banc(i) > "000000000000")) loop
                    
					--rest := suma - val_banc(i);
                    
					--suma := rest;
                    
					--nr_banc_ramase := nr_banc(i) - "000000000001";
                    
					--nr_banc(i) := nr_banc_ramase;
                
				--end loop;
                
				--i := i - 1;
            
			--end loop;
          
           
		
		--if suma = "0000000000000000" then 
                
			--existenta_suma_bancomat <= '1';
                
			--RAM(0) <= nr_banc(0);
                
			--RAM(1) <= nr_banc(1);
               
			--RAM(2) <= nr_banc(2);
                	
			--RAM(3) <= nr_banc(3);
                
			--RAM(4) <= nr_banc(4);
                
			--RAM(5) <= nr_banc(5);
                
			--RAM(6) <= nr_banc(6);
                
            
		--end if;
          
          
		--end if;
        
        
    
	--end process;
	
	
	
	D_RAM <= RAM(conv_integer(A_RAM)) when (WE =  '0' and CS_RAM = '1');
	
	--RAM(conv_integer(A_RAM)) <= D_RAM when (WE = '1' and CS_RAM = '1');	
	
	
	-- enter your statements here --

end MEMORIE_RAM_BANCNOTE;
