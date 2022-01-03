<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.AuthorityEdite.aspx.cs" Inherits="_2_AuthorityEdite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/bootstrap4-toggle-master/css/bootstrap4-toggle.css" rel="stylesheet" />
    <style>
        #savebtn {
            font-size: 25px;
            color:dodgerblue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="background-color: #EDEDED" id="contain1">

        <div class="row align-self-center">

            <div class="col-lg-12">
                <div class="card" style="background-color:#EDEDED">
                    <div class="card-body ">
                        <div class="card-title ">
                            <label id="savebtn" class="mdi mdi-content-save" for="btnSave">權限變更:</label>
                            <asp:Button ID="btnSave" runat="server" Text="儲存" CssClass="btn btn-warning btn-fw" OnClick="btnSave_Click" OnClientClick="return false;"/>
                           <%-- <input type="button" id="btnStop" value="停權" class="btn btn-danger btn-fw "  />--%>
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-info btn-fw " NavigateUrl="~/2.AuthoritySearch.aspx">返回</asp:HyperLink>
                        </div>
                    </div>

                </div>

            </div>
            <div class="card px-3">
                <div class="card-body">
                    <h3 class="card-title">權限清單</h3>
                    <div class="list-wrapper" style="max-height: 2000px; height: 700px">
                        <ul class="d-flex flex-column-reverse" id="myul">
                             <li>
                                <div class="form-check col-4">
                                   <asp:CheckBox ID="CheckMeetingRoom" runat="server" />
                                    <label for="CheckMeetingRoom" class="icon-lock">
                                        會議室管理           
                                    </label>

                                </div>
                            </li>    
                            <li>
                                 <div class="form-check col-4">
                                     <asp:CheckBox ID="checkAskForLeave" runat="server"  />
                                     <label for="checkAskForLeave" class="icon-lock">
                                        請假覆核權限
                                               
                                    </label>
                                </div>
                                
                                <div class="form-check col-4">
                                   <asp:CheckBox ID="CheckClub" runat="server" />
                                     <label for="CheckClub" class="icon-lock">
                                        社團管理權限
                                                 
                                    </label>

                                </div>
                                <div class="form-check col-4">
                                     <asp:CheckBox ID="checkShop" runat="server" />
                                    <label for="checkShop" class="icon-lock">
                                        團購審核權限
                                                
                                    </label>

                                </div>
                                

                               
                            </li>             
                            <li>
                                <div class="form-check col-4">
                                     <asp:CheckBox ID="checkEditDelete" runat="server" />
                                    <label for="checkEditDelete" class="icon-lock">
                                        員工資料編輯及刪除權限         
                                    </label>
                                </div> 
                                <div class="form-check col-4">
                                     <asp:CheckBox ID="checkEdit" runat="server" />
                                   <label for="checkEdit" class="icon-lock">
                                        員工權限變更權限
                                               
                                    </label>

                                </div>
                                <div class="form-check col-4">
                                      <asp:CheckBox ID="checkClock" runat="server" />
                                    <label for="checkClock" class="icon-lock">
                                        打卡覆核權限    
                                    </label>
                                </div>
                                
                                
                              
                            </li>
                            <li>
                                 
                                 <div class="form-check col-4">
                                   <asp:CheckBox ID="checkLogin" runat="server" />
                                    <label for="checkLogin" class="icon-lock">
                                        登入權限
                                                
                                    </label>

                                </div>
                                 <div class="form-check col-4">
                                     <asp:CheckBox ID="checkSearch" runat="server" />
                                    <label for="checkSearch" class="icon-lock">
                                        員工資料查詢權限
                                               
                                     
                                    </label>

                                </div>
                                <div class="form-check col-4">
                                     <asp:CheckBox ID="checkAdd" runat="server" />
                                     <label for="checkAdd" class="icon-lock">
                                        員工資料新增權限
                                              
                                       
                                    </label>

                                </div>
                               
                                
                               
                            </li>
                        </ul>

                    </div>
                     <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                    <asp:HiddenField ID="hid1" runat="server" />
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/bootstrap4-toggle-master/js/bootstrap4-toggle.js"></script>
    <%--<script src="../../../../js/calendar.js"></script>--%>

    <script>
        $(function () {
            $('input[type="checkbox"]').bootstrapToggle({
                on: '賦予',
                off: '卸除',
                onstyle: 'btn btn-outline-danger',
                offstyle: 'btn btn-outline-primary'
            }
            );


            $("#ContentPlaceHolder1_btnSave").click(function () {
                swal({
                    title: '請確認是否要儲存!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnSave");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '權限未修改', 'error')
                        }
                    });
            });

            if ($("#ContentPlaceHolder1_hid1").val() == "ok") {
                swal('完成!', '權限已修改', 'success')
                $("#ContentPlaceHolder1_hid1").val("")
            }



        })

        
    </script>
</asp:Content>

