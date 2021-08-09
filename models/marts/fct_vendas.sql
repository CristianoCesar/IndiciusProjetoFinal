with
    cidade as (
        select
        sk_cidade
        ,stateprovinceid_c
        ,territoryid
        from {{ref('dim_cidade')}}
    )
    , cliente as (
        select
        sk_cliente
        ,customerid
        ,personid
        from {{ref('dim_cliente')}}
    )
    , estado as (
        select
        sk_estado
        ,stateprovinceid
        ,territoryid
        from {{ref('dim_estado')}}
    )
    , motivo_da_venda as (
        select
        sk_motivo_da_venda
        ,salesreasonid
        ,salesorderid
        from {{ref('dim_motivo_da_venda')}}
    )
    , pais as (
        select
        sk_pais
        ,countryregioncode
        ,territoryid
        from {{ref('dim_pais')}}
    )
    ,produto as (
        select
        sk_produto
        ,productid
        from {{ref('dim_produto')}}
    )
    ,tipo_de_cartao as (
        select
        sk_tipo_de_cartao
        ,creditcardid
        from {{ref('dim_tipo_de_cartao')}}
    )
    ,pedido_com_sk as (
        select 
        pedido.salesorderid
        ,cidade.sk_cidade as fk_cidade
        ,cliente.sk_cliente as fk_cliente
        ,estado.sk_estado as fk_estado
        ,motivo_da_venda.sk_motivo_da_venda as fk_motivo_da_venda
        ,pais.sk_pais as fk_pais
        ,tipo_de_cartao.sk_tipo_de_cartao as fk_tipo_de_cartao
        ,pedido.purchaseordernumber	
        ,pedido.shipmethodid    
        ,pedido.billtoaddressid
        ,pedido.salespersonid
        ,pedido.taxamt
        ,pedido.shiptoaddressid
        ,pedido.onlineorderflag	   
        ,pedido.territoryid
        ,pedido.status
        ,pedido.currencyrateid
        ,pedido.orderdate       
        ,pedido.creditcardapprovalcode
        ,pedido.subtotal
        ,pedido.creditcardid
        ,pedido.revisionnumber
        ,pedido.freight
        ,pedido.duedate	
        ,pedido.totaldue	
        ,pedido.customerid	
        ,pedido.shipdate        
        ,pedido.accountnumber

        from {{ ref('stg_pedido')}} pedido
        left join cidade cidade on pedido.territoryid = cidade.territoryid
        left join cliente cliente on pedido.customerid = cliente.customerid
        left join estado estado on pedido.territoryid = estado.territoryid
        left join motivo_da_venda motivo_da_venda on pedido.salesorderid = motivo_da_venda.salesorderid
        left join pais pais on pedido.territoryid = pais.territoryid
        left join tipo_de_cartao tipo_de_cartao on pedido.creditcardid = tipo_de_cartao.creditcardid   
    )

    select * from pedido_com_sk