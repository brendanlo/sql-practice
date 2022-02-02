# DDL 

PSQL

CREATE DATABASE outer_space;
\c outer_space;

CREATE TABLE moons (
    moon varchar(100) PRIMARY KEY,
    planet varchar(100) NOT NULL REFERENCES planets
);

CREATE TABLE stars (
    star varchar(100) PRIMARY KEY,
    star_temp int
    --indicate which unit (K?, C?, F?)
);

CREATE TABLE planets (
    planet varchar(100) PRIMARY KEY,
    orbit_period float,
    star varchar(100) REFERENCES stars 
    -- should this be not null?
);

-- querying data
SELECT planets.planet, stars.star, count(moon) as moon_count
FROM planets
    JOIN stars 
        ON planets.star = stars.star
    JOIN moons
    --left outer join
        ON moons.planet = planets.planet
GROUP BY planets.planet, stars.star
