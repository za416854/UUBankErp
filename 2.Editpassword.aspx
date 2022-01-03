<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.Editpassword.aspx.cs" Inherits="_2_Editpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth px-0">
                <div class="row w-100 mx-0">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left py-5 px-4 px-sm-5" style="background-color: #ffffff">
                            <div class="brand-logo">
                                 <img src="images/louis/mylogo.png" />
                            </div>

                            <h3 class="font-weight-light" style="color: red">請輸入以下必要資訊</h3>
                            <div class="pt-3">
                                <div class="form-group">
                                    <asp:TextBox ID="SeachID" class="form-control form-control-lg" runat="server" placeholder="請填員工編號" ReadOnly="True"></asp:TextBox>
 
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="dpl1" runat="server" CssClass="form-control" ForeColor="Black" Font-Size="Large">
                                        <asp:ListItem>Erp系統密碼</asp:ListItem>
                                        <asp:ListItem>人事系統密碼</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="OldPassword" class="form-control form-control-lg" runat="server" placeholder="舊密碼" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請填密碼" Text="請填舊密碼" ControlToValidate="OldPassword" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="NewPassword" class="form-control form-control-lg" runat="server" placeholder="新密碼" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="請填新密碼" Text="請填新密碼" ControlToValidate="NewPassword" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="NewPassword2" class="form-control form-control-lg" runat="server" placeholder="請再次輸入新密碼" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="請確定新密碼是否相同" Text="請確定新密碼是否相同" ControlToValidate="NewPassword2" CssClass="badge badge-outline-danger badge-pill"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="請確定密碼是否相同" ControlToCompare="NewPassword" ControlToValidate="NewPassword2" CssClass="badge badge-outline-danger badge-pill"></asp:CompareValidator>

                                </div>
                                <div class="row">
                                    <%--<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />--%>
                                    <div class="col-6">
                                        <asp:Button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn " ID="btnSinin" runat="server" Text="變更" OnClick="btnSinin_Click" OnClientClick="return false;" />
                                    </div>
                                    <div class="col-6">
                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-block btn-secondary btn-lg font-weight-medium auth-form-btn " NavigateUrl="~/2.EditSlefPerson-Hight.aspx">返回</asp:HyperLink>
                                    </div>
                                </div>

                                <asp:HiddenField ID="hid1" runat="server" />
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

            $("#ContentPlaceHolder1_btnSinin").click(function () {
                swal({
                    title: '請確認!',
                    text: "密碼即將變更!",
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
                            swal('取消', '密碼未變更', 'error')
                        }
                    });

            });

            if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
                swal('完成!', '密碼已變更', 'success')
            }
            else if ($("#ContentPlaceHolder1_hid1").val() == "false") {
                swal('員工編號或舊密碼錯誤!', '密碼未變更', 'error')
            }

        });

    </script>
</asp:Content>

