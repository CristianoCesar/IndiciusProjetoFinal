with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_pessoa
    ,lastname
    ,persontype
    ,namestyle
    ,suffix
    ,emailpromotion
    ,title
    ,businessentityid as businessentityid_p 
    ,firstname
    ,middlename   
    from {{ source('adventureworks_raw_data', 'person' )}}
)
select * 
from dados_fonte