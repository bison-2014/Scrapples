$( document ).ready(function() {

    $('#invite-user').click(function(e) {
        $('<div><input name="email[]" type="text" /></div>').appendTo('#invite-user-container')
    })
});