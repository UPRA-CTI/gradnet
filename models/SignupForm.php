<?php
namespace app\models;

use app\models\User;
use yii\base\Model;
use Yii;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $name;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username','email'], 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This username has already been taken.'],
            [['username','name'], 'string', 'min' => 2, 'max' => 255],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\app\models\User', 'message' => 'This email address has already been taken.'],
        ];
    }

    /**
     * Signs user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if ($this->validate()) {
            try {
                $user = new User();
                $user->username = $this->username;
                $user->email = $this->email;
                $user->name = $this->name;
                $user->status = User::STATUS_ACTIVE;
                $user->setPassword($this->password);
                $user->generateAuthKey();

                $user->save(false);

                return $user;
            } catch (\Exception $e) {
                Yii::error('Failed to Add User. Error: '.$e->getMessage(), 'app');
                return null;
            }
        }
        return null;
    }
}
