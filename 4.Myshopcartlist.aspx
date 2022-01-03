<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace=" System.Data" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Request.QueryString["Id"];
        if (Page.IsPostBack == false)
        {
            string byid = Request.QueryString["id"];
            DataTable dataTableF = CartUtility.GetMyshopCartF(int.Parse(byid));
            
            Repeater1.DataSource = dataTableF;
            Repeater1.DataBind();

            DataTable dataTableT = CartUtility.GetMyshopCartT(int.Parse(byid));
            
            Repeater2.DataSource = dataTableT;
            Repeater2.DataBind();

        }

    }
 
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="vendors/owl-carousel-2/owl.theme.default.min.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.carousel.min.css" rel="stylesheet" />


    <link href="css/site.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--<div class="container">--%>
        <div class="content-wrapper bgcolor">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="card">
                <div class="card-body">
                  <h4 class="card-title">我的團購車</h4>
                  
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home-2" role="tab" aria-controls="home-1" aria-selected="true">尚未發車</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile-1" role="tab" aria-controls="profile-1" aria-selected="false">已發車</a>
                    </li>
                    
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane fade show active" id="home-2" role="tabpanel" aria-labelledby="home-tab">
                        <div class="table-responsive">
                             <table id="SponsorList" class="table">
                                <thead class="bg-facebook text-white">
                                    <tr>
                                        
                                        <th>編號</th>
                                        <th>項目</th>
                                        <th>團購品名</th>
                                        <th>價格</th>
                                        <th>訂購數量</th>
                                        <th>資訊</th>
                                        <th>累計數/發車數</th>
                                        <th></th>
                                        <th>更改</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" >
                                        <ItemTemplate>
                                            <tr>
                                                <input class="hidcartId" type="hidden" value='<%# Eval("CartId") %>' />
                                                <td>No.<%# Eval("Waterid") %></td> <input class="hidId" type="hidden" value='<%# Eval("Waterid") %>' />
                                                <td>
                                                    <asp:Image ID="Image4" runat="server" CssClass="Productimg img-fluid" ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %></td>
                                                <td><%# Eval("Price") %></td>
                                                <td><%# Eval("Count") %></td>
                                                <td><%# Eval("ProductInFo") %></td>
                                                <td><%# Eval("PDCountNow") %>/<%# Eval("LimitCount") %></td>
                                                <td>
                                                    <input type="button" name='<%# Eval("Waterid") %>' value="View" class="Mymodal btn btn-outline-dark form-control " data-bs-toggle="modal" data-bs-target='#modal' onclientclick="return false" />
                                                </td>
                                                <td>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-outline-facebook btn-sm " NavigateUrl='<%# String.Format("/4.Buyer_Edit.aspx?id={0}&waterid={1}", Eval("buyerid"), Eval("Waterid")) %>'>修改</asp:HyperLink>
                                                    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-outline-facebook btn-sm btn_cancle" >退車</asp:HyperLink>
                                                </td>

                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <%--                         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Members.Id AS Expr2, Members.Name,Members.Email, Sponsors.Waterid, Sponsors.Id, Sponsors.ProductName, Sponsors.Price, Sponsors.LimitCount, Sponsors.ProductInFo, Sponsors.SayST, Sponsors.ImgFileName1, Sponsors.ImgFileName2, Sponsors.ImgFileName3, Sponsors.[Check] FROM Members INNER JOIN Sponsors ON Members.Id = Sponsors.Id WHERE (Sponsors.[Check] = N'not')"></asp:SqlDataSource>--%>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile-1" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive">
                             <table id="SponsorList1" class="table">
                                <thead class="bg-facebook text-white">
                                    <tr>
                                        
                                        <th>編號</th>
                                        <th>項目</th>
                                        <th>團購品名</th>
                                        <th>價格</th>
                                        <th>訂購數量</th>
                                        <th>資訊</th>
                                        <th>累計數/發車數</th>
                                        <th></th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater2" runat="server" >
                                        <ItemTemplate>
                                            <tr>
                                                
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <td>
                                                    <asp:Image ID="Image4" runat="server" CssClass="Productimg img-fluid" ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %></td>
                                                <td><%# Eval("Price") %></td>
                                                <td><%# Eval("Count") %></td>
                                                <td><%# Eval("ProductInFo") %></td>
                                                <td><%# Eval("PDCountNow") %>/<%# Eval("LimitCount") %></td>
                                                <td>
                                                    <input type="button" name='<%# Eval("Waterid") %>' value="View" class="Mymodal btn btn-outline-dark form-control " data-bs-toggle="modal" data-bs-target='#modal' onclientclick="return false" />
                                                </td>
                                                

                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                   
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2"></asp:SqlDataSource>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                  </div>
                </div>
              </div>
        </div>

        <div class="modal fade show " id='modal' tabindex="0" aria-labelledby="exampleModalLabel" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-lg " role="document">
                    <div class="modal-content ">

                        <%-- modal Header --%>
                        <div class="modal-header bgcolor">
                            <h5 class="modal-title" id="Owner">發起人:<br />
                            </h5>
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close" id="closebtn">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>

                        <%-- modal Body --%>
                        <div class="modal-body">
                            <div class="row">

                                <%-- Image sm --%>
                                <div class="col-1 justify-content-around imageAry">
                                    <div class=" ">
                                        <img src="1" class="img-fluid img01 " id="img1" />
                                    </div>
                                    <div class=" ">
                                        <img src="1" class="img-fluid  img02" />
                                    </div>
                                    <div class=" ">
                                        <img src="1" class="img-fluid  img03" />
                                    </div>
                                </div>

                                <%-- Image Carousel --%>
                                <div class="col-6">
                                    <div class=" grid-margin stretch-card">
                                        <div class="owl-carousel owl-theme full-width">
                                            <div class="item">
                                                <img src="1" class="img-fluid img11" />

                                            </div>
                                            <div class="item slide2">
                                                <img src="1" class="img-fluid img22" />

                                            </div>
                                            <div class="item slide3">
                                                <img src="1" class="img-fluid img33" />

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- Card Product Info --%>
                                <div class="col-5">
                                    <p class ="btn btn-inverse-dark limitcount "></p>
                                    <p class ="btn btn-inverse-dark countnow text-right"></p>
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">團購品名 :</h4><span class="PDname"></span>

                                            <hr />

                                            <p class="card-description">價格:</p><span class="Price"></span>

                                            <hr />

                                            <p class="card-description">介紹:</p><span class="PDinfo"></span>

                                            <hr />

                                            <div class="card card-inverse-success" id="context-menu-access">
                                                <div class="card-body">
                                                    <div class="card-text ">發起人想說 : <br /></div><br /><p class="SayST"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- modal footer --%>
                        <div class="modal-footer bgcolor">
                            
                        </div>
                    </div>
                </div>
            </div>
    <%--</div>--%>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" Runat="Server">
    
    <script src="vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="js/owl-carousel.js"></script>
    
    <script>
        $(function () {

            $(".Mymodal").click(function (event) {
                var target = $(event.target)[0];
                var name = parseInt(target.name);
                //alert($(this).attr("name"));
                $("#LB_hide").attr(Text, name)
                var myData = {
                    waterid: name
                };

                $.ajax({
                    type: 'POST',
                    url: "WebService.asmx/GetProduct",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        var info = result.d;
                        $("#ContentPlaceHolder1_Label1").text(info.Waterid)
                        $(".PDname").text(info.ProductName)
                        $(".PDinfo").text(info.ProductInFo)
                        $(".SayST").text(info.SayST)
                        $(".Price").text("$" + info.Price)
                        /*alert(info.Waterid)*/
                        var a = $("#ContentPlaceHolder1_HiddenWaterid").val(info.Waterid);
                        var ownerid = info.Id;
                        $("#Owner").text("發起人工號:" + ownerid);
                        var now = info.PDCountNow;
                        $(".countnow").text("目前累積數量 : " + now);
                        $(".limitcount").text("開團數量 : " + info.LimitCount);


                        if (info.ImgFileName1 != "") {
                            $(".img01").attr("src", "/Sponsors/" + info.ImgFileName1)
                            $(".img11").attr("src", "/Sponsors/" + info.ImgFileName1)
                        }

                        if (info.ImgFileName2 != "") {
                            $(".img02").show()
                            $(".img22").show()
                            $(".img02").attr("src", "/Sponsors/" + info.ImgFileName2)
                            $(".img22").attr("src", "/Sponsors/" + info.ImgFileName2)
                        }
                        else {
                            $(".img02").hide()
                            $(".img22").hide()
                        }
                        if (info.ImgFileName3 != "") {
                            $(".img33").add()
                            $(".img03").show()
                            $(".img33").show()
                            $(".slide3").add()
                            $(".img03").attr("src", "/Sponsors/" + info.ImgFileName3)
                            $(".img33").attr("src", "/Sponsors/" + info.ImgFileName3)
                        }
                        else {
                            $(".slide3").remove()
                            $(".img03").hide()
                            $(".img33").hide()
                        }


                    }



                });

            });
            //ContentPlaceHolder1_Repeater1_HyperLink2_0

            $(".btn_cancle").click(function () {
                
                var cid = $(this).parent().parent().find(".hidcartId").val();
                myData = {
                    
                    CId: cid
                };
                swal({
                    title: '確認刪除此項目?',
                    /*text: "!",*/
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        $.ajax({
                            type: 'POST',
                            url: "WebService.asmx/DeleteCart",
                            contentType: "application/json;utf-8",
                            dataType: "json",
                            data: JSON.stringify(myData),
                            success: function (result) {
                                swal({
                                    title: '刪除成功!',
                                    text: "畫面將自動更新!",
                                    type: 'success',
                                });
                                setTimeout(function () { window.location.reload(); }, 1500)
                            }
                        });
                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '購物車未刪除', 'warning')
                        }
                    });
            });
        });

    </script>
</asp:Content>

