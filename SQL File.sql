
CREATE DATABASE Soccer;


use Soccer;


CREATE TABLE league(
leagueID int primary key,
name varchar(50),
country varchar(25),
numOfTeams int
);


 CREATE TABLE `stadium` (
  `stadiumID` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `totCapacity` int(11) DEFAULT NULL,
  `yearFounded` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`stadiumID`)
) ;

CREATE TABLE referees(

refereeID int PRIMARY KEY,
fName varchar(25),
lName varchar(50),
DOB   varchar(40),
nationality varchar(50)
);

CREATE TABLE `player` ( `playerID` int(11) NOT NULL,  
`fName` varchar(25) DEFAULT NULL, 
`lName` varchar(50) DEFAULT NULL, 
`height` varchar(10) DEFAULT NULL, 
`weight` varchar(10) DEFAULT NULL,  
`DOB` varchar(25) DEFAULT NULL,  
`position` varchar(25) DEFAULT NULL,  
`teamID` int(11) DEFAULT NULL,  
PRIMARY KEY (`playerID`) 
)  ;

CREATE TABLE team ( 
teamID int(11) PRIMARY KEY, 
name varchar(25), 
league int(11),
captainID int(11), 
stadiumID int(11), 
FOREIGN KEY(league) references league(leagueID), 
FOREIGN KEY(captainID) references player(playerID),
FOREIGN KEY(stadiumID) references stadium(stadiumID)
); 



CREATE TABLE goals(
playerID int ,
goalTime varchar(25),
PRIMARY KEY(playerID, goalTime) 
);


CREATE TABLE matches(

matchID int primary key,
team1 int,
team2 int,
matchDate varchar(25),
matchScore varchar(25),
matchRef int, 
stadiumID int,
FOREIGN KEY(team1) references team(teamID),
FOREIGN KEY(team2) references team(teamID),
FOREIGN KEY(matchRef) references referees(refereeID),
FOREIGN KEY(stadiumID) references stadium(stadiumID)
);



CREATE TABLE `playersinmatch` (
  `matchID` int(11) NOT NULL ,
  `playerID` int(11) NOT NULL,
  PRIMARY KEY (`matchID`,`playerID`)
  );
  
 
CREATE TABLE `teamboard` (
  `teamID` int(11) NOT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  KEY `teamID` (`teamID`),
FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`)
) ;


alter table player 
add FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`)
