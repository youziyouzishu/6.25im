<?php

namespace app\admin\model;


use Carbon\Carbon;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;
use support\Db;


/**
 * 
 *
 * @property int $id 主键
 * @property string|null $username 用户名
 * @property string|null $nickname 昵称
 * @property string|null $password 密码
 * @property string|null $sex 性别
 * @property string|null $avatar 头像
 * @property string|null $email 邮箱
 * @property string|null $mobile 手机
 * @property int|null $level 等级
 * @property string|null $birthday 生日
 * @property string $money 余额(元)
 * @property int $score 积分
 * @property \Illuminate\Support\Carbon|null $last_time 登录时间
 * @property string|null $last_ip 登录ip
 * @property \Illuminate\Support\Carbon|null $join_time 注册时间
 * @property string|null $join_ip 注册ip
 * @property string|null $token token
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property int $role 角色
 * @property int $status 禁用
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User fromTimesGTNow()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User query()
 * @property int|null $height 身高
 * @property int|null $weight 体重
 * @property string|null $address 居住地
 * @property \Illuminate\Support\Carbon|null $vip_expire_time 会员过期时间
 * @property int $chat_num 聊天次数
 * @property-read \Illuminate\Database\Eloquent\Collection<int, User> $followers
 * @property-read \Illuminate\Database\Eloquent\Collection<int, User> $followings
 * @property-read \Illuminate\Database\Eloquent\Collection<int, User> $visitorers
 * @property-read \Illuminate\Database\Eloquent\Collection<int, User> $visitorings
 * @property int $silence 禁言
 * @property \Illuminate\Support\Carbon|null $deleted_at 删除时间
 * @property-read mixed $vip_level
 * @property-read mixed $vip_text
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User withTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User withoutTrashed()
 * @mixin \Eloquent
 */
class User extends Base
{
    use SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_users';


    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'last_time' => 'datetime',
        'join_time' => 'datetime',
        'vip_expire_time' => 'datetime'
    ];

    protected $fillable = [
        'username',
        'nickname',
        'password',
        'sex',
        'avatar',
        'email',
        'mobile',
        'level',
        'birthday',
        'money',
        'score',
        'last_time',
        'last_ip',
        'join_time',
        'join_ip',
        'token',
        'role',
        'status',
        'height',
        'weight',
        'address',
        'vip_expire_time'
    ];

    protected $appends = [
        'vip_text',
        'vip_level'
    ];

    public static function changeMoney($money, $user_id, $memo)
    {
        Db::connection('plugin.admin.mysql')->beginTransaction();
        try {
            $user = self::lockForUpdate()->find($user_id);
            if ($user && $money != 0) {
                $before = $user->money;
                $after = function_exists('bcadd') ? bcadd($user->money, $money, 2) : $user->money + $money;
                //更新会员信息
                $user->money = $after;
                $user->save();
                //写入日志
                UserMoneyLog::create(['user_id' => $user_id, 'money' => $money, 'before' => $before, 'after' => $after, 'memo' => $memo]);
            }
            Db::connection('plugin.admin.mysql')->commit();
        } catch (\Throwable $e) {
            Db::connection('plugin.admin.mysql')->rollback();
            throw $e;
        }
    }

    public function followings()
    {
        // 我关注的人
        return $this->belongsToMany(
            User::class,
            UserLike::class,      // 中间表
            'user_id',      // 当前用户（主动方）
            'to_user_id'    // 目标用户（被关注方）
        );
    }

    public function followers()
    {
        // 关注我的人
        return $this->belongsToMany(
            User::class,
            UserLike::class,     // 中间表
            'to_user_id',    // 当前用户（被关注方）
            'user_id'        // 粉丝（主动方）
        );
    }

    function visitorings()
    {
        // 我访问的人
        return $this->belongsToMany(
            User::class,
            UserVisitor::class,      // 中间表
            'user_id',      // 当前用户（主动方）
            'to_user_id'    // 访问用户（被访问方）
        );
    }

    function visitorers()
    {
        // 访问我的人
        return $this->belongsToMany(
            User::class,
            UserVisitor::class,     // 中间表
            'to_user_id',    // 当前用户（被访问方）
            'user_id'        // 访问用户（主动方）
        );
    }

    function getVipTextAttribute($value)
    {
        $value = $value ? $value : $this->vip_expire_time;
        if ($value == null || $value->isPast()) {
            $vip_text = '普通会员';
        } elseif ($value == '2099-12-31 00:00:00') {
            $vip_text = '永久会员';
        } else {
            $vip_text = '钻石会员';
        }
        return $vip_text;
    }

    function getVipLevelAttribute($value)
    {
        $value = $value ? $value : $this->vip_expire_time;
        if ($value == null || $value->isPast()) {
            $vip_level = 1;
        } elseif ($value == '2099-12-31 00:00:00') {
            $vip_level = 3;
        } else {
            $vip_level = 2;
        }
        return $vip_level;
    }










}
