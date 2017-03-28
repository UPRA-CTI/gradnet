<?php

/**
* Documentation for BaseUser 
* https://github.com/dektrium/yii2-user/blob/master/models/User.php
*
*/

namespace app\models;

use Yii;

use dektrium\user\models\User as BaseUser;

class User extends BaseUser;
{
    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('db');
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grad_users';
    }

    /**
    * @return bool
    */
    public function isActive()
    {
        return ($this->status === self::STATUS_ACTIVE)? 'Active' : 'Deleted';
    }
}
