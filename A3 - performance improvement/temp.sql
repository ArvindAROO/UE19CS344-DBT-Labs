EXPLAIN ANALYZE SELECT count(*) from tickets group by cust_name;
EXPLAIN ANALYZE SELECT cust_name from tickets ORDER BY cust_name;

EXPLAIN ANALYZE SELECT * FROM tickets JOIN movie ON tickets.cust_name = movie.movie_name;
create index temp on tickets(cust_name);
create index temp1 on movie(movie_name);
EXPLAIN ANALYZE SELECT * FROM tickets JOIN movie ON tickets.cust_name = movie.movie_name;

drop index temp;
drop index temp1;


EXPLAIN ANALYZE SELECT * FROM 
(
    (SELECT * FROM tickets) A
    FULL OUTER JOIN
    (SELECT * FROM movie) B on A.cust_name= B.movie_name
    FULL OUTER JOIN 
    (SELECT * FROM director) C on A.cust_name = C.name
);

EXPLAIN ANALYZE SELECT * FROM 
(
    (SELECT * FROM director) A
    FULL OUTER JOIN
    (SELECT * FROM movie) B on A.name= B.movie_name
    FULL OUTER JOIN 
    (SELECT * FROM tickets) C on A.name = C.cust_name
);

explain analyze SELECT * FROM tickets GROUP BY 1, 2;
explain analyze SELECT * FROM tickets GROUP BY 2, 1;
