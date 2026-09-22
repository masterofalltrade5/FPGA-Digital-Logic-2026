-- Engineer: Samuel Johnson
-- Create Date: 09/14/2026 
-- Module Name:    lab1
-- Description: 
--    Determine F=PROD_of_Maxterms(0,1,2) in CSOP, CPOS, RSOP and RPOS
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           F_csop : out  STD_LOGIC;
           F_cpos : out  STD_LOGIC;
           F_rsop : out  STD_LOGIC;
           F_rpos : out  STD_LOGIC);
end lab1;

architecture Behavioral of lab1 is
begin
	F_csop <= ((not x) and y and z)
                or (x and (not y) and (not z)) 
                or (x and (not y) and z) 
                or (x and y and (not z))
		        or (x and y and z);
	F_cpos <= (x or y or z)
                and (x or (not y) or z)
                and (x or y or (not z));
	F_rsop <= (x) or (y and z);
	F_rpos <= (x or y) and (x or z);
end Behavioral;
