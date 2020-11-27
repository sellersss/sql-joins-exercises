-- The JOIN operation
-- #1
SELECT 
    matchid, 
    player
  FROM goal
 WHERE teamid LIKE 'GER';

-- #2
SELECT
    id,
    stadium,
    team1,
    team2
  FROM game
 WHERE id = 1012;

-- #3
SELECT
    player,
    teamid,
    stadium,
    mdate
  FROM game
  JOIN goal ON id = matchid
 WHERE teamid = 'GER';

--  #4
SELECT
    team1,
    team2,
    player
  FROM game
  JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%';

--  #5
SELECT
    player,
    teamid,
    coach,
    gtime
  FROM goal
  JOIN eteam ON teamid = id
 WHERE gtime <= 10;

-- #6
SELECT
    mdate,
    teamname
  FROM game
  JOIN eteam ON team1 = eteam.id
 WHERE coach = 'Fernando Santos';

-- #7
SELECT player
  FROM goal 
  JOIN game ON id = matchid
 WHERE stadium = 'National Stadium, Warsaw';

-- #8
SELECT DISTINCT player
  FROM game 
  JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER')
   AND teamid != 'GER';

-- #9
SELECT
    teamname,
    COUNT(teamid)
  FROM eteam
  JOIN goal ON id = teamid
 GROUP BY teamname;

-- #10
SELECT
    stadium,
    COUNT(1)
  FROM goal
  JOIN game ON id = matchid
 GROUP BY stadium;

-- #11
SELECT
    matchid,
    mdate,
    COUNT(teamid)
  FROM game
  JOIN goal ON matchid = id
 WHERE team1 = 'POL' or team2 = 'POL'
 GROUP BY matchid, mdate;

-- #12
SELECT
    matchid,
    mdate,
    COUNT(teamid)
  FROM game
  JOIN goal ON matchid = id
  WHERE teamid LIKE 'GER'
  GROUP BY matchid, mdate

-- #13
SELECT
    mdate,
    team1,
    SUM(CASE
        WHEN teamid = team1
        THEN 1
        ELSE 0
         END) score1,
    team2,
    SUM(CASE
        WHEN teamid= team2
        THEN 1
        ELSE 0
         END) score2
  FROM game 
  LEFT JOIN goal ON matchid = id
 GROUP BY mdate, matchid, team1, team2;

-- More JOIN operations
-- #1
SELECT
    id,
    title
  FROM movie
 WHERE yr = 1962;

-- #2
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- #3
SELECT
    id,
    title,
    yr
  FROM movie
 WHERE title
  LIKE 'Star Trek%'
 ORDER BY yr;

-- #4
SELECT title
  FROM movie
 WHERE id IN (11768, 11955, 21191);

-- #5
SELECT id
  FROM actor
 WHERE name = 'Glenn Close';

-- #6
SELECT actor.name
  FROM actor
  JOIN casting ON casting.actorid = actor.id
 WHERE casting.movieid = 11768;

-- #7
SELECT actor.name
  FROM actor
  JOIN casting ON casting.actorid = actor.id
  JOIN movie ON movie.id = casting.movieid
 WHERE movie.title = 'Alien';

-- #8
SELECT movie.title
  FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
 WHERE actor.name = 'Harrison Ford';

-- #9
SELECT movie.title
  FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
 WHERE actor.name = 'Harrison Ford'
   AND casting.ord != 1;

-- #10
SELECT movie.title, actor.name
  FROM movie
  JOIN casting ON casting.movieid = movie.id
  JOIN actor ON actor.id = casting.actorid
 WHERE movie.yr = 1962
   AND casting.ord = 1;