with dados_fonte as (
    select
    row_number() over (order by customerid) as sk_cliente
    ,personid
    ,modifieddate
    ,rowguid
    ,_sdc_table_version
    ,territoryid
    ,_sdc_received_at
    ,_sdc_sequence
    ,storeid
    ,customerid
    ,_sdc_batched_at
    from {{ source('adventureworks_raw_data', 'customer' )}}
)

select * 
from dados_fonte