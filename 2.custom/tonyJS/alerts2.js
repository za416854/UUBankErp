
$(function () {

    $("#btnBirthday").click(function () {
        swal({
            title: '請確認!!',
            text: "出生日期是否要變更!!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#EA0000',
        }).then(
            function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_hifID").val(),
                    birth: $("#ContentPlaceHolder1_myDatepicker").val(),
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/EditHumanEmployeeByBirthday",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        console.log(result)
                        swal('完成!!', '已變更完成!!', 'success')
                    },
                    error: function () {
                        swal('變更失敗!!', '請洽詢資訊處', 'error');
                    }
                });   
            },
            function (dismiss) {
                if (dismiss === 'cancel') {
                    swal('取消!!', '出生日期未變更!!', 'error')
                }
            });

    });

    $("#btnAdress").click(function () {
        swal({
            title: '請確認!!',
            text: "居住地址是否要變更!!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#EA0000',
        }).then(
            function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_hifID").val(),
                    address: $("#ContentPlaceHolder1_myaddress").val(),
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/EditHumanEmployeeByAdress",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        console.log(result)
                        swal('完成!!', '已變更完成!!', 'success')
                    },
                    error: function () {
                        swal('變更失敗!!', '請洽詢資訊處', 'error');
                    }
                });
            },
            function (dismiss) {
                if (dismiss === 'cancel') {
                    swal('取消!!', '居住地址未變更!!', 'error')
                }
            });

    });


    $("#btnCellPhone").click(function () {
        swal({
            title: '請確認!!',
            text: "手機是否要變更!!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#EA0000',
        }).then(
            function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_hifID").val(),
                    cellphone: $("#ContentPlaceHolder1_phone").val(),
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/EditHumanEmployeeByCellPhone",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        console.log(result)
                        swal('完成!!', '已變更完成!!', 'success')
                    },
                    error: function () {
                        swal('變更失敗!!', '請洽詢資訊處', 'error');
                    }
                });
            },
            function (dismiss) {
                if (dismiss === 'cancel') {
                    swal('取消!!', '手機未變更!!', 'error')
                }
            });

    });

    $("#btnHomePhone").click(function () {
        swal({
            title: '請確認!!',
            text: "居住電話是否要變更!!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#EA0000',
        }).then(
            function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_hifID").val(),
                    homephone: $("#ContentPlaceHolder1_homephone").val(),
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/EditHumanEmployeeByHomePhone",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        console.log(result)
                        swal('完成!!', '已變更完成!!', 'success')
                    },
                    error: function () {
                        swal('變更失敗!!', '請洽詢資訊處', 'error');
                    }
                });
            },
            function (dismiss) {
                if (dismiss === 'cancel') {
                    swal('取消!!', '居住電話未變更!!', 'error')
                }
            });

    });

});