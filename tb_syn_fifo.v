`include "syn_fifo.v"
module tb;
  parameter DATA_WIDTH = 8;
  parameter FIFO_SIZE = 16;
  parameter PTR_WIDTH = $clog2(FIFO_SIZE);
  
  reg clk,rst;
  reg wr_en,rd_en;
  reg [DATA_WIDTH-1:0] wdata;
  wire [DATA_WIDTH-1:0] rdata;
  wire full,overflow,empty,underflow;
  integer i,j,k,l,wr_delay,rd_delay;
  reg [15*8-1:0] test_name;
  
  syn_fifo dut(clk,rst,wr_en,wdata,full,overflow,rd_en,rdata,empty,underflow);
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    wdata = 0;
    repeat(2) @(posedge clk);
      rst = 0;
    
    $value$plusargs("test_name=%0s",test_name);
    case(test_name)
        "WR_RD": begin
  	               writes(FIFO_SIZE);
                   reads(FIFO_SIZE);
  	             end
        "FULL" : begin
    	           writes(FIFO_SIZE);
    			 end
     	"EMPTY" : begin
    	            writes(FIFO_SIZE);
    	            reads(FIFO_SIZE);
    			  end
    	"OVERFLOW" : begin
    	               writes(FIFO_SIZE+1);
    			     end
    	"UNDERFLOW" : begin
    	                writes(FIFO_SIZE);
    				    reads(FIFO_SIZE+1);
    			      end
    	"CONCURRENT" : fork
    	                 begin
    	                   for(k=0;k<20;k=k+1) begin
    	                       writes(1);
    						   wr_delay = $urandom_range(5,20);
    						   #(wr_delay);
    					   end
    					 end
    					 begin
    					   wait (empty==0);
                           for(l=0;l<20;l=l+1) begin
    					       reads(1);
    						   rd_delay = $urandom_range(5,20);
    						   #(rd_delay);
    					   end
    					 end
    			       join
    endcase
    
    #100;
    $finish;
  end
  
    //writes
    task writes(input integer num_writes); begin
         for(i=0;i<num_writes;i=i+1) begin
            @(posedge clk);
  		      wr_en = 1;
  		      wdata = $random;
  	     end
  	     @(posedge clk);
  		   wr_en = 0;
  		   wdata = 0;
      end
    endtask
     
    //reads 
    task reads(input integer num_reads); begin
         for(j=0;j<num_reads;j=j+1) begin
            @(posedge clk);
  	     	  rd_en = 1;
  	     end
  	     @(posedge clk);
  		   rd_en = 0;
      end
    endtask
  
  
endmodule
  
