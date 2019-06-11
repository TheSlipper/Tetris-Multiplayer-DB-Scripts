DROP SCHEMA IF EXISTS `TetrisMP`;

CREATE SCHEMA `TetrisMP`;

CREATE TABLE `TetrisMP`.`users` (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    user_password VARCHAR(90) NOT NULL,
    email VARCHAR(320) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TetrisMP`.`privilege_groups` (
	group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(90) NOT NULL,
    ban_usr_permission BOOL DEFAULT FALSE,
    post_news_permission BOOL DEFAULT FALSE,
    reset_usr_data_permission BOOL DEFAULT FALSE,
    server_log_in_permission BOOL DEFAULT FALSE
);

CREATE TABLE `TetrisMP`.`user_game_data` (
	user_data_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, -- TODO: Foreign key constraint
    privilege_group INT NOT NULL,
    tetromino_points LONG NOT NULL,
    time_played LONG NOT NULL,
    unranked_wins INT DEFAULT 0,
    unranked_losses INT DEFAULT 0,
    ranked_wins INT DEFAULT 0,
    ranked_losses INT DEFAULT 0,
    elo INT DEFAULT 800
);

CREATE TABLE `TetrisMP`.`friends` (
	friend_relation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id_one INT NOT NULL, -- TODO: Foreign key constraint
    user_id_two INT NOT NULL, -- TODO: Foreign key constraint
    invitation_confirmation BOOL -- If true - confirmed if not they're not friends
);

CREATE TABLE `TetrisMP`.`game_histories` (
	history_entry_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL, -- TODO: Foreign key constraint
    time_played INT NOT NULL DEFAULT 0,
    elo_difference INT NOT NULL,
    game_status BOOL, -- Win or loss
    ranked_or_not BOOL -- Ranked game or not
);

CREATE TABLE `TetrisMP`.`bans` (
	ban_id INT AUTO_INCREMENT PRIMARY KEY,
    banned_user_id INT NOT NULL, -- TODO: Foreign key constraint
    banned_date DATE NOT NULL,
    ban_expiration DATE NOT NULL,
    ban_reason VARCHAR(90) NOT NULL,
    bann_giver_id INT NOT NULL -- TODO: Foreign key constraint
);

CREATE TABLE `TetrisMP`.`update_logs` (
	update_log_id INT AUTO_INCREMENT PRIMARY KEY,
    update_log_header VARCHAR(300) NOT NULL,
    update_log_content TEXT NOT NULL,
    update_log_author INT NOT NULL,
    update_log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TetrisMP`.`login_attempts` (
	login_attempt_id INT AUTO_INCREMENT PRIMARY KEY,
	login_user_id INT NOT NULL,
	login_attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	login_attempt_status BOOL NOT NULL,
	login_attempt_os VARCHAR(100) NOT NULL,
	login_attempt_build VARCHAR(100) NOT NULL
);

USE `TetrisMP`;

-- ALTER TABLE `TetrisMP`.`user_game_data`ADD FOREIGN KEY (user_id) REFERENCES `TetrisMP`.`users`(user_id);

ALTER TABLE `TetrisMP`.`friends` ADD FOREIGN KEY (user_id_one) REFERENCES `TetrisMP`.`users`(user_id);

ALTER TABLE `TetrisMP`.`friends` ADD FOREIGN KEY (user_id_two) REFERENCES `TetrisMP`.`users`(user_id);

ALTER TABLE `TetrisMP`.`game_histories` ADD FOREIGN KEY (player_id) REFERENCES `TetrisMP`.`users`(user_id);

ALTER TABLE `TetrisMP`.`bans` ADD FOREIGN KEY (banned_user_id) REFERENCES `TetrisMP`.`users`(user_id);

-- ALTER TABLE `TetrisMP`.`user_game_data` ADD FOREIGN KEY (privilege_group) REFERENCES `TetrisMP`.`privilege_groups`(group_id);

ALTER TABLE `TetrisMP`.`update_logs` ADD FOREIGN KEY (update_log_author) REFERENCES `TetrisMP`.`users`(user_id);

ALTER TABLE `user_game_data` ADD CONSTRAINT `user_game_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `user_game_data` ADD CONSTRAINT `user_game_data_ibfk_2` FOREIGN KEY (`privilege_group`) REFERENCES `privilege_groups`(`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `bans` ADD CONSTRAINT `ban_giver_id_constraint` FOREIGN KEY (`bann_giver_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `login_attempts` ADD CONSTRAINT `login_user_id_constraint` FOREIGN KEY (`login_user_id`) REFERENCES `users`(`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

