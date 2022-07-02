-- drop test user if exists 
DROP USER IF EXISTS 'pysports_user'@'localhost';

-- create pysports_user and grant them all privileges to the pysports database 
CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';



-- grant all privileges to the pysports database to user pysports_user on localhost 
GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';


-- drop tables if they are present
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;



CREATE TABLE team (
    team_id     INT             NOT NULL        AUTO_INCREMENT,
    team_name   varchar(75)     NOT NULL,
    mascot      varchar(75)     NOT NULL,
    PRIMARY KEY(team_id)
); 

CREATE TABLE player (
    player_id   INT             NOT NULL        AUTO_INCREMENT,
    first_name  VARCHAR(75)     NOT NULL,
    last_name   VARCHAR(75)     NOT NULL,
    team_id     INT             NOT NULL,
    PRIMARY KEY(player_id),
    CONSTRAINT fk_team 
    FOREIGN KEY(team_id)
        REFERENCES team(team_id)
);

INSERT INTO team(team_name, mascot)
    VALUES('Ball Hogs', 'Hoggy');

INSERT INTO team(team_name, mascot)
    VALUES('Best Hitters', 'Blaster');
    
INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Mike', 'Jones', (SELECT team_id FROM team WHERE team_name = 'Ball Hogs'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('John', 'Hunt', (SELECT team_id FROM team WHERE team_name = 'Ball Hogs'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Fred', 'Force', (SELECT team_id FROM team WHERE team_name = 'Ball Hogs'));

INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Mark', 'White', (SELECT team_id FROM team WHERE team_name = 'Best Hitters'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Philip', 'Smacks', (SELECT team_id FROM team WHERE team_name = 'Best Hitters'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Steve', 'Crush', (SELECT team_id FROM team WHERE team_name = 'Best Hitters'));