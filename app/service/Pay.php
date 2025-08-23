<?php

namespace app\api\service;


class Pay
{

    public static function pay($pay_amount, $order_no, $mark, $attach)
    {

    }

    public static function generateOrderSn()
    {
        return date('Ymd') . mb_strtoupper(uniqid());
    }
}