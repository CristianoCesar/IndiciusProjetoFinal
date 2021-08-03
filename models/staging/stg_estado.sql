with dados_fonte as (
    select
    row_number() over (order by stateprovinceid) as sk_estado
    ,stateprovinceid
    ,countryregioncode	
    ,modifieddate
    ,rowguid	
    ,name
    ,_sdc_table_version
    ,territoryid
    ,_sdc_received_at	
    ,_sdc_sequence
    ,isonlystateprovinceflag	
    ,_sdc_batched_at
    ,stateprovincecode
    from {{ source('adventureworks_raw_data', 'stateprovince' )}}
)
select * 
from dados_fonte