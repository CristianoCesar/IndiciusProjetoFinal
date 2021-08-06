with dados_fonte as (
    select
    row_number() over (order by creditcardid) as sk_tipo_de_cartao
    ,cardtype
    ,expyear
    ,expmonth
    ,cardnumber
    ,creditcardid    
    from {{ source('adventureworks_raw_data', 'creditcard' )}}
)
select * 
from dados_fonte