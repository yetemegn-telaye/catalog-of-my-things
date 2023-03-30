SELECT * FROM items
JOIN authors ON items.author_id = authors.id
JOIN games ON items.id = games.item_id;