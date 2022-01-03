<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1.forgetPassword.aspx.cs" Inherits="_1_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>UUU Bank</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../../../vendors/ti-icons/css/themify-icons.css" />
    <link rel="stylesheet" href="../../../../vendors/css/vendor.bundle.base.css" />
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link href="1.louis/sweetalert2.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../../../../css/vertical-layout-light/style.css" />
    <!-- endinject -->
    <link rel="shortcut icon" href="../../../../images/favicon.png" />
    <style>
        #loginBack {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar-dark">
            <div class="container-scroller">
                <div class="container-fluid page-body-wrapper full-page-wrapper">
                    <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
                        <div class="row flex-grow" id="loginBack">
                            <div class="col-lg-6 d-flex align-items-center justify-content-center">
                                <div class="auth-form-transparent text-left p-3">
                                    
                                    <h2>忘記密碼</h2>
                                    <h4 class="font-weight-light">請輸入帳號、姓名、手機號碼以取回密碼</h4>
                                    <div class="pt-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail">帳號(Email)</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="ti-user text-primary"></i>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control form-control-lg border-left-0" id="exampleInputEmail" placeholder="帳號" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName">姓名</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="ti-lock text-primary"></i>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control form-control-lg border-left-0" id="exampleInputName" placeholder="姓名" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputMobile">手機號碼</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="ti-mobile text-primary"></i>
                                                    </span>
                                                </div>
                                                <input data-inputmask-alias="9999-999999" type="text" class="form-control form-control-lg border-left-0" id="exampleInputMobile" placeholder="手機號碼" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="my-3 col">
                                                <asp:Button OnClick="Button2_Click" CssClass="btn btn-block btn-warning btn-lg font-weight-medium auth-form-btn" ID="Button2" runat="server" Text="←返回上一頁" Font-Size="Large" />
                                            </div>
                                            <div class="my-3 col">
                                                <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                                <asp:Button OnClientClick="return false" OnClick="Button1_Click" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" ID="Button1" runat="server" Text="取回密碼" Font-Size="Large" />
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <br /><br />
                                                <input value="DEMO鍵" type="button" id="forgetdemo" class="btn btn-secondary btn-lg" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 d-flex flex-row">
                                <img src="images/louis/mylogoerp.png" />
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->
            <!-- plugins:js -->
            <script src="../../../../vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="1.louis/sweetalert2.min.js"></script>
            <script src="2.custom/tonyJS/jquery.inputmask.bundle.js"></script>
            <script src="2.custom/tonyJS/inputmask.js"></script>
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="../../../../js/off-canvas.js"></script>
            <script src="../../../../js/hoverable-collapse.js"></script>
            <script src="../../../../js/template.js"></script>
            <script src="../../../../js/settings.js"></script>
            <script src="../../../../js/todolist.js"></script>
            <!-- endinject -->
            <script>
                $(function () {
                    $("#forgetdemo").click(function () {
                        $("#exampleInputEmail").val("a80665308@gmail.com");
                        $("#exampleInputName").val("李路亞");
                        $("#exampleInputMobile").val("0976592068");
                    });





                    if ($("#HiddenField1").val() == 'noUser') {
                        swal({
                            title: '查無帳號!',
                            type: 'error',
                            showCancelButton: false,
                            confirmButtonText: '好的，我知道了',
                        });
                        $("#HiddenField1").val("");
                    }
                    else if ($("#HiddenField1").val() == 'getUser') {
                        swal({
                            title: '密碼已寄至您的Email',
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonText: '好的，我知道了',
                        });
                        $("#HiddenField1").val("");
                    }
                    $("#Button1").click(function () {
                        $("#__EVENTTARGET").val("Button1");
                        $("#form1").submit();
                    });
                });
            </script>

        </div>
    </form>
</body>
</html>
