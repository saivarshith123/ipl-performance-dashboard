-- Query for creating the first table that is ipl matches

CREATE TABLE ipl_matches_2008_2022
(
    id int8 PRIMARY KEY,
    city varchar(50),
    match_date date,
    season varchar(50),
    match_number varchar(50),
    team1 varchar(50),
    team2 varchar(50),
    venue varchar(100),
    toss_winner varchar(50),
    toss_decision varchar(50),
    superover varchar(50),
    winning_team varchar(50),
    won_by varchar(50),
    margin varchar(50),
    method varchar(50),
    player_of_match varchar(50),
    umpire1 varchar(50),
    umpire2 varchar(50)
)

-- Query for view the first table

select * from ipl_matches_2008_2022;

-- Query for creating the second table that is ipl ball by ball

CREATE TABLE ipl_ball_by_ball_2008_2022
(
    id int8 NOT NULL,
	innings int8,
	overs int8,
	ball_number int8,
	batter varchar(50),
	bowler varchar(50),
	non_striker varchar(50),
	extra_type varchar(50),
	batsman_run int8,
	extras_run int8,
	total_run int8,
	non_boundry int8,
	iswicket_delivery int8,
	player_out varchar(50),
	dismisal_kind varchar(50),
	fielders_involved varchar(50),
	batting_team varchar(50)
)

-- Query for view the second table

select * from ipl_ball_by_ball_2008_2022;

-- This is the Dax Querry for the finding the winner of the any perticular season

Title Winner = 
VAR max_date =
    CALCULATE (
        MAX ( 'calenderTable'[Date] ),
        ALLSELECTED ( 'public ipl_ball_by_ball_2008_2022' ),
        VALUES ( 'public ipl_ball_by_ball_2008_2022' )
    )
VAR title_winner =
    CALCULATE (
        SELECTEDVALUE ( 'public ipl_matches_2008_2022'[winning_team] ),
        'calenderTable'[Date] = max_date
    )
RETURN
    title_winner

-- This is the Dax Query for the finding the person who won the orange cap in the season

Batter Runs = 
    CONCATENATE(
        SUM('public ipl_ball_by_ball_2008_2022'[batsman_run]), 
        " Runs"
    )

-- This is the Dax Query for the finding the person who won the perple cap in the season

witckets = 
    CONCATENATE(
        SUM('public ipl_ball_by_ball_2008_2022'[iswicket_delivery]), 
        " Wickets"
    )

-- This is the Dax Query for the creating the calender tabel for the database

calenderTable = 
    CALENDAR(
        MIN('public ipl_matches_2008_2022'[match_date]), 
        MAX('public ipl_matches_2008_2022'[match_date])
    )

-- This is the Dax Query for the calculating the batsmans strick rate

Strike Rate for Batsman = 
    (
        SUM('public ipl_ball_by_ball_2008_2022'[batsman_run]) / 
        COUNT('public ipl_ball_by_ball_2008_2022'[ball_number])
    ) * 100

-- This is the Dax Query for the calculating the bowler economy

Economy = 
DIVIDE(
    SUMX(
        FILTER(
            'public ipl_ball_by_ball_2008_2022',
            'public ipl_ball_by_ball_2008_2022'[extra_type] <> "legbyes" 
            && 'public ipl_ball_by_ball_2008_2022'[extra_type] <> "byes"
        ),
        'public ipl_ball_by_ball_2008_2022'[total_run]
    ),
    COUNTROWS('public ipl_ball_by_ball_2008_2022') / 6
)

-- This is the Dax Query for the calculating the bowler average

Average = 
DIVIDE(
    SUMX(
        FILTER(
            'public ipl_ball_by_ball_2008_2022',
            'public ipl_ball_by_ball_2008_2022'[extra_type] <> "legbyes" 
            && 'public ipl_ball_by_ball_2008_2022'[extra_type] <> "byes"
        ),
        'public ipl_ball_by_ball_2008_2022'[total_run]
    ),
    SUM('public ipl_ball_by_ball_2008_2022') 
)

-- This is the Dax Query for the calculating the bowler SR

Bowling SR = 
    COUNT('public ipl_ball_by_ball_2008_2022'[bowler]) / 
    SUM('public ipl_ball_by_ball_2008_2022'[iswicket_delivery])

-- This is the Dax Query for calculating the matches on by toss decis

Matches_Win_on_Toss_Decision = 
    CALCULATE(
        COUNTROWS('public ipl_matches_2008_2022'),
        'public ipl_matches_2008_2022'[toss_winner] = 'public ipl_matches_2008_2022'[winning_team]
    )