library IEEE;
use IEEE.std_logic_1164.all;

entity Sumador4Bits is
    port (
        sVect : buffer std_logic_vector (4 downto 0);
		  sum_hxd : out std_logic_vector (9 downto 0);
        aVect : in std_logic_vector (3 downto 0);
        bVect : in std_logic_vector (3 downto 0);
        mainC_in : in std_logic
    );
end entity;

architecture arch_Sumador4Bits of Sumador4Bits is

    component Sumador1Bit is
        port (
            sum, carryOut : out std_logic;
            a, b, carryIn : in std_logic
        );
    end component;
	 
	 component Conversor is
	     port (
				sum : in std_logic_vector (4 downto 0);
				hxd : out std_logic_vector (9 downto 0)
		  );
	 end component;

    signal auxCarry : std_logic_vector (4 downto 0); 

begin

    auxCarry(0) <= mainC_in;

    bit_s0: Sumador1Bit port map (
        sum => sVect(0),
        carryOut => auxCarry(1),
        a => aVect(0),
        b => bVect(0),
        carryIn => auxCarry(0)
    );

    bit_s1: Sumador1Bit port map (
        sum => sVect(1),
        carryOut => auxCarry(2),
        a => aVect(1),
        b => bVect(1),
        carryIn => auxCarry(1)
    );

    bit_s2: Sumador1Bit port map (
        sum => sVect(2),
        carryOut => auxCarry(3),
        a => aVect(2),
        b => bVect(2),
        carryIn => auxCarry(2)
    );

    bit_s3: Sumador1Bit port map (
        sum => sVect(3),
        carryOut => auxCarry(4),
        a => aVect(3),
        b => bVect(3),
        carryIn => auxCarry(3)
    );

    sVect(4) <= auxCarry(4);
	 
	 conv: Conversor port map(
		 hxd => sum_hxd,
		 sum => sVect
	 );

end architecture;
