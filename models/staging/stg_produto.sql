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
    ,productmodelid
    ,weightunitmeasurecode
    ,standardcost
    ,name
    ,style
    ,sizeunitmeasurecode
    ,productid
    ,productsubcategoryid
    ,listprice
    ,daystomanufacture
    ,productline
    ,size
    ,color
    ,sellstartdate
    ,weight
    from {{ source('adventureworks_raw_data', 'product' )}}
)
select * 
from dados_fonte