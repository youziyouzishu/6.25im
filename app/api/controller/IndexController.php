<?php

namespace app\api\controller;

use app\admin\model\User;
use app\api\basic\Base;
use support\Request;
use Tinywan\Jwt\Exception\JwtRefreshTokenExpiredException;

class IndexController extends Base
{
    protected array $noNeedLogin = ['*'];
    function index()
    {
        $user_id = 10;
        if (!$user_id) {
            $user_id = 10;
        }
        $row = User::find($user_id);
        if (!$row) {
            throw new JwtRefreshTokenExpiredException();
        }
        return $this->success('成功', $row);
    }
}
