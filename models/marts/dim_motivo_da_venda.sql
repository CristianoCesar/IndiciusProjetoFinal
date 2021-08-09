with motivo_da_venda as (

    select *
    from {{ ref('stg_motivo_da_venda')}}

),
motivo_do_pedido as (
        select *
        from {{ ref('stg_motivo_do_pedido') }}

),
juntar_chaves as (
        select *
        from motivo_da_venda
        left join motivo_do_pedido on motivo_da_venda.salesreasonid = motivo_do_pedido.salesreasonid_mp
)

select * from juntar_chaves