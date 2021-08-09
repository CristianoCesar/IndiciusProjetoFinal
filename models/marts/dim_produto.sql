with produto as (

    select *
    from {{ ref('stg_produto')}}

),
pedido_detalhes as (
        select *
        from {{ ref('stg_pedido_detalhes') }}

),
juntar_chaves as (
        select *
        from produto
        left join pedido_detalhes on produto.productid = pedido_detalhes.productid_pd
)

select * from juntar_chaves