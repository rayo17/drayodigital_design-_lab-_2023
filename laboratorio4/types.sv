// types.sv
typedef enum logic [2:0] {
    HIDDEN   = 3'b000,
    REVEALED = 3'b001,
    FLAG     = 3'b010,
    BOMB     = 3'b011
} state_t;

typedef struct packed {
    logic [2:0] state;
    logic [2:0] data;
    logic       flag;
} cell_t;
