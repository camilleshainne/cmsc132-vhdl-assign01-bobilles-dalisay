-- AB + AD + AD'F + DE + A'BD'E + A'CD + A'BC + A'CD'F + D'EF

library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity t6l_bobilles_dalisay is
	port (alarm: out std_logic; i2,o2,i1,o1,i0,o0: in std_logic);
end entity;

architecture behav of t6l_bobilles_dalisay is

	begin
		alarm <= (i2 and o2) or (i2 and o1) or (i2 and (not o1) and o0) or (o1 and i0) or ((not i2) and o2 and (not o1) and i0) or ((not i2) and i1 and o1) or ((not i2) and o2 and i1) or ((not i2) and i1 and (not o1) and o0) or ((not o1) and i0 and o0);
		
end architecture behav;

----------------------------------------------------------------

--(a+c)(b+de+f) + a'c'(bd + b'e(d+f))

library IEEE; use IEEE.std_logic_1164.all;

entity barn is
	port(A, B, C, D, E, F : in std_logic; ou : out std_logic);
	--	 a,  b,  c,  d,  e,  f
end barn;

architecture full_adder of full_adder is
	begin
		--ou <= ((a or c) and (b or (d and e) or f)) or ((not a) and (not c) and ((b and d) or ((not b) and e and (d or f))));
		ou <= ((A or C) and (B or (D and E) or F)) or ((not A) and (not C) and ((B and D) or ((not B) and E and (D or F))));
end architecture;
