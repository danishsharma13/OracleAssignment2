-- ***********************
-- Name: Danish Sharma, Umesh Dharmendra Chaudhari, Yash Yadav
-- ID: 148201205, 114811201, 116431206
-- Group: 5
-- Date: December 08, 2021
-- Purpose: Assignment 2 DBS311
-- ***********************

SET SERVEROUTPUT ON;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 Players
-- Danish Sharma: Players Insert
-- Note for all error handling: Could have used pId IN OUT but we 
-- wanted to split Input and Output for error handling.
CREATE OR REPLACE PROCEDURE spPlayersInsert (
    pId IN players.playerId%type,
    rNum IN players.regNumber%type,
    lName IN players.lastName%type,
    fName IN players.firstName%type,
    isAct IN players.isActive%type,
    pErr OUT players.playerId%type
    ) AS
BEGIN
    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        INSERT INTO players
            VALUES (pId, rNum, lName, fName, isAct);
    ELSE
        -- -3 No rows inserted
        pErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        pErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        pErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            pErr := -1;
    WHEN OTHERS
        THEN
            pErr := -2;
END spPlayersInsert;

-- Danish Sharma: Player Update
CREATE OR REPLACE PROCEDURE spPlayersUpdate (
    pId IN players.playerId%type,
    rNum IN players.regNumber%type,
    lName IN players.lastName%type,
    fName IN players.firstName%type,
    isAct IN players.isActive%type,
    pErr OUT players.playerId%type
    ) AS
BEGIN

    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        UPDATE players 
        SET regNumber = rNum,
            lastName = lName,
            firstName = fName,
            isActive = isAct
        WHERE playerId = pId;
    ELSE
        -- -3 No rows updated
        pErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row updated
        pErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows updated
        pErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            pErr := -1;
    WHEN OTHERS
        THEN
            pErr := -2;
END spPlayersUpdate;

-- Danish Sharma: Player Delete
CREATE OR REPLACE PROCEDURE spPlayersDelete (
    pId IN players.playerId%type,
    pErr OUT players.playerId%type
    ) AS
BEGIN
    DELETE FROM players
    WHERE playerId = pId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        pErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No row deleted
        pErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            pErr := -1;
    WHEN OTHERS
        THEN
            pErr := -2;
END spPlayersDelete;

-- Danish Sharma: Player Select
CREATE OR REPLACE PROCEDURE spPlayersSelect (
    pId IN players.playerId%type,
    rNum OUT players.regNumber%type,
    lName OUT players.lastName%type,
    fName OUT players.firstName%type,
    isAct OUT players.isActive%type,
    pErr OUT players.playerId%type
    ) AS
BEGIN
    SELECT
        regNumber,
        lastName,
        firstname,
        isActive
    INTO
        rNum,
        lName,
        fName,
        isAct
    FROM players
    WHERE playerId = pId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        pErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            pErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            pErr := -2;
    WHEN OTHERS
        THEN
            pErr := -3;
END spPlayersSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 slLocations
-- Danish Sharma: slLocations Insert
CREATE OR REPLACE PROCEDURE spSlLocationsInsert (
    lId IN slLocations.locationId%type,
    locName IN slLocations.locationName%type,
    lField IN sllocations.fieldlength%type,
    isAct IN sllocations.isactive%type,
    lErr OUT slLocations.locationId%type
    ) AS
BEGIN

    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        INSERT INTO sllocations
            VALUES (lId, locName, lField, isAct);
    ELSE
        -- -3 No rows inserted
        lErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        lErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        lErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            lErr := -1;
    WHEN OTHERS
        THEN
            lErr := -2;
END spSlLocationsInsert;

-- Danish Sharma: slLocations Update
CREATE OR REPLACE PROCEDURE spSlLocationsUpdate (
    lId IN slLocations.locationId%type,
    locName IN slLocations.locationName%type,
    lField IN sllocations.fieldlength%type,
    isAct IN sllocations.isactive%type,
    lErr OUT slLocations.locationId%type
    ) AS
BEGIN

    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        UPDATE slLocations 
        SET locationName = locName,
            fieldlength = lField,
            isActive = isAct
        WHERE locationId = lId;
    ELSE
        -- -3 No rows updated
        lErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row updated
        lErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows updated
        lErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            lErr := -1;
    WHEN OTHERS
        THEN
            lErr := -2;
END spSlLocationsUpdate;

-- Danish Sharma: slLocations Delete
CREATE OR REPLACE PROCEDURE spSlLocationsDelete (
    lId IN slLocations.locationId%type,
    lErr OUT slLocations.locationId%type
    ) AS
BEGIN

    DELETE FROM slLocations
    WHERE locationId = lId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        lErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows deleted
        lErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            lErr := -1;
    WHEN OTHERS
        THEN
            lErr := -2;
END spSlLocationsDelete;

-- Danish Sharma: slLocations Select
CREATE OR REPLACE PROCEDURE spSlLocationsSelect (
    lId IN slLocations.locationId%type,
    locName OUT slLocations.locationName%type,
    lField OUT sllocations.fieldLength%type,
    isAct OUT sllocations.isActive%type,
    lErr OUT slLocations.locationId%type
    ) AS
BEGIN
    SELECT
        locationName,
        fieldLength,
        isActive
    INTO
        locName,
        lField,
        isAct
    FROM slLocations
    WHERE locationId = lId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        lErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            lErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            lErr := -2;
    WHEN OTHERS
        THEN
            lErr := -3;
END spSlLocationsSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 GoalScorers
-- Umesh: GoalScorers Insert
CREATE OR REPLACE PROCEDURE spGoalScorersInsert (
    gId IN goalScorers.goalId%type,
    gmId IN goalScorers.gameId%type,
    pId IN goalScorers.playerId%type,
    tId IN goalScorers.teamId%type,
    numG IN goalScorers.numgoals%type,
    numAss IN goalScorers.numassists%type,
    gsErr OUT goalScorers.goalId%type
    ) AS
BEGIN
    INSERT INTO goalScorers
        VALUES (gId, gmId, pId, tId, numG, numAss);
            
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        IF gId IS NULL THEN
            SELECT goalId
            INTO gsErr
            FROM goalScorers
            WHERE goalId = (    SELECT Max(goalId)
                                FROM goalScorers);
        ELSE
            gsErr := 0;
        END IF;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        gsErr := -3;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            gsErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            gsErr := -2;
    WHEN VALUE_ERROR
        THEN
            gsErr := -4;
    WHEN OTHERS
        THEN
            gsErr := -5;
END spGoalScorersInsert;

-- Umesh: GoalScorers Update
CREATE OR REPLACE PROCEDURE spGoalScorersUpdate (
    gId IN goalScorers.goalId%type,
    gmId IN goalScorers.gameId%type,
    pId IN goalScorers.playerId%type,
    tId IN goalScorers.teamId%type,
    numG IN goalScorers.numgoals%type,
    numAss IN goalScorers.numassists%type,
    gsErr OUT goalScorers.goalId%type
    ) AS
BEGIN
        UPDATE GoalScorers 
        SET 
            gameId = gmId,
            playerId = pId,
            teamId = tId,
            numgoals = numG,
            numassists = numAss
        WHERE goalId = gId;
          
          
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        gsErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        gsErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            gsErr := -1;
    WHEN OTHERS
        THEN
            gsErr := -2;
END spGoalScorersUpdate;

-- Umesh: GoalScorers Delete
CREATE OR REPLACE PROCEDURE spGoalScorersDelete (
    gId IN goalScorers.goalId%type,
    gsErr OUT goalScorers.goalId%type
    ) AS
BEGIN
    DELETE FROM GoalScorers
    WHERE goalId = gId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        gsErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No row deleted
        gsErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            gsErr := -1;
    WHEN OTHERS
        THEN
            gsErr := -2;
END spGoalScorersDelete;

-- Umesh : GoalScorers Select
CREATE OR REPLACE PROCEDURE spGoalScorersSelect (
    gId IN goalScorers.goalId%type,
    gmId OUT goalScorers.gameId%type,
    pId OUT goalScorers.playerId%type,
    tId OUT goalScorers.teamId%type,
    numG OUT goalScorers.numgoals%type,
    numAss OUT goalScorers.numassists%type,
    gsErr OUT goalScorers.goalId%type
    ) AS
BEGIN
    SELECT
        gameId,
        playerId,
        teamId,
        numgoals,
        numassists
    INTO
        gmId,
        pId,
        tId,
        numG,
        numAss
    FROM goalScorers
    WHERE goalId = gId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        gsErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            gsErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            gsErr := -2;
    WHEN OTHERS
        THEN
            gsErr := -3;
END spGoalScorersSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 Rosters
-- Umesh: Rosters Insert
CREATE OR REPLACE PROCEDURE spRostersInsert (
    rId IN rosters.rosterId%type,
    pId IN rosters.playerId%type,
    tId IN rosters.teamId%type,
    isAct IN rosters.isActive%type,
    jrNum IN rosters.jerseyNumber%type,
    rsErr OUT rosters.rosterId%type
    ) AS
BEGIN
    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        INSERT INTO rosters
            VALUES (rId, pId, tId, isAct, jrNum);
    ELSE
        -- -3 No rows inserted
        rsErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        IF rId IS NULL THEN
            SELECT rosterId
            INTO rsErr
            FROM rosters
            WHERE rosterId = (  SELECT Max(rosterId)
                                FROM rosters);
        ELSE
            rsErr := 0;
        END IF;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        rsErr := -3;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            rsErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            rsErr := -2;
    WHEN VALUE_ERROR
        THEN
            rsErr := -4;
    WHEN OTHERS
        THEN
            rsErr := -5;
END spRostersInsert;

-- Umesh: Rosters Update
CREATE OR REPLACE PROCEDURE spRostersUpdate (
    rId IN rosters.rosterId%type,
    pId IN rosters.playerId%type,
    tId IN rosters.teamId%type,
    isAct IN rosters.isActive%type,
    jrNum IN rosters.jerseyNumber%type,
    rsErr OUT rosters.rosterId%type
    ) AS
BEGIN

    IF isAct = 1 OR isAct = 0 OR isAct = NULL THEN
        UPDATE rosters 
        SET playerId = pId,
            teamId = tId,
            isActive = isAct,
            jerseyNumber = jrNum 
        WHERE rosterId = rId;
    ELSE
        -- -3 No rows updated
        rsErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row updated
        rsErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows updated
        rsErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            rsErr := -1;
    WHEN OTHERS
        THEN
            rsErr := -2;
END spRostersUpdate;

-- Umesh: Rosters Delete
CREATE OR REPLACE PROCEDURE spRostersDelete (
    rId IN rosters.rosterId%type,
    rsErr OUT rosters.rosterId%type
    ) AS
BEGIN
    DELETE FROM rosters
    WHERE rosterId = rId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        rsErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No row deleted
        rsErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            rsErr := -1;
    WHEN OTHERS
        THEN
            rsErr := -2;
END spRostersDelete;

-- Umesh: Rosters Select
CREATE OR REPLACE PROCEDURE spRostersSelect (
    rId IN rosters.rosterId%type,
    pId OUT rosters.playerId%type,
    tId OUT rosters.teamId%type,
    isAct OUT rosters.isActive%type,
    jrNum OUT rosters.jerseyNumber%type,
    rsErr OUT rosters.rosterId%type
    ) AS
BEGIN
    SELECT
        playerId,
        teamId,
        isActive,
        jerseyNumber
    INTO
        pId,
        tId,
        isAct,
        jrNum
    FROM rosters
    WHERE rosterId = rId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        rsErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            rsErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            rsErr := -2;
    WHEN OTHERS
        THEN
            rsErr := -3;
END spRostersSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 Games
-- Yash Yadav: Games Insert
CREATE OR REPLACE PROCEDURE spGamesInsert (
    gId IN games.gameId%type,
    dId IN games.divId%type,
    gNum IN games.gameNum%type,
    gDateTime IN games.gameDateTime%type,
    gHTeam IN games.homeTeam%type,
    gHScore IN games.homeScore%type,
    gVTeam IN games.visitTeam%type,
    gVScore IN games.visitScore%type,
    gLocationId IN games.locationId%type,
    gisPlayed IN games.isPlayed%type,
    gNotes IN games.Notes%type,
    gErr OUT games.gameId%type
    ) AS
BEGIN
    IF gisPlayed = 1 OR gisPlayed = 0 OR gisplayed = NULL THEN
        INSERT INTO games
            VALUES (gId,dId, gNum, gDateTime, gHTeam, gHScore, gVScore, gVTeam,gLocationId, gisPlayed, gNotes);
    ELSE
        -- -3 No rows inserted
        gErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        IF gId IS NULL THEN
            SELECT gameId
            INTO gErr
            FROM games
            WHERE gameId = (    SELECT Max(gameId)
                                FROM games);
        ELSE
            gErr := 0;
        END IF;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        gErr := -3;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            gErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            gErr := -2;
    WHEN VALUE_ERROR
        THEN
            gErr := -4;
    WHEN OTHERS
        THEN
            gErr := -5;
END spGamesInsert;

-- Yash Yadav: Games Update
CREATE OR REPLACE PROCEDURE spGamesUpdate (
    gId IN games.gameId%type,
    dId IN games.divId%type,
    gNum IN games.gameNum%type,
    gDateTime IN games.gameDateTime%type,
    gHTeam IN games.homeTeam%type,
    gHScore IN games.homeScore%type,
    gVTeam IN games.visitTeam%type,
    gVScore IN games.visitScore%type,
    gLocationId IN games.locationId%type,
    gisPlayed IN games.isPlayed%type,
    gNotes IN games.Notes%type,
    gErr OUT games.gameId%type
    ) AS
BEGIN

    IF gisPlayed = 1 OR gisPlayed = 0 OR gisPlayed = NULL THEN
        UPDATE games 
        SET
            divId = dId,
            gameNum = gNum,
            gamedateTime = gDateTime,
            homeTeam = gHTeam,
            homeScore = gHScore,
            VisitTeam = gVTeam,
            VisitScore = gVScore,
            LocationId = gLocationId,
            isPlayed = gisPlayed,
            Notes = gNotes

        WHERE gameId = gId;
    ELSE
        -- -3 No rows updated
        gErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row updated
        gErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows updated
        gErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            gErr := -1;
    WHEN OTHERS
        THEN
            gErr := -2;
END spGamesUpdate;

-- Yash Yadav: Games Delete
CREATE OR REPLACE PROCEDURE spGamesDelete (
    gId IN games.gameId%type,
    gErr OUT games.gameId%type
    ) AS
BEGIN
    DELETE FROM games
    WHERE gameId = gId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        gErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No row deleted
        gErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            gErr := -1;
    WHEN OTHERS
        THEN
            gErr := -2;
END spGamesDelete;

-- Yash Yadav: Games Select
CREATE OR REPLACE PROCEDURE spGamesSelect (
    gId IN games.gameId%type,
    dId OUT games.divId%type,
    gNum OUT games.gameNum%type,
    gDateTime OUT games.gameDateTime%type,
    gHTeam OUT games.homeTeam%type,
    gHScore OUT games.homeScore%type,
    gVTeam OUT games.visitTeam%type,
    gVScore OUT games.visitScore%type,
    gLocationId OUT games.locationId%type,
    gisPlayed OUT games.isPlayed%type,
    gNotes OUT games.Notes%type,
    gErr OUT games.gameId%type
    ) AS
BEGIN
    SELECT
        DivId,
        GameNum,
        gameDateTime,
        HomeTeam,
        HomeScore,
        VisitTeam,
        VisitScore,
        LocationId,
        IsPlayed,
        Notes
    INTO
        dId,
        gNum,
        gDateTime,
        gHTeam,
        gHScore,
        gVTeam,
        gVScore,
        glocationId,
        gIsPlayed,
        gNotes
    FROM games
    WHERE gameId = gId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        gErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            gErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            gErr := -2;
    WHEN OTHERS
        THEN
            gErr := -3;
END spGamesSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 1 Teams
-- Yash Yadav: Teams Insert
CREATE OR REPLACE PROCEDURE spTeamsInsert (
    tId IN teams.teamId%type,
    tName IN teams.teamName%type,
    tisAct IN teams.isActive%type,
    tJersey IN teams.jerseyColour%type,
    tErr OUT teams.teamId%type
    ) AS
BEGIN
    IF tisAct = 1 OR tisAct = 0 OR tisAct = NULL THEN
        INSERT INTO teams
            VALUES (tId, tName, tisAct, tJersey);
    ELSE
        -- -3 No rows inserted
        tErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row inserted
        tErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows inserted
        tErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            tErr := -1;
    WHEN OTHERS
        THEN
            tErr := -2;
END spTeamsInsert;

-- Yash Yadav: Teams Update
CREATE OR REPLACE PROCEDURE spTeamsUpdate (
    tId IN teams.teamId%type,
    tName IN teams.teamName%type,
    tisAct IN teams.isActive%type,
    tJersey IN teams.jerseyColour%type,
    tErr OUT teams.teamId%type
    ) AS
BEGIN

    IF tisAct = 1 OR tisAct = 0 OR tisAct = NULL THEN
        UPDATE teams 
        SET
            teamName = tName,
            isActive = tisAct,
            jerseyColour = tJersey
        WHERE teamId = tId;
    ELSE
        -- -3 No rows updated
        tErr := -3;
    END IF;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row updated
        tErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No rows updated
        tErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            tErr := -1;
    WHEN OTHERS
        THEN
            tErr := -2;
END spTeamsUpdate;

-- Yash Yadav: Teams Delete
CREATE OR REPLACE PROCEDURE spTeamsDelete (
    tId IN teams.teamId%type,
    tErr OUT teams.teamId%type
    ) AS
BEGIN
    DELETE FROM teams
    WHERE teamId = tId;
    
    IF SQL%ROWCOUNT = 1 THEN
        COMMIT;
        -- 1 row deleted
        tErr := 1;
    ELSE
        ROLLBACK;
        -- -3 No row deleted
        tErr := -3;
    END IF;
    
EXCEPTION
    WHEN VALUE_ERROR
        THEN
            tErr := -1;
    WHEN OTHERS
        THEN
            tErr := -2;
END spTeamsDelete;

-- Yash Yadav: Teams Select
CREATE OR REPLACE PROCEDURE spTeamsSelect (
    tId IN teams.teamId%type,
    tName OUT teams.teamName%type,
    tisAct OUT teams.isActive%type,
    tJersey OUT teams.jerseyColour%type,
    tErr OUT teams.teamId%type
    ) AS
BEGIN
    SELECT
        TeamName,
        JerseyColour,
        isActive
    INTO
        tName,
        tisAct,
        tJersey
    FROM teams
    WHERE teamId = tId;
    
    IF SQL%ROWCOUNT = 1 THEN
        -- 1 row selected
        tErr := 1;
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            tErr := -1;
    WHEN TOO_MANY_ROWS
        THEN
            tErr := -2;
    WHEN OTHERS
        THEN
            tErr := -3;
END spTeamsSelect;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 2
-- Umesh: Games Output
CREATE OR REPLACE PROCEDURE spGamesOutput AS
  CURSOR gameRow IS
    SELECT *
    FROM games;
  
  gamesRow games%rowType;
  bool INT := 0;
  
BEGIN
  OPEN gameRow;
  LOOP
    FETCH gameRow 
    INTO gamesRow;
    
    IF gameRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('Game ID: ' || gamesRow.gameId);
        DBMS_OUTPUT.PUT_LINE('    Div ID: ' || gamesRow.divId);
        DBMS_OUTPUT.PUT_LINE('    Game Num: ' || gamesRow.gameNum);
        DBMS_OUTPUT.PUT_LINE('    Date Time: ' || gamesRow.gameDateTime);
        DBMS_OUTPUT.PUT_LINE('    Home Team: ' || gamesRow.homeTeam);
        DBMS_OUTPUT.PUT_LINE('    Home Score: ' || gamesRow.homeScore);
        DBMS_OUTPUT.PUT_LINE('    Visit Team: ' || gamesRow.visitTeam);
        DBMS_OUTPUT.PUT_LINE('    Visit Score: ' || gamesRow.visitScore);
        DBMS_OUTPUT.PUT_LINE('    Location ID: ' || gamesRow.locationId);
        DBMS_OUTPUT.PUT_LINE('    Is Played: ' || gamesRow.isPlayed);
        DBMS_OUTPUT.PUT_LINE('    Notes: ' || gamesRow.notes);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spGamesOutput;

-- Umesh: Players Output
CREATE OR REPLACE PROCEDURE spPlayersOutput AS

  CURSOR playerRow IS
    SELECT *
    FROM players;
  
  playersRow players%rowType;
  bool INT := 0;
  
BEGIN
  OPEN playerRow;
  LOOP
    FETCH playerRow 
    INTO playersRow;
    
    IF playerRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('player ID: ' || playersRow.playerId);
        DBMS_OUTPUT.PUT_LINE('    Reg Num: ' || playersRow.regNumber);
        DBMS_OUTPUT.PUT_LINE('    Last Name: ' || playersRow.lastName);
        DBMS_OUTPUT.PUT_LINE('    FIrst Name: ' || playersRow.firstName);
        DBMS_OUTPUT.PUT_LINE('    Is Active: ' || playersRow.isActive);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spPlayersOutput;

-- Umesh: Teams
CREATE OR REPLACE PROCEDURE spTeamsOutput AS

  CURSOR teamRow IS
    SELECT *
    FROM teams;
  
  teamsRow teams%rowType;
  bool INT := 0;
  
BEGIN
  OPEN teamRow;
  LOOP
    FETCH teamRow 
    INTO teamsRow;
    
    IF teamRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('Team ID: ' || teamsRow.teamId);
        DBMS_OUTPUT.PUT_LINE('    Team Name: ' || teamsRow.teamName);
        DBMS_OUTPUT.PUT_LINE('    Is Active: ' || teamsRow.isActive);
        DBMS_OUTPUT.PUT_LINE('    Jersey Colour: ' || teamsRow.jerseyColour);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spTeamsOutput;

-- Umesh: GoalScorers
CREATE OR REPLACE PROCEDURE spGoalScorersOutput AS

  CURSOR goalScorerRow IS
    SELECT *
    FROM goalScorers;
  
  goalRow goalScorers%rowType;
  bool INT := 0;
  
BEGIN
  OPEN goalScorerRow;
  LOOP
    FETCH goalScorerRow 
    INTO goalRow;
    
    IF goalScorerRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('Goal ID: ' || goalRow.goalId);
        DBMS_OUTPUT.PUT_LINE('    Game ID: ' || goalRow.gameId);
        DBMS_OUTPUT.PUT_LINE('    Player ID: ' || goalRow.playerId);
        DBMS_OUTPUT.PUT_LINE('    Team ID: ' || goalRow.teamId);
        DBMS_OUTPUT.PUT_LINE('    Number Goals: ' || goalRow.numGoals);
        DBMS_OUTPUT.PUT_LINE('    Number Assists: ' || goalRow.numAssists);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
    WHEN OTHERS
      THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spGoalScorersOutput;

-- Umesh: Rosters
CREATE OR REPLACE PROCEDURE spRosterOutput AS

  CURSOR rostersRow IS
    SELECT *
    FROM rosters;
  
  rostRow rosters%rowType;
  bool INT := 0;
  
BEGIN
  OPEN rostersRow;
  LOOP
    FETCH rostersRow 
    INTO rostRow;
    
    IF rostersRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('Roster ID: ' || rostRow.rosterId);
        DBMS_OUTPUT.PUT_LINE('    Player ID: ' || rostRow.playerId);
        DBMS_OUTPUT.PUT_LINE('    Team ID: ' || rostRow.teamId);
        DBMS_OUTPUT.PUT_LINE('    Is Active: ' || rostRow.isActive);
        DBMS_OUTPUT.PUT_LINE('    Jersey Number: ' || rostRow.jerseyNumber);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spRosterOutput;

-- Umesh: SlLocations
CREATE OR REPLACE PROCEDURE spSlLocationsOutput AS

  CURSOR slLocationRow IS
    SELECT *
    FROM slLocations;
  
  slLocationsRow slLocations%rowType;
  bool INT := 0;
  
BEGIN
  OPEN slLocationRow;
  LOOP
    FETCH slLocationRow 
    INTO slLocationsRow;
    
    IF slLocationRow%NOTFOUND THEN
      IF bool = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
      END IF;
      EXIT;
    ELSE
        bool := 1;
        DBMS_OUTPUT.PUT_LINE('Location ID: ' || slLocationsRow.locationId);
        DBMS_OUTPUT.PUT_LINE('    Location Name: ' || slLocationsRow.locationName);
        DBMS_OUTPUT.PUT_LINE('    Field Length: ' || slLocationsRow.fieldLength);
        DBMS_OUTPUT.PUT_LINE('    Is Active: ' || slLocationsRow.isActive);
    END IF;
  
  END LOOP;
  
EXCEPTION
  WHEN ROWTYPE_MISMATCH
    THEN
      DBMS_OUTPUT.PUT_LINE('ERROR:  Row type mismatch');
WHEN OTHERS
  THEN
    DBMS_OUTPUT.PUT_LINE('ERROR: Other!');
END spSlLocationsOutput;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 3
-- Yash Yadav: vwPlayerRosters
CREATE OR REPLACE VIEW vwPlayerRosters  AS
    SELECT
        r.rosterId,
        r.isActive AS rIsActive,
        r.jerseyNumber,
        p.playerId,
        p.regNumber,
        p.lastName,
        p.firstName,
        p.isActive AS pIsActive,
        t.teamId,
        t.teamName,
        t.isActive AS tIsActive,
        t.jerseyColour
    FROM 
        rosters r JOIN players p
        ON r.playerId = p.playerId
        JOIN teams t
        ON r.teamId = t.teamId;

-- Task 4
-- Danish Sharma: spTeamRosterByID
CREATE OR REPLACE PROCEDURE spTeamRosterByID (
    tId IN teams.teamId%type
    ) AS
    CURSOR teamRoster IS
        SELECT *
        FROM vwPlayerRosters
        WHERE teamId = tId
        ORDER BY 
            lastName, 
            firstname;

    tRoster vwPlayerRosters%rowtype;
    bool NUMBER := 0;
    act VARCHAR(5) := 'No';
BEGIN
    OPEN teamRoster;
    
    LOOP
        act := 'No';
        FETCH teamRoster
        INTO tRoster;
        
        IF teamRoster%NOTFOUND THEN
            IF bool = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No data found!');
            END IF;
            EXIT;
        ELSE
            bool := 1;
    
            IF tRoster.rIsActive = 1 THEN
                act := 'Yes';
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('Player ID: ' || tRoster.playerId);
            DBMS_OUTPUT.PUT_LINE('    Name: ' || tRoster.firstName || ' ' || 
                tRoster.lastName);
            DBMS_OUTPUT.PUT_LINE('    Team: ' || tRoster.teamName);
            DBMS_OUTPUT.PUT_LINE('    Jersey#: ' || tRoster.jerseyNumber);
            DBMS_OUTPUT.PUT_LINE('    Active: ' || act);
        END IF;
    END LOOP;
    
EXCEPTION
    WHEN ROWTYPE_MISMATCH 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Rowtype mismatch!');
    WHEN OTHERS 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Others!');
END spTeamRosterByID;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 5
-- Danish Sharma: spTeamRosterByName
CREATE OR REPLACE PROCEDURE spTeamRosterByName (
    tName IN teams.teamName%type
    ) AS
    CURSOR teamRoster IS
        SELECT *
        FROM vwPlayerRosters
        WHERE Lower(teamName) LIKE Lower('%' || tName || '%')
        ORDER BY 
            lastName, 
            firstname;

    tRoster vwPlayerRosters%rowtype;
    bool NUMBER := 0;
    act VARCHAR(5) := 'No';
BEGIN
    OPEN teamRoster;
    
    LOOP
        act := 'No';
        FETCH teamRoster
        INTO tRoster;
        
        IF teamRoster%NOTFOUND THEN
            IF bool = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No data found!');
            END IF;
            EXIT;
        ELSE
            bool := 1;
            
            -- Check with Frosty about the alias used for isActive
            IF tRoster.risActive = 1 THEN
                act := 'Yes';
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('Player ID: ' || tRoster.playerId);
            DBMS_OUTPUT.PUT_LINE('    Name: ' || tRoster.firstName || ' ' || 
                tRoster.lastName);
            DBMS_OUTPUT.PUT_LINE('    Team: ' || tRoster.teamName);
            DBMS_OUTPUT.PUT_LINE('    Jersey#: ' || tRoster.jerseyNumber);
            DBMS_OUTPUT.PUT_LINE('    Active: ' || act);
        END IF;
    END LOOP;
    
EXCEPTION
    WHEN ROWTYPE_MISMATCH 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Rowtype mismatch!');
    WHEN OTHERS 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Others!');
END spTeamRosterByName;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 6
-- Yash Yadav: vwTeamsNumPlayers
CREATE OR REPLACE VIEW vwTeamsNumPlayers AS
    SELECT
        t.teamId,
        t.teamName,
        Count(r.playerID) AS numOfPlayers
    FROM
        teams t JOIN rosters r
        ON t.teamId = r.teamId
    GROUP BY
        t.teamId,
        t.teamName
    ORDER BY
        t.teamId;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 7
-- Umesh: fncNumPlayersByTeamID
CREATE OR REPLACE FUNCTION fncNumPlayersByTeamID (
    tId teams.teamId%type
) RETURN INT IS
    
    numPlayers INT;
    
BEGIN
    SELECT numOfPlayers
    INTO numPlayers
    FROM vwTeamsNumPlayers
    WHERE teamId = tId;
    
    RETURN numPlayers;

EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            RETURN -1;
    WHEN TOO_MANY_ROWS
        THEN
            RETURN -2;
    WHEN OTHERS
        THEN
            RETURN -3;
END fncNumPlayersByTeamID;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 8
-- Umesh: vwSchedule
CREATE OR REPLACE VIEW vwSchedule AS
    SELECT
        gameId,
        divId,
        gameNum,
        gameDateTime,
        homeTeam,
        (   SELECT teamName
            FROM teams
            WHERE teamId = homeTeam) AS homeName,
        homeScore,
        visitTeam,
        (   SELECT teamName
            FROM teams
            WHERE teamId = visitTeam) AS visitName,
        visitScore,
        locationId,
        (   SELECT locationName
            FROM slLocations sl
            WHERE sl.locationId = games.locationId) AS locationName,
        isPlayed,
        notes
    FROM games
    ORDER BY gameId;
    
-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 9
-- Yash Yadav: spSchedUpcomingGames
CREATE OR REPLACE PROCEDURE spSchedUpcomingGames (
    numDay INT) AS
    
    CURSOR upcoming IS
        SELECT *
        FROM vwSchedule
        WHERE 
            Trunc(gameDateTime) - Trunc(sysdate)  <= numDay
            AND Trunc(gameDateTime) - Trunc(sysdate) > 0;

    upcomingGame vwSchedule%rowtype;
    played VARCHAR(5);
    bool INT := 0;
BEGIN
    OPEN upcoming;

    LOOP
        played := 'No';
        FETCH upcoming
        INTO upcomingGame;
        
        IF upcoming%NOTFOUND THEN
            IF bool = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No data found!');
            END IF;
            EXIT;
        ELSE
            bool := 1;
            
            IF upcomingGame.isPlayed = 1 THEN
                played := 'Yes';
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('Game ID: ' || upcomingGame.gameId);
            DBMS_OUTPUT.PUT_LINE('    Home Team: ' || upcomingGame.homeName ||
                ' (' || upcomingGame.homeTeam || ')');
            DBMS_OUTPUT.PUT_LINE('    Visit Team: ' || upcomingGame.visitName ||
                ' (' || upcomingGame.visitTeam || ')');
            DBMS_OUTPUT.PUT_LINE('    Played: ' || played);
            DBMS_OUTPUT.PUT_LINE('    Location: ' || upcomingGame.locationName ||
                ' (' || upcomingGame.locationId || ')');
        END IF;
    END LOOP;
EXCEPTION
    WHEN ROWTYPE_MISMATCH 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Rowtype mismatch!');
    WHEN OTHERS 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Others!');
END spSchedUpcomingGames;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 10
-- Danish Sharma: spSchedPastGames
CREATE OR REPLACE PROCEDURE spSchedPastGames (
    numDay INT) AS
    
    CURSOR pastComing IS
        SELECT *
        FROM vwSchedule
        WHERE 
            Trunc(sysdate) - Trunc(gameDateTime)  <= numDay
            AND Trunc(sysdate) - Trunc(gameDateTime) > 0;

    pastGame vwSchedule%rowtype;
    play VARCHAR(5);
    bool INT := 0;
BEGIN
    OPEN pastComing;

    LOOP
        play := 'No';
        FETCH pastComing
        INTO pastGame;
        
        IF pastComing%NOTFOUND THEN
            IF bool = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No data found!');
            END IF;
            EXIT;
        ELSE
            bool := 1;
            
            IF pastGame.isPlayed = 1 THEN
                play := 'Yes';
            END IF;
            
            DBMS_OUTPUT.PUT_LINE('Game ID: ' || pastGame.gameId);
            DBMS_OUTPUT.PUT_LINE('    Home Team: ' || pastGame.homeName ||
                ' (' || pastGame.homeTeam || ')');
            DBMS_OUTPUT.PUT_LINE('    Visit Team: ' || pastGame.visitName ||
                ' (' || pastGame.visitTeam || ')');
            DBMS_OUTPUT.PUT_LINE('    Played: ' || play);
            DBMS_OUTPUT.PUT_LINE('    Location: ' ||  pastGame.locationName ||
                ' (' ||  pastGame.locationId || ')');
        END IF;
    END LOOP;
EXCEPTION
    WHEN ROWTYPE_MISMATCH 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Rowtype mismatch!');
    WHEN OTHERS 
        THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Others!');
END spSchedPastGames;

-- ***************************************************
-- ***************************************************
-- ***************************************************

-- Task 11
-- Danish Sharma: fncTopScorer
CREATE OR REPLACE FUNCTION fncTopScorer
    RETURN players.playerId%type IS
        
    topScorerPlayer players.playerId%type := NULL;
            
BEGIN
    SELECT playerId
    INTO topScorerPlayer
    FROM (
            SELECT 
                playerId,
                Sum(numGoals) AS top
            FROM goalScorers
            GROUP BY playerId
            ORDER BY Sum(numGoals)DESC
    )
    WHERE rowNum = 1;
    
    IF topScorerPlayer IS NOT NULL THEN
        RETURN topScorerPlayer;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN
            RETURN -1;
    WHEN TOO_MANY_ROWS
        THEN
            RETURN -2;
    WHEN OTHERS
        THEN
            RETURN -3;
END fncTopScorer;