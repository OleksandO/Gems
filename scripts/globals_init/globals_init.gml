/// @desc Глобальні налаштування та константи гри

function globals_init() {
    // Розмір поля
    global.board_cols    = 8;
    global.board_rows    = 8;
    global.cell_size     = 60;

    // Розміщення поля
    global.board_x       = 100;
    global.board_y       = 10;

    // Кількість кольорів, швидкість фішок, дозволи
    global.num_colors    = 8;
    global.fall_speed    = 10;
    global.input_enabled = true;

    // Стан гри (Game States)
    global.GS_WAIT_INPUT   = 0;
    global.GS_SWAP         = 1;
    global.GS_CHECK_MATCH  = 2;
    global.GS_REMOVE       = 3;
    global.GS_FALL         = 4;
    global.GS_REFILL       = 5;
    global.GS_PAUSE        = 6;

    global.game_state = global.GS_WAIT_INPUT;

    // Можна додати глобальні масиви для карт, мани, тощо:
    global.my_cards = array_create(4, -1); // Чотири карти гравця
    global.enemy_cards = array_create(4, -1); // Чотири карти супротивника
    global.mana = array_create(global.num_colors, 0); // Мана за кольорами

    // Для мульти-тача
    global.max_touches = 5;
    global.touches = array_create(global.max_touches, -1);
}