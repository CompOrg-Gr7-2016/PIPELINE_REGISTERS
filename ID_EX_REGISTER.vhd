entity ID_EX_REGISTER is
  port (
	clk : in std_logic;

	-- REGISTER CONTROL
		stall : in std_logic;

	-- DATA STORED
		-- IN
			reg_write_IN : in std_logic;
		    mem_write_IN : in std_logic;
		    mem_read_IN : in std_logic;
		    alu_imm_IN : in std_logic;
		    reg_d_dest_IN : in std_logic;
		    mem_byte_IN : in std_logic;
		    halt_IN : in std_logic;
			opcode_IN : in std_logic_vector(5 downto 0);
			reg_s_IN : in std_logic_vector(4 downto 0);
			reg_t_IN : in std_logic_vector(4 downto 0);
			reg_d_IN : in std_logic_vector(4 downto 0);
			funct_IN : in std_logic_vector(5 downto 0);
			shamt_IN : in std_logic_vector(4 downto 0);
			immediate_IN : in std_logic_vector(31 downto 0);
			reg_1_data_IN : in std_logic_vector(31 downto 0);
			reg_2_data_IN : in std_logic_vector(31 downto 0);
		
		-- OUT
			reg_write_OUT : out std_logic;
		    mem_write_OUT : out std_logic;
		    mem_read_OUT : out std_logic;
		    alu_imm_OUT : out std_logic;
		    reg_d_dest_OUT : out std_logic;
		    mem_byte_OUT : out std_logic;
		    halt_OUT : out std_logic;
			opcode_OUT : out std_logic_vector(5 downto 0);
			reg_s_OUT : out std_logic_vector(4 downto 0);
			reg_t_OUT : out std_logic_vector(4 downto 0);
			reg_d_OUT : out std_logic_vector(4 downto 0);
			funct_OUT : out std_logic_vector(5 downto 0);
			shamt_OUT : out std_logic_vector(4 downto 0);
			immediate_OUT : out std_logic_vector(31 downto 0);
			reg_1_data_OUT : out std_logic_vector(31 downto 0);
			reg_2_data_OUT : out std_logic_vector(31 downto 0);

	-- CPU CONTROLL
		valid : out std_logic;
  ) ;
end entity ; -- ID_EX_REGISTER

architecture arch of ID_EX_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if rising_edge(clk) then
			reg_write_OUT <= reg_write_IN;
		    mem_write_OUT <= mem_write_IN;
		    mem_read_OUT <= mem_read_IN;
		    alu_imm_OUT <= alu_imm_IN;
		    reg_d_dest_OUT <= reg_d_dest_IN;
		    mem_byte_OUT <= mem_byte_IN;
		    halt_OUT <= halt_IN;
			opcode_OUT <= opcode_IN;
			reg_s_OUT <= reg_s_IN;
			reg_t_OUT <= reg_t_IN;
			reg_d_OUT <= reg_d_IN;
			funct_OUT <= funct_IN;
			shamt_OUT <= shamt_IN;
			immediate_OUT <= immediate_IN;
			reg_1_data_OUT <= reg_1_data_IN;
			reg_2_data_OUT <= reg_2_data_IN;

			if stall = '0' then
				valid <= '1';
			else
				valid <= '0';
				reg_write_OUT <= '0';
				mem_write_OUT <= '0';
				mem_read_OUT <= '0';
				reg_s_OUT <= "00000";
				reg_t_OUT <= "00000";
				reg_d_OUT <= "00000";
				opcode_OUT <= "000000";
				funct_OUT <= "000000";
			end if;
		end if;
	end process ; -- register_behaviour
end architecture ; -- arch