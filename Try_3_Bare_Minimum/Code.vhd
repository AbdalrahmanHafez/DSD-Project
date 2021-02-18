library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.decoder7seg_pkg.all;
entity Code is
	port (
		clk,rst			: IN STD_LOGIC;
		GSENSOR_CS_N	: OUT STD_LOGIC;
		GSENSOR_INT1	: IN STD_LOGIC;
		GSENSOR_INT2 	: IN STD_LOGIC;
		GSENSOR_SCLK 	: OUT STD_LOGIC;
		-- GSENSOR_SDI 	: BUFFER STD_LOGIC_Vector(15 downto 0); -- suppositly the data is HERE
		GSENSOR_SDI 	: BUFFER STD_LOGIC; -- Serial DATA WTF ???

		GSENSOR_SDO 	: BUFFER STD_LOGIC;
		

		A, B : IN unsigned(2 downto 0);
		seven_seg0: BUFFER unsigned(6 downto 0);
		seven_seg1: BUFFER unsigned(6 downto 0);
		seven_seg2: BUFFER unsigned(6 downto 0);
		seven_seg3: BUFFER unsigned(6 downto 0)
		
		
	);
end entity Code;
architecture arc_Code of Code is
	SIGNAL sum: unsigned(3 downto 0);
	SIGNAL decodedsum: unsigned(7 downto 0);
begin
	GSENSOR_CS_N <= '0'; -- try 0 or 1 
	GSENSOR_SCLK <= clk;

	process
	begin
		wait until clk'EVENT and clk ='1';
		

		-- Grabbing the accelerometer Data and proccess it





	end process;
	
	-- Fix logic
	sum <= '0'&A + B;

	decodedsum <= sum + "00000000" when (sum <= "1001") else sum + "00000110";


	
	LED0 :	decoder7seg	
		port map(	input => decodedsum(3 downto 0) ,
				 	output => seven_seg0 );

	LED1 :	decoder7seg	
		port map(	input => decodedsum(7 downto 4) ,
					output => seven_seg1 );

	LED2 :	decoder7seg	
		port map(	input => decodedsum(7 downto 4) ,
					output => seven_seg2 );

	LED3 :	decoder7seg	
	port map(	input => decodedsum(7 downto 4) ,
				output => seven_seg3 );

end architecture arc_Code;
