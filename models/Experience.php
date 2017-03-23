<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grad_experience".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $location_id
 * @property integer $category_id
 * @property string $title
 * @property string $sub_title
 * @property string $description
 * @property integer $date_from
 * @property integer $date_to
 * @property integer $is_active
 * @property integer $updated_at
 * @property integer $created_at
 *
 * @property GradUsers $user
 * @property GradLocations $location
 * @property ExperienceCategory $category
 */
class Experience extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grad_experience';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'location_id', 'category_id', 'date_from', 'date_to', 'is_active', 'updated_at', 'created_at'], 'integer'],
            [['description'], 'string'],
            [['title', 'sub_title'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => Profile::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['location_id'], 'exist', 'skipOnError' => true, 'targetClass' => Location::className(), 'targetAttribute' => ['location_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Id',
            'user_id' => 'User ID',
            'location_id' => 'Lugar',
            'category_id' => 'Tipo de Experiencia',
            'title' => 'Título',
            'sub_title' => 'Nombre',
            'description' => 'Descripción',
            'date_from' => 'Fecha de Comienzo',
            'date_to' => 'Fecha de Final',
            'is_active' => 'Activo?',
            'updated_at' => 'Fecha Actualizado',
            'created_at' => 'Fecha Creado',
        ];
    }

    /**
    * @return string
    */
    public function getDate()
    {
        return (!empty($this->date_to))?
            $this->date_from.' al '. $this->date_to :
            $this->date_from.' al Presente';
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfile()
    {
        return $this->hasOne(Profile::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocation()
    {
        return $this->hasOne(Location::className(), ['id' => 'location_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }
}
