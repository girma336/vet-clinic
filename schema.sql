/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species varchar(255);

DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
    id SERIAL NOT NULL PRIMARY KEY,
    full_name varchar(255),
    age INT
);

DROP TABLE if EXISTS species;
CREATE TABLE species (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(255)
);

-- ALTER TABLE animals ADD PRIMARY KEY(id); multiple primary keys are not allowed
ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER Table animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);

DROP TABLE if EXISTS vets;
CREATE TABLE vets (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(255),
    age INT,
    date_of_graduation date
);

DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations (
    species_id INTEGER REFERENCES species(id) ON DELETE CASCADE,
    vet_id INTEGER REFERENCES vets(id) ON DELETE CASCADE,
);

DROP TABLE IF EXISTS visits;
CREATE TABLE visits (
    animals_id INTEGER REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INTEGER REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit date
);