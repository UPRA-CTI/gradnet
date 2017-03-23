$( document ).ready(function() {
    var parameters = {
      id: '<?= $model->id; ?>'
    };

    $.get("/experiences/view?"+ $params(parameters), function (data) {
        $("#gn-experience-timeline").html(data);
    });
});
