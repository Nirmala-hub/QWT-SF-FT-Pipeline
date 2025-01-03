{{config(materialized ='table', schema = 'transforming')}}

select o.orderid,od.lineno,o.customerid,o.shipperid,o.employeeid,
od.productid,od.quantity,od.unitprice,od.discount,od.orderdate,
 (od.unitprice*od.quantity)*(1-od.discount) as linesalesamount,
p.unitcost*od.quantity as costofgoodssold,
((od.unitprice*od.quantity)*(1-od.discount))-(p.unitcost*od.quantity) as margin
 from 
{{ref('stg_orders')}} o
inner join {{ref('stg_orderdetails')}} od on
od.orderid =o.orderid
inner join {{ref('stg_products')}} p
on od.productid=p.productid
