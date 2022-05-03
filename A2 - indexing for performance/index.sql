-- indexing problem
EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where id between 25000 and 100000;
CREATE INDEX idx_tickets_id ON tickets(id);
EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where id between 25000 and 100000;

EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where cust_name like '123%';
CREATE INDEX idx_cust ON tickets(cust_name);
EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where cust_name like '123%';

DROP INDEX IF EXISTS idx_tickets_id;
EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where id = 23092;
CREATE INDEX idx_tickets_id ON tickets(id);
EXPLAIN ANALYZE SELECT COUNT(*) FROM tickets where id = 23092;