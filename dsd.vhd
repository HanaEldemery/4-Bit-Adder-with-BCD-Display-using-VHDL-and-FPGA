library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY dsd IS 
PORT (X, Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		led1,led2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END dsd; 
 
ARCHITECTURE Behavior OF dsd IS 
SIGNAL Temp: STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL SP:STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL CP:STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
S <= ('0'&X)+Y;
Temp <= ('0'&X)+Y;
SP <= Temp WHEN Temp<10
      ELSE Temp-10 WHEN Temp<20
		ELSE Temp-20 WHEN Temp<30
		ELSE Temp-30;
CP <= "00" WHEN Temp<10
      ELSE "01" WHEN Temp<20
		ELSE "10" WHEN Temp<30
		ELSE "11";
PROCESS (SP(3 DOWNTO 0))		
    BEGIN
        CASE SP(3 DOWNTO 0) IS
            WHEN "0000" =>
                led1 <= "1000000";
            WHEN "0001" =>
                led1 <= "1111001";
            WHEN "0010" =>
                led1 <= "0100100";
            WHEN "0011" =>
                led1 <= "0110000";
            WHEN "0100" =>
                led1 <= "0011001";
            WHEN "0101" =>
                led1 <= "0010010";
            WHEN "0110" =>
                led1 <= "0000010";
            WHEN "0111" =>
                led1 <= "1111000";
            WHEN "1000" =>
                led1 <= "0000000";
            WHEN "1001" =>
                led1 <= "0011000";
            WHEN OTHERS =>
                led1 <= "0000000"; 
        END CASE;
    END PROCESS;	 
PROCESS (CP)
BEGIN
    CASE CP IS
        WHEN "00" =>
            led2 <= "1000000";
        WHEN "01" =>
            led2 <= "1111001";
        WHEN "10" =>
            led2 <= "0100100";
        WHEN "11" =>
            led2 <= "0110000";
        WHEN OTHERS =>
            led2 <= "0000000"; 
    END CASE;
END PROCESS;
END Behavior;