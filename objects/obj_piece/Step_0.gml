// Синхронізація позиції з масивом
x = lerp(x, global.board_x + grid_x * global.cell_size, 0.2);
y = lerp(y, global.board_y + grid_y * global.cell_size, 0.2);
image_index = color_id;