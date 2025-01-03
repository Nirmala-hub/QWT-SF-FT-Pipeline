{{config(materialized ='table', schema = 'transforming')}}

select a.productid,a.productname
,c.companyname as suppliercompanyname
,c.contactname as suppliercontactname
,c.city as suppliercity
,c.country as suppliercountry
,b.categoryname,a.quantityperunit,
a.unitprice ,a.unitcost,
a.unitprice - a.unitcost as profit
,a.unitsinstock,a.unitsonorder
,case when a.unitsinstock >= a.unitsonorder then 'Yes'
else 'No' end as productavailability
from 
{{ref('stg_products')}} a
left join {{ref('lkp_categories')}} b on
a.categoryid =b.categoryid
left join {{ref('trf_suppliers')}} c on 
a.supplierid = c.supplierid
