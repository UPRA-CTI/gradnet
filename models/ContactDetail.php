<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grad_contact_details".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $phone_number1
 * @property integer $phone_number2
 * @property string $phone_type
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property GradUsers $user
 */
class ContactDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grad_contact_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'phone_number1', 'phone_number2', 'created_at', 'updated_at'], 'integer'],
            [['phone_type'], 'string', 'max' => 128],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => GradUsers::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'phone_number1' => 'Phone Number1',
            'phone_number2' => 'Phone Number2',
            'phone_type' => 'Phone Type',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(GradUsers::className(), ['id' => 'user_id']);
    }
}
