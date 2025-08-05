<?php

namespace app\api\controller;

use app\admin\model\Sms;
use app\admin\model\User;
use app\api\basic\Base;
use support\Request;
use Tinywan\Jwt\JwtToken;

class AccountController extends Base
{
    protected array $noNeedLogin = ['*'];
    /**
     * 登陆
     * @param Request $request
     * @return \support\Response
     */
    function login(Request $request)
    {
        $mobile = $request->input('mobile');
        $password = $request->input('password');
        $user = User::where(['mobile' => $mobile])->first();
        if (!$user) {
            return $this->fail('用户不存在');
        }
        if (!password_verify($password, $user->password)) {
            return $this->fail('密码错误');
        }
        $token = JwtToken::generateToken([
            'id' => $user->id,
            'client' => JwtToken::TOKEN_CLIENT_MOBILE
        ]);
        return $this->success('成功', [
            'user' => $user->refresh(),
            'token' => $token
        ]);
    }

    /**
     * 注册
     * @param Request $request
     * @return \support\Response
     */
    function register(Request $request)
    {
        $mobile = $request->input('mobile');
        $captcha = $request->input('captcha');
        if (!Sms::check($mobile, $captcha, 'register')) {
            return $this->fail('验证码错误');
        }
        $user = User::create([
            'mobile' => $mobile
        ]);
        $token = JwtToken::generateToken([
            'id' => $user->id,
            'client' => JwtToken::TOKEN_CLIENT_MOBILE
        ]);
        return $this->success('成功', [
            'user' => $user->refresh(),
            'token' => $token
        ]);
    }

    /**
     * 判断用户是否存在
     * @param Request $request
     * @return \support\Response
     */
    function mobileIsExists(Request $request)
    {
        dump(1111);
        $mobile = $request->input('mobile');
        dump(2222);
        $exists = User::where(['mobile' => $mobile])->exists();
        dump(3333);
        return $this->success('成功',['exists' => $exists]);
    }
}
