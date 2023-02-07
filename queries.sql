/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

BEGIN TRANSACTION
UPDATE  animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE name  NOT LIKE '%mon';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE  animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT my_savepoint; 
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animlas;
COMMIT;

SELECT COUNT(id) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(*) FROM animals WHERE escape_attempts > 1 GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name, full_name FROM animals 
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT full_name, name FROM animals 
RIGHT JOIN owners ON owners.id = animals.owner_id;

SELECT animals.name as animalName, species.name as speciesName FROM animals 
JOIN species ON animals.species_id = species.id 
WHERE species.name = 'Pokermon';

SELECT species.name, COUNT(*) FROM animals
JOIN species ON species.id = animals.species_id
GROUP BY species.name;

SELECT * FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE animals.species_id = 2 AND full_name = 'Jennifer Orwell';

SELECT * FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE animals.escape_attempts = 0 AND full_name = 'Dean Winchester';

SELECT full_name, COUNT(*) FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY full_name ORDER BY COUNT(*) ASC;


-- Day 4

SELECT * FROM animals JOIN visits ON id = animals_id WHERE vet_id = 1;
SELECT COUNT(name) FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vet_id = 3;
SELECT name, species_id FROM vets LEFT JOIN specializations s ON vets.id = s.vet_id;

SELECT animals.name, visits.date_of_visit FROM animals 
JOIN visits ON animals.id = visits.animals_id 
WHERE vet_id = 3 AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(*) FROM animals
JOIN visits ON animals.id = visits.animals_id 
GROUP BY animals.name ORDER BY COUNT(animals_id);

SELECT animals.name, visits.date_of_visit FROM animals 
JOIN visits ON visits.animals_id = animals_id 
WHERE visits.vet_id = 2 ORDER BY visits.date_of_visit ASC LIMIT 1;

SELECT * FROM animals 
JOIN visits ON visits.vet_id = animals.id JOIN vets ON vets.id = visits.vet_id 
WHERE date_of_visit = (SELECT MIN(date_of_visit) FROM visits);

SELECT COUNT(*) FROM animals JOIN visits ON animals.id = visits.animals_id WHERE vet_id = 2;

SELECT species.name, COUNT(animals.species_id) FROM animals 
JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id);


SELECT COUNT(*) FROM visits where animals_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';