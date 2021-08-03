with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_funcionario
    ,nationalidnumber
    ,sickleavehours
    ,loginid
    ,currentflag
    ,modifieddate
    ,rowguid
    ,gender
    ,hiredate
    ,_sdc_table_version
    ,_sdc_received_at
    ,_sdc_sequence
    ,salariedflag
    ,birthdate
    ,maritalstatus
    ,organizationnode
    ,businessentityid
    ,vacationhours
    ,_sdc_batched_at
    ,jobtitle
    from {{ source('adventureworks_raw_data', 'employee' )}}
)
select * 
from dados_fonte