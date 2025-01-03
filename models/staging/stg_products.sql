{{config(materialized='table',sort='productid') }}

select 
product_id as productid,
product_name as productname ,
supplier_id as supplierid,
category_id as categoryid,
quantity_per_unit as quantityperunit,
unit_cost as unitprice,
unit_price as unitcost,
units_in_stock as unitsinstock,
units_on_order as unitsonorder from 
{{source ('QWT_RAW','products')}}