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