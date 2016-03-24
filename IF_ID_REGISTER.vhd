entity IF_ID_REGISTER is
  port (
	clk : in std_logic;

	-- REGISTER CONTROL
	stall : in std_logic;
	clear : in std_logic;

	-- DATA STORED
		-- IN
		instruction_IN : in std_logic_vector(31 downto 0);
		pc_plus_4_IN : in std_logic_vector(31 downto 0);

		-- OUT
		instruction_OUT : out std_logic_vector(31 downto 0);
		pc_plus_4_OUT : out std_logic_vector(31 downto 0);

	-- CPU CONTROLL

	valid : out std_logic;
  ) ;
end entity ; -- IF_ID_REGISTER

architecture arch of IF_ID_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if clr = '1' then
			reg_d_OUT <= "00000";
			instruction_OUT <= others => '0';
			pc_plus_4_OUT <= others => '0';
		end if ;

		if rising_edge(clk) then
			if stall = '0' then
				valid <= '1';
				instruction_OUT <= instruction_IN;
				pc_plus_4_OUT <= pc_plus_4_IN;
			else
				valid <= '0';
				reg_d_OUT <= "00000"; 
			end if;
		end if;		
	end process ; -- register_behaviour
end architecture ; -- arch