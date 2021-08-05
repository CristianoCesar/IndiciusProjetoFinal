with dados_fonte as (
    select
    row_number() over (order by salesorderid) as sk_motivo_do_pedido
    ,salesorderid
    ,modifieddate as modifieddate_mp
    ,salesreasonid as salesreasonid_mp
    ,_sdc_sequence as _sdc_sequence_mp
    ,_sdc_table_version as _sdc_table_version_mp
    ,_sdc_received_at as _sdc_received_at_mp
    ,_sdc_batched_at as _sdc_batched_at_mp
    from {{ source('adventureworks_raw_data', 'salesorderheadersalesreason' )}}
)
select * 
from dados_fonte