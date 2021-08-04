with vendedor as (

    select *
    from {{ ref('stg_vendedor')}}

),
funcionario as (

        select *
        from {{ ref('stg_funcionario') }}

),
pessoa as (

        select *
        from {{ ref('stg_pessoa') }}

),
juntar_chaves as (
        select *
        from vendedor
        inner join funcionario on vendedor.businessentityid = funcionario.businessentityid_f
        inner join pessoa on funcionario.businessentityid_f = pessoa.businessentityid_p
)

select * from juntar_chaves