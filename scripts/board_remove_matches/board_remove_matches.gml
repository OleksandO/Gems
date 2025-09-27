/// @function board_remove_matches(match_list)
/// @desc Видалення знайдених фішок з поля та запуск анімації зникнення.
/// @param {ds_list} match_list Список координат (по черзі ix, iy).

function board_remove_matches(match_list) {
    var i, ix, iy;
    
    show_debug_message("remove matches!");
    
    for (i = 0; i < ds_list_size(match_list); i += 2) {
        ix = ds_list_find_value(match_list, i);
        iy = ds_list_find_value(match_list, i + 1);
        global.board[ix][iy].color = -1; // -1 = порожньо

        // Видаляємо інстанс фішки
        with (obj_piece) {
            if (grid_x == ix && grid_y == iy) instance_destroy();
        }
    }
}