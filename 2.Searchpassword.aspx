<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.Searchpassword.aspx.cs" Inherits="_2_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="2.custom/tonyCss/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-scroller" >
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color:#ffffff">
              <div class="brand-logo">
                  <img src="images/louis/mylogo.png" />
              </div>
         
              <h3 class="font-weight-light " style="color:#fca805">請輸入員工編號以及Email</h3>
              <div class="pt-3">
                <div class="form-group">
                     <asp:TextBox ID="SeachId" class="form-control form-control-lg" runat="server" placeholder="ID"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請填員工編號" Text="請填員工編號" ControlToValidate="SeachID" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                 <asp:TextBox ID="SearchEmail" class="form-control form-control-lg" runat="server" placeholder="Email" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請填Email" Text="請填Email" ControlToValidate="SearchEmail" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                </div>
                <div class="mt-3">
                 <asp:Button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" ID="btnSinin" runat="server" Text="補發密碼" OnClick="btnSinin_Click"  OnClientClick="return false;"/>
                </div>
                <div class="form-group">
                    <br />
                    <br />
                   
                    <asp:Label ID="lblEnd" runat="server" Text="" CssClass="badge badge-outline-warning" Font-Size="Large" ></asp:Label>
                    <asp:HiddenField ID="hif1" runat="server" />
                     <asp:HiddenField ID="hif2" runat="server" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" Runat="Server">
     <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script>

        $(function () {

            $("#ContentPlaceHolder1_btnSinin").click(function () {
                swal({
                    title: '請確認!',
                    text: "密碼即將補發!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnSinin");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '密碼未補發', 'error')
                        }
                    });

            });

            if ($("#ContentPlaceHolder1_hif2").val() == "ok") {
                swal('完成!', $("#ContentPlaceHolder1_hif1").val(), 'success')
            }
            else if ($("#ContentPlaceHolder1_hif2").val() == "false") {
                swal('員工編號或Email錯誤!', '密碼未補發', 'error')
            }

        });

    </script>
</asp:Content>

