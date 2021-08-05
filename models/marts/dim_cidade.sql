with cidade as (

    select *
    from {{ ref('stg_cidade')}}

),
endereco_pessoa as (
        select *
        from {{ ref('stg_endereco_pessoa') }}

),
juntar_chaves as (
        select *
        from cidade
        inner join endereco_pessoa on cidade.addressid =endereco_pessoa.addressid_ep
)

select * from juntar_chaves