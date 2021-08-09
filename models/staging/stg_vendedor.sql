with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_vendedor
    ,salesquota
    ,saleslastyear
    ,commissionpct
    ,territoryid
    ,bonus
    ,businessentityid
    ,salesytd  
    from {{ source('adventureworks_raw_data', 'salesperson' )}}
)
select * 
from dados_fonte