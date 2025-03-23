########################
# Practical 2
# Name and surname: Karabo Matjila
# Student number: 22743333
########################

# Import the necessary packages
# DO NOT IMPORT ANY OTHER PACKAGES
library(sqldf)
library(lubridate)
library(RH2)

# Import the tables
customer_info <- read.csv("customer_info.csv",sep=";")
order_info <- read.csv("order_info.csv",sep=";")
product_info <- read.csv("product_info.csv",sep=";")

# Question 1
Q1<-sqldf("SELECT customer_id, product_id
           FROM order_info")

# Question 2
Q2<-sqldf("SELECT *
           FROM order_info")

# Question 3
Q3<-sqldf("SELECT customer_id, product_id, order_rating
           FROM order_info
           ORDER BY order_rating desc")

# Question 4
Q4<-sqldf("SELECT product_id, product_name
           FROM product_info
           WHERE gluten_free='Y'")

# Question 5

Q5<-sqldf("SELECT product_id, order_rating,
           CASE
           WHEN order_rating = '1' THEN 'Poor'
           WHEN order_rating = '2' THEN 'Poor'
           WHEN order_rating = '3' THEN 'Average'
           WHEN order_rating = '4' THEN 'Good'
           WHEN order_rating = '5' THEN 'Excellent' 
           END AS feedback
           FROM order_info
           ORDER BY order_rating asc") 
# Question 6
Q6<-sqldf("SELECT product_id, product_name, (sales_price-cost) AS profit
           FROM product_info")

# Question 7
Q7<-sqldf("SELECT product_id, COUNT(order_id) AS count
            FROM order_info
            GROUP BY product_id
            HAVING COUNT > 8")

# Question 8

order_info$order_date <- as.Date(order_info$order_date,format = "%Y/%m/%d")

Q8<-sqldf("SELECT * 
             FROM order_info
             WHERE order_date BETWEEN '2023-06-01' AND '2023-08-31' ")

# Question 9
customer_info$current <- date('2025-05-03')
customer_info$birthday <- as.Date(customer_info$birthday,format = "%d/%m/%Y")

Q9<-sqldf("SELECT customer_name, contact_no, birthday,
             (current-birthday)/365 AS age                
             FROM customer_info
            WHERE (current-birthday)/365 >= 8")

# Question 10
Q10<-sqldf("SELECT customer_name, contact_no, 
             month(birthday) AS month,
             year(birthday) AS year
             from customer_info
             WHERE month(birthday) = 12")

