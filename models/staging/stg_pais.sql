with dados_fonte as (
    select
    row_number() over (order by countryregioncode) as sk_pais
    ,countryregioncode
    ,name
    from {{ source('adventureworks_raw_data', 'countryregion' )}}
)
select * 
from dados_fonte