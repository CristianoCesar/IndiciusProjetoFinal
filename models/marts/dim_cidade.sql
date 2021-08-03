with staging as (

    select *
    from {{ ref('stg_cidade')}}

)

select * from staging