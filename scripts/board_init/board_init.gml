/// @function board_init()
/// @desc Ініціалізація ігрового поля та генерація фішок.
function board_init() {
    var ix, iy, clr, px, py, piece;
    global.board = array_create(global.board_cols, 0);
    for (ix = 0; ix < global.board_cols; ix++) {
        global.board[ix] = array_create(global.board_rows, 0);
        for (iy = 0; iy < global.board_rows; iy++) {
            clr = irandom(global.num_colors - 1);
            global.board[ix][iy] = {color: clr, bonus: 0, state: 0};
            px = global.board_x + ix * global.cell_size;
            py = global.board_y + iy * global.cell_size;
            piece = instance_create_layer(px, py, "Pieces", obj_piece);
            with (piece) {
            grid_x = ix;
            grid_y = iy;
            color_id = clr;
            image_index = clr; // тепер color_id вже існує!
            // Тепер, коли grid_x і grid_y вже є, встановлюємо координати:
            x = global.board_x + grid_x * global.cell_size;
            y = global.board_y + grid_y * global.cell_size;
            }
        }
    }
}