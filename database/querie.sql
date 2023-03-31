SELECT * FROM items
JOIN games ON items.id = games.item_id
JOIN authors ON items.author_id = authors.id;

SELECT * FROM items
JOIN books ON items.id = books.id
JOIN labels ON items.label_id = labels.id;

SELECT * FROM items
JOIN genres ON items.id = genres.id
JOIN music_albums ON items.genre_id = music_albums.id;