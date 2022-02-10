DROP TABLE Run IF EXISTS;
DROP TABLE Session IF EXISTS;
DROP TABLE User IF EXISTS;
DROP TABLE Game IF EXISTS;


CREATE TABLE User
(   username    VARCHAR(64) PRIMARY KEY,
    password    VARCHAR(64),
	keys		VARCHAR(3)
);

CREATE TABLE Session
(   sessionID    INTEGER PRIMARY KEY,
    sessionDate  DATE,
    username     VARCHAR(64),
    FOREIGN KEY (username) REFERENCES User (username)
    ON DELETE CASCADE
);

CREATE TABLE Run
(   runID     INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    runDate   DATE,
    score     INTEGER,
    sessionID INTEGER,
    FOREIGN KEY (sessionID) REFERENCES Session (sessionID)
    ON DELETE CASCADE
);

CREATE TABLE game
(   gameID    INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    version   VARCHAR(64),
    name      VARCHAR(64)
);