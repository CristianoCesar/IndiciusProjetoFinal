with cliente as (

    select *
    from {{ ref('stg_cliente')}}

),
pessoa as (
        select *
        from {{ ref('stg_pessoa') }}

),
juntar_chaves as (
        select *
        from cliente
        inner join pessoa on cliente.personid = pessoa.businessentityid_p
)

select * from juntar_chaves