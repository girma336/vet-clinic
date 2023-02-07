-- create patients table
CREATE TABLE patients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	date_of_birth DATE
)

-- create treatments table
CREATE TABLE treatments(
	id SERIAL PRIMARY KEY,
	type VARCHAR(255),
	name VARCHAR(255)
)

-- create medical histories table
CREATE TABLE medical_histories(
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT,
	CONSTRAINT fk_patient_id
	FOREIGN KEY(patient_id)
	REFERENCES patients(id)
  status VARCHAR(255)
)

-- create invoices table
CREATE TABLE invoices(
	id SERIAL PRIMARY KEY,
	total_amount DECIMAL(10,2),
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT,
	CONSTRAINT fk_medical_history_id
	FOREIGN KEY(medical_history_id)
	REFERENCES medical_histories(id)
)

