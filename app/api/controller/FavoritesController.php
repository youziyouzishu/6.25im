<?php

namespace app\api\controller;

use app\admin\model\Favorites;
use app\api\basic\Base;
use support\Request;

class FavoritesController extends Base
{
    /**
     * 收藏
     * @param Request $request
     * @return \support\Response
     */
    function doFavority(Request $request)
    {
        $params = array_filter($request->post());
        $params['user_id'] = $request->user_id;
        Favorites::create($params);
        return $this->success();
    }

}
