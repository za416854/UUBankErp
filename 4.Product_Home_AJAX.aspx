<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import Namespace=" System.Data" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            HiddenMBid.Value = Request.QueryString["id"];
            DataTable allPD = ProductUtility.GetALLproducts();
            Repeater1.DataSource = allPD;
            Repeater1.DataBind();
            foreach (RepeaterItem item in Repeater1.Items)
            {
                HiddenField hidST = item.FindControl("HiddenStatus") as HiddenField;
                bool Status = Convert.ToBoolean(hidST.Value);
                Button btnstatus = item.FindControl("Button3") as Button;

                if (Status)
                {
                    btnstatus.Visible = true;
                }
                else
                {
                    btnstatus.Visible = false;
                }
            }
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string a = HiddenWaterid.Value;
        string b = HiddenMBid.Value;

        Response.Redirect($"~/4.ProductDetail.aspx?WaterId={a}&id={b}");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link href="vendors/owl-carousel-2/owl.theme.default.min.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.carousel.min.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
    <link href="css/site.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <%--<div class="container">--%>
    <div class="content-wrapper bgcolor">
        <div class="row portfolio-grid col-12">

            <%-- Hidden Area --%>
            <asp:HiddenField ID="HiddenMBid" runat="server" />
            <asp:HiddenField ID="HiddenWaterid" runat="server" />

            <%--data repeater--%>
            <asp:Repeater ID="Repeater1" runat="server" ><%--DataSourceID="SqlDataSource1"--%>
                <ItemTemplate>
                    <div class=" col-lg-3 col-md-6 col-sm-6" id="Pcard">
                        <div class="card   cardpadd " style="min-height:600px; max-height:602px;">
                            <div class="card-header">
                                <%-- hide id --%>
                                <asp:Label Text='<%# Eval("Waterid") %>' runat="server" Visible="false" CssClass="Waterid" />
                                <asp:HiddenField ID="HiddenStatus" runat="server" value='<%# Eval("PDStatus") %>'/>
                                <div class =" card-title">
                                <%-- ProductName + link--%>
                                <%--<asp:HyperLink ID="HyperLink2" CssClass="card-title " NavigateUrl='<%# String.Format("/4.ProductDetail.aspx?id={0}&waterid={1}", Eval($"{HiddenMBid.Value}"), Eval("Waterid")) %>' runat="server" Font-Underline="false">--%>
                                    <h3 class="float-left">No.<%# Eval("Waterid") %></h3>
                                    <h3 class="float-left"><%# Eval("ProductName") %></h3>
                                <asp:Button ID="Button3" runat="server" Text="已發車" CssClass="gogobtn btn btn-rounded btn-warning btn-sm float-right" OnClientClick="return false" Visible="false"/>
                                <%--</asp:HyperLink><br />--%></div>
                            </div>


                            <%-- Img + link --%>
                            <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("/4.ProductDetail.aspx?id={0}&waterid={1}", Eval("buyerid"), Eval("Waterid")) %>'>--%>
                            <%--</asp:HyperLink>--%>

                                <asp:Image ID="Image4" runat="server" CssClass="Productimg img-fluid" ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />

                            <%-- SP SayST --%>
                            <div class="card-body ">
                                <p class="card-text ellipsis"><%# Eval("SayST") %></p>
                            </div>  


                            <%-- PDcountNow --%>
                            <div class="card-footer">
                                <p class="float-left">開團數量 : <%# Eval("LimitCount") %></p>
                                <p class="text-right">累積數量 : <%# Eval("PDCountNow") %></p>

                                <%-- modal btn --%>
                                <input type="button" name='<%# Eval("Waterid") %>' value="想了解" class="Mymodal btn btn-outline-dark form-control " data-bs-toggle="modal" data-bs-target='#modal' onclientclick="return false" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


            <%--modal begin--%>
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
                            
                            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="我要+1" class="btn btn-outline-facebook btnup"  />
                            <asp:Button ID="Button2" OnClick="Button1_Click" runat="server" Text="已發車" class="btn btn-warning btnup"  OnClientClick="return false"/>
                        </div>
                    </div>
                </div>

            </div>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT Sponsors.Waterid, Sponsors.[Check], Sponsors.Id, Sponsors.ProductName, Sponsors.Price, Sponsors.LimitCount, Sponsors.ProductInFo, Sponsors.SayST, Sponsors.ImgFileName1, Sponsors.ImgFileName2, Sponsors.ImgFileName3, Sponsors.PDStatus, Sponsors.PDCountNow FROM Sponsors LEFT OUTER JOIN Cart ON Sponsors.Waterid = Cart.Waterid WHERE (Sponsors.[Check] = N'agree')"></asp:SqlDataSource>
        </div>
        <%--</div>--%>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page -->
    <script src="vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="js/owl-carousel.js"></script>

    <!-- End plugin css for this page -->
    <!-- Custom js for this page-->


    <!-- End Custom js for this page-->
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
                        $(".PDname").text( info.ProductName)
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
                        var STa = info.PDStatus;
                        //alert(Number(STa));

                        if (STa == 1) {
                            
                            $("#ContentPlaceHolder1_Button2").show();
                            $("#ContentPlaceHolder1_Button1").hide();
                        } else
                        {
                            
                            $("#ContentPlaceHolder1_Button1").show();
                            $("#ContentPlaceHolder1_Button2").hide();
                        }


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
            

        });




    </script>
    
</asp:Content>

