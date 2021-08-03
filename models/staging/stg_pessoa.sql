with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_pessoa
    ,lastname
    ,persontype
    ,namestyle
    ,suffix
    ,modifieddate
    ,rowguid
    ,_sdc_table_version
    ,emailpromotion
    ,_sdc_received_at
    ,_sdc_sequence
    ,title
    ,businessentityid
    ,_sdc_batched_at	
    ,firstname
    ,middlename   
    from {{ source('adventureworks_raw_data', 'person' )}}
)
select * 
from dados_fonte