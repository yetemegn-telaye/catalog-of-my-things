
-- CREATE TABLE items (
--   id int generated always as identity,
--   publish_date date,
--   archived boolean,
--   genre_id int,
--   author_id int,
--   label_id int,
--   PRIMARY KEY (id)
-- )

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id),
  label_id INTEGER REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- for book

CREATE TABLE books (
  id INTEGER PRIMARY KEY REFERENCES items(id),
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(255) NOT NULL
);

-- for label


CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL
);


-- foreign key index
CREATE INDEX items_label_id_idx ON items (label_id);
