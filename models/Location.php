<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grad_locations".
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property string $address
 * @property string $address2
 * @property string $state
 * @property integer $state_id
 * @property string $city
 * @property integer $zipcode
 * @property integer $type_id
 * @property string $phone1
 * @property string $phone2
 * @property string $contact_email
 * @property string $contact_email2
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property GradExperience[] $gradExperiences
 */
class Location extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grad_locations';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['state_id', 'zipcode', 'type_id', 'created_at', 'updated_at'], 'integer'],
            [['name', 'address', 'address2', 'state', 'city'], 'string', 'max' => 255],
            [['phone1', 'phone2', 'contact_email', 'contact_email2'], 'string', 'max' => 128],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Id',
            'name' => 'Nombre',
            'description' => 'Descripción',
            'address' => 'Dirección Postal',
            'address2' => 'Dirección Física',
            'state' => 'Estado',
            'state_id' => 'Estado',
            'city' => 'Ciudad',
            'zipcode' => 'Código Postal',
            'type_id' => 'Tipo de Localización, Compañía',
            'phone1' => 'Teléfono #1',
            'phone2' => 'Teléfono #2',
            'contact_email' => 'Correo Electrónico',
            'contact_email2' => 'Correo Electrónico #2',
            'created_at' => 'Fecha Creado',
            'updated_at' => 'Fecha Actualizado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGradExperiences()
    {
        return $this->hasMany(GradExperience::className(), ['location_id' => 'id']);
    }
}
