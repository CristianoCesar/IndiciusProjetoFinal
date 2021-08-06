with endereco_pessoa as (

    select 
        sk_endereco_pessoa
        ,businessentityid_ep
        ,addressid_ep
    from {{ ref('stg_endereco_pessoa') }}

),
cidade as (

    select 
        addressid
        ,stateprovinceid_c
    from {{ ref('stg_cidade')}}

),
estado as (

    select *
    from {{ ref('stg_estado')}}

),
juntar_chaves as (
        select *
        from endereco_pessoa
        inner join cidade on endereco_pessoa.addressid_ep = cidade.addressid
        inner join estado on cidade.stateprovinceid_c = estado.stateprovinceid        
)

select * from juntar_chaves