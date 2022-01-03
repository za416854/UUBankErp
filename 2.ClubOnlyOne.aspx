<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.ClubOnlyOne.aspx.cs" Inherits="_2_ClubOnlyOne" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="2.custom/tonyCss/dataTables.bootstrap4.css" rel="stylesheet" />
     <script src="2.custom/tonyJS/vue.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary " NavigateUrl="~/2.ClubTotal.aspx">返回社團總覽</asp:HyperLink>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">
                    <asp:Label ID="lblClubData" runat="server" Text="Label"></asp:Label></h4>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>員工編號</th>
                                        <th>姓名</th>
                                        <th>部門</th>
                                        <th>申請原因</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="s in myList">
                                        <td>{{s.EmployeeId}}</td>
                                        <td>{{s.EmployeeName}}</td>
                                        <td>{{s.EmployeeDepartment}}</td>
                                        <td>
                                            <textarea rows="2" cols="20" readonly="readonly" style="background-color: snow"> {{s.JoinClubReason}}</textarea>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hfd1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" Runat="Server">
    <script src="2.custom/tonyJS/jquery.dataTables.js"></script>
    <script src="2.custom/tonyJS/dataTables.bootstrap4.js"></script>
    <script src="2.custom/tonyJS/data-table.js"></script>
   
    <script>


        var app = new Vue({
            el: '#order-listing',
            data: {
                myList: []
            },
            created: function () {
                var self = this;

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/GetClubPeole",
                    contentType: "application/json;utf-8",
                    async: false,
                    dataType: "json",
                    data: JSON.stringify({ id: $("#ContentPlaceHolder1_hfd1").val()}),
                    success: function (result) {
                        self.myList = result.d;
                    }
                });
            }

        });



    </script>
</asp:Content>

