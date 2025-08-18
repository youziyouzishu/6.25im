<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_Id 用户
 * @property int $chat_type 1=单聊 2=群聊
 * @property int $msg_type 1=文本 2=图片 3=语音 4=视频 5=文件 6=聊天记录
 * @property string|null $content 文本内容或文件信息(JSON)
 * @property string|null $file_url 本地/对象存储的文件路径
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Favorites newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Favorites newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Favorites query()
 * @mixin \Eloquent
 */
class Favorites extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_favorites';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id',
        'chat_type',
        'msg_type',
        'content',
        'file_url'
    ];


    
    
    
}
