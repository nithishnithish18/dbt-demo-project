with payments as
(
    select * from {{ ref('stg_payment') }}
)

select
    order_id,
    sum(amount) as total
    from payments
    group by order_id
    having(total < 0)