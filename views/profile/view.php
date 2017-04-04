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
// $this->params['breadcrumbs'][] = ['label' => 'Profiles', 'url' => ['index']];
// $this->params['breadcrumbs'][] = $this->title;
$this->registerAssetBundle(yii\web\JqueryAsset::className(), View::POS_HEAD);
?>
<div class="profile-view">
    <div class = "col-sm-12">
        <h1> <?= Html::encode($this->title) ?> </h1>

        <p>
            <?= Html::button('Actualizar Mi Perfil',['value' => Url:: to ('/gradnet/web/profile/update?id=1'),'class' => 'btn btn-primary pull-right', 'id' => 'updatingData']) ?>
        </p> 
        <div class="content" id="infoDetail">
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
        </div>

        <div class="row">
        <p>
            <?= Html::button('<i class="material-icons">note_add</i> Agregar Experiencia',['value' => Url:: to ('/gradnet/web/experiences/create'),'class' => 'btn btn-primary pull-right', 'id' => 'createExperience']) ?>
        </p>
        <div id="gn-experience-timeline"></div>
            <!-- Este botón debe ir incluido en cada experiencia que el usuario tenga... -->
            <!--<p>
                <?= Html::button('Modificar Experiencia',['value' => Url:: to ('/gradnet/web/experiences/update?id=1'),'class' => 'btn btn-primary pull-right', 'id' => 'updatingExperience']) ?>
            </p>-->
        </div>
    </div>
</div>

<script type="text/javascript">
$( document ).ready(function() {

    $.get('<?= Url::to(['/experiences/view','id' => $model->id]) ?>', function (data) {
        $("#gn-experience-timeline").html(data);
    });
});
</script>

