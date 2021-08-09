with estado as (

    select *
 
    from {{ ref('stg_estado')}}
),
cidade as (
        select *
            
        from {{ ref('stg_cidade') }}

),
juntar_chaves as (
        select *
        from cidade
        left join estado on cidade.stateprovinceid_c = estado.stateprovinceid
)

select * from juntar_chaves