with endereco_pessoa as (

    select *
    from {{ ref('stg_endereco_pessoa') }}

),
cidade as (

    select *
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