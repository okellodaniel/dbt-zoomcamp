{{
    config(
        materialized='table'
    )
}}

select 
    {{ dbt.safe_cast("locationid", api.Column.translate_type("integer")) }} as locationid,
    borough,
    zone,
    replace(service_zone,'Boro','Green') as service_zone
from {{ref("taxi_zone_lookup")}}