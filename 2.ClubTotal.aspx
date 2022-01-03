<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.ClubTotal.aspx.cs" Inherits="_2_ClubTotal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/jsgrid.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/jsgrid-theme.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/sweetalert2.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="col-12 ">
             <asp:HyperLink ID="HyperLink1" CssClass="btn btn-primary" runat="server" NavigateUrl="~/2.ClubManager.aspx">返回社團管理</asp:HyperLink>
        </div>
       
        <div class="col-12 grid-margin">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">社團總覽</h4>
                    
                    <div class="card-text media"> 
                        <div class="media-body ">
                            <asp:Label ID="Label18" runat="server" Text="請勾選欲刪除社團:" Font-Size="Large" ForeColor="#CC0000">  
                                            </asp:Label>
                            <input type="button" id="btndelete" class="btn btn-outline-danger " value="刪除"  font-size: large" />
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="table-sorter-wrapper col-lg-12 table-responsive">
                            <table id="sortable-table-1" class="table">

                                <asp:Repeater ID="rptclub" runat="server">
                                    <HeaderTemplate>
                                        <thead>
                                            <tr>
                                                <th>
                                                        全選:
                                                    <input type="checkbox" id="allcheck" name="allcheck" />
                                                </th>
                                                <th class="sortStyle">社團編號<i class="ti-angle-down"></th>
                                                <th class="sortStyle">社團名稱<i class="ti-angle-down"></i></th>
                                                <th class="sortStyle">社長員工編號<i class="ti-angle-down"></i></th>
                                                <th>社長姓名</th>
                                                <th>社團描素(30字內)</th>
                                                <th>社團詳細描素</th>
                                                <th class="sortStyle">社團人數<i class="ti-angle-down"></i></th>
                                                <th>封面照片</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="QQ" id="CheckboxGroup1_0" value="<%# Eval("Id") %>" />

                                            </td>
                                            <td>
                                                <a class="btn btn-outline-info" href='<%# Eval("Id","/2.ClubOnlyOne.aspx?id={0}") %>'>
                                                    <%# Eval("Id") %></a>
                                            </td>
                                            <td><%# Eval("ClubName") %></td>
                                            <td><%# Eval("ClubFounderId") %></td>
                                            <td><%# Eval("ClubFounderName") %></td>
                                            <td><%# Eval("ClubScript") %></td>
                                            <td><%# Eval("DetailClubScript") %></td>
                                            <td><%# Eval("PeopleCount") %></td>
                                            <td>'
                                                <image style="width: 200px; height: 200px;" src='/UUUBankClubImage/<%# Eval("ClubImage") %>.jpg'></image>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/jsgrid.min.js"></script>
    <script src="2.custom/tonyJS/jsgrid-zh-tw.js"></script>
    <script src="2.custom/tonyJS/sweetalert2.js"></script>
    <script src="2.custom/tonyJS/jq.tablesort.js"></script>
    <script src="2.custom/tonyJS/tablesorter.js"></script>
    <script>
        $(function () {

            $("#allcheck").click(function () {
                if ($("#allcheck").prop("checked")) {
                    $("input[class='QQ']").each(function () {
                        $(this).prop("checked", true);
                    })
                } else {
                    $("input[class='QQ']").each(function () {

                        $(this).prop("checked", false);
                    })
                }



            });


            $("#btndelete").click(function () {
                swal({
                    title: '請確認!',
                    text: "社團資料即將被刪除!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(function () {
                    var ClubID = new Array();
                    $("input[class='QQ']").each(function () {
                        if ($(this).prop("checked") === true) {
                            ClubID.push($(this).val());
                        }
                    });
                    var club = {
                        id: ClubID
                    };
                    $.ajax({
                        type: 'POST',
                        url: "TonyWebService.asmx/DeleteClub",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(club),
                        success: function (result) {
                            swal({
                                title: result.d,
                                text: "",
                                type: 'info',
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#EA0000',
                            });
                            /* window.location.href = "/2.ClubTotal.aspx";*/
                            setTimeout(function () { window.location.reload();},1500)
                            
                        },
                        error: function () {
                            swal('失敗', '資料未刪除', 'error')
                        }
                    });

                }, function (dismiss) {
                    if (dismiss === 'cancel') {
                        swal('取消', '資料未刪除', 'error')
                    }
                }
                )
            })



        });

    </script>
</asp:Content>

