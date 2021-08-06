with dados_fonte as (
    select
    row_number() over (order by addressid) as sk_cidade
    ,stateprovinceid as stateprovinceid_c
    ,city
    ,addressline2
    ,postalcode
    ,spatiallocation
    ,addressid 
    from {{ source('adventureworks_raw_data', 'address' )}}
)

select * 
from dados_fonte