entity EX_MEM_REGISTER is
  port (
	clk : in std_logic;

	-- REGISTER CONTROL
	stall : in std_logic;

	-- DATA STORED
		-- IN
			reg_write_IN : in std_logic;
		    mem_write_IN : in std_logic;
		    mem_read_IN : in std_logic;
		    mem_byte_IN : in std_logic;
		    halt_IN : in std_logic;
		    alu_result_IN : in std_logic_vector(31 downto 0);
			reg_dest_IN : in std_logic_vector(4 downto 0);
			write_data_IN : in std_logic_vector(31 downto 0);

		-- OUT
			reg_write_OUT : out std_logic;
		    mem_write_OUT : out std_logic;
		    mem_read_OUT : out std_logic;
		    mem_byte_OUT : out std_logic;
		    halt_OUT : out std_logic;
		    alu_result_OUT : out std_logic_vector(31 downto 0);
			reg_dest_OUT : out std_logic_vector(4 downto 0);
			write_data_OUT : out std_logic_vector(31 downto 0);

	-- CPU CONTROLL

	valid : out std_logic;
  ) ;
end entity ; -- EX_MEM_REGISTER

architecture arch of EX_MEM_REGISTER is
begin

	register_behaviour : process( clk )
	begin
		if rising_edge(clk) then
			
			reg_write_OUT <= reg_write_IN;
		    mem_write_OUT <= mem_write_IN;
		    mem_read_OUT <= mem_read_IN;
		    mem_byte_OUT <= mem_byte_IN;
		    halt_OUT <= halt_IN;
		    alu_result_OUT <= alu_result_IN;
			reg_dest_OUT <= reg_dest_IN;
			write_data_OUT <= write_data_IN;
			
			if stall = '0' then
				valid <= '1';
			else
				valid <= '0';
				reg_write_OUT <= '0';
			    mem_write_OUT <= '0';
			    mem_read_OUT <= '0';
				reg_dest_OUT <= "00000";
			end if;
		end if;		
	end process ; -- register_behaviour
end architecture ; -- arch