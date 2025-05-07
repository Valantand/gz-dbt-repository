{{ config(materialized='table') }}

SELECT
    date_date,
    paid_source
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click,
    'adwords' AS source
FROM {{ ref('stg_raw__adwords') }}

UNION ALL

SELECT
    date_date,
    paid_source
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click,
    'bing' AS source
FROM {{ ref('stg_raw__bing') }}

UNION ALL

SELECT
    date_date,
    paid_source
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click,
    'criteo' AS source
FROM {{ ref('stg_raw__criteo') }}

UNION ALL

SELECT
    date_date,
    paid_source
    campaign_key,
    campaign_name,
    ads_cost,
    impression,
    click,
    'facebook' AS source
FROM {{ ref('stg_raw__facebook') }}
