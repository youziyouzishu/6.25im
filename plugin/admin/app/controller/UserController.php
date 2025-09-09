<?php

namespace plugin\admin\app\controller;

use app\api\service\TencentIM;
use plugin\admin\app\model\User;
use support\exception\BusinessException;
use support\Request;
use support\Response;
use Throwable;

/**
 * 用户管理 
 */
class UserController extends Crud
{
    
    /**
     * @var User
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new User;
    }

    /**
     * 浏览
     * @return Response
     * @throws Throwable
     */
    public function index(): Response
    {
        return raw_view('user/index');
    }

    /**
     * 插入
     * @param Request $request
     * @return Response
     * @throws BusinessException|Throwable
     */
    public function insert(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $nickname = $request->input('nickname');
            $password = $request->input('password');
            $sex = $request->input('sex');
            $avatar = $request->input('avatar');
            $mobile = $request->input('mobile');
            $mobile_has = User::where(['mobile' => $mobile])->exists();
            if ($mobile_has) {
                return $this->fail('手机号已存在');
            }
            return parent::insert($request);
        }
        return raw_view('user/insert');
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException|Throwable
     */
    public function update(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $nickname = $request->input('nickname');
            $password = $request->input('password');
            $sex = $request->input('sex');
            $avatar = $request->input('avatar');
            $mobile = $request->input('mobile');
            $id = $request->input('id');
            if (isset($sex) && isset($nickname) && isset($avatar)) {
                if ($sex == 1) {
                    $Tag_Profile_IM_Gender = 'Gender_Type_Male';
                } else {
                    $Tag_Profile_IM_Gender = 'Gender_Type_Female';
                }
                $res = TencentIM::getInstance()->portraitSet($id, [
                    [
                        'Tag' => 'Tag_Profile_IM_Nick',
                        'Value' => $nickname
                    ],
                    [
                        'Tag' => 'Tag_Profile_IM_Gender',
                        'Value' => $Tag_Profile_IM_Gender
                    ],
                    [
                        'Tag' => 'Tag_Profile_IM_Image',
                        'Value' => 'https://wzxinnan.top' . $avatar
                    ],
                ]);
            }
            return parent::update($request);
        }
        return raw_view('user/update');
    }

}
