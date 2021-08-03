with dados_fonte as (
    select
    row_number() over (order by salesorderid) as sk_pedido
    ,purchaseordernumber
    ,shipmethodid
    ,salesorderid
    ,billtoaddressid
    ,salespersonid
    ,modifieddate
    ,rowguid
    ,taxamt
    ,shiptoaddressid
    ,onlineorderflag
    ,_sdc_table_version
    ,territoryid
    ,status
    ,currencyrateid
    ,orderdate
    ,_sdc_received_at
    ,_sdc_sequence
    ,creditcardapprovalcode
    ,subtotal
    ,creditcardid
    ,revisionnumber
    ,freight
    ,duedate
    ,totaldue
    ,customerid
    ,shipdate
    ,_sdc_batched_at
    ,accountnumber
    from {{ source('adventureworks_raw_data', 'salesorderheader' )}}
)
select * 
from dados_fonte