with dados_fonte as (
    select
    row_number() over (order by countryregioncode) as sk_pais
    ,countryregioncode
    ,modifieddate
    ,name
    ,_sdc_sequence
    ,_sdc_table_version
    ,_sdc_received_at
    ,_sdc_batched_at
    from {{ source('adventureworks_raw_data', 'countryregion' )}}
)
select * 
from dados_fonte