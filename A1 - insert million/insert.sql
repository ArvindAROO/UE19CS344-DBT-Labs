DROP TABLE IF EXISTS milliontable;
CREATE TABLE milliontable(
    id varchar PRIMARY KEY,
    name varchar(10),
    age integer
);
EXPLAIN ANALYZE INSERT INTO milliontable (id, name, age)
SELECT (random()*100000000)::text,
        substr(md5(random()::text), 1, 10),
       (random() * 70 + 10)::integer
FROM generate_series(1, 1000000)
ON CONFLICT (id) DO NOTHING;
select count(*) from milliontable;
-- select * from milliontable;