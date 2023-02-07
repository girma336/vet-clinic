-- create patients table
CREATE TABLE patients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	date_of_birth DATE
);

-- create treatments table
CREATE TABLE treatments(
	id SERIAL PRIMARY KEY,
	type VARCHAR(255),
	name VARCHAR(255)
);


-- create medical histories table
CREATE TABLE medical_histories(
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT,
	CONSTRAINT fk_patient_id
	FOREIGN KEY(patient_id)
	REFERENCES patients(id),
    status VARCHAR(255)
);

CREATE INDEX medical_his_patient_id_idx ON 
medical_histories(patient_id);

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
);
CREATE INDEX invoices_medical_his_id_idx ON 
invoices(medical_history_id);

-- CREATE invoice_item table
CREATE TABLE invoice_item(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(10,2),
  quantity INT,
  total_price DECIMAL(10,2),
  invoice_id INT,
  CONSTRAINT fk_invoice_id
  FOREIGN KEY(invoice_id)
  REFERENCES invoices(id),
  treatment_id INT,
  CONSTRAINT fk_treatment_id
  FOREIGN KEY(treatment_id)
  REFERENCES treatments(id)
);

CREATE INDEX invoices_invoice_id_idx ON 
invoice_item(invoice_id);
CREATE INDEX invoices_item_treatment_id_idx ON 
invoice_item(treatment_id);