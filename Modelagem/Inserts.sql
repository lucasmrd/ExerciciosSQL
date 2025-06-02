CREATE DATABASE IF NOT EXISTS MiniAsaas;
USE MiniAsaas;

SELECT * FROM customer;
SELECT * FROM payer;
SELECT * FROM payment;

/*Cadastro de customer e payer*/
INSERT INTO customer (id, username, password, name, email, date_created) VALUES
(1, 'user1', '123', 'Usuário 1', 'user@email.com.', current_timestamp());

INSERT INTO payer (id, name, cpf_cnpj, email, address, address_number, complement, city, company, max_payment_value, date_created) VALUES
(1, 'Customer 1', '58944512767', 'customer@email.com', 'Rua xyz', 240, 'Apto. 10', 'Sorocaba', 'Asaas', 1000000, CURRENT_TIMESTAMP());

/*Cadastrar cobranças*/
INSERT INTO payment (id, billing_type, payer_id, customer_id, description, due_date, value, status, date_created) VALUES
(1, 'BOLETO', 1, 1, 'Cobrança x', DATE_ADD(CURRENT_DATE(), INTERVAL 30 DAY), 1000, 'PENDENTE', CURRENT_TIMESTAMP());

/*Atualizar cobranças*/
UPDATE
	payment
SET
	billing_type = 'CARTAO',
    value = 999,
    status = 'CONCLUIDO'
WHERE
	id = 1;
    
/*Remover cobranças*/
DELETE FROM
	payment
WHERE
	id = 1;
	
    
    
    
    
    
    
    
