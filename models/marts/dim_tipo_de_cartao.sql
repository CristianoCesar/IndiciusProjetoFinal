with staging as (

    select *
    from {{ ref('stg_tipo_de_cartao')}}

)

select * from staging