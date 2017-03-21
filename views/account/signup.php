<?php

use yii\helpers\Html;

$this->title = 'Crear Cuenta';

?>
<div class="panel panel-default">
  <div class="panel-body">
    <h1><?= Html::encode($this->title) ?></h1>
    <hr>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
  </div>
</div>
