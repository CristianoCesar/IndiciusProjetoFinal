with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_funcionario
    ,nationalidnumber
    ,sickleavehours
    ,loginid
    ,currentflag
    ,modifieddate as modifieddate_f
    ,rowguid as rowguid_f
    ,gender
    ,hiredate
    ,_sdc_table_version as _sdc_table_version_f
    ,_sdc_received_at as _sdc_received_at_f
    ,_sdc_sequence as _sdc_sequence_f
    ,salariedflag
    ,birthdate
    ,maritalstatus
    ,organizationnode
    ,businessentityid as businessentityid_f
    ,vacationhours
    ,_sdc_batched_at as _sdc_batched_at_f
    ,jobtitle
    from {{ source('adventureworks_raw_data', 'employee' )}}
)
select * 
from dados_fonte