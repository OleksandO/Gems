/// @function board_swap(x1, y1, x2, y2)
/// @desc Міняє місцями дві фішки на полі
function board_swap(x1, y1, x2, y2) {
    // Міняємо у масиві board
    var temp = global.board[x1][y1];
    global.board[x1][y1] = global.board[x2][y2];
    global.board[x2][y2] = temp;

    // Міняємо grid_x, grid_y та позиції інстансів
    var piece1 = noone, piece2 = noone;
    with (obj_piece) {
        if (grid_x == x1 && grid_y == y1) piece1 = id;
        if (grid_x == x2 && grid_y == y2) piece2 = id;
    }
    if (piece1 != noone && piece2 != noone) {
        var t1x = global.board_x + x1 * global.cell_size;
        var t1y = global.board_y + y1 * global.cell_size;
        var t2x = global.board_x + x2 * global.cell_size;
        var t2y = global.board_y + y2 * global.cell_size;

        with (piece1) {
            grid_x = x2; grid_y = y2;
            x = t2x; y = t2y;
        }
        with (piece2) {
            grid_x = x1; grid_y = y1;
            x = t1x; y = t1y;
        }
    }
    
}