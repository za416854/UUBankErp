<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.EmployeeList OnlySearch.aspx.cs" Inherits="_2_EmployeeList_OnlySearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/dataTables.bootstrap4.css" rel="stylesheet" />
    <script src="2.custom/tonyJS/vue.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row ">
            <div class=" col-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary " NavigateUrl="~/2.EditSlefPerson-Hight.aspx">返回人事首頁</asp:HyperLink>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">員工資料表</h4>
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table id="order-listing" class="table">
                                <thead>
                                    <tr>
                                        <th>員工編號</th>
                                        <th>Email</th>
                                        <th>姓名</th>
                                        <th>性別</th>
                                        <th>出生日期</th>
                                        <th>居住地址</th>
                                        <th>手機</th>
                                        <th>居住電話</th>
                                        <th>部門</th>
                                        <th>職位</th>
                                        <th>分機</th>
                                        <th>薪資</th>
                                        <th>到職日</th>
                                        <th>離職日</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="s in myList">
                                        <td>{{s.ID}}</td>
                                        <td>{{s.Email}}</td>
                                        <td>{{s.Name}}</td>
                                        <td>{{s.Gender}}</td>

                                        <td>{{s.Birthday}}</td>
                                        <td>
                                            <textarea rows="2" cols="20" readonly="readonly" style="background-color: snow"> {{s.Address}}</textarea>

                                        </td>
                                        <td>{{s.CellPhone}}</td>
                                        <td>{{s.HomePhone}}</td>
                                        <td>{{s.Department}}</td>
                                        <td>{{s.Position}}</td>
                                        <td>{{s.Extension}}</td>
                                        <td>{{s.Salary}}</td>
                                        <td>{{s.HireDay}}</td>
                                        <td>{{s.Resignday}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
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
                    url: "TonyWebService.asmx/GetHumanPatiailList",
                    contentType: "application/json;utf-8",
                    async: false,
                    dataType: "json",
                    success: function (result) {
                        self.myList = result.d;
                    }
                });
            }

        });



    </script>
</asp:Content>
