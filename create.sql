CREATE TABLE Player
(
  Player_id INT NOT NULL,
  Player_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (Player_id)
);

CREATE TABLE Club
(
  Club_id INT NOT NULL,
  Club_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (Club_id)
);

CREATE TABLE Matches
(
  Match_id INT NOT NULL,
  Match_date DATE NOT NULL,
--Тут написан зі зміною References, тому що вирішило питання двох зовнішних ключів на одну зміну
  Club_id_one INT REFERENCES Club(Club_id) NOT NULL,
  Clud_id_two INT REFERENCES Club(Club_id) NOT NULL,
  PRIMARY KEY (Match_id)
);

CREATE TABLE Contract
(
  Player_id INT NOT NULL,
  Club_id INT NOT NULL,
  Join_date DATE NOT NULL,
  Leave_date DATE NOT NULL,
  Position_primary VARCHAR(50) NOT NULL,
  PRIMARY KEY (Player_id, Club_id),
  FOREIGN KEY (Player_id) REFERENCES Player(Player_id),
  FOREIGN KEY (Club_id) REFERENCES Club(Club_id)
);

CREATE TABLE Match_player
(
  Match_id INT NOT NULL,
  Player_id INT NOT NULL,
  Goals INT NOT NULL,
  Assits INT NOT NULL,
  Saved INT NOT NULL,
  Fouls INT NOT NULL,
  Minutes_played INT NOT NULL,
  PRIMARY KEY (Player_id, Match_id),
  FOREIGN KEY (Player_id) REFERENCES Player(Player_id),
  FOREIGN KEY (Match_id) REFERENCES Matches(Match_id)
);