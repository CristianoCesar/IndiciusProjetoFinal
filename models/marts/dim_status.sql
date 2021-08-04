with staging as (

    select 
    sk_pedido
    ,salesorderid
    ,status
    from {{ ref('stg_pedido')}}
)
select * from staging