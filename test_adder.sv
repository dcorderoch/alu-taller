module test_adder();
	logic [1:0] a;
	logic [1:0] b;
	logic [1:0] s;
	logic cin;
	logic cout;
	adder #(2) DUT(a,b,cin,s,cout);
	initial begin
	cin=1;
	a = 2'b00;
	b = 2'b00;
	#100;
	assert(s === 2'b00) $display("Ok, s is 2'b00"); else $error("2'b00 failed");
	#100;
	
	a = 2'b01;
	b = 2'b00;
	#100;
	assert(s === 2'b01) $display("Ok, s is 2'b01"); else $error("2'b01 failed");
	#100;
	
	
	a = 2'b01;
	b = 2'b01;
	#100;
	assert(s === 2'b10) $display("Ok, s is 2'b10"); else $error("2'b10 failed");
	#100;
	end
endmodule
