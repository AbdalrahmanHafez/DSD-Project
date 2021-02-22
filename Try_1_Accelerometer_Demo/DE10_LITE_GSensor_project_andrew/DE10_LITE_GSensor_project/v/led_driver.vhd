--------------------------------------------------------------
--------------------------------------------------------------
--                                                          --
-- This VHDL file has been generated by the verilog2vhdl    --
-- tool.                                                    --
-- Contact help@edautils.com  for support/info.--
--                                                          --
--                                                          --
--------------------------------------------------------------
--------------------------------------------------------------
--
--
-- Assumptions: 
--         (1) All the parameters are of type INTEGER, and hence the translated generics are of this type
--
--
-- Generated by : apache on 2/22/21 9:40 AM
--
--
library ieee;
use ieee.std_logic_1164.all;
--package vl2vh_common_pack is 
  --  type vl2vh_memory_type is      array  ( natural range <> , natural range <>  )  of std_logic ;
  --  function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic;  constant falseval : std_logic)  return std_logic; 
  --  function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic_vector;  constant falseval : std_logic_vector)  return std_logic_vector; 
--end package; 




package body vl2vh_common_pack is 
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic;  constant falseval : std_logic)  return std_logic is 
    begin
        if ( cond ) then 
             return trueval;
        else 
             return falseval;
        end if;
    end;
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic_vector;  constant falseval : std_logic_vector)  return std_logic_vector is 
    begin
        if ( cond ) then 
             return trueval;
        else 
             return falseval;
        end if;
    end;
end; 


library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.vl2vh_common_pack.all;
entity led_driver is 
     port (
        iRSTN :  in std_logic;
        iCLK :  in std_logic;
        iDIG :  in std_logic_vector( 9  downto 0  );
        iG_INT2 :  in std_logic;
        oLED :  out std_logic_vector( 9  downto 0  )
    );
end entity; 


architecture rtl of led_driver is 
    signal select_data : std_logic_vector( 4  downto 0  );
    signal signed_bit : std_logic;
    signal abs_select_high : std_logic_vector( 3  downto 0  );
    signal int2_d : std_logic_vector( 1  downto 0  );
    signal int2_count : std_logic_vector( 23  downto 0  );
    signal int2_count_en : std_logic;
    begin 
        select_data <= vl2vh_ternary_func( iG_INT2, iDIG(9  downto 5 ), vl2vh_ternary_func( iDIG(9 ), vl2vh_ternary_func( iDIG(8 ), iDIG(8  downto 4 ), X"10"  ), vl2vh_ternary_func( iDIG(8 ), X"f" , iDIG(8  downto 4 ) ) ) );
        signed_bit <= select_data(4 );
        abs_select_high <= vl2vh_ternary_func( signed_bit, (  not select_data(3  downto 0 ) ) , select_data(3  downto 0 ) );
        oLED <= vl2vh_ternary_func( int2_count(23 ), vl2vh_ternary_func( ( abs_select_high = X"0"  ) , X"030" , vl2vh_ternary_func( ( abs_select_high = X"1"  ) , vl2vh_ternary_func( signed_bit, X"010" , X"020"  ), vl2vh_ternary_func( ( abs_select_high = X"2"  ) , vl2vh_ternary_func( signed_bit, X"018" , X"060"  ), vl2vh_ternary_func( ( abs_select_high = X"3"  ) , vl2vh_ternary_func( signed_bit, X"8" , X"040"  ), vl2vh_ternary_func( ( abs_select_high = X"4"  ) , vl2vh_ternary_func( signed_bit, X"c" , X"0c0"  ), vl2vh_ternary_func( ( abs_select_high = X"5"  ) , vl2vh_ternary_func( signed_bit, X"4" , X"080"  ), vl2vh_ternary_func( ( abs_select_high = X"6"  ) , vl2vh_ternary_func( signed_bit, X"6" , X"180"  ), vl2vh_ternary_func( ( abs_select_high = X"7"  ) , vl2vh_ternary_func( signed_bit, X"2" , X"100"  ), vl2vh_ternary_func( ( abs_select_high = X"8"  ) , vl2vh_ternary_func( signed_bit, X"3" , X"300"  ), vl2vh_ternary_func( signed_bit, X"1" , X"200"  ) ) ) ) ) ) ) ) ) ), vl2vh_ternary_func( int2_count(20 ), X"0" , X"3ff"  ) );
        process 
        begin
            wait until ( ( iRSTN'EVENT and ( iRSTN = '0' )  )  or ( iCLK'EVENT and ( iCLK = '1' )  )  ) ;
            if ( (  not iRSTN )  ) then 
                int2_count_en <= '0';
                int2_count <= X"800000" ;
            else 
                int2_d <= ( int2_d(0 ) & iG_INT2 );
                if ( ( (  not int2_d(1 ) )  and int2_d(0 ) )  ) then 
                    int2_count_en <= '1';
                    int2_count <= X"0" ;
                else 
                    if ( int2_count(23 ) ) then 
                        int2_count_en <= '0';
                    else 
                        int2_count <= ( int2_count + 1  ) ;
                    end if;
                end if;
            end if;
        end process;
    end; 


