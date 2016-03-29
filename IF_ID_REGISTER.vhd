entity IF_ID_REGISTER is
  port (
	clk : in std_logic;

	-- REGISTER CONTROL
	stall : in std_logic;

	-- DATA STORED
		-- IN
		instruction_IN : in std_logic_vector(31 downto 0);
		pc_IN : in std_logic_vector(31 downto 0);

		-- OUT
		instruction_OUT : out std_logic_vector(31 downto 0);
		pc_plus_4_OUT : out std_logic_vector(31 downto 0);
		pc_OUT : out std_logic_vector(31 downto 0);

	-- CPU CONTROLL

	valid : out std_logic;
  ) ;
end entity ; -- IF_ID_REGISTER

architecture arch of IF_ID_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if rising_edge(clk) then
			pc_OUT <= pc_IN;
			instruction_OUT <= instruction_IN;
			pc_plus_4_OUT <= std_logic_vector(to_signed(to_integer(signed(pc_IN)) + 4, 32));
			
			if stall = '0' then
				valid <= '1';
			else
				valid <= '0';
				instruction_OUT <= others => '0';
				pc_plus_4_OUT <= pc_IN;
			end if;
		end if;		
	end process ; -- register_behaviour
end architecture ; -- arch