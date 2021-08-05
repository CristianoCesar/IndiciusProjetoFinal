with dados_fonte as (
    select
    row_number() over (order by stateprovinceid) as sk_estado
    ,stateprovinceid
    ,countryregioncode as countryregioncode_e
    ,modifieddate as modifieddate_e
    ,rowguid as rowguid_e	
    ,name
    ,_sdc_table_version as _sdc_table_version_e
    ,territoryid
    ,_sdc_received_at as _sdc_received_at_e	
    ,_sdc_sequence as _sdc_sequence_e
    ,isonlystateprovinceflag	
    ,_sdc_batched_at as _sdc_batched_at_e
    ,stateprovincecode
    from {{ source('adventureworks_raw_data', 'stateprovince' )}}
)
select * 
from dados_fonte