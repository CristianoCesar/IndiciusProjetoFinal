with dados_fonte as (
    select
    row_number() over (order by addressid) as sk_endereco_pessoa
    ,modifieddate as modifieddate_ep
    ,rowguid as rowguid_ep
    ,addresstypeid
    ,businessentityid as businessentityid_ep
    ,addressid as addressid_ep
    ,_sdc_sequence as _sdc_sequence_ep
    ,_sdc_table_version as _sdc_table_version_ep
    ,_sdc_received_at as _sdc_received_at_ep
    ,_sdc_batched_at as _sdc_batched_at_ep
    from {{ source('adventureworks_raw_data', 'businessentityaddress' )}}
)

select * 
from dados_fonte