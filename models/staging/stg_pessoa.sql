with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_pessoa
    ,lastname
    ,persontype
    ,namestyle
    ,suffix
    ,modifieddate as modifieddate_p
    ,rowguid as rowguid_p
    ,_sdc_table_version as _sdc_table_version_p
    ,emailpromotion
    ,_sdc_received_at as _sdc_received_at_p
    ,_sdc_sequence as _sdc_sequence_p
    ,title
    ,businessentityid as businessentityid_p
    ,_sdc_batched_at as _sdc_batched_at_p
    ,firstname
    ,middlename   
    from {{ source('adventureworks_raw_data', 'person' )}}
)
select * 
from dados_fonte