DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name  VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  breed VARCHAR(255),
  type VARCHAR(255),
  admission_date VARCHAR(255),
  adoptable BOOLEAN,
  owner_id INT REFERENCES owners(id) ON DELETE CASCADE
);
