with dados_fonte as (
    select
    row_number() over (order by addressid) as sk_endereco_pessoa
    ,addresstypeid
    ,businessentityid as businessentityid_ep
    ,addressid as addressid_ep
    from {{ source('adventureworks_raw_data', 'businessentityaddress' )}}
)

select * 
from dados_fonte