<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property string $title 标题
 * @property string $version 版本号
 * @property string $content 描述
 * @property string $url 链接
 * @property integer $weigh 权重
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class Version extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_version';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';
    
    
    
}
