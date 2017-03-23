<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "experience_category".
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property integer $is_active
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property GradExperience[] $gradExperiences
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'experience_category';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['is_active', 'created_at', 'updated_at'], 'integer'],
            [['name'], 'string', 'max' => 128],
            [['description'], 'string', 'max' => 255],
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
            'is_active' => 'Activo?',
            'created_at' => 'Fecha Creado',
            'updated_at' => 'Fecha Actualizado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGradExperiences()
    {
        return $this->hasMany(GradExperience::className(), ['category_id' => 'id']);
    }
}
