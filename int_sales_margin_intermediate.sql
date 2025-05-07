with sales as (

    select *
    from `dbt_arobert.stg_gwz_raw_data__raw_gz_sales`

),

product as (

    select *
    from `dbt_arobert.stg_gz_raw_data__raw_gz_product`

)

select
    sales.date_date,
    sales.orders_id,
    sales.pdt_id,
    sales.revenue,
    sales.quantity,
    product.purchase_price,
    sales.quantity * product.purchase_price as purchase_cost,
    sales.revenue - (sales.quantity * product.purchase_price) as margin

from sales
inner join product
    on sales.pdt_id = product.products_id
