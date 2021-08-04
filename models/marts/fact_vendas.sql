with pedido as (

    select *
    from {{ ref('stg_pedido')}}

),
pedido_detalhes as (
        select *
        from {{ ref('stg_pedido_detalhes') }}

),
juntar_chaves as (
        select *
        from pedido
        inner join pedido_detalhes on pedido.salesorderid = pedido_detalhes.salesorderid_pd
)
select * from juntar_chaves