<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $model app\models\Profile */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="profile-form">
<?php Pjax::begin(['id'=>'infoForm']) ?>
    <?php $form = ActiveForm::begin(['options' => ['data-pjax' => true]]); ?>

            <?= $form->field($model, 'user_id')->textInput() ?>

            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'public_email')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'gravatar_email')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'gravatar_id')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'location')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'website')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'bio')->textarea(['rows' => 6]) ?>

            <div class="form-group">
                <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                
            </div>

    <?php ActiveForm::end(); ?> 
    <?php Pjax::end()?> 
</div>

<script type="text/javascript">
   $(document).ready(
       $('#infoForm').on('beforeSubmit', "form#infoForm", function() {
           var form = $(this);

           alert("INSIDE THE FORM SCRIPT");

           if(form.find('.has-error').length) {
               alert("Error!!!")
               return false; 
           }
           //submit form
           $.ajax({
               url: form.attr('action'),
               type: 'post',
               data: form.serialize(),
               timeout: 2000,
               success: function(response) {
                   alert("SUCCESS");
                    $("#modal").modal("toggle");
                    $.pjax.reload({container:"#infoDetail"}); //for pjax update
               }
           });
           return false; 
       })
   );

</script>
