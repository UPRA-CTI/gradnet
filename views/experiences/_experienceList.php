<?php

use yii\helpers\Html;
?>
<div class="row">
  <div class="col-sm-12">
    <ul class="list-group">
      <?php foreach ($experiences as $key => $event): ?>
        <li class="list-group-item">
          <?= $this->render('_experienceEvent', ['event' => $event]); ?>
        </li>
      <?php endforeach; ?>
    </ul>
  </div>
</div>
