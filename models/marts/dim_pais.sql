with staging as (

    select *
    from {{ ref('stg_pais')}}

)

select * from staging