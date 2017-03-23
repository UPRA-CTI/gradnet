<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Profile */

use yii\web\View;
$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$this->registerAssetBundle(yii\web\JqueryAsset::className(), View::POS_HEAD);
?>
<div class="profile-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <!-- <p>
        <?php //= Html::a('Update', ['update', 'id' => $model->user_id], ['class' => 'btn btn-primary']) ?>
    </p> -->

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'public_email:email',
            'gravatar_email:email',
            'gravatar_id',
            'location',
            'website',
            'bio:ntext',
        ],
    ]) ?>

    <div class="row">
      <div id="gn-experience-timeline"></div>
    </div>
</div>
<script type="text/javascript">
$( document ).ready(function() {

    $.get('<?= Url::to(['/experiences/view','id' => $model->id]) ?>', function (data) {
        $("#gn-experience-timeline").html(data);
    });
});
</script>
