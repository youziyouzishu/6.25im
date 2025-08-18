<?php

namespace app\api\controller;

use app\admin\model\Sms;
use app\admin\model\User;
use app\api\basic\Base;
use support\Request;
use support\Response;
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
        $captcha = $request->input('captcha');
        $login_type = $request->input('login_type');#1=验证码登陆 2=密码登陆
        $user = User::where(['mobile' => $mobile])->first();
        if (!$user) {
            return $this->fail('用户不存在');
        }
        if ($login_type == 1) {
            if (!Sms::check($mobile, $captcha, 'login')) {
                return $this->fail('验证码错误');
            }
        }else{
            if (!password_verify($password, $user->password)) {
                return $this->fail('密码错误');
            }
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
        $exists = User::where(['mobile' => $mobile])->exists();
        if ($exists) {
            return $this->fail('用户已存在');
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
        $mobile = $request->input('mobile');
        $exists = User::where(['mobile' => $mobile])->exists();
        return $this->success('成功',['exists' => $exists]);
    }

    /**
     * 刷新令牌
     * @param Request $request
     * @return Response
     */
    function refreshToken(Request $request)
    {
        $res = JwtToken::refreshToken();
        return $this->success('刷新成功', $res);
    }
}
