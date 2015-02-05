$( document ).ready(function() {

    $('#invite-user').click(function(e) {
        var newForm = $('<div><input name="email[]" type="text" /></div>');
        $('#invite-user-container').append(newForm)
        newForm.hide().slideToggle('fast');
    })
});