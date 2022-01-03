<%@ Page Language="C#" AutoEventWireup="true" CodeFile="1.login.aspx.cs" Inherits="_1_login" %>

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
                                    <div>
                                        <%--<img src="../images/louis/mylogo.png" alt="logo" width="250" />--%>
                                    </div>
                                        <h2>ERP系統</h2>
                                    <h4 class="font-weight-light">請在下方輸入帳號密碼</h4>
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
                                            <label for="exampleInputPassword">密碼</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend bg-transparent">
                                                    <span class="input-group-text bg-transparent border-right-0">
                                                        <i class="ti-lock text-primary"></i>
                                                    </span>
                                                </div>
                                                <input type="password" class="form-control form-control-lg border-left-0" id="exampleInputPassword" placeholder="密碼" runat="server" />
                                            </div>
                                        </div>
                                        <div class="my-2 d-flex justify-content-between align-items-center">
                                            <a href="../1.forgetPassword.aspx" class="auth-link text-black">忘記密碼?</a>
                                        </div>
                                        <div class="my-3">
                                            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                                            <asp:Button OnClientClick="return false" OnClick="Button1_Click" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" ID="Button1" runat="server" Text="登入" Font-Size="Large" />
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </div>
                                        <input type="button" value="人事主管" id="hrBtn" class="btn btn-success" /> &nbsp; &nbsp;
                                        <input type="button" value="一般主管" id="spBtn" class="btn btn-warning" /> &nbsp; &nbsp;
                                        <input type="button" value="一般員工" id="normalBtn" class="btn btn-secondary" /><br /><br />
                                        <input type="button" value="人事測試員工" id="testBtn" class="btn btn-secondary" />
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
                    if ($("#HiddenField1").val() == 'noUser') {
                        swal({
                            title: '查無帳號或輸入有誤!',
                            type: 'error',
                            showCancelButton: false,
                            confirmButtonText: '好的，我知道了',
                        });
                       
                        $("#HiddenField1").val("");
                    }
                    if ($("#HiddenField1").val() == 'noau') {
                        swal({
                            title: '此帳號無登入權限，請洽人事部門!!',
                            type: 'error',
                            showCancelButton: false,
                            confirmButtonText: '好的，我知道了',
                        });
                    }
                    $("#Button1").click(function () {
                        $("#__EVENTTARGET").val("Button1");
                        $("#form1").submit();
                    });



                    $("#hrBtn").click(function () {
                        $("#exampleInputEmail").val("tony01551251@gmail.com");
                        $("#exampleInputPassword").val("123456");
                    });
                    $("#spBtn").click(function () {
                        $("#exampleInputEmail").val("a80665308@gmail.com");
                        $("#exampleInputPassword").val("123");
                    });
                    $("#normalBtn").click(function () {
                        $("#exampleInputEmail").val("tony321123@gmial.com");
                        $("#exampleInputPassword").val("123456");
                    });
                    $("#testBtn").click(function () {
                        $("#exampleInputEmail").val("li168@gmial.com");
                        $("#exampleInputPassword").val("123456");
                    });
                });
            </script>

        </div>
    </form>
</body>
</html>
