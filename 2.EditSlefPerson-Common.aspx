<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.EditSlefPerson-Common.aspx.cs" Inherits="EditSlefPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/dropify.min.css" rel="stylesheet" />
    <link href="2.custom/jquery-ui.css" rel="stylesheet" />
    <link href="2.custom/jquery-ui.structure.css" rel="stylesheet" />
    <link href="2.custom/jquery-ui.theme.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.min.css" rel="stylesheet" />
    <style>
        .lbl1 {
            color: #625D5D;
            font-size: large;
            font-weight: 600;
        }

        .lbl2 {
            color: #625D5D;
            font-size: large;
            font-weight: 600;
        }

        .nav-pills-info .nav-link {
            color: #4863A0;
            font-size: large;
            font-weight: 600;
        }

        .nav-pills .nav-link.active, .nav-pills .show > .nav-link {
            background: #4863A0;
        }

        .cc {
            font-size: large;
            font-weight: 600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card-body" id="mytable">
        <h1 class="card-title">
            <asp:Label runat="server" Text="" ForeColor="#625D5D" Font-Size="XX-Large" ID="lblHello"></asp:Label>
        </h1>
        <asp:HiddenField ID="hifID" runat="server" />
        <div class="row">
            <div class="col-4">
                <ul class="nav nav-pills nav-pills-vertical nav-pills-info" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <li class="nav-item">
                        <a class="nav-link active" id="HumanInfo-tab" data-bs-toggle="pill" href="#HumanInfo-home" role="tab" aria-controls="v-pills-home" aria-selected="true">
                            <i class="ti-home"></i>
                            人事登入資訊
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="Club-tab" data-bs-toggle="pill" href="#ClubInfo" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <i class="ti-magnet"></i>
                            部門資訊
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="Person-tab" data-bs-toggle="pill" href="#PersonInfo" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <i class="ti-user"></i>
                            基本資料修改
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="Image-tab" data-bs-toggle="pill" href="#ImageInfo" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <i class="ti-image"></i>
                            頭像圖片更換
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="logout" data-bs-toggle="pill" href="#logoutInfo" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <i class="ti-key"></i>
                            登出
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-8">
                <div class="tab-content tab-content-vertical" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="HumanInfo-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                        <div class="media">
                            <div class="media-body col-3">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Name" class="icon-user lbl1">姓名:</label></h4>
                                        <p class="card-description">
                                            <%--<input type="text" class="form-control" id="Name" size="20" value="0" readonly="readonly">--%>
                                            <asp:TextBox ID="Name" CssClass="form-control col-12" ReadOnly="true" runat="server" Width="250px" Font-Size="Small"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body col-3">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Email" class="icon-people lbl1">性別:</label></h4>
                                        <p class="card-description">
                                            <%--<input type="text" class="form-control" id="Gender" size="20" value="0" readonly="readonly">--%>
                                            <asp:TextBox ID="Gender" CssClass="form-control col-12" ReadOnly="true" runat="server" Width="250px" Font-Size="Small"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body col-3">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Email" class="ti-email lbl1">Email:</label></h4>
                                        <p class="card-description">
                                            <%--<input type="text" class="form-control" id="Email" size="30" value="0" readonly="readonly">--%>
                                            <asp:TextBox ID="Email" CssClass="form-control col-12" ReadOnly="true" runat="server" Width="250px" Font-Size="Small"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body col-3">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="humanPassword" class="icon-lock lbl2">密碼變更:</label></h4>
                                        <%-- <p class="card-description">
                                           
                                            <asp:TextBox ID="humanPassword" CssClass="form-control" size="20"  runat="server"  TextMode="Password"></asp:TextBox>
                                        </p>--%>
                                        <div>
                                            <%--<button type="button" class="btn btn-outline-info " onclick="showSwal('warning-message-and-cancel')">密碼變更</button>--%>
                                            <asp:HyperLink class="auth-link text-black col-12" ID="EditPassword" runat="server" NavigateUrl="~/2.Editpassword-common.aspx" CssClass="btn btn-info" Font-Size="Small">密碼變更</asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="tab-pane fade" id="ClubInfo" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        <div class="media">
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Club" class="fa fa-briefcase lbl1">部門:</label></h4>
                                        <p class="card-description">
                                            <%-- <input type="text" class="form-control" id="Club" size="15" value="" readonly="readonly">--%>
                                            <asp:TextBox ID="Club" CssClass="form-control" size="15" ReadOnly="true" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Position" class="fa fa-id-card lbl1">職位:</label></h4>
                                        <p class="card-description">
                                            <%-- <input type="text" class="form-control" id="Position" size="15" value="" readonly="readonly">--%>
                                            <asp:TextBox ID="Position" CssClass="form-control" size="15" ReadOnly="true" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Extension" class="fa fa-phone lbl1">分機:</label></h4>
                                        <p class="card-description">
                                            <%-- <input type="text" class="form-control" id="Extension" size="15" value="" readonly="readonly">--%>
                                            <asp:TextBox ID="Extension" CssClass="form-control" size="15" ReadOnly="true" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="HireDate" class="fa fa-calendar lbl1">到職日:</label></h4>
                                        <p class="card-description">
                                            <%--<input type="text" class="form-control" id="HireDate" size="15" value="" readonly="readonly">--%>
                                            <asp:TextBox ID="HireDate" CssClass="form-control" size="15" ReadOnly="true" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="Salary" class="ti-money lbl1">薪資:</label></h4>
                                        <p class="card-description">
                                            <%--  <input type="text" class="form-control" id="Salary" size="15" value="" readonly="readonly">--%>
                                            <asp:TextBox ID="Salary" CssClass="form-control" size="15" ReadOnly="true" runat="server"></asp:TextBox>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="PersonInfo" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                        <div class="media">
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="myDatepicker" class="fa fa-calendar-o lbl2">出生日期:</label></h4>
                                        <p class="card-description">
                                            <%-- <input type="text" class="form-control" id="myDatepicker" placeholder="yyyy/mm/dd">--%>
                                            <asp:TextBox ID="myDatepicker" CssClass="form-control" placeholder="yyyy/mm/dd" runat="server"></asp:TextBox>
                                        </p>
                                        <button type="button" class="btn  btn-inverse-warning" id="btnBirthday">修改</button>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="myaddress" class="fa fa-address-card lbl2">居住地址:</label></h4>
                                        <p class="card-description">
                                            <%--<input type="text" class="form-control" id="myaddress" size="40">--%>
                                            <asp:TextBox ID="myaddress" CssClass="form-control" size="40" runat="server"></asp:TextBox>
                                        </p>
                                        <button type="button" id="btnAdress" class="btn btn-inverse-warning">修改</button>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="phone" class="fa fa-mobile lbl2">手機:</label></h4>
                                        <p class="card-description">
                                            <%-- <input class="form-control" id="phone" data-inputmask-alias="9999-999999" />--%>
                                            <asp:TextBox ID="phone" CssClass="form-control" data-inputmask-alias="9999-999999" runat="server"></asp:TextBox>
                                        </p>
                                        <button type="button" id="btnCellPhone" class="btn btn-inverse-warning">修改</button>
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card-body">
                                    <div class="wrapper text-center">
                                        <h4 class="card-title">
                                            <label for="homephone" class="fa fa-phone-square lbl2">居住電話:</label></h4>
                                        <p class="card-description">
                                            <%--<input class="form-control" id="homephone" data-inputmask-alias="(99) 9999-9999" />--%>
                                            <asp:TextBox ID="homephone" CssClass="form-control" data-inputmask-alias="(99) 9999-9999" runat="server"></asp:TextBox>
                                        </p>
                                        <button type="button" id="btnHomePhone" class="btn btn-inverse-warning">修改</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="ImageInfo" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                        <div class="media">
                            <div class="media-body">
                                <div class="card-body w-50">
                                    <div class="wrapper text-center">
                                        <%-- <img class="me-3  rounded" src="" alt="sample image">--%>
                                        <asp:Image ID="EmployeeImage" Width="300px" Height="300px" class="me-3  rounded" alt="個人圖片" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="media-body">
                                <div class="card w-75 ">
                                    <div class="card-body text-center">
                                        <h4 class="card-title d-flex">照片上傳
                                            <small class="ms-auto align-self-end"></small>
                                        </h4>
                                        <input type="file" class="dropify" id="fileup1" />
                                        <%--  <asp:FileUpload ID="FileUpload1" runat="server" CssClass="dropify"/>--%>
                                    </div>
                                    <div class="card-body">
                                        <div class="wrapper text-center">

                                            <button type="button" id="btnImage" class="btn btn-inverse-warning card-description">照片更換</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="logoutInfo" role="tabpanel" aria-labelledby="v-pills-messages-tab">

                        <div class="card-body">
                            <div class=" text-center">
                                <h4 class="wrapper card-title">
                                    <asp:Label ID="Label4" runat="server" Text="人事系統登出" CssClass="fa fa-search cc" for="SearchInfo" ForeColor="#625D5D"></asp:Label>
                                </h4>
                                <p class="card-description">

                                    <asp:Button ID="btnLogOut" runat="server" Text="登出" CssClass="btn btn-info card-description" OnClick="btnLogOut_Click" />
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/js/vendor.bundle.base.js"></script>
    <script src="2.custom/tonyJS/tabs.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script src="2.custom/tonyJS/alerts2.js"></script>
    <script src="2.custom/tonyJS/dropify.min.js"></script>
    <script src="2.custom/tonyJS/dropify.js"></script>
    <script src="2.custom/external/jquery/jquery.js"></script>
    <script src="2.custom/jquery-ui.js"></script>
    <script src="2.custom/tonyJS/jquery.inputmask.bundle.js"></script>
    <script src="2.custom/tonyJS/inputmask.js"></script>
    <script>
        $(document).ready(init);
        function init() {
            var myDate = new Date().getHours();
            $("#myDatepicker").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: "HELLO"
            });
        }

        $("#<% =myDatepicker.ClientID %>").datepicker({
            dateFormat: "yy/mm/dd",
            firstDay: 0,
            isRTL: false,
            constrainInput: true,
            yearSuffix: ""
        });

        $("#btnImage").click(function () {
            //var fileUpload = $("#fileup1").get(0);
            //var files = fileUpload.files;
            //if (files.length <= 0) {

            //    return alert('請上傳檔案')
            //}
            //var data = new FormData();
            //data.append("12123.jpg", files[0]);
            //data.append("id", $("#ContentPlaceHolder1_hifID").val());
            //$.ajax({
            //    url: "TonyWebService.asmx/FileUpload",
            //    type: "POST",
            //    data: data,
            //    contentType: false,
            //    processData: false,
            //    success: function () {
            //        var n = $('#ContentPlaceHolder1_Name').val();
            //        $("#ContentPlaceHolder1_EmployeeImage").attr("src", "/EmployeesImage/" + n + ".jpg");
            //        alert("已上傳成功")
            //    },
            //    error: function () {
            //        alert("上傳失敗")
            //    }
            //});

            swal({
                title: '上傳確認!',
                text: "請再次確認是否要上傳該圖片!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#EA0000',
            }).then(
                function () {
                    var fileUpload = $("#fileup1").get(0);
                    var files = fileUpload.files;
                    if (files.length <= 0) {

                        return swal('上傳失敗!', '未上傳任何檔案', 'error')
                    }
                    var data = new FormData();
                    data.append("12123.jpg", files[0]);
                    data.append("id", $("#ContentPlaceHolder1_hifID").val());
                    $.ajax({
                        url: "TonyWebService.asmx/FileUpload",
                        type: "POST",
                        data: data,
                        contentType: false,
                        processData: false,
                        success: function () {
                            var n = $('#ContentPlaceHolder1_Name').val();
                            var e = $('#ContentPlaceHolder1_Email').val();
                            $("#ContentPlaceHolder1_EmployeeImage").attr("src", "/EmployeesImage/" + e + n + ".jpg?i=" + Math.random());
                            swal('完成!', "上傳完成!", 'success');
                        },
                        error: function () {
                            swal('取消', '上傳失敗!', 'error')
                        }
                    });
                },
                function (dismiss) {
                    if (dismiss === 'cancel') {
                        swal('取消', '上傳失敗!', 'error')
                    }
                });

        });



    </script>
</asp:Content>

