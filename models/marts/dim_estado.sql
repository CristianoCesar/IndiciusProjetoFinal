with staging as (

    select *
    from {{ ref('stg_estado')}}

)

select * from staging