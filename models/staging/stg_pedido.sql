with dados_fonte as (
    select
    row_number() over (order by salesorderid) as sk_pedido
    ,purchaseordernumber
    ,shipmethodid
    ,salesorderid
    ,billtoaddressid
    ,salespersonid
    ,taxamt
    ,shiptoaddressid
    ,onlineorderflag
    ,territoryid
    ,status
    ,currencyrateid
    ,orderdate
    ,creditcardapprovalcode
    ,subtotal
    ,creditcardid
    ,revisionnumber
    ,freight
    ,duedate
    ,totaldue
    ,customerid
    ,shipdate
    ,accountnumber
    from {{ source('adventureworks_raw_data', 'salesorderheader' )}}
)
select * 
from dados_fonte