<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.HumanLogin.aspx.cs" Inherits="_2_HumanLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper   d-flex align-items-center auth px-0" style="background-color:#EDEDED">
                <div class="row w-100 mx-0">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color:#EDEDED">
                            <div class="brand-logo">
                                <img src="images/louis/mylogo.png" />
                            </div>
                            <h2 class="font-weight-light " style="color: #36bcf7">您好! 歡迎來到人事系統</h2>

                            <div class="pt-3">
                                <div class="form-group">
                                    <%--<input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="Username">--%>
                                    <asp:TextBox ID="LoginName" class="form-control form-control-lg" runat="server" ReadOnly="true"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <%--<input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">--%>
                                    <asp:TextBox ID="LoginPw" runat="server" class="form-control form-control-lg" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入密碼" Text="請輸入密碼" ControlToValidate="LoginPw" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                </div>
                                <div class="mt-3">
                                    <asp:Button class="btn btn-block btn-facebook btn-lg font-weight-medium auth-form-btn" ID="btnSinin" runat="server" Text="登入" OnClick="btnSinin_Click" OnClientClick="return false;" />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblErro" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="my-2 d-flex justify-content-between align-items-center">
                                    <asp:HyperLink class="auth-link text-black" ID="HyperLink1" runat="server" NavigateUrl="~/2.Searchpassword.aspx" ForeColor="#0066FF">忘記密碼?</asp:HyperLink>
                                    <asp:HiddenField ID="hif2" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    
    <script src="2.custom/tonyJS/sweetalert2.js"></script>

    <script>
        $(function () {


            if ($("#ContentPlaceHolder1_hif2").val() == "fales") {
                swal('登入失敗!', '密碼錯誤!', 'error');
                $("#ContentPlaceHolder1_hif2").val("ok");
            } 


            $("#ContentPlaceHolder1_btnSinin").click(function () {


               

                $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnSinin");
                //if ($("#ContentPlaceHolder1_LoginPw").val() === "") {
                //    swal('登入失敗!', '請輸入密碼!!', 'error');
                //} else if ($("#ContentPlaceHolder1_hif2").val() == "ok")
                //{
                    
                //    swal('完成!', '即將進入首頁', 'success')
                //}
                    
                
                /*setTimeout(function () { $("#form").submit(); },800)*/
                $("#form").submit();

            })
        });


    </script>

</asp:Content>

