select
    s.date_date,
    s.orders_id,
    p.products_id,
    s.revenue,
    p.purchase_price,
    s.quantity,
    round(s.quantity * p.purchase_price, 2) as purchase_cost,
    round(s.revenue - p.purchase_price * s.quantity, 2) as margin
from {{ ref("stg_raw__sales") }} as s
left join {{ ref("stg_raw__product") }} as p using (products_id)
