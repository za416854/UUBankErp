(function ($) {
    showSwal = function (type) {
        swal({
            title: '請問確定要修改嗎?',
            text: "請在修改前再次確定!!!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3f51b5',
            cancelButtonColor: '#ff4081',
            confirmButtonText: 'Great ',
            buttons: {
     
                confirm: {
                    text: "確定",
                    value: true,
                    visible: true,
                    className: "btn btn-info",
                    closeModal: true
                },
                 cancel: {
                    text: "取消",
                    value: null,
                    visible: true,
                    className: "btn btn-danger",
                    closeModal: true,
                }
            }
        })
    }

})(jQuery);