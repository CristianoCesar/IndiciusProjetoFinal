with dados_fonte as (
    select
    row_number() over (order by businessentityid) as sk_funcionario
    ,businessentityid as businessentityid_f
    ,nationalidnumber
    ,sickleavehours
    ,loginid
    ,currentflag
    ,gender
    ,hiredate
    ,salariedflag
    ,birthdate
    ,maritalstatus
    ,organizationnode
    ,vacationhours
    ,jobtitle
    from {{ source('adventureworks_raw_data', 'employee' )}}
)
select * 
from dados_fonte