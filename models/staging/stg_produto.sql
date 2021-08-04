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
    ,modifieddate as modifieddate_p
    ,rowguid as rowguid_p
    ,productmodelid
    ,weightunitmeasurecode
    ,standardcost
    ,name
    ,_sdc_table_version as _sdc_table_version_p
    ,style
    ,sizeunitmeasurecode
    ,productid
    ,productsubcategoryid
    ,_sdc_received_at as _sdc_received_at_p
    ,_sdc_sequence as _sdc_sequence_p
    ,listprice
    ,daystomanufacture
    ,productline
    ,size
    ,_sdc_batched_at as _sdc_batched_at_p
    ,color
    ,sellstartdate
    ,weight
    from {{ source('adventureworks_raw_data', 'product' )}}
)
select * 
from dados_fonte