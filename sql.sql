SELECT * FROM fraud_db
USE fraud_db;

SELECT * FROM fraud_transactions 
LIMIT 10;

##Total transactions
SELECT COUNT(*) FROM fraud_transactions

##Fraud VS Non-Fraud
SELECT is_fraud, COUNT(*)
FROM fraud_transactions 
GROUP BY is_fraud;

##Fraud Amount Analysis
SELECT is_fraud,
   AVG(amt) AS Avg_amount,
   MAX(amt) AS Max_Amount
FROM fraud_transactions
GROUP BY is_fraud;

##Category wise transactions
SELECT 
   category,
   COUNT(*) AS total_frauds
FROM fraud_transactions
GROUP BY category
ORDER BY total_frauds

##Top fraud Merchants
SELECT 
   merchant,
   COUNT(*) AS fraud_count
FROM fraud_transactions 
WHERE is_fraud = 1
GROUP BY merchant 
ORDER BY fraud_count DESC
LIMIT 10;

##Fraud percentage
SELECT 
   (SUM(is_fraud)/COUNT(*)) * 100 AS fraud_percentage
FROM fraud_transactions