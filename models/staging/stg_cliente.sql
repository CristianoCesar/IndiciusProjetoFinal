with dados_fonte as (
    select
    row_number() over (order by customerid) as sk_cliente
    ,personid
    ,territoryid
    ,storeid
    ,customerid
    from {{ source('adventureworks_raw_data', 'customer' )}}
)

select * 
from dados_fonte