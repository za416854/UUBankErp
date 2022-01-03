<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="2.ClubHome.aspx.cs" Inherits="_2_ClubHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="2.custom/tonyCss/carousel/owl.carousel.min.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/carousel/owl.theme.default.min.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/carousel/style.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/carousel/themify-icons.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/carousel/vendor.bundle.base.css" rel="stylesheet" />
    <link href="2.custom/tonyCss/dropify.min.css" rel="stylesheet" />
    <style>
        .aa {
            color: #ff0000;
            font-size: large;
        }

        .bb {
            background-color: #EDEDED
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="row justify-content-center">
            <div class="col-8 ">
                <div class="card">
                    <div class="card-body bb">
                        <h1 class="card-title">UUUBank 社團</h1>
                        <div class="owl-carousel owl-theme full-width">
                            <asp:Repeater ID="Repeater2" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="card text-white">
                                            <img class="card-img" src="UUUBankClubImage/<%#Eval("ClubImage")%>.jpg" alt="Clab image" style="width:1080px;height:700px" >
                                            <div class="card-img-overlay d-flex">
                                                <div class="mt-auto text-center w-100">
                                                    <%-- <h3>寶可夢社團</h3>
                                            <h6 class="card-text mb-4 font-weight-normal">歡迎加入寶可夢社團</h6>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <%-- <div class="item">
                                <div class="card text-white">
                                    <img class="card-img" src="https://via.placeholder.com/497x310" alt="Card image">
                                    <div class="card-img-overlay d-flex">
                                        <div class="mt-auto text-center w-100">
                                            <h3>Third Slide Label</h3>
                                            <h6 class="card-text mb-4 font-weight-normal">Nulla vitae elit libero, a pharetra augue mollis interdum.</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body bb">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row portfolio-grid" >
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12" data-bs-toggle="tooltip" data-bs-placement="top" title='社團描述:<%#Eval("ClubScript")%>'>
                                    <figure class="effect-text-in" style="background-color:white">
                                        <img src='UUUBankClubImage/<%#Eval("ClubImage")%>.jpg' alt="image" style="width:500px;height:300px"/>
                                        <figcaption>
                                            <p>
                                                <a tabindex="0" class="btn btn-outline-success btn-rounded " role="button" data-bs-toggle="popover" data-bs-placement="top" data-bs-trigger="focus" title='社團簡介:' data-bs-content='<%#Eval("DetailClubScript")%>'>簡介</a>
                                                &nbsp&nbsp&nbsp&nbsp
                                                    <a href='<%# Eval("Id","/2.ClubOnlyHome.aspx?id={0}") %>' class="btn btn-outline-warning">進入<%#Eval("ClubName")%></a>
                                            </p>
                                        </figcaption>
                                    </figure>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </div>
                        </div>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>
                </div>

            </div>

        </div>
        <br />
        <br />
        <br />
        <div class="row justify-content-center">
            <div class="col-12 ">
                <div class="card">
                    <div class="card-body bb">
                        <div class="media">
                            <div class="media-body">
                                <h1 class="card-title">UUUBank 社團建立</h1>
                                <div class="form-group">
                                    <div class="modal fade" id="exampleModalLive2" tabindex="-1" aria-labelledby="exampleModalLiveLabe2" style="display: none;" aria-hidden="true" data-bs-backdrop="static">
                                        <div class="modal-dialog .modal-dialog-scrollable  modal-lg ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h2 class="modal-title" id="exampleModalLiveLabe2" style="color: #4dc8f7">社團建立申請</h2>
                                                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body media">
                                                    <div class="media-body col-6">
                                                        <div>
                                                            <asp:Label ID="Label1" runat="server" Text="員工編號:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="mdi mdi-account-star">
                                                                <asp:TextBox ID="txtEMId" runat="server" CssClass="form-control" placeholder="請輸入員工編號" Width="250px" ReadOnly="true"></asp:TextBox>
                                                                <%--<h6 id="emIdhelp2" class="form-text text-muted">
                                                                    <input type="button" id="btnDataEmID" class=" btn btn-outline-info " value="帶入個人資料" />
                                                                </h6>--%>

                                                            </asp:Label>
                                                        </div>
                                                        <br />
                                                        <div>
                                                            <asp:Label ID="Label5" CssClass="mdi mdi-account-outline" runat="server" Text="姓名:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                <asp:TextBox ID="txtEmName" runat="server" CssClass="form-control" placeholder="請輸入姓名" Width="250px" ReadOnly="true"></asp:TextBox>

                                                            </asp:Label>
                                                        </div>
                                                        <br />
                                                        <div>
                                                            <asp:Label ID="Label6" CssClass="mdi mdi-hospital-building" runat="server" Text="社團名稱:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                <asp:TextBox ID="txtClubName" runat="server" CssClass="form-control" placeholder="請輸入社團名稱" Width="250px"></asp:TextBox>
                                                                <h6 id="namehelp" class="form-text text-muted">
                                                                    <input type="button" id="btnCheck" class="btn btn-outline-warning " value="檢查社團名稱是否重複" />
                                                                </h6>

                                                            </asp:Label>
                                                        </div>
                                                        <br />
                                                         <div>
                                                            <asp:Label ID="Label7" CssClass="mdi mdi-hospital-building" runat="server" Text="社團描述(30字內):" Font-Size="X-Large" ForeColor="#625D5D">
                                                                <asp:TextBox ID="txtScript" runat="server" CssClass="form-control" placeholder="請輸入社團描述" TextMode="MultiLine" MaxLength="30" Width="250px"></asp:TextBox>

                                                            </asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="media-body col-6">
                                                        <div>
                                                            <asp:Label ID="Label8" CssClass="mdi mdi-hospital-building" runat="server" Text="社團簡介:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                <asp:TextBox ID="txtDetailScript" runat="server" CssClass="form-control" placeholder="請輸入社團簡介" TextMode="MultiLine" Width="500px" Height="250px"></asp:TextBox>

                                                            </asp:Label>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <asp:Label ID="Label12" runat="server" Text="社團封面照片:" Font-Size="X-Large" ForeColor="#625D5D">
                                                                <div class="card w-50 ">
                                                                    <div class="card-body text-center ">
                                                                        <h4 class="card-title d-flex">社團封面照片上傳
                                                                         <small class="ms-auto align-self-end"></small>
                                                                        </h4>
                                                                        <asp:FileUpload ID="fulImage" runat="server" CssClass="dropify" />

                                                                    </div>
                                                                </div>
                                                            </asp:Label>
                                                        </div>
                                                    </div>




                                                </div>
                                                <div class="modal-footer">
                                                     <input type="button" id="btndemo" value="我是DEMO" class="btn btn-outline-warning" />
                                                    |
                                                    <asp:Button ID="btnApplication" runat="server" Text="申請" class="btn btn-outline-info" OnClick="btnApplication_Click" OnClientClick="return false" />
                                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">關閉</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="mdi mdi-account-multiple-plus btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModalLive2">
                                        社團建立申請
                                    </button>
                                </div>
                            </div>
                            <div class="media-body">
                                <h1 class="card-title">UUUBank 社團加入</h1>
                                <div class="form-group">
                                    <div class="modal fade" id="exampleModalLive" tabindex="-1" aria-labelledby="exampleModalLiveLabel" style="display: none;" aria-hidden="true" data-bs-backdrop="static">
                                        <div class="modal-dialog .modal-dialog-scrollable  ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h2 class="modal-title" id="exampleModalLiveLabel" style="color: #4dc8f7">社團加入</h2>
                                                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <asp:Label ID="Label2" runat="server" Text="員工編號:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="mdi mdi-account-star">
                                                            <asp:TextBox ID="txtId" runat="server" CssClass="form-control" placeholder="請輸入員工編號" ReadOnly="true"></asp:TextBox>
                                                           <%-- <h6 id="emIdhelp" class="form-text text-muted">
                                                                <input type="button" id="btnData" class=" btn btn-outline-info " value="帶入個人資料" />
                                                            </h6>--%>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label3" CssClass="mdi mdi-account-outline" runat="server" Text="姓名:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="請輸入姓名" ReadOnly="true"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label10" CssClass="mdi mdi-account-outline" runat="server" Text="部門:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control" placeholder="請輸入部門" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label4" CssClass="mdi mdi-hospital-building" runat="server" Text="社團名稱:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:DropDownList ID="dplClub" runat="server" CssClass="form-control" ForeColor="Black" DataSourceID="SqlDataSource1" DataTextField="ClubName" DataValueField="ClubName"></asp:DropDownList>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:UUUBankErpConnectionString1 %>' SelectCommand="SELECT [ClubName] FROM [Club]"></asp:SqlDataSource>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label9" CssClass="mdi mdi-account-outline" runat="server" Text="申請原因:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" placeholder="請輸入申請原因" TextMode="MultiLine"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                   
                                                    <asp:Button ID="btnJoin" runat="server" Text="申請" class="btn btn-outline-info" OnClick="btnJoin_Click" OnClientClick="return false;" />
                                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">關閉</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="mdi mdi-account-plus btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModalLive">
                                        社團加入申請
                                    </button>
                                </div>
                            </div>
                            <div class="media-body">
                                <h1 class="card-title">UUUBank 社團退出</h1>
                                <div class="form-group">
                                    <div class="modal fade" id="exampleModalLiveQuit" tabindex="-1" aria-labelledby="exampleModalLiveLabelQuit" style="display: none;" aria-hidden="true" data-bs-backdrop="static">
                                        <div class="modal-dialog .modal-dialog-scrollable  ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h2 class="modal-title" id="exampleModalLiveLabelQuit" style="color: #4dc8f7">社團退出</h2>
                                                    <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <asp:Label ID="Label11" runat="server" Text="員工編號:" Font-Size="X-Large" ForeColor="#625D5D" CssClass="mdi mdi-account-star">
                                                            <asp:TextBox ID="txtQuitId" runat="server" CssClass="form-control" placeholder="請輸入員工編號" ReadOnly="true"></asp:TextBox>
                                                           <%-- <h6 id="emIdhelp3" class="form-text text-muted">
                                                                <input type="button" id="btnQuitData" class=" btn btn-outline-info " value="帶入個人資料" />
                                                            </h6>--%>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label13" CssClass="mdi mdi-account-outline" runat="server" Text="姓名:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtQuitName" runat="server" CssClass="form-control" placeholder="請輸入姓名" ReadOnly="true"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label14" CssClass="mdi mdi-account-outline" runat="server" Text="部門:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtQuitDepartment" runat="server" CssClass="form-control" placeholder="請輸入部門" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label15" CssClass="mdi mdi-hospital-building" runat="server" Text="社團名稱:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:DropDownList ID="dplQuitClub" runat="server" CssClass="form-control" ForeColor="Black" DataSourceID="SqlDataSource2" DataTextField="ClubName" DataValueField="ClubName"></asp:DropDownList>
                                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:UUUBankErpConnectionString1 %>' SelectCommand="SELECT [ClubName] FROM [Club]"></asp:SqlDataSource>

                                                        </asp:Label>
                                                    </div>
                                                    <br />
                                                    <div>
                                                        <asp:Label ID="Label16" CssClass="mdi mdi-account-outline" runat="server" Text="退出原因:" Font-Size="X-Large" ForeColor="#625D5D">
                                                            <asp:TextBox ID="txtQuitReason" runat="server" CssClass="form-control" placeholder="請輸入退出原因" TextMode="MultiLine"></asp:TextBox>

                                                        </asp:Label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="btnQuit" runat="server" Text="申請" class="btn btn-outline-info" OnClick="btnQuit_Click" OnClientClick="return false;" />
                                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">關閉</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="mdi mdi-account-plus btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModalLiveQuit">
                                        社團退出申請
                                    </button>
                                </div>
                            </div>
                            <asp:HiddenField ID="hfd1" runat="server" />
                            <asp:HiddenField ID="hfd2" runat="server" />
                            <asp:HiddenField ID="hfd3" runat="server" />
                            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="2.custom/tonyJS/owl.carousel.min.js"></script>
    <script src="2.custom/tonyJS/owl-carousel.js"></script>
    <script src="2.custom/tonyJS/dropify.min.js"></script>
    <script src="2.custom/tonyJS/dropify.js"></script>
    <script>
        $(function () {

            $("#btndemo").click(function () {
                $("#ContentPlaceHolder1_txtClubName").val("ONE PIECE");
                $("#ContentPlaceHolder1_txtScript").val("歡迎喜歡海賊王的同仁一起加入");
                $("#ContentPlaceHolder1_txtDetailScript").val("這是一個由熱愛海賊王的人所創立的社團，在這裡可以盡情討論關於海賊王的相關資訊；會有不定期聚餐以及觀看海賊王的影集電影等活動哦!!!");
            });


            $("#btnDataEmID").click(function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_txtEMId").val()
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/WriteData",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        if (result.d !== null) {
                            swal("已帶入個人資料", '', 'success');
                            $("#ContentPlaceHolder1_txtEmName").val(result.d.Name);
                        } else {
                            swal('員工編號不存在!!', '', 'error');
                        }

                    },
                    error: function () {
                        swal('請輸入員工編號!!', '', 'error');
                    }
                });



            })




            $("#btnData").click(function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_txtId").val(),

                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/WriteData",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        if (result.d !== null) {
                            swal("已帶入個人資料", '', 'success');
                            $("#ContentPlaceHolder1_txtName").val(result.d.Name);
                            $("#ContentPlaceHolder1_txtDepartment").val(result.d.Department);
                        } else {
                            swal('員工編號不存在!!', '', 'error');
                        }

                    },
                    error: function () {
                        swal('請輸入員工編號!!', '', 'error');
                    }
                });



            })





            $("#btnQuitData").click(function () {
                var myData = {
                    id: $("#ContentPlaceHolder1_txtQuitId").val()
                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/WriteData",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        if (result.d !== null) {
                            swal("已帶入個人資料", '', 'success');
                            $("#ContentPlaceHolder1_txtQuitName").val(result.d.Name);
                            $("#ContentPlaceHolder1_txtQuitDepartment").val(result.d.Department);
                        } else {
                            swal('員工編號不存在!!', '', 'error');
                        }

                    },
                    error: function () {
                        swal('請輸入員工編號!!', '', 'error');
                    }
                });



            })



            $("#btnCheck").click(function () {
                var myData = {
                    name: $("#ContentPlaceHolder1_txtClubName").val(),

                };

                $.ajax({
                    type: 'POST',
                    url: "TonyWebService.asmx/CheckClubName",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(myData),
                    success: function (result) {
                        swal(result.d, '', 'info')
                    },
                    error: function () {
                        swal('請輸入社團名稱!!', '', 'error')
                    }
                });



            })


            $("#ContentPlaceHolder1_btnApplication").click(function () {
                swal({
                    title: '請確認是否要申請建立社團!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnApplication");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '申請失敗', 'error');
                        }
                    });
            });

            if ($("#ContentPlaceHolder1_hfd1").val() == "ok") {
                swal('完成!', '社團建立已申請成功', 'success');
                //$("#ContentPlaceHolder1_hfd1").val("");
                //$("#ContentPlaceHolder1_txtEMId").val("");
                //$("#ContentPlaceHolder1_txtEmName").val("");
                //$("#ContentPlaceHolder1_txtClubName").val("");
                //$("#ContentPlaceHolder1_txtScript").val("");
                //$("#ContentPlaceHolder1_txtDetailScript").val("");
            }
            else if ($("#ContentPlaceHolder1_hfd1").val() == "notyet") {
                swal('封面照片未上傳!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            } else if ($("#ContentPlaceHolder1_hfd1").val() == "false") {
                swal('資料填寫不完整!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            } else if ($("#ContentPlaceHolder1_hfd1").val() == "no") {
                swal('社團名稱已被申請，請更換!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            } else if ($("#ContentPlaceHolder1_hfd1").val() == "iderro") {
                swal('公司無此員工，請確認員工編號是否錯誤!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            } else if ($("#ContentPlaceHolder1_hfd1").val() == "nameerro") {
                swal('姓名錯誤，請再次確認姓名!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            } else if ($("#ContentPlaceHolder1_hfd1").val() == "exit") {
                swal('社團已存在，請勿重覆創立!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd1").val("");
            }


            $("#ContentPlaceHolder1_btnJoin").click(function () {
                swal({
                    title: '請確認是否要申請加入社團!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnJoin");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '申請失敗', 'error')
                        }
                    });
            });

            if ($("#ContentPlaceHolder1_hfd2").val() == "ok") {
                swal('完成!', '社團加入已申請成功', 'success');
                $("#ContentPlaceHolder1_hfd2").val("");
            }
            else if ($("#ContentPlaceHolder1_hfd2").val() == "false") {
                swal('資料填寫不完整!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd2").val("");
            } else if ($("#ContentPlaceHolder1_hfd2").val() == "again") {
                swal('請勿重複申請!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd2").val("");
            } else if ($("#ContentPlaceHolder1_hfd2").val() == "exit") {
                swal('已為該社團成員，請勿重覆加入!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd2").val("");
            } else if ($("#ContentPlaceHolder1_hfd2").val() == "emerro") {
                swal('申請人資料填寫錯誤，請再次確認!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd2").val("");
            }


            $("#ContentPlaceHolder1_btnQuit").click(function () {
                swal({
                    title: '請確認是否要申請退出社團!',
                    text: "",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#EA0000',
                }).then(
                    function () {


                        $("#__EVENTTARGET").val("ctl00$ContentPlaceHolder1$btnQuit");

                        $("#form").submit();

                    },
                    function (dismiss) {
                        if (dismiss === 'cancel') {
                            swal('取消', '申請失敗', 'error');
                        }
                    });
            });

            if ($("#ContentPlaceHolder1_hfd3").val() == "ok") {
                swal('完成!', '社團退出已申請成功', 'success');
                $("#ContentPlaceHolder1_hfd3").val("");
            }
            else if ($("#ContentPlaceHolder1_hfd3").val() == "false") {
                swal('資料填寫不完整!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd3").val("");
            } else if ($("#ContentPlaceHolder1_hfd3").val() == "again") {
                swal('請勿重複申請!!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd3").val("");
            } else if ($("#ContentPlaceHolder1_hfd3").val() == "exit") {
                swal('非該社團成員，請勿申請退出!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd3").val("");
            } else if ($("#ContentPlaceHolder1_hfd3").val() == "emerro") {
                swal('申請人資料填寫錯誤，請再次確認!!', '申請失敗', 'error');
                $("#ContentPlaceHolder1_hfd3").val("");
            }



        });







    </script>


</asp:Content>


