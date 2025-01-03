{{config(materialized='incremental', unique_key=['orderid','lineno']) }}

select 
a.line_no as lineno,
a.order_id as orderid,
a.product_id as productid,
a.quantity as quantity,
a.unit_price as unitprice,
a.discount as discount,
b.order_date as orderdate
from 
{{source ('QWT_RAW','orderdetails')}} a
inner join {{source ('QWT_RAW','orders')}} b
on a.order_id=b.order_id

{%if is_incremental()%}
where b.order_date>(select max(orderdate)from {{this}})
{%endif%}