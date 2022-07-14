with payment as(
    select * from {{ ref('stg_payment') }}
),

orders as(
    select * from   {{ ref('stg_orders') }}
),

fct_order as (
    select
    orders.order_id,
    orders.customer_id,
    sum(payment.paid_amount) as total_amount
    
    from orders 
    inner join  payment
    using (order_id) 
    where payment.order_status = 'success'
    group by orders.order_id,orders.customer_id
)


select * from fct_order