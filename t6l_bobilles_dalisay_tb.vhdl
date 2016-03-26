library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_t6l_bobilles_dalisay is
	constant MAX_COMB: integer := 64;
	constant DELAY: time := 10 ns;
end entity;

architecture tb_buzzer of tb_t6l_bobilles_dalisay is
	component buzzer is
		port(alarm: out std_logic; i2,o2,i1,o1,i0,o0: in std_logic);
	end component;
	
	signal alarm: std_logic;
	signal i2,o2,i1,o1,i0,o0: std_logic;
	
	begin --architecture
		uut: component tb_buzzer port map(alarm,i2,o2,i1,o1,i0,o0);
		main: process is
		
			variable temp: unsigned(5 downto 0);
			variable expected_alarm: std_logic;
			variable error_count: integer := 0;
		
		begin --process
		
			report "start simulation";
			for i in 0 to 63 loop --for(i=0; i<=63; i++)
				temp := TO_UNSIGNED(i, 6);
				--TO_UNSIGNED function converts i to unsigned binary (1st param) with 6 digits (2nd param)
				--assign i2, o2, i1, o1, i0 and o0 a value from the std_logic_vector temp
				
				i2 <= temp(5);
				o2 <= temp(4);
				i1 <= temp(3);
				o1 <= temp(2);
				i0 <= temp(1);
				o0 <= temp(0);
				
				if(i=0 or i=1 or i=2 or i=4 or i=5 or i=8 or i=10 or i=16 or i=17 or i=20 or i=21 or i=32 or i=34 or =40 or i=42) then
					expected_alarm := '0';
				else
					expected_alarm := '1';
				
				end if;
				wait for DELAY;
				
				assert(expected_alarm = alarm)
					report "ERROR: Expected Alarm " & std_logic'image(expected_alarm) & " /= actual alarm " & std_logic'image(alarm) & " at time " & time'image(now);
					
				if (expected_alarm /= alarm) then
					error_count := error_count + 1;
				end if;
			end loop;
			
			wait for DELAY;
			assert (error_count = 0)
				report "ERROR: There were " &
					integer'image(error_count) & " errors!";
				if(error_count = 0)
					then report "Simulation completed with NO errors.";
				end if;
			wait;
		end process;
end architecture tb_buzzer;
