with dados_fonte as (
    select
    row_number() over (order by salesorderid) as sk_motivo_do_pedido
    ,salesorderid
    ,modifieddate as modifieddate_mp
    ,salesreasonid as salesreasonid_mp
    from {{ source('adventureworks_raw_data', 'salesorderheadersalesreason' )}}
)
select * 
from dados_fonte