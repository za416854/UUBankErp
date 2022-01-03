<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="GemBox.Spreadsheet" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Request.QueryString["Id"];
        List<Sponsor> sponsors = ProductUtility.GetProducts();
        List<Sponsor> RP1_StatusF = sponsors.Where(s => s.Id == int.Parse(Request.QueryString["Id"]) && s.PDStatus.ToString() == "False" && s.Check == "Agree").ToList();
        Repeater1.DataSource = RP1_StatusF;
        Repeater1.DataBind();
        List<Sponsor> RP2_StatusT = sponsors.Where(s => s.Id == int.Parse(Request.QueryString["Id"]) && s.PDStatus.ToString() == "True").ToList();
        Repeater2.DataSource = RP2_StatusT;
        Repeater2.DataBind();
        List<Sponsor> RP3_CheckR = sponsors.Where(s => s.Id == int.Parse(Request.QueryString["Id"]) && s.Check == "Reject").ToList();
        Repeater3.DataSource = RP3_CheckR;
        Repeater3.DataBind();
        List<Sponsor> RP4_Notyet = sponsors.Where(s => s.Id == int.Parse(Request.QueryString["Id"]) && s.Check == "Notyet").ToList();
        Repeater4.DataSource = RP4_Notyet;
        Repeater4.DataBind();

        List<int> LC = new List<int>();
        List<int> CN = new List<int>();

        foreach (RepeaterItem item in Repeater1.Items)
        {
            HiddenField hidLC = item.FindControl("HideLC") as HiddenField;
            int Lcount = int.Parse(hidLC.Value);

            HiddenField hidCN = item.FindControl("HideCN") as HiddenField;
            int CNount = int.Parse(hidCN.Value);

            Button btn = item.FindControl("Button2") as Button;

            HiddenField hidst = item.FindControl("HideStatus") as HiddenField;
            Boolean Sta = Convert.ToBoolean(hidst.Value);

            if (CNount >= Lcount && hidst.Value == "False")
            {
                btn.Visible = true;
            }
            else
            {
                btn.Visible = false;
            }


            HyperLink hy1 = item.FindControl("HyperLink1") as HyperLink;
            HyperLink hy2 = item.FindControl("HyperLink2") as HyperLink;

            if (Sta)
            {
                hy1.Visible = false;
                hy2.Visible = false;
            }
            else
            {
                hy1.Visible = true;
                hy2.Visible = true;
            }

        }

    }
    //創建團購
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect($"~/4.Iamsponsor_Add.aspx?Id={Request.QueryString["Id"]}");
    }


</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="vendors/owl-carousel-2/owl.theme.default.min.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.carousel.min.css" rel="stylesheet" />
    <link href="ted/IMSponsor/sweetalert2.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="container">--%>
        <div class="content-wrapper bgcolor">
            <asp:HiddenField ID="Hiddenalertif" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">我是發起人</h4>
                    <div class="card-description">
                        <asp:Button ID="Button1" runat="server" Text="創建團購" CssClass="btn btn-facebook btn-sm" OnClick="Button1_Click" />
                    </div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home-2" role="tab" aria-controls="home-1" aria-selected="true">尚未發車</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile-1" role="tab" aria-controls="profile-1" aria-selected="false">已發車</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="notyet-tab" data-bs-toggle="tab" href="#notyet-1" role="tab" aria-controls="notyet-1" aria-selected="false">審核中</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact-1" role="tab" aria-controls="contact-1" aria-selected="false">審核失敗</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="home-2" role="tabpanel" aria-labelledby="home-tab">
                            <div class="table-responsive pt-3">
                                <table class="table table-hover">
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr>
                                                    <th>編號</th>
                                                    <th>項目
                                                    </th>
                                                    <th>團購品名
                                                    </th>
                                                    <th>價格
                                                    </th>
                                                    <%--<th>資訊
                                                    </th>--%>
                                                    <th>賣家想說...
                                                    </th>
                                                    <%--<th>發車狀態
                                </th>--%>
                                                    <th>目前數量/發車數量
                                                    </th>
                                                    <th>審核狀態
                                                    </th>
                                                    <th>編輯</th>
                                                </tr>

                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <%--<asp:HiddenField ID="Hiddenwtid" runat="server" Value='<%# Eval("Waterid") %>' />--%>
                                                <input class="hidId" type="hidden" value='<%# Eval("Waterid") %>' />
                                                <td>
                                                    <asp:Image ID="Image1" runat="server"  CssClass=" img-fluid PDimg" data-bs-toggle="modal" data-bs-target='#modal_main' ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %>
                                                </td>
                                                <td><%# Eval("Price") %>
                                                </td>
                                               <%-- <td><%# Eval("ProductInFo") %>
                                                </td>--%>
                                                <td class="single-ellipsis"><%# Eval("SayST") %>
                                                </td>
                                                <%--<td><%# Eval("PDStatus") %></td>--%>
                                                <asp:HiddenField ID="HideStatus" Value='<%# Eval("PDStatus") %>' runat="server" />
                                                <td class="CCCount">
                                                    <asp:HiddenField ID="HideLC" runat="server" Value='<%# Eval("LimitCount") %>' />
                                                    <asp:HiddenField ID="HideCN" runat="server" Value='<%# Eval("PDCountNow") %>' />

                                                    <p id="NC" class="PDNcount float-left"><%# Eval("PDCountNow") %></p>
                                                    <p class="float-left">/</p>
                                                    <p id="LC" class="PDLcount float-left"><%# Eval("LimitCount") %></p>
                                                </td>
                                                <td class="PDcheck"><%# Eval("Check") %>   &emsp;  
                                
                                                    <%--<asp:HyperLink ID="Button2" runat="server" CssClass="gogobtn btn btn-rounded btn-info btn-sm" NavigateUrl='<%# Eval("WaterId","/4.ChangeStatus.aspx?WaterId={0}") %>'>發車去!</asp:HyperLink>--%>
                                                    <asp:Button ID="Button2" name='<%# Eval("Waterid") %>' runat="server" Text="發車去!" CssClass="gogobtn btn btn-rounded btn-info btn-sm" OnClientClick="return false"  />
                                                    <%--<input id="button" type="button" name="<%# Eval("Waterid") %>" value="發車去!" Class="gogobtn btn btn-rounded btn-info btn-sm"/>--%>
                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-outline-facebook btn-sm btnedit" NavigateUrl='<%# Eval("WaterId","/4.Iamsponsor_Edit.aspx?WaterId={0}") %>'>修改</asp:HyperLink>
                                                    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-outline-facebook btn-sm btndelete" NavigateUrl='<%# Eval("WaterId","/4.Iamsponsor_Edit.aspx?WaterId={0}") %>'>刪除</asp:HyperLink>
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
                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                        <div class="tab-pane fade" id="profile-1" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="table-responsive pt-3">
                                <table class="table table-hover">
                                    <asp:HiddenField ID="hidesave" runat="server" />
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr>
                                                    <th>編號</th>
                                                    <th>項目
                                                    </th>
                                                    <th>團購品名
                                                    </th>
                                                    <th>價格
                                                    </th>
                                                    <%--<th>資訊
                                                    </th>--%>
                                                    <th>賣家想說...
                                                    </th>

                                                    <th>總下單數量
                                                    </th>
                                                    <th>下載表單
                                                    </th>

                                                </tr>

                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>No.<%# Eval("Waterid") %></td><input class="hidId" type="hidden" value='<%# Eval("Waterid") %>' />
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" name='<%# Eval("Waterid") %>' CssClass=" img-fluid PDimg" data-bs-toggle="modal" data-bs-target='#modal_main' ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %>
                                                </td>
                                                <td><%# Eval("Price") %>
                                                </td>
                                                <%--<td><%# Eval("ProductInFo") %>
                                                </td>--%>
                                                <td class="single-ellipsis"><%# Eval("SayST") %>
                                                </td>
                                                <%--<td><%# Eval("PDStatus") %></td> <asp:HiddenField ID="HideStatus" Value='<%# Eval("PDStatus") %>' runat="server" />--%>
                                                <td class="CCCount">
                                                    <asp:HiddenField ID="HideLC" runat="server" Value='<%# Eval("LimitCount") %>' />
                                                    <asp:HiddenField ID="HideCN" runat="server" Value='<%# Eval("PDCountNow") %>' />

                                                    <p id="NC" class="PDNcount float-left"><%# Eval("PDCountNow") %></p>
                                                </td>
                                                <td>
                                                    <%--<asp:Button ID="Btn_Download" runat="server" Text="下載表單" CssClass="btn btn-google btn-sm btn-rounded dl_btn" OnClientClick="return false"/>--%>
                                                    <asp:HyperLink ID="Btn_Download" runat="server" CssClass="btn btn-google btn-sm btn-rounded dl_btn" NavigateUrl='<%# Eval("WaterId","/4.download.aspx?WaterId={0}") %>'>下載表單</asp:HyperLink>
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
                        <div class="tab-pane fade" id="notyet-1" role="tabpanel" aria-labelledby="notyet-tab">
                            <div class="table-responsive pt-3">
                                <table class="table table-hover">
                                    <asp:Repeater ID="Repeater4" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr>
                                                    <th>編號</th>
                                                    <th>項目
                                                    </th>
                                                    <th>團購品名
                                                    </th>
                                                    <th>價格
                                                    </th>
                                                   <%-- <th>資訊
                                                    </th>--%>
                                                    <th>賣家想說...
                                                    </th>

                                                    <th>審核狀態
                                                    </th>
                                                    <th>備註
                                                    </th>

                                                </tr>

                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" name='<%# Eval("Waterid") %>' CssClass=" img-fluid PDimg" data-bs-toggle="modal" data-bs-target='#modal_main' ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %>
                                                </td>
                                                <td><%# Eval("Price") %>
                                                </td>
                                              <%--  <td><%# Eval("ProductInFo") %>
                                                </td>--%>
                                                <td class="single-ellipsis"><%# Eval("SayST") %>
                                                </td>
                                                <td class="PDcheck"><%# Eval("Check") %>   
                                                </td>
                                                <td><%# Eval("RJresult") %></td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact-1" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="table-responsive pt-3">
                                <table class="table table-hover">
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr>
                                                    <th>編號</th>
                                                    <th>項目
                                                    </th>
                                                    <th>團購品名
                                                    </th>
                                                    <th>價格
                                                    </th>
                                                    <%--<th>資訊
                                                    </th>--%>
                                                    <th>賣家想說...
                                                    </th>

                                                    <th>審核狀態
                                                    </th>
                                                    <th>備註
                                                    </th>

                                                </tr>

                                            </thead>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" name='<%# Eval("Waterid") %>' CssClass=" img-fluid PDimg" data-bs-toggle="modal" data-bs-target='#modal_main' ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %>
                                                </td>
                                                <td><%# Eval("Price") %>
                                                </td>
                                              <%--  <td><%# Eval("ProductInFo") %>
                                                </td>--%>
                                                <td class="single-ellipsis"><%# Eval("SayST") %>
                                                </td>
                                                <td class="PDcheck"><%# Eval("Check") %>   
                                                </td>
                                                <td><%# Eval("RJresult") %></td>
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
    <%--</div>--%>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="js/owl-carousel.js"></script>

    <script src="vendors/sweetalert/sweetalert.min.js"></script>
    <script src="vendors/jquery.avgrund/jquery.avgrund.min.js"></script>

    <script src="ted/IMSponsor/sweetalert2.js"></script>


    <script src="js/alerts.js"></script>
    <script>
        $(function () {

            $(".gogobtn").click(function () {
                var id = $(this).parent().parent().find(".hidId").val();
                var myData = {
                    waterid: id
                };
                $.ajax({
                    type: 'POST',
                    url: "WebService.asmx/GetProduct",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        var info = result.d;

                        swal({
                            title: '確認發車?',
                            text: "發車後不得更改資訊!",
                            type: 'warning',
                            showCancelButton: true,
                        }).then(
                            function () {
                                var a = info.Waterid;
                                var b = info.Id;
                                document.location.replace(`4.ChangeStatus.aspx?Waterid=${a}`);
                            },
                            function (dismiss) {
                                if (dismiss === 'cancel') {
                                    swal('取消', '尚未發車', 'warning')
                                }
                            });
                    }
                });
            });

        });
    </script>
</asp:Content>

