<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
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

    <p>
        <?= Html::button('Actualizar Perfil',['value' => Url:: to ('/gradnet/web/profile/update?id=2'),'class' => 'btn btn-primary', 'id' => 'updatingData']) ?>
    </p> 

  <?php Pjax::begin(['id'=>'infoDetail']); ?> 
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
                 ]]) ?>
    <?php Pjax::end(); ?>


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

