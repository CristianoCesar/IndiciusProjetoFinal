with dados_fonte as (
    select
    row_number() over (order by salesorderdetailid) as sk_pedido_detalhes
    ,orderqty
    ,salesorderid as salesorderid_pd
    ,salesorderdetailid
    ,unitprice
    ,specialofferid   
    ,productid as productid_pd
    ,carriertrackingnumber
    ,unitpricediscount  
    from {{ source('adventureworks_raw_data', 'salesorderdetail' )}}
)
select * 
from dados_fonte