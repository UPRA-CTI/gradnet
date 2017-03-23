<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ExperienceSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="experience-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php //= $form->field($model, 'id') ?>

    <?php //= $form->field($model, 'user_id') ?>

    <?php //= $form->field($model, 'location_id') ?>

    <?php //= $form->field($model, 'category_id') ?>

    <?php //= $form->field($model, 'title') ?>

    <?php // echo $form->field($model, 'sub_title') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'date_from') ?>

    <?php // echo $form->field($model, 'date_to') ?>

    <?php // echo $form->field($model, 'is_active') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
