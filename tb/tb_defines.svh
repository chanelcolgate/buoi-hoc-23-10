// Register address value:

parameter SPI_RX_0 = 5'h0;
parameter SPI_RX_1 = 5'h4;
parameter SPI_RX_2 = 5'h8;
parameter SPI_RX_3 = 5'hc;

parameter SPI_TX_0 = 5'h0;
parameter SPI_TX_1 = 5'h4;
parameter SPI_TX_2 = 5'h8;
parameter SPI_TX_3 = 5'hc;
parameter SPI_CTRL = 5'h10;
parameter SPI_DIVIDE = 5'h14;
parameter SPI_SS = 5'h18;

logic clock, rstn;
logic sclk, mosi, miso;
logic [7:0] ss;
logic tip;

// Virtual interface
typedef virtual spi_interface spi_vif;
