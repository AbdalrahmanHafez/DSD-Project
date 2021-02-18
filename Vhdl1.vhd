library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity acc is
	port (
		clk				: IN STD_LOGIC;
		GSENSOR_CS_N	: OUT STD_LOGIC;
		GSENSOR_INT1	: IN STD_LOGIC;
		GSENSOR_INT2 	: IN STD_LOGIC;
		GSENSOR_SCLK 	: OUT STD_LOGIC;
		GSENSOR_SDI 	: BUFFER STD_LOGIC_Vector(15 downto 0);
		GSENSOR_SDO 	: BUFFER STD_LOGIC;
		
		
		A, B : IN UNSIGNED(0 to 2);
		seven_seg0: OUT UNSIGNED(0 to 6);
		seven_seg1: OUT UNSIGNED(0 to 6)	 
		
		-- incomplelte -- the other 7segs
		
	);
end entity acc;


architecture arc_acc of acc is
	
begin
	GSENSOR_CS_N <= '0';
	GSENSOR_SDO <= '0';
	GSENSOR_INT1 <= '0';
	GSENSOR_INT2 <= '0';
	GSENSOR_SCLK<= clk;
	sevenseg1 <= '10011110';
	
	process(clk, rst)
	begin
		wait until clk'EVENT and clk ='1';
		sevenseg2 <= '11001100';

		-- incomplelte -- HOW to obtain the Sensor Data ? ?
		
	end process;
	
	
	sum <= '0'&A + B;

	decodedsum <= sum + "00000000" when (sum <= "1001") else sum + "00000110";

	with decodedsum(3 downto 0) select
	seven_seg0 <= 	not "1111110" when "0000",
						not "0110000" when "0001",
						not "1101101" when "0010",
						not "1111001" when "0011",
						not "0110011" when "0100",
						not "1011011" when "0101",
						not "0011111" when "0110",
						not "1110000" when "0111",
						not "1111111" when "1000",
						not "1110011" when "1001",
						not "0000000" when others;

	with decodedsum(7 downto 4) select
	seven_seg1 <= 	not "1111110" when "0000",
						not "0110000" when "0001",
						not "1101101" when "0010",
						not "1111001" when "0011",
						not "0110011" when "0100",
						not "1011011" when "0101",
						not "0011111" when "0110",
						not "1110000" when "0111",
						not "1111111" when "1000",
						not "1110011" when "1001",
						not "0000000" when others;

end architecture arc_acc;
