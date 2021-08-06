with dados_fonte as (
    select
    row_number() over (order by stateprovinceid) as sk_estado
    ,stateprovinceid
    ,countryregioncode as countryregioncode_e
    ,name
    ,territoryid
    ,isonlystateprovinceflag
    ,stateprovincecode
    from {{ source('adventureworks_raw_data', 'stateprovince' )}}
)
select * 
from dados_fonte