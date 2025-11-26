select
    om.*,
    round(om.margin + s.shipping_fee - s.logcost - ship_cost, 2) as operational_margin
from {{ ref("int_orders_margin") }} as om
left join {{ ref("stg_raw__ship") }} as s using (orders_id)
