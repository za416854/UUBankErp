<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Txt_MbId.Text = Request.QueryString["Id"];
            HiddenField2.Value = Txt_MbId.Text;
            HumanMember M = HumanMemberUtility.GetHumanMemberById(int.Parse(Txt_MbId.Text));
            Txt_Mbname.Text = M.Name;
            Txt_MbEmail.Text = M.Email;
            Txt_Mbphone.Text = M.CellPhone;
            HiddenField1.Value = "";
        }


    }
    //新增 
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Txt_Pdname.Text != "" && Txt_PdPrice.Value != "" && Txt_Pdinfo.Value != "" && FileUpload1.HasFile == true)
        {

            Sponsor p = new Sponsor(
                1,
                int.Parse(Txt_MbId.Text),
                Txt_Pdname.Text,
                int.Parse(Txt_PdPrice.Value),
                int.Parse(Txt_limit.Value),
                Txt_Pdinfo.Value,
                Txt_Sayst.Value,
                FileUpload1.FileName,
                FileUpload2.FileName,
                FileUpload3.FileName,
                "Notyet",
                false,
                0,
                ""
                );

            ProductUtility.AddProduct(p);


            string path1 = Server.MapPath($"/Sponsors/{p.ImgFileName1}");
            string path2 = Server.MapPath($"/Sponsors/{p.ImgFileName2}");
            string path3 = Server.MapPath($"/Sponsors/{p.ImgFileName3}");

            if (p.ImgFileName1 != "")
            {
                FileUpload1.SaveAs(path1);
            }
            if (p.ImgFileName2 != "")
            {
                FileUpload2.SaveAs(path2);
            }
            if (p.ImgFileName3 != "")
            {
                FileUpload3.SaveAs(path3);
            }

            HiddenField1.Value = "ok";
            //Response.Redirect($"~/4.Iamsponsor_main.aspx?id={Txt_MbId.Text}");
        }
        else
        {
            HiddenField1.Value = "nook";
            
        }



    }
    //取消
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect($"~/4.Iamsponsor_Main.aspx?id={Request.QueryString["id"]}");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Plugin css for this page -->
    <link href="vendors/select2/select2.min.css" rel="stylesheet" />
    <link href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css" rel="stylesheet" />

    <link href="ted/IMSponsor/sweetalert2.css" rel="stylesheet" />
    <!-- End plugin css for this page -->

    <link href="css/forsponsor.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">

        <asp:HiddenField ID="HiddenField2" runat="server" />

        <br />
        <div class="card m-5 ">
            <div class="card-body">
                <h1 class="card-title">團購資訊</h1>
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="card-description">第一部分:確認資料</asp:Label>

                <hr />
                <div class="forms-sample row ">
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>員工編號:</label>
                        <%--<input type="text" class="form-control" id="exampleInputName1" placeholder="Name" enabl>--%>
                        <asp:TextBox ID="Txt_MbId" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>員工姓名:</label>
                        <%--<input type="text" class="form-control" id="exampleInputName1" placeholder="Name" enabl>--%>
                        <asp:TextBox ID="Txt_Mbname" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>Email address:</label>
                        <asp:TextBox ID="Txt_MbEmail" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
                        <%--<input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">--%>
                    </div>
                    <div class="form-group col-lg-6 col-xs-12">
                        <label>Phone:</label>
                        <asp:TextBox ID="Txt_Mbphone" runat="server" CssClass="form-control form-control-sm" Enabled="false"></asp:TextBox>
                        <%--<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">--%>
                    </div>
                    <br />

                    <asp:Label ID="Label2" runat="server" Text="Label" CssClass="card-description">第二部分:填寫團購品項資料</asp:Label>
                    <p class="card-description">
                        * 為必填欄位
                    </p>
                </div>
                <hr />
                <div class="forms-sample row ">


                    <%--<div class="form-group">
                        <label for="exampleSelectGender"></label>
                        <select class="form-control" id="exampleSelectGender">
                            <option>Male</option>
                            <option>Female</option>
                        </select>
                    </div>--%>
                    <div class=" col-5">
                        <div class="form-group col-12 ">
                            <label>* 品名:</label>
                            <asp:TextBox ID="Txt_Pdname" runat="server" CssClass="form-control form-control-sm" placeholder="Product Name"></asp:TextBox>
                            <%--<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">--%>
                        </div>
                        <div class="col-12">
                            <div class="form-group  ">
                                <label>* 價格:</label>
                                <%--<asp:TextBox ID="Txt_PdPrice" runat="server"  CssClass="form-control form-control-sm" Font-Names="Price"></asp:TextBox>--%>
                                <input type="number" min="1" max="100000" runat="server" class="form-control form-control-sm" id="Txt_PdPrice" placeholder="Price">
                            </div>
                            <div class="form-group  ">
                                <label>最少開團人數:</label>
                                <%--<asp:TextBox ID="Txt_limit" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>--%>
                                <input type="number" min="1" max="100000" class="form-control form-control-sm" runat="server" id="Txt_limit" value="1">
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-7 ">
                        <label>* 產品資訊:</label>
                        <%--<asp:TextBox ID="TextBox11" runat="server" Multiline="True" name="ProductInFo" CssClass="form-control" rows="14" Height="230px" Width="657px"></asp:TextBox>--%>
                        <textarea class="form-control" id="Txt_Pdinfo" rows="14" name="ProductInFo" runat="server" placeholder="Product Infomation"></textarea>
                        <%--<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>--%>
                        <%--<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">--%>
                    </div>

                    <div class="form-group">
                        <label for="exampleTextarea1">我想說...</label>
                        <textarea class="form-control" id="Txt_Sayst" rows="4" runat="server" placeholder="I want to say..."></textarea>
                    </div>


                    <div class="form-group col-lg-4 col-xs-12">
                        <label>* Image upload 1:</label>
                        <%--<input type="file" name="img[]" class="file-upload-default" id="imginp1">--%>
                        <div class="input-group ">
                            <%--<input id="Img1" type="text" class="form-control form-control-sm " disabled="" placeholder="Upload Image">--%>
                            <asp:TextBox ID="Img1" runat="server" CssClass="form-control form-control-sm " disabled="" name="img1" placeholder="Upload Image"></asp:TextBox>
                            <span class="input-group-append">
                                <button class=" btn btn-outline-facebook" type="button" onclick="ContentPlaceHolder1_FileUpload1.click()">Upload</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12">
                        <label>Image upload 2:</label>
                        <%--<input type="file" name="img[]" class="file-upload-default" id="imginp2">--%>
                        <div class="input-group ">
                            <%--<input id="Img2" type="text" class="form-control form-control-sm " disabled="" placeholder="Upload Image">--%>
                            <asp:TextBox ID="Img2" runat="server" CssClass="form-control form-control-sm " disabled="" name="img2" placeholder="Upload Image"></asp:TextBox>
                            <span class="input-group-append">
                                <button class=" btn btn-outline-facebook" type="button" onclick="ContentPlaceHolder1_FileUpload2.click()">Upload</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12">
                        <label>Image upload 3:</label>
                        <%--<input type="file" name="img[]" class="file-upload-default" id="imginp3">--%>
                        <div class="input-group ">
                            <%--<input id="Img3" type="text" class="form-control form-control-sm " disabled="" placeholder="Upload Image">--%>
                            <asp:TextBox ID="Img3" runat="server" CssClass="form-control form-control-sm " disabled="" name="img3" placeholder="Upload Image"></asp:TextBox>
                            <span class="input-group-append">
                                <button class=" btn btn-outline-facebook" type="button" onclick="ContentPlaceHolder1_FileUpload3.click()">Upload</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <img src="images/white.jpg" alt="" class="img-fluid  imggg" id="img1" name="img1" />
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <img src="images/white.jpg" alt="" class="img-fluid  imggg" id="img2" name="img2" />
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <img src="images/white.jpg" alt="" class="img-fluid  imggg" id="img3" name="img3" />
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="ContentPlaceHolder1_Img1.value=this.value" Style="visibility: hidden" />
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:FileUpload ID="FileUpload2" runat="server" onchange="ContentPlaceHolder1_Img2.value=this.value" Style="visibility: hidden" />
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:FileUpload ID="FileUpload3" runat="server" onchange="ContentPlaceHolder1_Img3.value=this.value" Style="visibility: hidden" />
                    </div>


                    <div class="row justify-content-around form-group">
                        <%--<button type="submit" class="btn btn-facebook me-2 form-control-sm col-3">Submit</button>--%>
                        <%--<button class="btn btn-facebook me-2 form-control-sm col-3" onclick="showSwal('warning-message-and-cancel')">Click here!</button>--%>
                        <asp:Button ID="Button1" runat="server" Text="建立" OnClick="Button1_Click" CssClass="btn btn-facebook me-2 form-control-sm col-3" OnClientClick="return false" />
                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <%--<button class="btn btn-outline-dark form-control-sm col-3">取消</button>--%>
                        <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-outline-dark form-control-sm col-3" OnClick="Button2_Click" />
                        
                        <input id="Demo" type="button" name="name" value="Demo" Class="btn btn-success form-control-sm col-3"/>
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
            $("#ContentPlaceHolder1_Button1").click(function () {
                swal({
                    title: '確認送出?',
                    text: "送出後請待審核通過!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button1");
                        $("#form").submit();

                    },
                    function (dismiss) {
                        //if (dismiss === 'cancel') {
                        //    swal('取消', '檔案未被刪除', 'error')
                        //}
                    });



            });
            if ($("#ContentPlaceHolder1_HiddenField1").val() == "ok") {
                swal({
                    title: '完成!',
                    text: '資料已送出!',
                    type: 'success'
                }).then(function () {
                    var a = $("#ContentPlaceHolder1_HiddenField2").val();

                    document.location.replace(`4.Iamsponsor_Main.aspx?Id=${a}`);
                });

            } else if ($("#ContentPlaceHolder1_HiddenField1").val() == "nook") {
                swal({
                    title: 'Error',
                    text: '資訊輸入未完整!',
                    type: 'warning'
                }).then(function () {

                });
            }




            $("#Demo").click(function () {
                

                $("#ContentPlaceHolder1_Txt_Pdname").val("Poter 皮夾");
                $("#ContentPlaceHolder1_Txt_PdPrice").val("1500");
                $("#ContentPlaceHolder1_Txt_limit").val("2");
                $("#ContentPlaceHolder1_Txt_Pdinfo").val("卡片夾層，標準鈔票夾層，附品牌紙盒包裝，材質: 人字紋布(尼龍)、牛皮，簡單對開尺寸: L11.5 x H9.5 cm，有照片夾層尺寸: L11 x H9 cm，有零錢袋尺寸: L12 x H9.5 cm");
                $("#ContentPlaceHolder1_Txt_Sayst").val("之前買了一個送老婆，老婆很喜歡，推薦給大家~~");

            });

        });

    </script>
</asp:Content>

