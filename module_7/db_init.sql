DROP USER IF EXISTS 'pysports_user'@'localhost';

CREATE USER 'pysports_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON pysports.* TO'pysports_user'@'localhost';

DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS team;

CREATE TABLE team (
    team_id     INT             NOT NULL        AUTO_INCREMENT,
    team_name   VARCHAR(75)     NOT NULL,
    mascot      VARCHAR(75)     NOT NULL,
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
    VALUES('Bellevue Hackers', 'Owl');

INSERT INTO team(team_name, mascot)
    VALUES('Bellevue Protectors', 'Knights');

INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Jane', 'Marie', (SELECT team_id FROM team WHERE team_name = 'Bellevue Hackers'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('John', 'Doe', (SELECT team_id FROM team WHERE team_name = 'Bellevue Hackers'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Bob', 'Clayton', (SELECT team_id FROM team WHERE team_name = 'Bellevue Hackers'));

INSERT INTO player(first_name, last_name, team_id) 
    VALUES('Myles', 'Yule', (SELECT team_id FROM team WHERE team_name = 'Bellevue Protectors'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Smith', 'Jones', (SELECT team_id FROM team WHERE team_name = 'Bellevue Protectors'));

INSERT INTO player(first_name, last_name, team_id)
    VALUES('Larry', 'Hugh', (SELECT team_id FROM team WHERE team_name = 'Bellevue Protectors'));
