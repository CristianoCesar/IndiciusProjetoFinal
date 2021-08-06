with
    cidade as (
        select
        sk_cidade
        ,stateprovinceid_c
        ,businessentityid_ep 
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
        ,businessentityid_ep
        from {{ref('dim_estado')}}
    )
    , motivo_da_venda as (
        select
        sk_motivo_da_venda
        ,salesreasonid
        from {{ref('dim_motivo_da_venda')}}
    )
    , pais as (
        select
        sk_pais
        ,countryregioncode
        ,businessentityid_ep
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
    ,vendedor as (
        select
        sk_vendedor
        ,businessentityid
        from {{ref('dim_vendedor')}}
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
        ,vendedor.sk_vendedor as fk_vendedor
        ,pedido.purchaseordernumber	
        ,pedido.shipmethodid	
        ,pedido.salesorderid	
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
        left join cidade cidade on pedido.businessentityid = cidade.businessentityid_ep
        left join cliente cliente on pedido.customerid = cliente.customerid
        left join estado estado on pedido.businessentityid = estado.businessentityid_ep
        left join motivo_da_venda motivo_da_venda on pedido.salesorderid = motivo_da_venda.salesorderid
        left join pais pais on pedido.businessentityid = pais.businessentityid_ep
        left join tipo_de_cartao tipo_de_cartao on pedido.creditcardid = tipo_de_cartao.creditcardid
        left join vendedor vendedor on pedido.businessentityid = vendedor.businessentityid
    )
    ,pedido_detalhes_com_sk as (
        select 
        pedido_detalhes.salesorderdetailid
        ,produto.sk_produto as fk_produto
        ,pedido_detalhes.orderqty
	    ,pedido_detalhes.salesorderdetailid	
        ,pedido_detalhes.unitprice
        from {{ ref('stg_pedido_detalhes') }} pedido_detalhes
        left join produto produto on pedido_detalhes.productid = produto.productid

    ),
    final as (
        select 
        pedido_detalhes.salesorderid
        ,pedido.fk_cidade
        ,pedido.fk_cliente
        ,pedido.fk_estado
        ,pedido.fk_motivo_da_venda
        ,pedido.fk_pais
        ,pedido.fk_tipo_de_cartao
        ,pedido.fk_vendedor
        ,pedido.purchaseordernumber	
        ,pedido.shipmethodid	
        ,pedido.salesorderid	
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
        ,pedido_detalhes.orderqty
	    ,pedido_detalhes.salesorderdetailid	
        ,pedido_detalhes.unitprice

        from pedido_com_sk pedido
        inner join pedido_detalhes_com_sk pedido_detalhes on pedido.salesorderid = pedido_detalhes.salesorderid_pd
    )
select * from final