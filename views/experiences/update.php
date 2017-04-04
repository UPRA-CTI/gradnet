<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Experience */

$this->title = 'Update Experience: ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Experiences', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="experience-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <!--<button type = "button" class="btn btn-primary" value = ""> <i class="material-icons">info_outline</i> Editar.. </button>-->
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
