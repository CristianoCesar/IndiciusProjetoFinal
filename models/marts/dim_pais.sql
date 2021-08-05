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
pais as (

    select *
    from {{ ref('stg_pais')}}

),
juntar_chaves as (
        select *
        from endereco_pessoa
        inner join cidade on endereco_pessoa.addressid_ep = cidade.addressid
        inner join estado on cidade.stateprovinceid_c = estado.stateprovinceid  
        inner join pais on estado.countryregioncode_e = pais.countryregioncode     
)

select * from juntar_chaves

