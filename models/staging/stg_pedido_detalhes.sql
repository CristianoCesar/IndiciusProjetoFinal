with dados_fonte as (
    select
    row_number() over (order by salesorderdetailid) as sk_pedido_detalhes
    ,orderqty
    ,salesorderid
    ,salesorderdetailid
    ,unitprice
    ,specialofferid
    ,modifieddate
    ,rowguid
    ,_sdc_table_version
    ,productid
    ,_sdc_received_at
    ,_sdc_sequence
    ,_sdc_batched_at
    ,carriertrackingnumber
    ,unitpricediscount  
    from {{ source('adventureworks_raw_data', 'salesorderdetail' )}}
)
select * 
from dados_fonte