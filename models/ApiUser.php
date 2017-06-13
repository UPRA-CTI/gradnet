<?php

/**
* Documentation for BaseUser 
* https://github.com/dektrium/yii2-user/blob/master/models/User.php
*
*/

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;
use yii\behaviors\TimestampBehavior;
/**
* Used to in authentication of API clients
*/
class ApiUser extends ActiveRecord implements IdentityInterface
{
  const STATUS_DELETED = 0;
  const STATUS_ACTIVE = 10;

  /**
   * @inheritdoc
   */
  public function rules()
  {
      return [
          [['email'],'email'],
          [['username'],'string'],
          [['username'],'unique'],
          ['status', 'default', 'value' => self::STATUS_ACTIVE],
          ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
      ];
  }
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
      return '{{%grad_users}}';
  }
  public function behaviors()
  {
      return [
          TimestampBehavior::className(),
      ];
  }
  public static function findIdentity($id)
  {
      return static::findOne($id);
  }

  public static function findIdentityByAccessToken($token, $type = null)
  {
      return static::findOne(['auth_key' => $token, 'status' => self::STATUS_ACTIVE]);
  }

  public function getId()
  {
      return $this->id;
  }

  public function getAuthKey()
  {
      return $this->authKey;
  }

  public function validateAuthKey($authKey)
  {
      return $this->authKey === $authKey;
  }

      /**
       * Generates password hash from password and sets it to the model
       *
       * @param string $password
       */
      public function setPassword($password)
      {
          $this->password_hash = Yii::$app->security->generatePasswordHash($password);
      }

      /**
       * Generates "remember me" authentication key
       */
      public function generateAuthKey()
      {
          $this->auth_key = Yii::$app->security->generateRandomString();
      }

      /**
       * Generates new password reset token
       */
      public function generatePasswordResetToken()
      {
          $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
      }

      /**
       * Removes password reset token
       */
      public function removePasswordResetToken()
      {
          $this->password_reset_token = null;
      }
      public function getActive()
      {
          return ($this->status === self::STATUS_ACTIVE)? 'Active' : 'Deleted';
      }
}
