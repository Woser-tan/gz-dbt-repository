select
    s.date_date,
    s.orders_id,
    round(SUM(s.revenue), 2) as revenue,
    round(SUM(s.quantity), 2) as quantity,
    round(SUM(s.quantity * p.purchase_price), 2) as purchase_cost,
    round(SUM(s.revenue - p.purchase_price * s.quantity), 2) as margin
from {{ ref("stg_raw__sales") }} as s
left join {{ ref("stg_raw__product") }} as p using (products_id)
group by s.date_date, s.orders_id
