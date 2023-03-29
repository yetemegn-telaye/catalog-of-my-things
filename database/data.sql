/* authors */
INSERT into authors values (DEFAULT, 'Allassane', 'Dicko');
INSERT into authors values (DEFAULT, 'Traster', 'Trast');

/* Items */
INSERT into items(id, publish_date, archived, author_id) values (1, '2020-01-01', false, 1);
INSERT into items (id, publish_date, archived, author_id) values (2, '2000-01-01', false, 2);

/* games */
INSERT into games (item_id, multiplayer, last_played_at) values (0, true, '2006-01-01');
INSERT into games (item_id, multiplayer, last_played_at) values (1, true, '2010-01-01');