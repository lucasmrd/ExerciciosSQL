CREATE DATABASE IF NOT EXISTS MiniAsaas;
USE MiniAsaas;

CREATE TABLE IF NOT EXISTS customer (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    password VARCHAR(255),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    date_created TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payer (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    cpf_cnpj VARCHAR(20) UNIQUE,
    email VARCHAR(255) UNIQUE,
    address VARCHAR(255),
    address_number INT,
    complement VARCHAR(255),
    city VARCHAR(255),
    company VARCHAR(255),
    max_payment_value DECIMAL(10, 2),
    date_created TIMESTAMP
);


CREATE TABLE IF NOT EXISTS payment (
	id INT PRIMARY KEY AUTO_INCREMENT,
    billing_type VARCHAR(255),
    payer_id INT,
    customer_id INT,
    description TEXT,
    due_date DATE,
    payment_date DATE,
    value DECIMAL(10, 2),
    status VARCHAR(255),
    date_created TIMESTAMP,
    
    FOREIGN KEY (payer_id) REFERENCES payer(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);








