global.horizontal = (keyboard_check(vk_right)) - (keyboard_check(vk_left));
global.vertical = (keyboard_check(vk_down)) - (keyboard_check(vk_up));

global.jump = (keyboard_check_pressed(ord("A")));
global.jumpHold = (keyboard_check(ord("A")));

global.run = (keyboard_check(ord("S")));