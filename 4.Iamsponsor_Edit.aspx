<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack==false)
        {
            //int waterid = 1;
            int waterid = int.Parse(Request.QueryString["WaterId"]);

            Sponsor p = ProductUtility.GetProduct(waterid);
            int SPid = p.Id;
            HumanMember M = HumanMemberUtility.GetHumanMemberById(SPid);
            Txt_MbId.Text = SPid.ToString();
            Txt_Mbname.Text= M.Name;
            Txt_Mbphone.Text = M.CellPhone;
            Txt_MbEmail.Text = M.Email;
            Hiddenwaterid.Value = p.Waterid.ToString();
            Txt_MbId.Text = p.Id.ToString();
            HiddenSPmbid.Value = Txt_MbId.Text;
            Txt_Pdname.Text = p.ProductName;
            Txt_PdPrice.Value = p.Price.ToString();
            Txt_limit.Value = p.LimitCount.ToString();
            Txt_Pdinfo.Value = p.ProductInFo;
            Txt_Sayst.Value = p.SayST;
            Hiddencheck.Value = p.Check;
            HiddenCountnow.Value = p.PDCountNow.ToString();
            HiddenStatus.Value = p.PDStatus.ToString();
            Image1.ImageUrl = "~/Sponsors/" + p.ImgFileName1;
            Image2.ImageUrl = "~/Sponsors/" + p.ImgFileName2;
            Image3.ImageUrl = "~/Sponsors/" + p.ImgFileName3;

            Img1.Text = p.ImgFileName1;
            Img2.Text = p.ImgFileName2;
            Img3.Text = p.ImgFileName3;

            Hiddenimg1.Value = p.ImgFileName1;
            Hiddenimg2.Value = p.ImgFileName2;
            Hiddenimg3.Value = p.ImgFileName3;
            HiddenField1.Value = "";
        }

    }
    //更新
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Txt_Pdname.Text != "" && Txt_PdPrice.Value != "" && Txt_Pdinfo.Value != "" && Img1.Text !="")
        {


            string imagefilename1 = Hiddenimg1.Value;
            string imagefilename2 = Hiddenimg2.Value;
            string imagefilename3 = Hiddenimg3.Value;
            if (FileUpload1.HasFile)
            {
                string path = Server.MapPath($"/Sponsors/{FileUpload1.FileName}");
                FileUpload1.SaveAs(path);
                imagefilename1 = FileUpload1.FileName;
            }
            if (FileUpload2.HasFile)
            {
                string path = Server.MapPath($"/Sponsors/{FileUpload2.FileName}");
                FileUpload2.SaveAs(path);
                imagefilename2 = FileUpload2.FileName;
            }
            if (FileUpload3.HasFile)
            {
                string path = Server.MapPath($"/Sponsors/{FileUpload3.FileName}");
                FileUpload3.SaveAs(path);
                imagefilename3 = FileUpload3.FileName;
            }


            Sponsor p = new Sponsor(
                    int.Parse(Hiddenwaterid.Value),
                    int.Parse(Txt_MbId.Text),
                    Txt_Pdname.Text,
                    int.Parse(Txt_PdPrice.Value),
                    int.Parse(Txt_limit.Value),
                    Txt_Pdinfo.Value,
                    Txt_Sayst.Value,
                    imagefilename1,
                    imagefilename2,
                    imagefilename3,
                    Hiddencheck.Value,
                    Convert.ToBoolean(HiddenStatus.Value),
                    int.Parse(HiddenCountnow.Value),""
                    );

            ProductUtility.UpdateProduct(p);
            HiddenField1.Value = "ok";
            //Response.Redirect($"~/4.Iamsponsor_Main.aspx?Id={Txt_MbId.Text}");
        }
        else
        {
            HiddenField1.Value = "nook";
        };



    }
    //取消
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Response.Redirect($"~/4.Iamsponsor_Main.aspx?Id={Txt_MbId.Text}");
    }
    //刪除
    protected void Button3_Click(object sender, EventArgs e)
    {
        int waterid = int.Parse(Request.QueryString["WaterId"]);
        Response.Redirect($"~/4.Iamsponsor_Delete.aspx?WaterId={waterid}");
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
        <asp:HiddenField ID="Hiddenimg1" runat="server" />
        <asp:HiddenField ID="Hiddenimg2" runat="server" />
        <asp:HiddenField ID="Hiddenimg3" runat="server" />
        <asp:HiddenField ID="Hiddenwaterid" runat="server" />
        <asp:HiddenField ID="HiddenSPmbid" runat="server" />
        <asp:HiddenField ID="Hiddencheck" runat="server" />
        <asp:HiddenField ID="HiddenStatus" runat="server" />
        <asp:HiddenField ID="HiddenCountnow" runat="server" />
        <br />
        <div class="card m-5 ">
            <div class="card-body">
                <h1 class="card-title">修改資訊</h1>
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
                    <div class="form-group col-lg-6 col-xs- 12">
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
                            <asp:TextBox ID="Txt_Pdname" runat="server" CssClass="form-control form-control-sm" Font-Names="ProductName"></asp:TextBox>
                            <%--<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">--%>
                        </div>
                        <div class="col-12">
                            <div class="form-group  ">
                                <label>* 價格:</label>
                                <%--<asp:TextBox ID="Txt_PdPrice" runat="server" CssClass="form-control form-control-sm" Font-Names="Price"></asp:TextBox>--%>
                                <input type="number" min="1" max="100000" runat="server" class="form-control form-control-sm" ID="Txt_PdPrice" >
                            </div>
                            
                            <div class="form-group  ">
                                <label>最少開團人數:</label>
                                <%--<asp:TextBox ID="Txt_limit" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>--%>
                                <input type="number" min="1" max="100000" class="form-control form-control-sm" runat="server" ID="Txt_limit">
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-7 ">
                        <label>* 產品資訊:</label>
                        <%--<asp:TextBox ID="TextBox11" runat="server" Multiline="True" name="ProductInFo" CssClass="form-control" rows="14" Height="230px" Width="657px"></asp:TextBox>--%>
                        <textarea class="form-control" id="Txt_Pdinfo" rows="14" name="ProductInFo" runat="server"></textarea>
                        <%--<asp:TextBox ID="TextBox6" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>--%>
                        <%--<input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">--%>
                    </div>

                    <div class="form-group">
                        <label for="exampleTextarea1">我想說...</label>
                        <textarea class="form-control" id="Txt_Sayst" rows="4" runat="server"></textarea>
                    </div>


                    <div class="form-group col-lg-4 col-xs-12">
                        <label>* Image upload 1:</label>
                        <%--<input type="file" name="img[]" class="file-upload-default" id="imginp1">--%>
                        <div class="input-group ">
                            <%--<input id="Img1" type="text" class="form-control form-control-sm " disabled="" placeholder="Upload Image">--%>
                            <asp:TextBox ID="Img1" runat="server" CssClass="form-control form-control-sm "  name="img1" placeholder="Upload Image" ></asp:TextBox>
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
                            <asp:TextBox ID="Img2" runat="server" CssClass="form-control form-control-sm "  name="img2" placeholder="Upload Image"></asp:TextBox>
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
                            <asp:TextBox ID="Img3" runat="server" CssClass="form-control form-control-sm "  name="img3" placeholder="Upload Image"></asp:TextBox>
                            <span class="input-group-append">
                                <button id="" class=" btn btn-outline-facebook" type="button" onclick="ContentPlaceHolder1_FileUpload3.click()">Upload</button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid"/>                        
                        <%--<img src="images/white.jpg" alt="Alternate Text" class="img-fluid  imggg" id="img1" name="img1" />--%>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:Image ID="Image2" runat="server" CssClass="img-fluid"/>
                        <%--<img src="images/white.jpg" alt="Alternate Text" class="img-fluid  imggg" id="img2" name="img2" />--%>
                    </div>
                    <div class="form-group col-lg-4 col-xs-12  ">
                        <asp:Image ID="Image3" runat="server" CssClass="img-fluid"/>
                        <%--<img src="images/white.jpg" alt="Alternate Text" class="img-fluid  imggg" id="img3" name="img3" />--%>
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
                        <asp:Button ID="Button1" runat="server" Text="更新" OnClick="Button1_Click" CssClass="btn btn-facebook me-2 form-control-sm col-3" OnClientClick="return false"/>
                        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <%--<button class="btn btn-outline-dark form-control-sm col-3">取消</button>--%>
                        <asp:Button ID="Button2" runat="server" Text="取消" CssClass="btn btn-outline-dark form-control-sm col-3" OnClick="Button2_Click" OnClientClick="return false"/>
                        <asp:Button ID="Button3" runat="server" Text="刪除" CssClass="btn btn-outline-danger form-control-sm col-3" OnClick="Button3_Click" OnClientClick="return false"/>
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
                        $("#ContentPlaceHolder1_Image1").attr('src', e.target.result);
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
                        $("#ContentPlaceHolder1_Image2").attr('src', e.target.result);
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
                        $("#ContentPlaceHolder1_Image3").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            //更新
            $("#ContentPlaceHolder1_Button1").click(function () {
                swal({
                    title: '確認更新?',
                    text: "若需再更改請至個人頁面!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button1");


                        $("#form").submit();



                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '資料未更改', 'warning')
                        }
                    });



            });
                if ($("#ContentPlaceHolder1_HiddenField1").val() == "ok") {
                    swal({
                        title: '完成!',
                        text: '資料已送出!',
                        type: 'success'
                    }).then(function () {
                        leave()
                    });

                } else if ($("#ContentPlaceHolder1_HiddenField1").val() == "nook"){
                    swal({
                        title: 'Error',
                        text: '資訊輸入未完整!',
                        type: 'warning'
                    }).then(function () {

                    });
                }
            //取消
            $("#ContentPlaceHolder1_Button2").click(function () {
                swal({
                    title: '取消',
                    text: "確定離開?",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {
                        leave()
                    });
                    
            });
            //刪除
            $("#ContentPlaceHolder1_Button3").click(function () {
                swal({
                    title: '確認刪除?',
                    text: "刪除後無法再救回!",
                    type: 'warning',
                    showCancelButton: true,
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$Button3");


                        $("#form").submit();

                        

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '資料未刪除', 'warning')
                        }
                    });



            });
            function leave()
            {
                var a = $("#ContentPlaceHolder1_HiddenSPmbid").val();

                document.location.replace(`4.Iamsponsor_Main.aspx?Id=${a}`)
            }
        });

    </script>
</asp:Content>

