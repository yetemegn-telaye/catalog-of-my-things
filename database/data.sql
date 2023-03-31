/* authors */
INSERT into authors values (1, 'Allassane', 'Dicko');
INSERT into authors values (2, 'Traster', 'Trast');

/* genres */
INSERT into genres values (5, 'genre1');
INSERT into genres values (6, 'genre2');

/* label */
INSERT into labels values (3, 'label1', 'blue');
INSERT into labels values (4, 'label2', 'red');

/* Items */
INSERT into items (id, publish_date, archived, author_id) values (1, '2020-01-01', false, 1);
INSERT into items (id, publish_date, archived, author_id) values (2, '2000-01-01', false, 2);
INSERT into items (id, publish_date, archived, label_id) values (3, '2000-01-01', false, 3);
INSERT into items (id, publish_date, archived, label_id) values (4, '2000-01-01', false, 4);
INSERT into items (id, publish_date, archived, genre_id) values (5, '2000-01-01', false, 5);
INSERT into items (id, publish_date, archived, genre_id) values (6, '2000-01-01', false, 6);

/* games */
INSERT into games (item_id, multiplayer, last_played_at) values (1, true, '2006-01-01');
INSERT into games (item_id, multiplayer, last_played_at) values (2, true, '2010-01-01');

/* book */
INSERT into books values (3, 'Trast trast', 'good');
INSERT into books values (4, 'dicko dicko', 'bad');

/* music album */
INSERT into music_albums values (5, '2006-01-01', true);
INSERT into music_albums values (6, '2010-01-01', false);