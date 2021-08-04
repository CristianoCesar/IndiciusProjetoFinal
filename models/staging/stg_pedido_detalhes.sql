with dados_fonte as (
    select
    row_number() over (order by salesorderdetailid) as sk_pedido_detalhes
    ,orderqty
    ,salesorderid as salesorderid_pd
    ,salesorderdetailid
    ,unitprice
    ,specialofferid
    ,modifieddate as modifieddate_pd
    ,rowguid as rowguid_pd
    ,_sdc_table_version as _sdc_table_version_pd
    ,productid as productid_pd
    ,_sdc_received_at as _sdc_received_at_pd
    ,_sdc_sequence as _sdc_sequence_pd
    ,_sdc_batched_at as _sdc_batched_at_pd
    ,carriertrackingnumber
    ,unitpricediscount  
    from {{ source('adventureworks_raw_data', 'salesorderdetail' )}}
)
select * 
from dados_fonte