with staging as (

    select *
    from {{ ref('stg_produto')}}

)

select * from staging