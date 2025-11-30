select
    fd.date_date as date,
    fd.operational_margin - cd.ads_cost as ads_margin,
    ROUND(fd.average_basket,2) AS average_basket,
    fd.operational_margin as operational_margin,
    cd.ads_cost as ads_cost,
    cd.ads_impression as ads_impression,
    cd.ads_clicks as ads_clicks,
    fd.quantity as quantity,
    fd.revenue as revenue,
    fd.purchase_cost as purchase_cost,
    fd.margin as margin,
    fd.shipping_fee as shipping_fee,
    fd.log_cost as log_cost,
    fd.ship_cost as ship_cost
from {{ ref("int_campaigns_day") }} as cd
full outer join {{ ref("finance_days") }} as fd using (date_date)
order by date_date desc
