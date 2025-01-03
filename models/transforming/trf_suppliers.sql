{{config(materialized ='table', schema = 'transforming')}}

select 
GET(XMLGET(suppliersinfo,'SupplierID'),'$') as supplierid,
GET(XMLGET(suppliersinfo,'CompanyName'),'$')::varchar as companyname,
GET(XMLGET(suppliersinfo,'ContactName'),'$')::varchar as contactname,
GET(XMLGET(suppliersinfo,'Address'),'$')::varchar as address,
GET(XMLGET(suppliersinfo,'City'),'$')::varchar as city,
GET(XMLGET(suppliersinfo,'PostalCode'),'$')::varchar as postalcode,
GET(XMLGET(suppliersinfo,'Country'),'$')::varchar as country,
GET(XMLGET(suppliersinfo,'Phone'),'$')::varchar as phone,
GET(XMLGET(suppliersinfo,'Fax'),'$')::varchar as fax
from 
{{ref('stg_suppliers')}} 