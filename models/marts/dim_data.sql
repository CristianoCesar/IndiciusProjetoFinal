with staging as (

    select 
    sk_pedido
    ,salesorderid
    ,orderdate
    from {{ ref('stg_pedido')}}
)
select * from staging