DROP TABLE IF EXISTS director;
CREATE TABLE director(
    id int PRIMARY KEY,
    name varchar(10)
);
INSERT INTO director (id, name)
SELECT (random()*100000)::integer,
        substr(md5(random()::text), 1, 10)
FROM generate_series(1, 10000)
ON CONFLICT (id) DO NOTHING;
select count(*) from director;


DROP TABLE IF EXISTS movie;
CREATE TABLE movie(
    id int PRIMARY KEY,
    movie_name varchar(10)
);
INSERT INTO movie (id, movie_name)
SELECT (random()*100000)::integer,
        substr(md5(random()::text), 1, 10)
FROM generate_series(1, 20000)
ON CONFLICT (id) DO NOTHING;
select count(*) from movie;


DROP TABLE IF EXISTS actor;
CREATE TABLE actor(
    id int PRIMARY KEY,
    name varchar(10)
);
INSERT INTO actor (id, name)
SELECT (random()*100000)::integer,
        substr(md5(random()::text), 1, 10)
FROM generate_series(1, 30000)
ON CONFLICT (id) DO NOTHING;
select count(*) from actor;

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets(
    id int PRIMARY KEY,
    cust_name varchar(10)
);
INSERT INTO tickets (id, cust_name)
SELECT (random()*100000)::integer,
        substr(md5(random()::text), 1, 10)
FROM generate_series(1, 40000)
ON CONFLICT (id) DO NOTHING;
select count(*) from tickets;

SELECT schemaname,relname,n_live_tup 
  FROM pg_stat_user_tables 
ORDER BY n_live_tup;

EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets natural join actor natural join movie natural join director;


EXPLAIN ANALYZE SELECT COUNT(*) FROM director natural join movie natural join actor natural join tickets;


