global.pause = 0
menu_action = -1; //The item that has been chosen
menu_control = true; //Becomes false when an item has been chosen
menu_cursor = -1; //The item being hovered over on the menu
activator_pressed = 0;

menu[0] = "Resume Game";
menu[1] = "Reset Level";
if (global.debug = 1) menu[2] = "Debug: On"; else menu[2] = "Debug: Off";
if (global.music = 1) menu[3] = "Music: On"; else menu[3] = "Music: Off";
menu[4] = "Quit to Main Menu";

menu_items = array_length_1d(menu) //Returns amount of items

menu_distance = 96;
menu_start_height = (1080 - (menu_distance * menu_items))/2;
menu_end_height = (menu_start_height) + (menu_distance * menu_items)