$(function () {
    $('.popup-modal').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#username',
        modal: true
    });
    $(document).on('click', '.popup-modal-dismiss', function (e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
});

function writeCoordinates(c){
    $('#user_avatar_crop_x').val(c.x);
    $('#user_avatar_crop_y').val(c.y);
    $('#user_avatar_crop_width').val(c.w);
    $('#user_avatar_crop_height').val(c.h);

}


