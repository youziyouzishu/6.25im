<?php

namespace app\api\controller;

use app\api\basic\Base;
use support\Request;

class IndexController extends Base
{
    protected array $noNeedLogin = ['*'];
    function index()
    {
        $str = substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 0, 6);
        echo $str; // 例如 QWERTY
    }
}
