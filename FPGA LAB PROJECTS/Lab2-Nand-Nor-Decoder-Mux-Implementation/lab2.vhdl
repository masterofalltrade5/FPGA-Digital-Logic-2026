library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab2 is
    Port(
           x,y,z: in STD_LOGIC;
           Decoder : out  STD_LOGIC;
           MUX : out  STD_LOGIC;
           Nand_Implement : out  STD_LOGIC;
           Nor_Implement : out  STD_LOGIC);
end entity lab2;

architecture rtl of lab2 is
signal d: STD_LOGIC_vector(7 downto 0);
begin
    process(x, y, z)
    begin
        case std_logic_vector'(x & y & z) is
            when "000"  => d <= "00000001"; -- d(0) high
            when "001"  => d <= "00000010"; -- d(1) high
            when "010"  => d <= "00000100"; -- d(2) high
            when "011"  => d <= "00001000"; -- d(3) high
            when "100"  => d <= "00010000"; -- d(4) high
            when "101"  => d <= "00100000"; -- d(5) high
            when "110"  => d <= "01000000"; -- d(6) high
            when "111"  => d <= "10000000"; -- d(7) high
            when others => d <= "00000000";
        end case;
    end process;
    --NAND IMPLEMENTATION
	Nand_Implement <= ((x nand x)nand(y nand z));
	--NOR IMPLEMENTATION
	Nor_Implement <= ((x nor z)nor(x nor y));
	--DECODER OUTPUT
	Decoder <= d(3)or d(4)or d(5)or d(6)or d(7);
	--MUX IMPLEMENTATION
	with STD_LOGIC_vector'(x & y) select
	   MUX <= '0' when "00",
	           z  when "01",
	          '1' when "10",
	          '1' when "11",
	          '0' when others;
end architecture rtl;
