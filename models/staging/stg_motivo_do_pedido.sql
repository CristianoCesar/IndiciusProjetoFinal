with dados_fonte as (
    select
    row_number() over (order by salesorderid) as sk_motivo_do_pedido
    ,salesorderid
    ,modifieddate
    ,salesreasonid
    ,_sdc_sequence
    ,_sdc_table_version
    ,_sdc_received_at
    ,_sdc_batched_at
    from {{ source('adventureworks_raw_data', 'salesorderheadersalesreason' )}}
)
select * 
from dados_fonte