with dados_fonte as (
    select
    row_number() over (order by salesreasonid) as sk_motivo_da_venda
    ,reasontype
    ,name
    ,salesreasonid
    from {{ source('adventureworks_raw_data', 'salesreason' )}}
)
select * 
from dados_fonte