with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        purchse_price,
        CAST(purchse_price as FLOAT64) as purchase_price

    from source

)

select * from renamed
