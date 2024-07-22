CREATE TABLE Video_game_players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100),
    last_played DATE
);

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    game_name VARCHAR(100)
);

CREATE TABLE pla_games (
    player_id INT,
    game_id INT,
    score INT,
    play_date DATE,
    FOREIGN KEY (player_id) REFERENCES Video_game_players (player_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    PRIMARY KEY (player_id, game_id)
);

CREATE TRIGGER update_last_played
AFTER INSERT ON pla_games
FOR EACH ROW
begin
    UPDATE players
    SET last_played = NEW.play_date
    WHERE player_id = NEW.player_id;
END;

INSERT INTO Video_game_players (player_id, player_name) VALUES (1, 'JAY');
INSERT INTO games (game_id, game_name) VALUES (1, 'Yash');


INSERT INTO pla_games (player_id, game_id, score, play_date) VALUES (1, 1, 100, '2024-07-22');


SELECT * FROM pla_games WHERE player_id = 1;



