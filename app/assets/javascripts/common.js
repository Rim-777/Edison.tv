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

function setFileUploader(){
    $('#new_picture').fileupload({ dataType:'script'});



    $('.new_picture').fileupload({dataType: 'script'});

}

