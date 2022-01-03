<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            int waterid = int.Parse(Request.QueryString["WaterId"]);
            //int waterid = 1;
            Sponsor p = ProductUtility.GetProduct(waterid);
            //int SPid = p.Id;
            int SPid = p.Id;
            HumanMember M = HumanMemberUtility.GetHumanMemberById(SPid);
            Lb_SP_Name.Text = M.Name;
            Lb_SP_Phone.Text = M.CellPhone;
            Lb_SP_Email.Text = M.Email;
            HiddenField5.Value = p.Waterid.ToString();
            
            Lb_PD_Name.Text = p.ProductName;
            Lb_PD_Price.Text = p.Price.ToString();
            Lb_SP_LimitCount.Text = $"{p.LimitCount.ToString()}/{p.PDCountNow}";
            Txt_PD_info.Value = p.ProductInFo;
            Lb_SP_SayST.Text = p.SayST;

            int BYid = int.Parse(Request.QueryString["id"]);
            HumanMember BM = HumanMemberUtility.GetHumanMemberById(BYid);

            Lb_BY_Id.Text = BM.ID.ToString();
            Lb_BY_Name.Text = BM.Name;
            Lb_BY_Email.Text = BM.Email;
            Lb_BY_Phone.Text = BM.CellPhone;

            Image1.ImageUrl = "~/Sponsors/" + p.ImgFileName1;
            Image2.ImageUrl = "~/Sponsors/" + p.ImgFileName2;
            Image3.ImageUrl = "~/Sponsors/" + p.ImgFileName3;
            Cart C = CartUtility.GetoneCartById(BYid,waterid);
            PDcount.Value = C.Count.ToString();


        }

    }
    //送出
    protected void Button1_Click(object sender, EventArgs e)
    {
        int waterid = int.Parse(Request.QueryString["WaterId"]);

        Sponsor SP = ProductUtility.GetProduct(waterid);
        Cart C = CartUtility.GetoneCartById(int.Parse(Lb_BY_Id.Text), SP.Waterid);

        if (C.Count>int.Parse(PDcount.Value)) 
        {
            //-
            int upc = C.Count - int.Parse(PDcount.Value);
            C.Count = int.Parse(PDcount.Value);
            CartUtility.UpdateCart(C);
            ProductUtility.DeleteCountNow(waterid, upc);
        }
        else if (C.Count<int.Parse(PDcount.Value))
        {
            //+
            int upc = int.Parse(PDcount.Value) - C.Count;
            C.Count = int.Parse(PDcount.Value);
            CartUtility.UpdateCart(C);
            ProductUtility.AddCountNow(waterid, upc);
        }

        Response.Redirect($"~/4.Myshopcartlist.aspx?id={int.Parse(Lb_BY_Id.Text)}");


    }
    //取消
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect($"~/4.Myshopcartlist.aspx?id={int.Parse(Lb_BY_Id.Text)}");
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link href="vendors/select2/select2.min.css" rel="stylesheet" />
    <link href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css" rel="stylesheet" />

    <link href="ted/IMSponsor/sweetalert2.css" rel="stylesheet" />
    <!-- End plugin css for this page -->
    <link href="vendors/owl-carousel-2/owl.theme.default.min.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.carousel.min.css" rel="stylesheet" />

    <link href="css/forsponsor.css" rel="stylesheet" />
    <link href="css/productdetail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <asp:HiddenField ID="HiddenField2" runat="server" />
        <asp:HiddenField ID="HiddenField3" runat="server" />
        <asp:HiddenField ID="HiddenField4" runat="server" />
        <asp:HiddenField ID="HiddenField5" runat="server" />

        <br />
        <div class="card m-5 ">
            <div class="card-body">
                <h1 class="card-title">商品資訊</h1>
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass=" card-description">第一部分:確認商品</asp:Label>

                <hr />
                <div class="forms-sample row ">
                    <div class="form-group col-lg-3 col-xs-12">
                        <label>發起人:</label>
                        <asp:Label ID="Lb_SP_Name" Text="" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White"  />
                    </div>
                    <div class="form-group col-lg-3 col-xs-12">
                        <label>發起人電話:</label>
                        <asp:Label ID="Lb_SP_Phone" Text="" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White"  />
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>發起人Email:</label>
                        <asp:Label ID="Lb_SP_Email" Text="" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White"  />
                    </div>
                    <div class="form-group col-lg-12 col-xs-12">
                        <label>商品名稱:</label>
                        <asp:Label ID="Lb_PD_Name" Text="" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White"  />
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <div class="form-group col-lg-12 col-xs-12">
                            <label>價格:</label>
                            <asp:Label ID="Lb_PD_Price" Text="" runat="server" CssClass="form-control form-control-sm bgcolor" BackColor="White" />
                        </div>
                        <div class="form-group col-lg-12 col-xs-12">
                            <div>
                                <label>商品介紹:</label>
                            </div>
                            <textarea ID="Txt_PD_info" class=" form-control  " rows="14" backcolor="White" BorderStyle="None" runat="server"></textarea>

                            <%--<asp:Label ID="Txt_PDinfo"  runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White" />--%>
                        </div>
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <div class="owl-carousel owl-theme full-width">
                            <div class="item">
                                <asp:Image ID="Image1" runat="server" class="img-fluid"/>
                                <%--<img src="Sponsors/d0ee81f16175c97770192fb691fdda8da1f4f349.png" class="img-fluid" id="img1" runat="server"/>--%>
                            </div>
                            <div class="item">
                                <asp:Image ID="Image2" runat="server" class="img-fluid"/>
                                <%--<img src="Sponsors/d0ee81f16175c97770192fb691fdda8da1f4f349.png" class="img-fluid" id="img2" runat="server"/>--%>
                            </div>
                            <div class="item">
                                <asp:Image ID="Image3" runat="server" class="img-fluid"/>
                                <%--<img src="Sponsors/d0ee81f16175c97770192fb691fdda8da1f4f349.png" class="img-fluid" id="img3" runat="server"/>--%>
                            </div>
                        </div>


                        <%--<img src="Sponsors/649b3c0f69e218d567e16e97253d7a20648c64bb.png" class="img-fluid " />--%>
                    </div>
                    <div class="form-group col-lg-10 col-xs-12">
                        <label>發起人想說...</label>
                        <asp:Label ID="Lb_SP_SayST" Text="" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White" />
                    </div>
                    <div class="form-group col-lg-2 col-xs-12">
                        <label>開團數量/目前累計:</label>
                        <asp:Label ID="Lb_SP_LimitCount" Text="1" runat="server" CssClass=" form-control form-control-sm bgcolor" BackColor="White" />
                    </div>
                    <br />
                    <br />
                </div>
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="card-description">第二部分:確認個人資料</asp:Label>

                <hr />
                <div class="forms-sample row ">
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>員工編號:</label>
                        <asp:Label ID="Lb_BY_Id" Text="" runat="server" CssClass="form-control form-control-sm" BorderStyle="None" />
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>員工姓名:</label>
                        <asp:Label ID="Lb_BY_Name" Text="" runat="server" CssClass="form-control form-control-sm" BorderStyle="None" />
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>Email address:</label>
                        <asp:Label ID="Lb_BY_Email" Text="" runat="server" CssClass="form-control form-control-sm" BorderStyle="None" />
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>Phone:</label>
                        <asp:Label ID="Lb_BY_Phone" Text="" runat="server" CssClass="form-control form-control-sm" BorderStyle="None" />
                        <%--<asp:TextBox ID="Txt_BY_Phone" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>--%>
                    </div>
                    <div class="form-group col-lg-3 col-xs-6">
                        <label>訂購數量:</label>
                        <input id="PDcount" type="number" min="1" max="1000" class="form-control" value="1" runat="server"/>
                    </div>
                    <div class="row justify-content-around form-group">
                        <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="送出"  CssClass="btn btn-facebook me-2 form-control-sm col-3" />
                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-outline-dark form-control-sm col-3" OnClick="Button2_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <!-- Plugin js for this page-->
    <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="vendors/select2/select2.min.js"></script>

    <script src="vendors/sweetalert/sweetalert.min.js"></script>
    <script src="vendors/jquery.avgrund/jquery.avgrund.min.js"></script>

    <script src="ted/IMSponsor/sweetalert2.js"></script>

    <!-- End plugin js for this page-->
    <!-- Custom js for this page-->
    <script src="vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="js/owl-carousel.js"></script>
    <script src="js/file-upload.js"></script>
    <script src="js/typeahead.js"></script>
    <script src="js/select2.js"></script>

    <script src="js/alerts.js"></script>
    <script src="js/avgrund.js"></script>
    <!-- End custom js for this page-->
    <script>
        $(function () {

            $("#ContentPlaceHolder1_FileUpload1").change(function () {
                //當檔案改變後，做一些事 
                readURL(this);   // this代表<input id="imgInp">
            });
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#img1").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
                /*$("#Img1").val(ContentPlaceHolder1_FileUpload1.readURL);*/
            }

            $("#ContentPlaceHolder1_FileUpload2").change(function () {
                //當檔案改變後，做一些事 
                readURL2(this);   // this代表<input id="imgInp">
            });
            function readURL2(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#img2").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);

                }

            }
            $("#ContentPlaceHolder1_FileUpload3").change(function () {
                //當檔案改變後，做一些事 
                readURL3(this);   // this代表<input id="imgInp">
            });
            function readURL3(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#img3").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

        });

    </script>
</asp:Content>

