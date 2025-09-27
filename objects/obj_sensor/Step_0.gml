for (var i = 0; i < global.max_touches; i++) {
    if (device_mouse_check_button_pressed(i, mb_left)) {
        var mx = device_mouse_x(i);
        var my = device_mouse_y(i);
        var gx = floor((mx - global.board_x) / global.cell_size);
        var gy = floor((my - global.board_y) / global.cell_size);
        if (gx >= 0 && gx < global.board_cols && gy >= 0 && gy < global.board_rows) {
            // Зберігаємо початкову точку торкання
            global.touches[i] = { start_x: gx, start_y: gy, dragging: true };
        }
    }
    if (global.touches[i] != -1 && device_mouse_check_button_released(i, mb_left)) {
        var mx = device_mouse_x(i);
        var my = device_mouse_y(i);
        var gx = floor((mx - global.board_x) / global.cell_size);
        var gy = floor((my - global.board_y) / global.cell_size);
        var start_x = global.touches[i].start_x;
        var start_y = global.touches[i].start_y;
        // Перевірка на сусідню клітинку
        var dx = abs(gx - start_x);
        var dy = abs(gy - start_y);
        if ((dx == 1 && dy == 0) || (dx == 0 && dy == 1)) {
            board_swap(start_x, start_y, gx, gy);
        }
        global.touches[i] = -1;
    }
}