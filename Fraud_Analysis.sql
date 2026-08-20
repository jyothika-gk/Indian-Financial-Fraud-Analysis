Create DATABASE banking_analytics;
use banking_analytics;
CREATE TABLE customers (
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    Marital_Status VARCHAR(30),
    Occupation VARCHAR(100),
    Annual_Income DECIMAL(15,2),
    Customer_Segment VARCHAR(30),
    State VARCHAR(50),
    City VARCHAR(50),
    Account_Type VARCHAR(30),
    Customer_Since DATE
);
SHOW TABLES;
DESCRIBE customers;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT *
FROM customers
LIMIT 5;


CREATE TABLE cards (
    Card_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Card_Type VARCHAR(30),
    Card_Network VARCHAR(50),
    Credit_Limit DECIMAL(15,2),
    Card_Status VARCHAR(30),
    Contactless VARCHAR(10),
    Card_Mode VARCHAR(20),
    Issue_Date DATE,
    Expiry_Date DATE
);
SHOW TABLES;
Describe cards;
SELECT COUNT(*) AS total_cards
FROM cards;


CREATE TABLE merchants (
    Merchant_ID VARCHAR(20),
    Merchant_Name VARCHAR(100),
    Merchant_Category VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Merchant_Risk_Level VARCHAR(30),
    Merchant_Rating DECIMAL(5,2),
    Merchant_Status VARCHAR(30),
    Merchant_Since DATE
);
SHOW TABLES;
Describe merchants;
SELECT COUNT(*) AS total_merchants
FROM merchants;


CREATE TABLE transactions (
    Transaction_ID VARCHAR(30),
    Customer_ID VARCHAR(20),
    Card_ID VARCHAR(20),
    Merchant_ID VARCHAR(20),
    Transaction_Date DATE,
    Transaction_Time TIME,
    Transaction_Amount DECIMAL(15,2),
    Payment_Method VARCHAR(30),
    Transaction_Channel VARCHAR(30),
    Device_Type VARCHAR(50),
    Transaction_Status VARCHAR(30),
    Is_International VARCHAR(10),
    Fraud_Flag INT,
    Fraud_Reason VARCHAR(150),
    Merchant_Risk_Level VARCHAR(30),
    Merchant_Category VARCHAR(50),
    Customer_State VARCHAR(50),
    Customer_City VARCHAR(50),
    Merchant_State VARCHAR(50),
    Merchant_City VARCHAR(50)
);
SHOW TABLES;
Describe transactions;
SHOW VARIABLES LIKE 'local_infile';
SELECT COUNT(*) AS transaction_count
FROM transactions;
LOAD DATA LOCAL INFILE 'C:/Users/2005j/Downloads/Transaction_Data_250k.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Transaction_ID,
    Customer_ID,
    Card_ID,
    Merchant_ID,
    Transaction_Date,
    Transaction_Time,
    Transaction_Amount,
    Payment_Method,
    Transaction_Channel,
    Device_Type,
    Transaction_Status,
    Is_International,
    Fraud_Flag,
    Fraud_Reason,
    Merchant_Risk_Level,
    Merchant_Category,
    Customer_State,
    Customer_City,
    Merchant_State,
    Merchant_City
);
SELECT COUNT(*) AS total_transactions
FROM transactions;
SELECT *
FROM customers
LIMIT 10;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT
    customer_id,
    customer_name,
    gender,
    age,
    occupation,
    annual_income,
    customer_segment,
    state,
    city,
    account_type
FROM customers
LIMIT 10;
SELECT
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM customers;
SELECT DISTINCT customer_segment
FROM customers;
SELECT *
FROM customers
WHERE age >= 60;
SELECT
    customer_id,
    customer_name,
    age,
    occupation,
    annual_income
FROM customers
WHERE state = 'Kerala';
SELECT
    customer_id,
    customer_name,
    age,
    annual_income
FROM customers
WHERE state = 'Kerala'
  AND annual_income > 500000;
  SELECT
    customer_id,
    customer_name,
    age,
    annual_income
FROM customers
ORDER BY annual_income DESC
LIMIT 10;
SELECT
    customer_id,
    customer_name,
    age,
    annual_income
FROM customers
ORDER BY age ASC
LIMIT 10;
SELECT
    state,
    COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC;
SELECT
    SUM(annual_income) AS total_income
FROM customers;
SELECT
    AVG(annual_income) AS average_income
FROM customers;
SELECT
    state,
    AVG(annual_income) AS avg_income
FROM customers
GROUP BY state
ORDER BY avg_income DESC;
SELECT
    gender,
    COUNT(*) AS customer_count
FROM customers
GROUP BY gender;
SELECT
    account_type,
    COUNT(*) AS total_customers
FROM customers
GROUP BY account_type
ORDER BY total_customers DESC;
SELECT
    occupation,
    COUNT(*) AS customer_count
FROM customers
GROUP BY occupation
ORDER BY customer_count DESC;
SELECT
    SUM(transaction_amount) AS total_transaction_amount
FROM transactions;
SELECT
    AVG(transaction_amount) AS average_transaction_amount
FROM transactions;SELECT
    MIN(transaction_amount) AS minimum_amount,
    MAX(transaction_amount) AS maximum_amount
FROM transactions;
SELECT
    transaction_status,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY transaction_status
ORDER BY transaction_count DESC;
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY payment_method
ORDER BY transaction_count DESC;
SELECT
    COUNT(*) AS fraud_transactions
FROM transactions
WHERE fraud_flag = 1;
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions
FROM transactions
GROUP BY payment_method
ORDER BY fraud_transactions DESC;
SELECT
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions;
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions
GROUP BY payment_method
ORDER BY fraud_rate_percent DESC;
SELECT
    customer_state,
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions
GROUP BY customer_state
ORDER BY fraud_rate_percent DESC;
SELECT
    customer_state,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY customer_state
HAVING COUNT(*) > 16500
ORDER BY transaction_count DESC;
SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY payment_method
HAVING COUNT(*) > 10000
ORDER BY transaction_count DESC;
SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY payment_method
HAVING COUNT(*) > 10000
ORDER BY transaction_count DESC;SELECT
    fraud_reason,
    COUNT(*) AS fraud_count,
    SUM(transaction_amount) AS fraud_amount
FROM transactions
WHERE fraud_flag = 1
GROUP BY fraud_reason
ORDER BY fraud_count DESC;
SELECT
    t.transaction_id,
    t.transaction_amount,
    t.transaction_status,
    t.fraud_flag,
    c.customer_id,
    c.customer_name,
    c.gender,
    c.age,
    c.occupation,
    c.annual_income
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
LIMIT 10;
SELECT
    c.customer_segment,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY fraud_rate_percent DESC;
SELECT
    c.occupation,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY c.occupation
ORDER BY fraud_rate_percent DESC;
SELECT
    t.transaction_id,
    t.customer_id,
    c.customer_name,
    t.transaction_amount
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
LIMIT 10;
SELECT
    c.customer_segment,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY fraud_rate_percent DESC;
SELECT
    ca.card_type,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN cards ca
    ON t.card_id = ca.card_id
GROUP BY ca.card_type
ORDER BY fraud_rate_percent DESC;
SELECT
    m.merchant_risk_level,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_risk_level
ORDER BY fraud_rate_percent DESC;
SELECT
    c.customer_segment,
    ca.card_type,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
JOIN cards ca
    ON t.card_id = ca.card_id
GROUP BY c.customer_segment, ca.card_type
ORDER BY fraud_rate_percent DESC;
SELECT
    m.merchant_category,
    m.merchant_risk_level,
    COUNT(*) AS total_transactions,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_category, m.merchant_risk_level
ORDER BY fraud_rate_percent DESC;
SELECT
    transaction_id,
    transaction_amount,
    CASE
        WHEN transaction_amount < 10000 THEN 'Low'
        WHEN transaction_amount < 50000 THEN 'Medium'
        ELSE 'High'
    END AS transaction_category
FROM transactions
LIMIT 20;
SELECT
    CASE
        WHEN transaction_amount < 10000 THEN 'Low'
        WHEN transaction_amount < 50000 THEN 'Medium'
        ELSE 'High'
    END AS transaction_category,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount,
    SUM(fraud_flag) AS fraud_transactions
FROM transactions
GROUP BY transaction_category
ORDER BY transaction_count DESC;
SELECT
    transaction_id,
    transaction_amount
FROM transactions
WHERE transaction_amount > (
    SELECT AVG(transaction_amount)
    FROM transactions
);
SELECT
    transaction_id,
    transaction_amount,
    RANK() OVER (
        ORDER BY transaction_amount DESC
    ) AS amount_rank
FROM transactions
LIMIT 20;
SELECT
    transaction_id,
    transaction_amount,
    ROW_NUMBER() OVER (
        ORDER BY transaction_amount DESC
    ) AS row_num
FROM transactions
LIMIT 20;
SELECT
    t.transaction_id,
    c.customer_name,
    c.customer_segment,
    ca.card_type,
    m.merchant_category,
    m.merchant_risk_level,
    t.transaction_amount,
    t.transaction_status,
    t.fraud_flag
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
JOIN cards ca
    ON t.card_id = ca.card_id
JOIN merchants m
    ON t.merchant_id = m.merchant_id
LIMIT 20;
SELECT
    transaction_status,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount,
    ROUND(AVG(transaction_amount), 2) AS average_amount
FROM transactions
GROUP BY transaction_status
ORDER BY transaction_count DESC;
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY payment_method
ORDER BY fraud_rate DESC;
SELECT
    transaction_channel,
    COUNT(*) AS transaction_count,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY transaction_channel
ORDER BY fraud_rate DESC;
SELECT
    transaction_channel,
    COUNT(*) AS transaction_count,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY transaction_channel
ORDER BY fraud_rate DESC;
SELECT
    device_type,
    COUNT(*) AS transaction_count,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY device_type
ORDER BY fraud_rate DESC;
SELECT
    fraud_reason,
    COUNT(*) AS fraud_transactions,
    SUM(transaction_amount) AS fraud_amount
FROM transactions
WHERE fraud_flag = 1
GROUP BY fraud_reason
ORDER BY fraud_transactions DESC;
SELECT
    customer_state,
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions
GROUP BY customer_state
ORDER BY fraud_rate DESC;
SELECT
    t.customer_id,
    c.customer_name,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_amount
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY t.customer_id, c.customer_name
ORDER BY total_amount DESC
LIMIT 10;
SELECT
    t.customer_id,
    c.customer_name,
    SUM(t.fraud_flag) AS fraud_transactions,
    COUNT(*) AS total_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions t
JOIN customers c
    ON t.customer_id = c.customer_id
GROUP BY t.customer_id, c.customer_name
HAVING SUM(t.fraud_flag) > 0
ORDER BY fraud_transactions DESC
LIMIT 10;
SELECT
    ca.card_type,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_amount,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions t
JOIN cards ca
    ON t.card_id = ca.card_id
GROUP BY ca.card_type
ORDER BY total_amount DESC;
SELECT
    m.merchant_risk_level,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_amount,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_risk_level
ORDER BY fraud_rate DESC;
SELECT
    m.merchant_category,
    COUNT(*) AS transaction_count,
    SUM(t.transaction_amount) AS total_amount,
    SUM(t.fraud_flag) AS fraud_transactions,
    ROUND(SUM(t.fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate
FROM transactions t
JOIN merchants m
    ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_category
ORDER BY fraud_rate DESC;
SELECT
    is_international,
    COUNT(*) AS transaction_count,
    SUM(transaction_amount) AS total_amount
FROM transactions
GROUP BY is_international;
SELECT
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.transaction_amount
FROM customers c
LEFT JOIN transactions t
    ON c.customer_id = t.customer_id
LIMIT 20;
SELECT
    COUNT(*) AS total_customers
FROM customers;
SELECT
    COUNT(*) AS total_cards
FROM cards;
SELECT
    COUNT(*) AS total_merchants
FROM merchants;
SELECT
    COUNT(*) AS total_transactions
FROM transactions;
SELECT
    COUNT(*) AS total_transactions,
    SUM(fraud_flag) AS fraud_transactions,
    COUNT(*) - SUM(fraud_flag) AS non_fraud_transactions,
    ROUND(SUM(fraud_flag) * 100.0 / COUNT(*), 2) AS fraud_rate_percent,
    SUM(CASE WHEN fraud_flag = 1 THEN transaction_amount ELSE 0 END) AS fraud_amount
FROM transactions;