with dados_fonte as (
    select
    row_number() over (order by creditcardid) as sk_tipo_de_cartao
    ,cardtype
    ,expyear
    ,modifieddate
    ,_sdc_table_version
    ,expmonth
    ,_sdc_received_at
    ,_sdc_sequence
    ,cardnumber
    ,creditcardid
    ,_sdc_batched_at    
    from {{ source('adventureworks_raw_data', 'creditcard' )}}
)
select * 
from dados_fonte