/* Importacao arquivo posicional */

data work.tb_tmp_posicional;
	infile "/home/user/data/shoes_posicional.txt"
	lrecl=100
	truncover
	;
	input 
		@01 Region $25.
		@26 Product $14.
		@40 Subsidiary $12.
		@52 Store 8.
		@61 Sales dollar8.
		@68 Inventory dollar8.
		@76 Returns dollar8.
	;
run;