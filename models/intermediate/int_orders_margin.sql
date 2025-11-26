select
    date_date,
    orders_id,
    round(sum(revenue), 2) as revenue,
    round(sum(quantity), 2) as quantity,
    round(sum(quantity * purchase_price), 2) as purchase_cost,
    round(sum(revenue - purchase_price * quantity), 2) as margin
from {{ ref("int_sales_margin") }}
group by date_date, orders_id