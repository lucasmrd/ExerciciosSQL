/*1. Select de cobranças (payment) com valor maior que R$ 1.000,00*/
SELECT
	p.id,
    p.billing_type,
    p.customer_account_id,
    p.date_created,
    p.due_date,
    p.value
FROM
	payment p
WHERE
	p.value > 1000;

/*2. Soma dos valores de cobranças recebidas com a data de criação maior que 2020, agrupadas por tipo de cobrança (billing_type)*/
SELECT
	p.billing_type,
	SUM(p.value) AS soma_valores,
    YEAR(p.date_created) AS ano
FROM
	payment p
WHERE 
	YEAR(p.date_created) > 2020
GROUP BY
	p.billing_type,
    ano
ORDER BY 
	ano;
    
/*3. Lista de 20 pagadores (customer_account) com valores recebidos maiores que R$ 1.000,00*/

select * from customer_account limit 20;
select * from payment limit 20;

SELECT
	c.name,
	SUM(p.value) AS soma
FROM 
	customer_account c
JOIN
	payment p ON c.id = p.customer_account_id
GROUP BY
	c.name
HAVING
	soma > 1000
ORDER BY
	soma DESC
LIMIT 20;

/*4. Primeiro nome dos clientes (customer) com análise geral aprovada (customer_regiter_status), ordenado por data de aprovação*/

SELECT * FROM customer LIMIT 20;
SELECT * FROM customer_register_status LIMIT 20;

SELECT	
	SUBSTRING_INDEX(c.name, " ", 1),
    crs.general_approval AS status,
    crs.last_updated AS data_aprovacao
FROM
	customer c
JOIN
	customer_register_status crs ON c.id = crs.customer_id
WHERE
	crs.general_approval = 'APPROVED'
ORDER BY
	crs.last_updated;
    











