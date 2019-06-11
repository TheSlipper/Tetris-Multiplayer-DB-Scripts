USE `TetrisMP`;

INSERT INTO `TetrisMP`.`users` VALUES (
NULL,
 "slipper",
 "passwd",
 "korneldomeradzki1@gmail.com",
 NULL
);


INSERT INTO `TetrisMP`.`users` VALUES (NULL,
 "root",
 "root",
 "root@root.root",
 NULL
);


INSERT INTO `privilege_groups` (`group_id`, `group_name`, `ban_usr_permission`, `post_news_permission`, `reset_usr_data_permission`, `server_log_in_permission`) VALUES (NULL, 'normal_user', '0', '0', '0', '0');
INSERT INTO `TetrisMP`.`privilege_groups` VALUES (NULL,
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
 5000, 0,
 0,
 0,
 0,
 0,
 800);


INSERT INTO `TetrisMP`.`user_game_data` VALUES (NULL,
 2,
 2,
 5000, 0, 0,
 0,
 0,
 0,
 800);


INSERT INTO `TetrisMP`.`update_logs` VALUES (NULL, "Hello world! - Welcome to the indev version 0.0.1",
 "Welcome to the first version of Tetris Multiplayer! The game is still in very early stage of development so the game might not be fully optimized and it might have few bugs here and there so please do expect the unexpected! ;)", 1,
 NULL
);

INSERT INTO `update_logs` (`update_log_id`, `update_log_header`, `update_log_content`, `update_log_author`, `update_log_date`) VALUES (NULL, 'Friends are coming here! - indev 0.0.2', 'We are currently working on implementing a friend system so that you can see what all of your tetris friends are up to at the very moment! Stay tuned on twitter to hear more about the update - @PolishedSliper', '1', CURRENT_TIMESTAMP)