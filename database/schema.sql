
CREATE TABLE items (
  id int generated always as identity,
  publish_date date,
  archived boolean,
  genre_id int,
  author_id int,
  label_id int,
  PRIMARY KEY (id)
)