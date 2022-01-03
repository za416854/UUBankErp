(function($) {
  showSwal = function(type) {
    'use strict';
    if (type === 'basic') {
      swal({
        text: 'Any fool can use a computer',
        button: {
          text: "OK",
          value: true,
          visible: true,
          className: "btn btn-primary"
        }
      })

    } else if (type === 'title-and-text') {
      swal({
        title: 'Read the alert!',
        text: 'Click OK to close this alert',
        button: {
          text: "OK",
          value: true,
          visible: true,
          className: "btn btn-primary"
        }
      })

    } else if (type === 'success-message') {
      swal({
        title: 'Congratulations!',
        text: 'You entered the correct answer',
        icon: 'success',
        button: {
          text: "Continue",
          value: true,
          visible: true,
          className: "btn btn-primary"
        }
      })

    } else if (type === 'auto-close') {
      swal({
        title: 'Auto close alert!',
        text: 'I will close in 2 seconds.',
        timer: 2000,
        button: false
      }).then(
        function() {},
        // handling the promise rejection
        function(dismiss) {
          if (dismiss === 'timer') {
            console.log('I was closed by the timer')
          }
        }
      )
    } else if (type === 'warning-message-and-cancel') {
        swal({
            title: '請問確定要修改嗎?',
            text: "請在修改前再次確定!!!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#000079',
            cancelButtonColor: '#EA0000',
            confirmButtonText: '確定',
            cancelButtonText: '取消',
            //buttons: {

            //    confirm: {
            //        text: "確定",
            //        value: true,
            //        visible: true,
            //        className: "btn btn-info",
            //        closeModal: true
            //    },
            //    cancel: {
            //        text: "取消",
            //        value: false,
            //        visible: true,
            //        className: "btn btn-danger",
            //        closeModal: true,
            //    }
            //}
        }).then(
            function () {
                swal('完成!', '檔案已經刪除', 'success')
            },
            function (dismiss) {
                if (dismiss === 'cancel') {
                    swal('取消', '檔案未被刪除', 'error')
                }
            });

    }
    else if (type === 'custom-html') {
      swal({
        content: {
          element: "input",
          attributes: {
            placeholder: "Type your password",
            type: "password",
            class: 'form-control'
          },
        },
        button: {
          text: "OK",
          value: true,
          visible: true,
          className: "btn btn-primary"
        }
      })
    }
  }

})(jQuery);