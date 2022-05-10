
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity MAIN is
	port(pin: in STD_LOGIC_VECTOR (15 downto 0);
	optiune: in STD_LOGIC_VECTOR (1 downto 0);
	suma, pin_nou: in STD_LOGIC_VECTOR (15 downto 0);
	chitanta: in STD_LOGIC;
	sold: out STD_LOGIC_VECTOR (15 downto 0);
	clk, rst: in STD_LOGIC);
end MAIN;

--}} End of automatically maintained section

architecture MAIN of MAIN is 

signal eliberare_chitanta, afisare_sold, schimba_pin, en_actualizeaza_retragere, en_actualizeaza_depunere, en_verif_suma, en_validare_pin,  CS_PINURI, CS_BANCNOTE, CS_SUME, EA, ES: STD_LOGIC;

signal pin_valid, verificare_existenta_suma_cont, verificare_existenta_suma_bancomat: STD_LOGIC;
	
signal poz_pin: STD_LOGIC_VECTOR (1 downto 0);	

signal A_RAM_PINURI, A_RAM_SUME: STD_LOGIC_VECTOR (1 downto 0);

signal A_RAM_BANCNOTE: STD_LOGIC_VECTOR (2 downto 0);

signal D_RAM_PINURI, D_RAM_SUME: STD_LOGIC_VECTOR (15 downto 0);

signal D_RAM_BANCNOTE: STD_LOGIC_VECTOR (11 downto 0);

signal suma_finala_depunere, suma_finala_retragere: STD_LOGIC_VECTOR (15 downto 0);

component MEMORIE_RAM_PINURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC;
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		schimba_pin: in STD_LOGIC;
		pin_nou: in STD_LOGIC_VECTOR (15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR (1 downto 0));
end component;

component MEMORIE_RAM_SUME_CARDURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC; 
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		suma_finala_depunere, suma_finala_retragere: in STD_LOGIC_VECTOR(15 downto 0);
		ES, EA: in STD_LOGIC);
end component;	

component MEMORIE_RAM_BANCNOTE
	port (A_RAM: in STD_LOGIC_VECTOR(2 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC;
		D_RAM: inout STD_LOGIC_VECTOR(11 downto 0);
		suma: in STD_LOGIC_VECTOR (15 downto 0);
		existenta_suma_bancomat: out STD_LOGIC;
		en_verif_suma: in STD_LOGIC;
		EA: STD_LOGIC);
end component;

component ORGANIGRAMA 
	port (clk, rst: in STD_LOGIC;
		validare_pin, verificare_existenta_suma_cont, chitanta, verificare_existenta_suma_bancomat: in STD_LOGIC;
		alegere_optiune: in STD_LOGIC_VECTOR(1 downto 0);
		eliberare_chitanta, afisare_sold, schimba_pin, en_verif_suma, en_validare_pin, CS_PINURI, CS_BANCNOTE, CS_SUME, EA, ES: out STD_LOGIC);
end component;	

component ADAUGARE_BANI_CONT 
	port (suma_depunere: in STD_LOGIC_VECTOR (15 downto 0);
	poz_pin: in STD_LOGIC_VECTOR (1 downto 0);
	suma_finala_cont_curent: out STD_LOGIC_VECTOR (15 downto 0);
	EA: in STD_LOGIC);
end component;

component SCADERE_BANI_CONT 
	port (suma_retragere: in STD_LOGIC_VECTOR (15 downto 0);
		suma_finala_cont_retragere: out STD_LOGIC_VECTOR (15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		ES: in STD_LOGIC);
end component;

component INTEROGARE_SOLD
	port (poz_pin: in STD_LOGIC_VECTOR (1 downto 0);
		afisare_sold: in STD_LOGIC;
		sold: out STD_LOGIC_VECTOR (15 downto 0));
end component;

component VERIFICARE_EXISTANTE_BANI_CONT
	port(poz_pin: in STD_LOGIC_VECTOR  (1 downto 0);
		suma_retragere: in STD_LOGIC_VECTOR (15 downto 0);
		en_verif_suma: in STD_LOGIC;
		verificare_existenta_suma_cont: out STD_LOGIC);
end component;

component VALIDARE_PIN 
	port (pin: in STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: out STD_LOGIC_VECTOR (1 downto 0);
		en_validare_pin: in STD_LOGIC;
		validare_pin: out STD_LOGIC);
end component;

begin

MAPARE_ORGANIGRAMA: ORGANIGRAMA port map (clk, rst, pin_valid, verificare_existenta_suma_cont, chitanta, verificare_existenta_suma_bancomat, optiune, eliberare_chitanta, afisare_sold, schimba_pin, en_verif_suma, en_validare_pin, CS_PINURI, CS_BANCNOTE, CS_SUME, EA, ES); 

C1: VALIDARE_PIN port map (pin, poz_pin, en_validare_pin, pin_valid);

C2: MEMORIE_RAM_PINURI port map (poz_pin, CS_PINURI, '0', D_RAM_PINURI, schimba_pin, pin_nou, poz_pin);

C3: MEMORIE_RAM_SUME_CARDURI port map (poz_pin, CS_SUME, '0', D_RAM_SUME, poz_pin, suma_finala_depunere, suma_finala_retragere, ES, EA);	

C4: MEMORIE_RAM_BANCNOTE port map (A_RAM_BANCNOTE, CS_BANCNOTE, '0', D_RAM_BANCNOTE, suma, verificare_existenta_suma_bancomat, en_verif_suma, EA);

C5: VERIFICARE_EXISTANTE_BANI_CONT port map (poz_pin, suma, en_verif_suma, verificare_existenta_suma_cont);

C6: INTEROGARE_SOLD port map (poz_pin, afisare_sold, sold);	

C7: ADAUGARE_BANI_CONT port map (suma, poz_pin, suma_finala_depunere, EA);

C8: SCADERE_BANI_CONT port map (suma, suma_finala_retragere, poz_pin, ES);



-- enter your statements here --
end MAIN;
