with staging as (

    select 
    sk_estado
    ,stateprovinceid
    ,countryregioncode_e
    ,name	
    ,territoryid	
    ,isonlystateprovinceflag	
    ,stateprovincecode
    from {{ ref('stg_estado')}}
)
select * from staging