with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_vendedor
,salesquota
,modifieddate
,rowguid
,saleslastyear
,commissionpct
,_sdc_table_version
,territoryid
,bonus
,_sdc_received_at
,_sdc_sequence
,businessentityid
,_sdc_batched_at
,salesytd  
    from {{ source('adventureworks_raw_data', 'salesperson' )}}
)
select * 
from dados_fonte