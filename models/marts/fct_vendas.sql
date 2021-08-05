with
    cidade (
        select
        cidade_sk
        , stateprovinceid
        from {{ref('dim_cidade')}}
    )
    , cliente as (
        select
        cliente_sk
        , customerid
        from {{ref('dim_cliente')}}
    )
     , estado as (
        select
        estado_sk
        , stateprovinceid
        from {{ref('dim_estado')}}
    )
     , motivo_da_venda as (
        select
        motivo_da_venda_sk
        , salesreasonid
        from {{ref('dim_motivo_da_venda')}}
    )
     , pais as (
        select
        pais_sk
        , countryregioncode
        from {{ref('dim_pais')}}
    )
     ,produto as (
        select
        produto_sk
        , productid
        from {{ref('dim_produto')}}
    )
     ,tipo_de_cartao as (
        select
        tipo_de_cartao_sk
        , creditcardid
        from {{ref('dim_tipo_de_cartao')}}
    )
     ,vendedor as (
        select
        vendedor_sk
        , businessentityid
        from {{ref('dim_vendedor')}}
    )
    


pedido as (

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