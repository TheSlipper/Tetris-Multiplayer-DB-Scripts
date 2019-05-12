INSERT INTO `TetrisMP`.`users` VALUES (
	NULL,
    "slipper",
    "passwd",
    "korneldomeradzki1@gmail.com",
    NULL
);

INSERT INTO `TetrisMP`.`privilege_groups` VALUES (
	NULL,
    "administrator",
    TRUE,
    TRUE,
    TRUE,
    TRUE
);

INSERT INTO `TetrisMP`.`user_game_data` VALUES (
	NULL,
    1,
    1,
    5000, -- On default you start with only 5000 tetromino points
    0,
    0,
    0,
    0,
    0,
    800 -- On default you start with only 800 ELO
);

INSERT INTO `TetrisMP`.`update_logs` VALUES (
	NULL, 
    "Hello world! - Welcome to the indev version 0.0.1",
    "Welcome to the first version of Tetris Multiplayer! The game is still in very early stage of development so the game might not be fully optimized and it might have few bugs here and there so please do expect the unexpected! ;)",
	1,
    NULL
);