#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

global.up = vk_up;
global.right = vk_right;
global.down = vk_down;
global.left = vk_left;
global.attack = mb_left;
global.dash = vk_control;
global.shield = mb_right;
global.accept = vk_enter;

global.stock_input = [global.up, global.right, global.down, global.left, global.dash , global.accept];

global.max_health = 100;
global.health = global.max_health;

global.damage = 10;

global.boss_stat = [[0,0], [0,0], [0,0]]
global.boss_vaincu = 0;

global.retry = false;