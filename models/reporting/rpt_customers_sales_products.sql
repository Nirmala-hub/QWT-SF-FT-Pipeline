{{config(materialized ='view', schema = 'reporting')}}

select c.companyname,c.contactname,min(o.orderdate) as frist_order_date,
max(orderdate) as recent_order_date,count(p.productid) as number_of_products,
sum(o.quantity) as total_quantity,sum(o.linesalesamount) as total_sales,
avg(margin) as avg_margin
 from 
{{ref('fct_orders')}} o
inner join {{ref('dim_customers')}} c on
o.customerid =c.customerid
inner join {{ref('dim_products')}} p
on o.productid=p.productid
group by 
c.companyname,c.contactname
order by total_sales desc