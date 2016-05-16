$(document).ready(function () {
    setPopupGallery()
});

function setPopupGallery() {

    $('.popup-gallery').magnificPopup({
        delegate: 'a',
        type: 'image',
        closeOnContentClick: false,
        closeBtnInside: false,
        mainClass: 'mfp-with-zoom mfp-img-mobile',
        image: {
            verticalFit: true,
            titleSrc: function (item) {
                return item.el.attr('title');
            }
        },
        gallery: {
            enabled: true
        },
        zoom: {
            enabled: true,
            duration: 300, // don't foget to change the duration also in CSS
            opener: function (element) {
                return element.find('img');
            }
        }
    });

}

function setFileUploader() {
    var files_count = 0;
    $('.new_picture').fileupload({
        dataType: 'script',
        add: function (e, data) {
            var types = /(\.|\/)(jpe?g|png)$/i;
            var file = data.files[0];
            if (types.test(file.type) || types.test(file.name)){
                data.context = $(tmpl("template-upload", file));
                $('.progress_modal_body').html(data.context);
                files_count++;
                $('#progress-modal').modal('show');
                $('.count').html(files_count/2);
                data.submit();
            }
        },
        progress: function (e, data) {
            files_count = 0;
            if (data.context) {
                progress = parseInt(data.loaded / data.total * 100, 10);
                console.log(progress);
                data.context.find('.bar').css('width', progress + '%');
                $('.progress_modal_body').html(data.context);
            }

        }
    });
}




