with staging as (

    select *

    from {{ ref('stg_pedido')}}
)
select * from staging