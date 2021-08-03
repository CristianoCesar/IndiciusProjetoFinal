with staging as (

    select *
    from {{ ref('stg_motivo_da_venda')}}

)

select * from staging