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
    var filesuploaded = 0;
    $('.new_picture').bind('fileuploaddone', function (e, data) {
        $('.count').html(++filesuploaded);
        if ((files_count/2) == filesuploaded) {
            files_count = 0;
            filesuploaded = 0;
            $('#progress-modal').modal('hide');
        }
    });

    $('.new_picture').fileupload({
        dataType: 'script',
        add: function (e, data) {
            files_count++;
            var types = /(\.|\/)(jpe?g|png)$/i;
            var file = data.files[0];
            if (types.test(file.type) || types.test(file.name)) {
                data.context = $(tmpl("template-upload", file));
                $('#progress-modal').modal('show');
                $('.result').html(files_count/2);
                $('.progress_modal_body').html(data.context);
                data.submit();
            }
        },
        progress: function (e, data) {
            if (data.context) {
                progress = parseInt(data.loaded / data.total * 100, 10);
                console.log(progress);
                data.context.find('.bar').css('width', progress + '%');
              }
        }
    });
}



