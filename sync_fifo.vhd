library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--! module description

--!{signal: [
--!  {name: "clk", 	wave: "P........"},
--!  {name: "wr_en", 	wave: "1.01...0."},
--!  {name: "input_data",	wave: "=========", data: "09 0d 01 76 8c c6 77 8f c5"},
--!  {name: "rd_en",	wave: "01..010.."},
--!  {name: "output_data",	wave: "x.==..=..", data: "09 0d 76"},
--!  {name: "rdata", 	wave: "x..==..=.", data: "09 0d 76"}
--!]}

entity sync_fifo is
  generic
  (
    data_width : natural := 8;
    fifo_depth : integer := 8
  );

  port
  (
    clk, reset  : in std_logic;
    wr_en       : in std_logic;
    input_data  : in std_logic_vector (data_width - 1 downto 0);
    empty, full : out std_logic;
    rd_en       : in std_logic;
    output_data : out std_logic_vector (data_width - 1 downto 0)
  );
end entity;

architecture logic_flow of sync_fifo is
  type fifo_array_type is array (0 to fifo_depth - 1) of std_logic_vector (data_width-1 downto 0);
  signal fifo_array : fifo_array_type := (others => (others => '0'));

  signal wr_index  : integer range 0 to fifo_depth - 1  := 0;
  signal rd_index  : integer range -1 to fifo_depth - 1  := 0;
  signal fifo_line : integer range -1 to fifo_depth + 1 := 1;
  signal full_sig  : std_logic := '0';
  signal empty_sig : std_logic := '0';
begin
  process (clk, reset)
  begin
    if (reset = '1') then
      fifo_line <= 0;
      wr_index  <= 0;
      rd_index  <= 0;
    elsif (clk'event and clk='0') then
      if (wr_en = '1' and rd_en = '0') then
        fifo_line <= fifo_line + 1;
        fifo_array(wr_index) <= input_data;
        if (wr_index = fifo_depth - 1) then
          wr_index <= 0;
        else
          wr_index <= wr_index + 1;
        end if;
      end if;

      if (wr_en = '0' and rd_en = '1' and empty_sig = '0') then
        fifo_line <= fifo_line - 1;
        if (rd_index = fifo_depth - 1) then
          rd_index <= 0;
        else
          rd_index <= rd_index + 1;
        end if;
      end if;
    end if;
  end process;
  
  full_sig <= '1' when fifo_line=fifo_depth else '0';
  empty_sig <= '1' when fifo_line=0 else '0';
  output_data <= fifo_array(rd_index) when wr_en = '0';
      
  full  <= full_sig;
  empty <= empty_sig;
end architecture;
