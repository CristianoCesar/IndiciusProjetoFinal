with dados_fonte as (
    select
    row_number() over (order by salesreasonid) as sk_motivo_da_venda
    ,reasontype
    ,modifieddate
    ,name
    ,salesreasonid
    ,_sdc_sequence
    ,_sdc_table_version
    ,_sdc_received_at
    ,_sdc_batched_at
    from {{ source('adventureworks_raw_data', 'salesreason' )}}
)
select * 
from dados_fonte