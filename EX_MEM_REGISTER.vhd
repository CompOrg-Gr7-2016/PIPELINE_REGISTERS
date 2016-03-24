entity EX_MEM_REGISTER is
  port (
	clk : in std_logic;

	-- REGISTER CONTROL
	stall : in std_logic;
	clear : in std_logic;

	-- DATA STORED
		-- IN
			reg_write_IN : in std_logic;
			mem_to_reg_IN : in std_logic;
			mem_write_IN : in std_logic;
			alu_out_IN : in std_logic_vector(31 downto 0);
			write_data_IN : in std_logic_vector(31 downto 0);
			write_reg_IN : in std_logic_vector(4 downto 0);
		-- OUT
			reg_write_OUT : in std_logic;
			mem_to_reg_OUT : in std_logic;
			mem_write_OUT : in std_logic;
			alu_out_OUT : in std_logic_vector(31 downto 0);
			write_data_OUT : in std_logic_vector(31 downto 0);
			write_reg_OUT : in std_logic_vector(4 downto 0);

	-- CPU CONTROLL

	valid : out std_logic;
  ) ;
end entity ; -- EX_MEM_REGISTER

architecture arch of EX_MEM_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if clr = '1' then
			reg_d_OUT <= "00000";
		end if ;

		if rising_edge(clk) then
			if stall = '0' then
				valid <= '1';

				reg_write_OUT <= reg_write_OUT;
				mem_to_reg_OUT <= mem_to_reg_OUT;
				mem_write_OUT <= mem_write_OUT;
				alu_out_OUT <= alu_out_OUT;
				write_data_OUT <= write_data_OUT;
				write_reg_OUT <= write_reg_OUT;
			else
				valid <= '0';
				reg_d_OUT <= "00000"; 
			end if;
		end if;		
	end process ; -- register_behaviour
end architecture ; -- arch