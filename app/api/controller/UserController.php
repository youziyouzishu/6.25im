<?php

namespace app\api\controller;

use app\admin\model\User;
use app\api\basic\Base;
use support\Request;
use support\Response;
use Tencent\TLSSigAPIv2;
use Tinywan\Jwt\Exception\JwtRefreshTokenExpiredException;

class UserController extends Base
{
    /**
     * 用户详情
     * @param Request $request
     * @return \support\Response
     */
    function getUserInfo(Request $request)
    {
        $user_id = $request->input('user_id');
        if (!$user_id) {
            $user_id = $request->user_id;
        }
        $row = User::find($user_id);
        if (!$row) {
            throw new JwtRefreshTokenExpiredException();
        }
        return $this->success('成功', $row);
    }

    /**
     * 编辑用户信息
     * @param Request $request
     * @return Response
     */
    function editUserInfo(Request $request)
    {
        $param = $request->post();
        $fields = ['nickname', 'avatar', 'sex', 'birthday','password'];
        foreach ($param as $key => $value) {
            if (!in_array($key, $fields)) {
                unset($param[$key]);
            }
            if ($key == 'sex') {
                $param[$key] = strval($value);
            }
            if ($key == 'password') {
                $param[$key] = password_hash($value, PASSWORD_DEFAULT);
            }
        }
        $row = User::find($request->user_id);
        $row->fill($param);
        $row->save();
        return $this->success('成功');
    }

    /**
     * 获取im签名
     * @param Request $request
     * @return Response
     * @throws \Exception
     */
    function getTLSSig(Request $request)
    {
        $api = new TLSSigAPIv2(1600098449, 'f88e37560d1891b56730e4e629e428ffdebcc6479e7bb35c0546b58920b395ea'); // 替换为实际AppID和密钥
        $sign = $api->genUserSig($request->user_id);
        return $this->success('成功', ['sign' => $sign]);
    }

}
