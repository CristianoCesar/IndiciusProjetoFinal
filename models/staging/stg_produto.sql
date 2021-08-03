with dados_fonte as (
    select
    row_number() over (order by productid) as sk_produto
    ,sellenddate
    ,safetystocklevel
    ,finishedgoodsflag
    ,class
    ,makeflag
    ,productnumber
    ,reorderpoint
    ,modifieddate
    ,rowguid
    ,productmodelid
    ,weightunitmeasurecode
    ,standardcost
    ,name
    ,_sdc_table_version
    ,style
    ,sizeunitmeasurecode
    ,productid
    ,productsubcategoryid
    ,_sdc_received_at
    ,_sdc_sequence
    ,listprice
    ,daystomanufacture
    ,productline
    ,size
    ,_sdc_batched_at
    ,color
    ,sellstartdate
    ,weight
    from {{ source('adventureworks_raw_data', 'product' )}}
)
select * 
from dados_fonte