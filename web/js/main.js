$(function() {
    // get the click for updating personal data
    $('#updatingData').click(function() {
        $('#modal').modal('show')
            .find('#modalContent')
            .load($(this).attr('value'));
    });
});