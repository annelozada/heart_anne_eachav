`default_nettype none

module glyphs_rom(
    input  wire [5:0] c, 
    input  wire [3:0] y, 
    input  wire [2:0] x, 
    output reg pixel
);
    reg [7:0] rb; 

    always @(*) begin
        case (c) 
            // "Anne ♡ EA" mapped to indices 0 through 8
            0:  case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            1:  case(y) 5:rb=8'hDC; 6:rb=8'hF6; 7,8,9,10:rb=8'hC6; default:rb=0; endcase // n (lowercase)
            2:  case(y) 5:rb=8'hDC; 6:rb=8'hF6; 7,8,9,10:rb=8'hC6; default:rb=0; endcase // n (lowercase)
            3:  case(y) 5,10:rb=8'h7C; 6,9:rb=8'hC6; 7:rb=8'hFE; 8:rb=8'hC0; default:rb=0; endcase // e (lowercase)
            4:  rb = 8'h00; // SPACE
            5:  case(y) 2:rb=8'h66; 3,4,5:rb=8'hFF; 6:rb=8'h7E; 7:rb=8'h3C; 8:rb=8'h18; default:rb=0; endcase // ♡ (Heart)
            6:  rb = 8'h00; // SPACE
            7:  case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // E
            8:  case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            default: rb = 8'h00; // Blank for any other character index
        endcase
        
        pixel = rb[7-x];
    end
endmodule