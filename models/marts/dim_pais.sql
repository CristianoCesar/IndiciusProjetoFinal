with estado as (

    select *
 
    from {{ ref('stg_estado')}}
),
pais as (
        select *
            
        from {{ ref('stg_pais') }}

),
juntar_chaves as (
        select *
        from pais
        inner join estado on pais.countryregioncode = estado.countryregioncode_e
)

select * from juntar_chaves