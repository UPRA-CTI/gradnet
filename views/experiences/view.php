<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Experience */

$this->title = '';
$this->params['breadcrumbs'][] = ['label' => 'Experiences', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
  <div class="col-sm-12">
    <div class="panel panel-default">
      <div class="panel-body"> 
        <h2><?= Html::encode($this->title) ?></h2>
          <?= $this->render('_experienceList', ['experiences' => $experiences]); ?>
        <h2></h2>
      </div>
    </div>
  </div>
</div>
