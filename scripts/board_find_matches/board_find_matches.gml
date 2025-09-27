/// @function board_find_matches()
/// @desc Пошук комбінацій по горизонталі та вертикалі.
/// @returns {ds_list} Список координат фішок, що входять до комбінацій (по черзі ix, iy).
function board_find_matches() {
    var match_list, ix, iy, ik, cnt, clr, prev_clr;
    match_list = ds_list_create();
    
    

    // Горизонтальні перевірки
    for (iy = 0; iy < global.board_rows; iy++) {
        cnt = 1;
        prev_clr = global.board[0][iy].color;
        for (ix = 1; ix < global.board_cols; ix++) {
            clr = global.board[ix][iy].color;
            if (clr == prev_clr && clr != -1) {
                cnt += 1;
            } else {
                if (cnt >= 3 && prev_clr != -1) {
                    for (ik = 0; ik < cnt; ik++) {
                        ds_list_add(match_list, ix - 1 - ik);
                        ds_list_add(match_list, iy);
                    }
                }
                cnt = 1;
            }
            prev_clr = clr;
        }
        if (cnt >= 3 && prev_clr != -1) {
            for (ik = 0; ik < cnt; ik++) {
                ds_list_add(match_list, global.board_cols - 1 - ik);
                ds_list_add(match_list, iy);
            }
        }
    }

    // Вертикальні перевірки
    for (ix = 0; ix < global.board_cols; ix++) {
        cnt = 1;
        prev_clr = global.board[ix][0].color;
        for (iy = 1; iy < global.board_rows; iy++) {
            clr = global.board[ix][iy].color;
            if (clr == prev_clr && clr != -1) {
                cnt += 1;
            } else {
                if (cnt >= 3 && prev_clr != -1) {
                    for (ik = 0; ik < cnt; ik++) {
                        ds_list_add(match_list, ix);
                        ds_list_add(match_list, iy - 1 - ik);
                    }
                }
                cnt = 1;
            }
            prev_clr = clr;
        }
        if (cnt >= 3 && prev_clr != -1) {
            for (ik = 0; ik < cnt; ik++) {
                ds_list_add(match_list, ix);
                ds_list_add(match_list, global.board_rows - 1 - ik);
            }
        }
    }

    show_debug_message("find matches!")
    return match_list;
}