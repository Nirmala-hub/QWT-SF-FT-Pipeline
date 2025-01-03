{{config(materialized ='table', schema = 'transforming')}}

select a.customerid,a.companyname,a.contactname,a.city,a.country,
b.divisionname,a.address,a.fax,a.phone,a.PostalCode
,case when a.StateProvince ='' then 'NA'
else a.StateProvince end as StateProvince
from 
{{ref('stg_customers')}} a
left join {{ref('lkp_divisions')}} b on
a.divisionid =b.divisionid
