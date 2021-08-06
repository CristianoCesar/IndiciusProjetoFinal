with cidade as (

    select *
    from {{ ref('stg_cidade')}}

),
endereco_pessoa as (
        select
        sk_endereco_pessoa
        ,businessentityid_ep
        ,addressid_ep
          
        from {{ ref('stg_endereco_pessoa') }}

),
juntar_chaves as (
        select *
        from endereco_pessoa
        inner join cidade on endereco_pessoa.addressid_ep = cidade.addressid
)

select * from juntar_chaves