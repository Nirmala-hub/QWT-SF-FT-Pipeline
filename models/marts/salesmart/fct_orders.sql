{{config(materalized = 'view' , schema = 'salesmart')}}

select * from 
{{ref('trf_orders')}}