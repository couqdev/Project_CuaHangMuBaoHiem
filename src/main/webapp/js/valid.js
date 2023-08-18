var password = $('#password'),
    confirm_pw = $('#confirm_pw'),
    bt_submit = $('#submit')

$('form p').hide();

function checkPass() {
    if (password.val().length >= 6) {
        password.next().fadeOut('fast');
    } else {
        password.next().fadeIn('fast');
    }
}

function checkConfirm() {
    if (password.val() === confirm_pw.val()) {
        confirm_pw.next().fadeOut('fast');
    } else {
        confirm_pw.next().fadeIn('fast');
    }
}

function isValid() {
    return password.val() > 6 && password.val() === confirm_pw.val();
}

function enableSubmit() {
    bt_submit.prop('disabled', !isValid());
}

password.focus(function () {
    checkPass();
    checkConfirm();
    enableSubmit();
}).keyup(function () {
    checkPass();
    checkConfirm();
    enableSubmit();
});

confirm_pw.focus(function () {
    checkConfirm();
    enableSubmit();
}).keyup(function () {
    checkConfirm();
    enableSubmit();
});
enableSubmit();