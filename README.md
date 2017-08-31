
Given the following ER diagram:


And given the following information:
	•	created_at fields have a timestamp of the time at which a row was inserted in a table for the first time.
	•	product_sku is unique for every product.
	•	product_family_handle is unique for every product family.
	•	Subscription status can be: ‘paused’, ‘cancelled’ or ‘active’.
	•	The fk_product field in the order table indicates the product that was purchased in an order. The fk_product_subscribed_to in the subscription table indicates the product a subscription is currently subscribed to. A subscription can change the product it is subscribed to at any moment.
	•	An order is generated when a box is shipped to a customer

Write SQL statements to retrieve the following information:
	•	For the customer with email address ‘fancygirl83@hotmail.com’ show all product_skus the customer has an active subscription for.
Select product_sku
From product
Inner join subscription on product.id_product = subscription. id_product
Inner join customer on subscription.id_customer = customer.id_customer
Where email = ‘fancygirl83@hotmail.com’ and status = “active”


	•	Get all the customers that have an active subscription to a product that corresponds to a product family with product_family_handle = ‘classic-box’

Select id_customer, first_name, last_name 
From customer
Inner join subscription on customer.id_customer = subscription.id_customer
Inner join product on subscription.id_product = product.id_product
Inner join product_family on product.id_product_family=product.id_product_family
Where product_family_handle = ‘classic-box’

	•	Get all the paused subscriptions that have only received one box.
Select status
From subscription 
Inner join order on subscription.id_subscription=order.id_subscription
Where status = “paused” and order_number = “received one box”

	•	How many subscriptions do our customers have on average?
Select avg (id_subscription)
From subscription
Where status = “active”

	•	How many customers have ordered more than one product?
Select count (id_customer) as customer_count
From customer 
Inner join subscription on customer.id_customer = subscription.id_customer
Inner join product on subscription.id_product = product.id_product
Inner join order on product.id_order=order.id_order
Where count (id_order) =! “1”

	•	How many customers have ordered more that one product with the same subscription?
Select count (id_customer) as customer_count
From customer 
Inner join subscription on customer.id_customer = subscription.id_customer
Inner join product on subscription.id_product = product.id_product
Inner join order on product.id_order=order.id_order
Where count (id_order) =! “1”


	•	Get a list of all customers which got a box delivered to them two weeks ago, and the count of boxes that had been delivered to them up to that week (loyalty)
	•	For all our customers, get the date of the latest order delivered to them and include associated product_sku, delivery_date and purchase price. If there were two orders delivered to the same customer on the same date, they should both appear.







# database
