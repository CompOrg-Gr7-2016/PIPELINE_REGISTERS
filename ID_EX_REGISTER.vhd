entity ID_EX_REGISTER is
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
			opcode_IN : in std_logic_vector(5 downto 0);
			funct_IN : in std_logic_vector(5 downto 0);
			shamt_IN : in std_logic_vector(4 downto 0);
			immediate_select_IN : in std_logic;
			reg_dest_select_IN : in std_logic;
			reg_s_IN : in std_logic_vector(4 downto 0);
			reg_t_IN : in std_logic_vector(4 downto 0);
			reg_d_IN : in std_logic_vector(4 downto 0);
			immediate_value_IN : in std_logic_vector(31 downto 0);
		-- OUT
			reg_write_OUT : in std_logic;
			mem_to_reg_OUT : in std_logic;
			mem_write_OUT : in std_logic;
			opcode_OUT : in std_logic_vector(5 downto 0);
			funct_OUT : in std_logic_vector(5 downto 0);
			shamt_OUT : in std_logic_vector(4 downto 0);
			immediate_select_OUT : in std_logic;
			reg_dest_select_OUT : in std_logic;
			reg_s_OUT : in std_logic_vector(4 downto 0);
			reg_t_OUT : in std_logic_vector(4 downto 0);
			reg_d_OUT : in std_logic_vector(4 downto 0);
			immediate_value_OUT : in std_logic_vector(31 downto 0);

	-- CPU CONTROLL

	valid : out std_logic;
  ) ;
end entity ; -- ID_EX_REGISTER

architecture arch of ID_EX_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if clr = '1' then
			reg_d_OUT <= "00000";
		end if ;

		if rising_edge(clk) then
			if stall = '0' then
				valid <= '1';
				
				reg_write_OUT <= reg_write_IN;
				mem_to_reg_OUT <= mem_to_reg_IN;
				mem_write_OUT <= mem_write_IN;
				opcode_OUT <= opcode_IN;
				funct_OUT <= funct_IN;
				shamt_OUT <= shamt_IN;
				immediate_select_OUT <= immediate_select_IN;
				reg_dest_select_OUT <= reg_dest_select_IN;
				reg_s_OUT <= reg_s_IN;
				reg_t_OUT <= reg_t_IN;
				reg_d_OUT <= reg_d_IN;
				immediate_value_OUT <= immediate_value_IN;
			else
				valid <= '0';
				reg_d_OUT <= "00000"; 
			end if;
		end if;		
	end process ; -- register_behaviour
end architecture ; -- arch