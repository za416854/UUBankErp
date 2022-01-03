<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.EmployeeAdd.aspx.cs" Inherits="_2_EmployeeAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/dropify.min.css" rel="stylesheet" />
    <link href="2.custom/jquery-ui.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/dropify.min.css" rel="stylesheet" />
    <link href="2.custom/bootstrap4-toggle-master/css/bootstrap4-toggle.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.css" rel="stylesheet" />

    <style>
        .wizard > .content {
            height: 600px !important;
        }
        .wizard > .steps .current a{
            background:#4863A0 !important; 
        }
        .wizard > .steps .done a{
            background: #98AFC7 !important;
        }
        .wizard > .steps a{
            font-size:large !important;
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary " NavigateUrl="~/2.EditSlefPerson-Hight.aspx">返回人事首頁</asp:HyperLink>
            </div>
        </div>
        <div class="row">
            <div class="col-12 grid-margin">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">新增員工資料</h4>
                        <div id="example-form" action="#">
                            <div>
                                <h3>登入資訊設定</h3>
                                <section>
                                    <h3>登入資訊設定</h3>
                                    <div class="form-group">
                                        <label for="txtEmail" class="ti-email">Email登入帳號:</label>
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter email" data-inputmask="'alias': 'email'" im-insert="true"></asp:TextBox>

                                        <small id="emailHelp" class="form-text text-muted">
                                           
                                            <input type="button" id="btnCheck" value="檢查Email是否重複" class="btn btn-inverse-warning" />
                                            
                                        </small>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入Email" Text="請輸入Email" ControlToValidate="txtEmail" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="icon-lock" for="txtPW">ERP系統登入密碼預設:</label>
                                        <asp:TextBox ID="txtPW" runat="server" class="form-control " placeholder="密碼" Text="123456"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請輸入密碼" Text="請填入密碼" ControlToValidate="txtPW" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="icon-lock" for="txtPW2">人事系統登入密碼預設:</label>
                                        <asp:TextBox ID="txtPW2" runat="server" class="form-control " placeholder="密碼" Text="123456"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="請輸入密碼" Text="請輸入密碼" ControlToValidate="txtPW2" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <div class="modal fade" id="exampleModalLive" tabindex="-1" aria-labelledby="exampleModalLiveLabel" style="display: none;" aria-hidden="true" data-bs-backdrop="static">
                                            <div class="modal-dialog   ">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h2 class="modal-title" id="exampleModalLiveLabel" style="color: #f8313b">權限設定</h2>
                                                        <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <input type="button" id="btnEMAU" value="普通員工" class="btn btn-success btn-rounded btn-fw" />
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="button" id="btnMAAU" value="一般主管" class="btn btn-primary btn-rounded btn-fw" />
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="button" id="btnHUEMAU" value="人事員工" class="btn btn-info btn-rounded btn-fw" />
                                                            </div>
                                                            <div class="col-3">
                                                                <input type="button" id="btnHUMAAU" value="人事主管" class="btn btn-danger btn-rounded btn-fw" />
                                                            </div>
                                                        </div>
                                                        <br />
                                                        <div>
                                                            <ul>
                                                                <li>
                                                                    <div>
                                                                        
                                                                        <label class="icon-lock form-check-danger">
                                                                            登入:
                                                                            <asp:CheckBox ID="checkLogin" runat="server" CssClass="form-check-danger" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div>
                                                                        
                                                                        <label class="icon-lock ">
                                                                            員工資料查詢:
                                                                            <asp:CheckBox ID="CheckSearch" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            員工資料新增:
                                                                        <asp:CheckBox ID="CheckAddEM" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li id="liEM">
                                                                    <div>
                                                                        <label class="icon-lock " id="lblaEMedit">
                                                                            員工資料變更及刪除:
                                                                        <asp:CheckBox ID="CheckEdtiDelete" runat="server"  />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li id="liAU">
                                                                    <div>
                                                                        <label class="icon-lock " id="lblaAUedit">
                                                                            員工權限變更:
                                                                        <asp:CheckBox ID="CheckEditAU" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            請假覆核 :
                                                                        <asp:CheckBox ID="CheckaskForLeave" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            打卡覆核 :
                                                                        <asp:CheckBox ID="CheckClock" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li id="liShop">
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            團購審核 :
                                                                        <asp:CheckBox ID="CheckShopManager" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li id="liClub">
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            社團管理 :
                                                                        <asp:CheckBox ID="CheckClub" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div>
                                                                        <label class="icon-lock ">
                                                                            會議室管理 :
                                                                        <asp:CheckBox ID="CheckMeetingRoom" runat="server" />
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">儲存</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="icon-lock btn btn-inverse-primary" data-bs-toggle="modal" data-bs-target="#exampleModalLive">
                                            權限設定
                                        </button>
                                    </div>
                                    <div class="form-group">
                                      
                                        <input type="button" class="btn btn-info btn-rounded btn-fw " id="btnDemo" style="font-size: large" value="我是DEMO" />

                                    </div>
                                </section>
                                <h3>個人資料</h3>
                                <section>
                                    <h3>個人資料</h3>
                                    <div class="form-group">
                                        <label for="txtName" class="icon-user">姓名:</label>
                                        <asp:TextBox ID="txtName" class="form-control" placeholder="請輸入姓名" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="請輸入姓名" Text="請輸入姓名" ControlToValidate="txtName" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="dropGender" class="icon-people">性別:</label>
                                        <asp:DropDownList ID="dropGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="男">男</asp:ListItem>
                                            <asp:ListItem Value="女">女</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-calendar-o" for="txtBirth">出生日期:</label>
                                        <asp:TextBox ID="txtBirth" class="form-control" placeholder="yyyy/mm/dd" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="請輸入出生日期" Text="請輸入出生日期" ControlToValidate="txtBirth" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-address-card">居住地址:</label>
                                        <asp:TextBox ID="txtAdress" class="form-control" placeholder="請輸入居住地址" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="請輸入居住地址" Text="請輸入居住地址" ControlToValidate="txtAdress" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-mobile">手機:</label>
                                        <asp:TextBox ID="txtCellPhone" class="form-control" placeholder="請輸入手機" runat="server" data-inputmask-alias="9999-999999"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="請輸入手機" Text="請輸入手機" ControlToValidate="txtCellPhone" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-phone-square">居住電話:</label>
                                        <asp:TextBox ID="txtHomePhone" class="form-control" placeholder="請輸入居住電話" runat="server" data-inputmask-alias="(99) 9999-9999"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="請輸入居住電話" Text="請輸入居住電話" ControlToValidate="txtHomePhone" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>

                                </section>
                                <h3>個人照片</h3>
                                <section>
                                    <h3>個人照片</h3>

                                    <div class="card w-50 ">
                                        <div class="card-body text-center ">
                                            <h4 class="card-title d-flex">照片上傳
                                            <small class="ms-auto align-self-end"></small>
                                            </h4>
                                            <asp:FileUpload ID="fulImage" runat="server" CssClass="dropify" />
                                        </div>
                                    </div>
                                </section>
                                <h3>部門資訊</h3>
                                <section>
                                    <h3>部門資訊</h3>
                                    <div class="form-group">
                                        <label class="fa fa-briefcase">部門:</label>
                                        <asp:TextBox ID="txtClub" class="form-control" placeholder="請輸入部門" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="請輸入部門" Text="請輸入部門" ControlToValidate="txtClub" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-id-card">職位:</label>
                                        <asp:TextBox ID="txtPosition" class="form-control" placeholder="請輸入職位" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="請輸入職位" Text="請輸入職位" ControlToValidate="txtClub" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-address-card">分機:</label>
                                        <asp:TextBox ID="txtExtention" class="form-control" placeholder="請輸入分機" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="請輸入分機" Text="請輸入分機" ControlToValidate="txtExtention" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="fa fa-calendar">到職日:</label>
                                        <asp:TextBox ID="txtHireDate" class="form-control" placeholder="yyyy/mm/dd" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="請輸入到職日" Text="請輸入到職日" ControlToValidate="txtHireDate" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label class="ti-money">薪資:</label>
                                        <asp:TextBox ID="txtMoney" class="form-control" placeholder="請輸入薪資" runat="server" TextMode="Number" min="24000"></asp:TextBox>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="請輸入薪資24000至500000" ControlToValidate="txtMoney" CssClass="badge badge-outline-danger badge-pill" MinimumValue="24000" MaximumValue="500000" Type="Integer"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="請輸入薪資" Text="請輸入薪資" ControlToValidate="txtMoney" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    </div>
                                </section>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 grid-margin">
                <div class="container">
                    <div class="card row justify-content-between">
                        <div class="card-body" >
                            <div class="row ">
                                <asp:Button runat="server" Text="新增" CssClass="btn btn-danger btn-rounded btn-fw form-control" ID="btnAdd" OnClick="btnAdd_Click" OnClientClick="return false;" ForeColor="Black" Font-Size="Large" />
                                <asp:HiddenField ID="hid1" runat="server" />
                            </div>
                            <div class="row " >
                                <asp:Label ID="lblWarning" runat="server" Text="" CssClass="badge badge-outline-warning badge-pill"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hidEMedit" runat="server" />
    <asp:HiddenField ID="hidAUedit" runat="server" />
    <!--vertical wizard-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/jquery.steps.min.js"></script>
    <script src="2.custom/tonyJS/wizard.js"></script>
    <script src="2.custom/external/jquery/jquery.js"></script>
    <script src="2.custom/jquery-ui.js"></script>
    <script src="2.custom/tonyJS/jquery.inputmask.bundle.js"></script>
    <script src="2.custom/tonyJS/inputmask.js"></script>
    <script src="2.custom/tonyJS/dropify.min.js"></script>
    <script src="2.custom/tonyJS/dropify.js"></script>
    <script src="2.custom/bootstrap4-toggle-master/js/bootstrap4-toggle.js"></script>
    <script src="../../../../js/calendar.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>

    <script>
        $(function () {
            $("#btn").addClass("btn-check");
           <%-- var session = '<%=HttpContext.Current.Session["HumanAuthorityInfo"]%>';--%>
            if ($("#ContentPlaceHolder1_hidEMedit").val() == "false") {
                $("#lblaEMedit").prop("hidden", true);
                $("#btnHUEMAU").prop("hidden", true);
                $("#liEM").prop("hidden", true);
                $("#liShop").prop("hidden", true);
                $("#liClub").prop("hidden", true);
            };
            if ($("#ContentPlaceHolder1_hidAUedit").val() == "false") {
                $("#lblaAUedit").prop("hidden", true);
                $("#btnHUMAAU").prop("hidden", true);
                $("#liAU").prop("hidden", true);
            }

        });

        $(document).ready(init);
        function init() {
            $("#<% =txtHireDate.ClientID %>").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: ""
            });

            $("#<% =txtBirth.ClientID %>").datepicker({
                dateFormat: "yy/mm/dd",
                firstDay: 0,
                isRTL: false,
                constrainInput: true,
                yearSuffix: ""
            });

           <%-- $("#<% =CheckSearch %>").addClass("btn-check");--%>

            //$(function () {
            //    $('input[type="checkbox"]').bootstrapToggle({
            //        on: '',
            //        off: '',
            //        onstyle: 'btn btn-outline-danger',
            //        offstyle: 'btn btn-outline-info'

            //    }
            //    );
            //})





        };


        $(function () {



            $("#ContentPlaceHolder1_btnAdd").click(function () {
                swal({
                    title: '請確認是否要新增!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnAdd");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '資料未新增', 'error')
                        }
                    });
            });

            if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
                swal('完成!', '資料已新增', 'success');
                $("#ContentPlaceHolder1_hid1").val("");
            }
            else if ($("#ContentPlaceHolder1_hid1").val() == "false") {
                swal('Email已被使用!', '資料尚未新增', 'error');
                $("#ContentPlaceHolder1_hid1").val("");
            } else if ($("#ContentPlaceHolder1_hid1").val() == "notyet") {
                swal('檔案未上傳!', '資料尚未新增', 'error');
                $("#ContentPlaceHolder1_hid1").val("");
            } else if ($("#ContentPlaceHolder1_hid1").val() == "false2") {
                swal('Email已被使用以及檔案未上傳!', '資料尚未新增', 'error')
                $("#ContentPlaceHolder1_hid1").val("");
            }
        });


        $(function () {

            $("#ContentPlaceHolder1_btnCheck").click(function () {



                $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnCheck");

                $("#form").submit();




            });

        });

        //$(function () {

        //    $("#ContentPlaceHolder1_btnDemo").click(function () {



        //        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnDemo");

        //        $("#form").submit();




        //    });

        //});

        $(function () {
            $("#btnDemo").click(function () {
                $("#ContentPlaceHolder1_txtEmail").val("li168@gmial.com")
                $("#ContentPlaceHolder1_txtName").val("林力祥")
                $("#ContentPlaceHolder1_txtBirth").val("1995/12/24")
                $("#ContentPlaceHolder1_txtAdress").val("台北市復興北路100號")
                $("#ContentPlaceHolder1_txtCellPhone").val("0988127583")
                $("#ContentPlaceHolder1_txtHomePhone").val("02-2223-0807")
                $("#ContentPlaceHolder1_txtClub").val("資訊部門")
                $("#ContentPlaceHolder1_txtPosition").val("一般專員")
                $("#ContentPlaceHolder1_txtExtention").val("248")
                $("#ContentPlaceHolder1_txtHireDate").val("2005/12/14")
                $("#ContentPlaceHolder1_txtMoney").val("60000")
            })

            $("#btnEMAU").click(function () {
                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", false);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", false);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", false);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", false);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", false);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEditAU").prop("checked", false);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", true);

            })

            $("#btnMAAU").click(function () {
                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", false);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", false);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", false);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", false);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", false);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEditAU").prop("checked", false);


                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", true);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", true);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", true);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", true);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", true);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", true);
               
               
            })


            $("#btnHUEMAU").click(function () {
                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", false);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", false);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", false);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", false);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", false);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEditAU").prop("checked", false);

                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", true);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", true);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", true);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", true);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", true);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", true);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", true);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", true);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", true);
            })


            $("#btnHUMAAU").click(function () {
                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", false);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", false);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", false);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", false);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", false);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", false);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", false);
                $("#ContentPlaceHolder1_CheckEditAU").prop("checked", false);

                $("#ContentPlaceHolder1_CheckMeetingRoom").prop("checked", true);
                $("#ContentPlaceHolder1_checkLogin").prop("checked", true);
                $("#ContentPlaceHolder1_CheckSearch").prop("checked", true);
                $("#ContentPlaceHolder1_CheckAddEM").prop("checked", true);
                $("#ContentPlaceHolder1_CheckaskForLeave").prop("checked", true);
                $("#ContentPlaceHolder1_CheckClock").prop("checked", true);
                $("#ContentPlaceHolder1_CheckClub").prop("checked", true);
                $("#ContentPlaceHolder1_CheckShopManager").prop("checked", true);
                $("#ContentPlaceHolder1_CheckEdtiDelete").prop("checked", true);
                $("#ContentPlaceHolder1_CheckEditAU").prop("checked", true);
            });


            $("#btnCheck").click(function () {
                var myData = {
                    emaill: $("#ContentPlaceHolder1_txtEmail").val(),

                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/CheckMail",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        swal(result.d, '', 'info')
                    },
                    error: function () {
                        swal('請輸入Email !!', '', 'error')
                    }
                });



            });

        })

    </script>
</asp:Content>

