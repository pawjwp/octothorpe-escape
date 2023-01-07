menu_action = -1; //The item that has been chosen
menu_control = true; //Becomes false when an item has been chosen
menu_cursor = -1; //The item being hovered over on the menu
activator_pressed = 0;

if (global.finishedlevels = 0) menu[0] = "New Game"; else menu[0] = "Resume Game";
menu[1] = "Level Select";
menu[2] = "Settings";
menu[3] = "Quit Game";

menu_items = array_length_1d(menu) //Returns amount of items

menu_distance = 96;
menu_start_height = (1080 - (menu_distance * menu_items))/2;
menu_end_height = (menu_start_height) + (menu_distance * menu_items)
newwall = 0;