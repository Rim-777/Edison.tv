$(function () {
    $('.popup-modal').magnificPopup({
        type: 'inline',
        preloader: true,
        focus: '#username',
        modal: true
    });
    $(document).on('click', '.popup-modal-dismiss', function (e) {
        e.preventDefault();
        $.magnificPopup.close();
    });
});

function writeCoordinates(c) {
    $('#user_avatar_crop_x').val(c.x);
    $('#user_avatar_crop_y').val(c.y);
    $('#user_avatar_crop_width').val(c.w);
    $('#user_avatar_crop_height').val(c.h);

    $('#avatar_preview').css({
            width: Math.round(100 / c.w * $('#crop_avatar').width()) + 'px',
            height: Math.round(100 / c.h * $('#crop_avatar').height()) + 'px',
            marginLeft: '-' + Math.round(100 / c.w * c.x) + 'px',
            marginTop: '-' + Math.round(100 / c.h * c.y) + 'px'

        }
    )
}

function crop_avatar(){
    $('#crop_avatar').Jcrop({
            onSelect: writeCoordinates,
            boxWidth: 300,
            aspectRatio: 1,
            minSize: [300, 300],
            setSelect: [0, 0, 300, 300]
        }
    );
}
