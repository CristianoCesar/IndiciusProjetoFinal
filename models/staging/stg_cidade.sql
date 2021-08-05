with dados_fonte as (
    select
    row_number() over (order by addressid) as sk_cidade
    ,stateprovinceid as stateprovinceid_c
    ,city
    ,addressline2
    ,modifieddate
    ,rowguid
    ,_sdc_table_version
    ,postalcode
    ,spatiallocation
    ,_sdc_received_at
    ,_sdc_sequence
    ,addressline1
    ,_sdc_batched_at
    ,addressid 
    from {{ source('adventureworks_raw_data', 'address' )}}
)

select * 
from dados_fonte