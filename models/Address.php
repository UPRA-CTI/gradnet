<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grad_addresses".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $address1
 * @property string $address2
 * @property string $city
 * @property integer $zipcode
 * @property string $state_id
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property GradUsers $user
 */
class Address extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grad_addresses';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'zipcode', 'created_at', 'updated_at'], 'integer'],
            [['address1', 'address2', 'city'], 'string', 'max' => 256],
            [['state_id'], 'string', 'max' => 2],
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
            'address1' => 'Dirección #1',
            'address2' => 'Dirección #2',
            'city' => 'Ciudad',
            'zipcode' => 'Código Postal',
            'state_id' => 'State ID',
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
