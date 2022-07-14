with payment as(

    select id as payment_id,
    orderid as order_id,
    status as order_status,
    paymentmethod,
    amount/100 as paid_amount
    from stripe.payment
)
select * from payment