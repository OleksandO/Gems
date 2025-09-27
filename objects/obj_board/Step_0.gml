// Головна логіка керування станами гри

switch (global.game_state)
{
    case global.GS_WAIT_INPUT:
        // Чекаємо на вибір/свайп гравця. Тут можна викликати скрипт/функцію, що обробляє введення.
        // Наприклад, якщо обробляєш клік по фішках, то саме тут перевіряй чи вибрано дві фішки, і якщо так — змінюй стан на SWAP.
        break;

    case global.GS_SWAP:
        // Анімація або логіка обміну фішками
        // Після завершення — global.game_state = global.GS_CHECK_MATCH;
        break;

    case global.GS_CHECK_MATCH:
        // Перевіряємо, чи є комбінації для видалення
        var matches = board_find_matches();
        if (ds_list_size(matches) > 0) {
            board_remove_matches(matches);
            global.game_state = global.GS_REMOVE;
        } else {
            // Якщо не було збігів — повертаємо фішки назад (реверс свап) або чекаємо нового ходу
            global.game_state = global.GS_WAIT_INPUT;
        }
        ds_list_destroy(matches);
        break;

    case global.GS_REMOVE:
        // Можна запустити анімацію зникнення, а після неї перейти до падіння фішок
        // Тут — одразу до падіння:
        global.game_state = global.GS_FALL;
        break;

    case global.GS_FALL:
        // Обробка падіння фішок (заповнення порожніх місць)
        // Якщо все впало — переходимо до поповнення
        global.game_state = global.GS_REFILL;
        break;

    case global.GS_REFILL:
        // Додаємо нові фішки на порожні місця
        // Після поповнення — повертаємося до CHECK_MATCH, бо можуть бути нові збіги!
        global.game_state = global.GS_CHECK_MATCH;
        break;

    case global.GS_PAUSE:
        // Тут можна зробити логіку для паузи, меню, тощо
        break;
}