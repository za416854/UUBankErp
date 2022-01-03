<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="3.MessageBoardAdd.aspx.cs" Inherits="clubtable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="Scripts/kris/sweetalert2.min.css" rel="stylesheet" />
    <link href="vendors/jquery-toast-plugin/jquery.toast.min.css" rel="stylesheet" />
    <title>JustDo Admin</title>
    <!-- plugins:css -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row">
        </div>
        <!--vertical wizard-->
        <div class="row">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="badge badge-outline-primary" style="font-size: xx-large">新增留言/Create New Message</h4>
                        <br />
                        <br />
                        <br />
                        <div id="example-vertical-wizard" action="#">
                            <div>
                                <h3>新增主題/Create Topic</h3>
                                <section>
                                    <h3>建立您的主旨/Create Your Topic</h3>
                                    <div class="form-group">
                                        <label for="userId">員編</label>
                                        <asp:TextBox ID="TextBoxNumber" CssClass="required form-control" disabled="disable" runat="server"></asp:TextBox>
                                        <%--<input id="userId" name="userId" type="text" class="required form-control">--%>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">姓名</label>
                                        <%--<input id="name" name="name" type="text" class="required form-control">--%>
                                        <asp:TextBox ID="TextBoxName" disabled="disable" CssClass="required form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="topic">主旨</label>
                                        <textarea id="topic" name="topic" class="required form-control" rows="5" cols="40" required> </textarea>
                                        <small style="color: #FF0000">*必須輸入項目</small>
                                    </div>
                                </section>
                                <h3>新增內文/Create Topic</h3>
                                <section>
                                    <h3>內文</h3>
                                    <div class="form-group">
                                        <label for="content">請輸入內容</label>
                                        <textarea name="content" id="content" class="form-control" rows="17" cols="40" required> </textarea>
                                        <small style="color: #FF0000">*必須輸入項目</small>
                                    </div>
                                </section>
                                <h3>提交您的留言/Confirm Your Message</h3>
                                <section>
                                    <h1>請選擇對象</h1>
                                    <div class="form-check">
                                        <br />
                                        <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="true" CssClass="btn btn-danger dropdown-toggle" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                                            <asp:ListItem Selected="True">所有人</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:UUUBankErpConnectionString1 %>' SelectCommand="SELECT [Name] FROM [Employee]"></asp:SqlDataSource>
                                        <%--<select id="DropDownListToName" class="btn btn-danger dropdown-toggle" onchange="getDiffByDay(dateStart, dateEnd)" runat="server" style="color: #000000">
                                            <option>所有人</option>
                                            <option>Kris Hu</option>
                                            <option>Julia Van Oordt</option>
                                            <option>David Halligan</option>
                                            <option>Richard Fila</option>
                                            <option>Timothy Martin</option>
                                        </select>--%>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelSubmit" runat="server" Text="確認完畢後，即可提交。" ForeColor="Blue"></asp:Label>
                                </section>

                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                <asp:HiddenField ID="HiddenField3" runat="server" />
                            </div>
                        </div>
                        <input type="button" id="reasonBtn" class="btn btn-facebook" value="Demo" />
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page-->
    <script src="/vendors/jquery-steps/jquery.steps.min.js"></script>
    <script src="Scripts/kris/sweetalert2.min.js"></script>
    <!-- Custom js for this page-->
    <%--    <script src="kris/js/krisWizard.js"></script>--%>
    <script src="vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
    <%--<script src="kris/js/toastDemoKris.js"></script>--%>
    <!-- End custom js for this page-->
    <script>
        (function ($) {
            'use strict';
            var form = $("#example-form");
            form.children("div").steps({
                headerTag: "h3",
                bodyTag: "section",
                transitionEffect: "slideLeft",
                onFinished: function (event, currentIndex) {
                    confirm("Submmited!");
                }
            });
            var validationForm = $("#example-validation-form");
            validationForm.val({
                errorPlacement: function errorPlacement(error, element) {
                    element.before(error);
                },
                rules: {
                    confirm: {
                        equalTo: "#password"
                    }
                }
            });
            validationForm.children("div").steps({
                headerTag: "h3",
                bodyTag: "section",
                transitionEffect: "slideLeft",
                onStepChanging: function (event, currentIndex, newIndex) {
                    validationForm.val({
                        ignore: [":disabled", ":hidden"]
                    })
                    return validationForm.val();
                },
                onFinishing: function (event, currentIndex) {
                    validationForm.val({
                        ignore: [':disabled']
                    })
                    return validationForm.val();
                },
                onFinished: function (event, currentIndex) {
                    confirm("Submmited!");
                }
            });
            var verticalForm = $("#example-vertical-wizard");
            verticalForm.children("div").steps({
                headerTag: "h3",
                bodyTag: "section",
                transitionEffect: "slideLeft",
                stepsOrientation: "vertical",
                onFinished: function (event, currentIndex) {
                    if ($("#ContentPlaceHolder1_TextBoxName").val() == " " || "") {
                        swal({
                            title: '錯誤',
                            text: "請輸入名字!",
                            type: 'error',
                            showCancelButton: false,
                        });
                        showWarningToast();
                    } else if ($("#topic").val() == " " || "") {
                        swal({
                            title: '錯誤',
                            text: "請輸入主題!",
                            type: 'error',
                            showCancelButton: false,
                        });
                        showWarningToast();
                    } else if ($("#content").val() == " " || "") {
                        swal({
                            title: '錯誤',
                            text: "請輸入內容!",
                            type: 'error',
                            showCancelButton: false,
                        });
                        showWarningToast();
                    } else {
                        swal({
                            title: 'Check Again',
                            text: '資料經上傳後不可修改!',
                            type: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#EA0000',
                        }).then(
                            function () {
                                var myData = {
                                    fromName: $("#ContentPlaceHolder1_TextBoxName").val(),
                                    toName: $("#ContentPlaceHolder1_DropDownList1").val(),
                                    topic: $("#topic").val(),
                                    messageContent: $("#content").val(),
                                    time: $("#ContentPlaceHolder1_HiddenField2").val(),
                                    state: $("#ContentPlaceHolder1_HiddenField3").val(),
                                }
                                $.ajax({
                                    type: 'POST',
                                    url: "WebService.asmx/GetMessage",
                                    contentType: "application/json;utf-8",
                                    dataType: "json",
                                    data: JSON.stringify(myData),
                                    async: false,
                                    success: function (result) {
                                        swal({
                                            title: '留言已送出!',
                                            text: '',
                                            type: 'success',
                                            showCancelButton: false,
                                            confirmButtonColor: '#3085d6',
                                            cancelButtonColor: '#EA0000',
                                        });
                                        showSuccessToast();
                                        setTimeout(function myfunction() {
                                            window.location.href = "/3.MessageBoardList.aspx";
                                        }, 1800)
                                    }
                                });
                            },
                        );
                    }
                }
            });
        })(jQuery);

    </script>
    <script>
        (function ($) {
            showSuccessToast = function () {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: '新增成功',
                    text: '即將為您導入List頁面',
                    showHideTransition: 'slide',
                    icon: 'success',
                    loaderBg: '#f96868',
                    position: 'top-right'
                })
            };
            showInfoToast = function () {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: 'Info',
                    text: '留言板已新增，正在為您導入留言板頁面',
                    showHideTransition: 'slide',
                    icon: 'info',
                    loaderBg: '#46c35f',
                    position: 'top-right'
                })
            };
            showWarningToast = function () {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: '警告',
                    text: '請確實填寫內容',
                    showHideTransition: 'slide',
                    icon: 'warning',
                    loaderBg: '#57c7d4',
                    position: 'top-right'
                })
            };
            showDangerToast = function () {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: 'Danger',
                    text: 'And these were just the basic demos! Scroll down to check further details on how to customize the output.',
                    showHideTransition: 'slide',
                    icon: 'error',
                    loaderBg: '#f2a654',
                    position: 'top-right'
                })
            };
            showToastPosition = function (position) {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: 'Positioning',
                    text: 'Specify the custom position object or use one of the predefined ones',
                    position: String(position),
                    icon: 'info',
                    stack: false,
                    loaderBg: '#f96868'
                })
            }
            showToastInCustomPosition = function () {
                'use strict';
                resetToastPosition();
                $.toast({
                    heading: 'Custom positioning',
                    text: 'Specify the custom position object or use one of the predefined ones',
                    icon: 'info',
                    position: {
                        left: 120,
                        top: 120
                    },
                    stack: false,
                    loaderBg: '#f96868'
                })
            }
            resetToastPosition = function () {
                $('.jq-toast-wrap').removeClass('bottom-left bottom-right top-left top-right mid-center'); // to remove previous position class
                $(".jq-toast-wrap").css({
                    "top": "",
                    "left": "",
                    "bottom": "",
                    "right": ""
                }); //to remove previous position style
            }
        })(jQuery);
        $("#reasonBtn").click(function () {
            $("#topic").val("假單未核准");
            $("#content").val("周杰您好，假單的部分，我已退件，原因請於假單詳情頁面觀看，謝謝。");
        });
    </script>
</asp:Content>
