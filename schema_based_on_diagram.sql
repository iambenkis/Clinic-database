CREATE TABLE patients (
	id INT PRIMARY KEY NOT NULL,
	name varchar(100),   
	date_of_birth DATE,
);

CREATE TABLE medical_histories (
	id INT PRIMARY KEY NOT NULL,
	admitted_at TIMESTAMP,   
	patient_id INT,
	status varchar(120),
	FOREIGN KEY patient_id REFERENCES patient(id),
);

CREATE TABLE invoices (
	id INT PRIMARY KEY NOT NULL,
	total_amount DECIMAL,   
	generated_at TIMESTAMP,
	paid_at TIMESTAMP,
	medical_history_id varchar(120),
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
);

CREATE TABLE treatments (
	id INT PRIMARY KEY NOT NULL,
	type varchar(100),  
	name varchar(100),  
);

CREATE TABLE invoice_items (
	id INT PRIMARY KEY NOT NULL,
	unit_price DECIMAL,  
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT,
	FOREIGN KEY (invoice_id) REFERENCES invoices(id);  
	FOREIGN KEY (treatment_id) REFERENCES treatments(id);
);

CREATE TABLE treatment_history (
    treatments_id INT REFERENCES treatments (id),
    medical_history_id INT REFERENCES medical_histories (id)
);

/* Foreign key indexes */

CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX invoice_treatment_DESC ON invoice_items(invoice_id DESC, treatment_id DESC);
CREATE INDEX treatment_history_ASC ON treatment_history(treatments_id ASC, medical_history_id ASC);
