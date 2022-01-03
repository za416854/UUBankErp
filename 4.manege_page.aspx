<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
       


    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="vendors/datatables.net-bs4/dataTables.bootstrap4.css" rel="stylesheet" />
    <link href="css/productdetail.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.theme.default.min.css" rel="stylesheet" />
    <link href="vendors/owl-carousel-2/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div class="container">--%>
    <div class="content-wrapper " style="background-color:antiquewhite">

        <div class="card " >
                <div class="card-body">
                  <h4 class="card-title">團購品審核</h4>
                  <div class="card-description">
                   
                  </div>
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home-2" role="tab" aria-controls="home-1" aria-selected="true">尚未簽核</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile-1" role="tab" aria-controls="profile-1" aria-selected="false">已簽核</a>
                    </li>
                   
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane fade show active" id="home-2" role="tabpanel" aria-labelledby="home-tab">
                        <div class="table-responsive pt-3">
                            
                            <div class="table-responsive">
                            <table id="SponsorList" class="table">
                                <thead class="bg-facebook text-white">
                                    <tr>
                                        <th>

                                            <input type="checkbox" name="name" id="checkall" onclick="checkAll();"/></th>
                                        <th>編號</th>
                                        <th>發起人工號</th>
                                        <th>發起人姓名</th>
                                        <th>Email</th>
                                        <th>項目</th>
                                        <th>團購品名</th>
                                        <th>發起人想說~</th>
                                        <th>資訊</th>
                                        <th></th>
                      
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                
                                                <input type="checkbox" name="name" value='<%# Eval("Waterid") %>' class="mycheckbox" />
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <td><%# Eval("Id") %></td>
                                                <td><%# Eval("Name") %></td>
                                                <td><%# Eval("Email") %></td>
                                                <td>
                                                        <asp:Image ID="Image4" runat="server" CssClass="Productimg img-fluid" ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %></td>
                                                <td><%# Eval("Price") %></td>
                                                <td><%# Eval("SayST") %></td>
                                                <td>
                                                    <input type="button" name='<%# Eval("Waterid") %>' value="View" class="Mymodal btn btn-outline-dark form-control " data-bs-toggle="modal" data-bs-target='#modal' onclientclick="return false"  />
                                                </td>
           
                                                
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Employee.ID, Employee.Name,Employee.Email,Employee.CellPhone, Sponsors.Waterid, Sponsors.Id AS Expr1, Sponsors.ProductName, Sponsors.Price, Sponsors.LimitCount, Sponsors.ProductInFo, Sponsors.SayST, Sponsors.ImgFileName1, Sponsors.ImgFileName2, Sponsors.ImgFileName3, Sponsors.[Check], Sponsors.PDStatus, Sponsors.PDCountNow FROM Employee INNER JOIN Sponsors ON Employee.ID = Sponsors.Id WHERE (Sponsors.[Check] = N'Notyet')"></asp:SqlDataSource>
                                </tbody>
                            </table>
                                <div class="row justify-content-center">
                                <input type="button" id="Btn_agree" class="btn btn-facebook col-1 " value="Agree"  />
                                <div class="col-1"></div>
                                <input type="button" id="Btn_reject" class="btn btn-facebook col-1 " value="Reject"  />
                                <div class="col-12">
                                <asp:Button ID="Button3" runat="server" Text="" BorderStyle="None" BackColor="white"/>
        
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile-1" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="table-responsive pt-3">
                            
                            <div class="table-responsive">
                            <table id="SponsorList1" class="table">
                                <thead class="bg-facebook text-white">
                                    <tr>
                                        
                                        <th>編號</th>
                                        <th>發起人工號</th>
                                        <th>發起人姓名</th>
                                        <th>Email</th>
                                        <th>項目</th>
                                        <th>團購品名</th>
                                        <th>價格</th>
                                        <th>發起人想說~</th>
                                        <th>審核結果</th>
                                        <th>備註</th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                            <tr>
                                                <td>No.<%# Eval("Waterid") %></td>
                                                <td><%# Eval("Id") %></td>
                                                <td><%# Eval("Name") %></td>
                                                <td><%# Eval("Email") %></td>
                                                <td>
                                                        <asp:Image ID="Image4" runat="server" CssClass="Productimg img-fluid" ImageUrl=' <%# Eval("ImgFileName1", "~/Sponsors/{0}") %>' />
                                                </td>
                                                <td><%# Eval("ProductName") %></td>
                                                <td><%# Eval("Price") %></td>
                                                <td><%# Eval("SayST") %></td>
                                                <td><%# Eval("Check") %></td>
                                                <td><%# Eval("RJresult") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Employee.ID, Employee.Name, Employee.Email, Employee.CellPhone, Sponsors.Waterid, Sponsors.Id AS Expr1, Sponsors.ProductName, Sponsors.Price, Sponsors.LimitCount, Sponsors.ProductInFo, Sponsors.SayST, Sponsors.ImgFileName1, Sponsors.ImgFileName2, Sponsors.ImgFileName3, Sponsors.[Check], Sponsors.PDStatus, Sponsors.PDCountNow, Sponsors.RJresult FROM Employee INNER JOIN Sponsors ON Employee.ID = Sponsors.Id WHERE (Sponsors.[Check] <> N'Notyet')"></asp:SqlDataSource>
                                </tbody>
                            </table>

                        </div>

                        </div>
                    </div>
                    
                  </div>
                </div>
              </div>



        <%--<div class="modal fade show " id='modal' tabindex="0" aria-labelledby="exampleModalLabel" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
            <div class="modal-dialog modal-lg " role="document">
                    <div class="modal-content ">
                        <div class="modal-header bgcolor">
                            <h5 class="modal-title" id="exampleModalLabel">發起人:<br />
                            </h5>
                            <button type="button" class="btn-close " data-bs-dismiss="modal" aria-label="Close" id="closebtn">
                                <span aria-hidden="true"></span>
                            </button> 
                        </div>
                        <div class="modal-body">
                            <div class="row">
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
                                <div class="col-5">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title PDname">團購品名 : 
                                            </h4>

                                            <p class="card-description Price ">
                                                價格:$
                                            </p>

                                            <p class="card-description  ">
                                                介紹:
                                            </p>
                                            <p class="PDinfo"></p>
                                            <div class="card card-inverse-success" id="context-menu-access">
                                                <div class="card-body">
                                                    <div class="card-text ">
                                                        發起人想說 :<br />

                                                    </div>
                                                    <br />
                                                    <p class="SayST"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bgcolor">
                            
                        </div>
                    </div>
                </div>
        </div>--%>
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
    </div>
<%--</div>--%>

    <%--<asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Members.Id AS Expr2, Members.Name, Sponsors.Waterid, Sponsors.Id, Sponsors.ProductName, Sponsors.Price, Sponsors.LimitCount, Sponsors.ProductInFo, Sponsors.SayST, Sponsors.ImgFileName1, Sponsors.ImgFileName2, Sponsors.ImgFileName3, Sponsors.[Check] FROM Members INNER JOIN Sponsors ON Members.Id = Sponsors.Id WHERE (Sponsors.[Check] = N'not')"></asp:SqlDataSource>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="vendors/owl-carousel-2/owl.carousel.min.js"></script>
    <script src="js/owl-carousel.js"></script>
    <script src="vendors/datatables.net/jquery.dataTables.js"></script>
    <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="js/data-table.js"></script>
    <script src="ted/vue.js"></script>



    <script>
        var app = new Vue({
            el: '#SponsorList',
            data: {

                myPDList: [],
                mySPList: []
            },

            created: function () {
                var self = this;
            }

        });
        $(function () {
            $("#SponsorList").dataTable({
                "aLengthMenu": [
                    [5, 10, 15, -1],
                    [5, 10, 15, "All"]
                ],
                "language": {
                    search: "搜尋",
                    processing: "處理中...",
                    loadingRecords: "載入中...",
                    lengthMenu: "顯示 _MENU_ 項結果",
                    zeroRecords: "沒有符合的結果",
                    info: "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                    infoEmpty: "顯示第 0 至 0 項結果，共 0 項",
                    infoFiltered: "(從 _MAX_ 項結果中過濾)",
                    infoPostFix: "",
                    paginate: {
                        first: "第一頁",
                        previous: "上一頁",
                        next: "下一頁",
                        last: "最後一頁"
                    },
                },
                processing: false,
                serverSide: false,
                stateSave: true,
                destroy: false,
                info: false,
                autoWidth: false,
                ordering: false,
                scrollX: "10px",
                scrollY: "5000px",
                scrollCollapse: true,
                paging: true,
                rowCallback: function (row, data) {
                    if (data["Status"] == "未完成") {
                        $(row).addClass("danger");
                    } else {
                        $(row).addClass("warning");
                    }
                },


            });
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
            $("#Btn_agree").click(function () {
                var checklist = new Array();
                $(".mycheckbox").each(function () {
                    if ($(this).prop("checked") === true) { checklist.push($(this).val()) }

                });

                if (checklist!="") {
                    
                    swal({
                        title: 'Agree?!',
                        text: "團購品項即將審核通過",
                        type: 'warning',
                        showCancelButton: true,
                    
                    }).then(function () {

                        console.log(checklist);
                        var PD = { Waterid: checklist }
                        $.ajax({
                            type: 'POST',
                            url: "WebService.asmx/ChangePDcheckA",
                            contentType: "application/json;utf-8",
                            dataType: "json",
                            data: JSON.stringify(PD),
                            success: function (result) {
                                swal({
                                    title: '完成!!',
                                    text: "審核已通過!",
                                    type: 'success',
                                    showCancelButton: false,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#EA0000',
                                });
                                /* window.location.href = "/2.EmployeeList.aspx";*/
                                setTimeout(function () { window.location.reload(); }, 1500)
                            },
                            error: function () {
                                swal('失敗', '審核未送出', 'error');
                            }
                        });
                    });
                } else {
                    swal('Error', '請勾選項目!', 'error');
                }

            });
            $("#Btn_reject").click(function () {
                var checklist = new Array();
                $(".mycheckbox").each(function () {
                    if ($(this).prop("checked") === true) { checklist.push($(this).val()) }
                });

                if (checklist != "") {

                    swal({
                    title: 'Reject?!',
                    text: "Reject原因 ",
                    input: "textarea",
                    type: 'warning',
                    showCancelButton: true,
                    inputValidator: function (value) { // validates your input
                        return new Promise(function (resolve, reject) {
                            if (value != '' && value != null) {
                                var area = value
                                
                                
                                console.log(checklist);
                                var RJR = {
                                    text: area,
                                    Waterid: checklist
                                };

                                $.ajax({
                                    type: 'POST',
                                    url: "WebService.asmx/ChangePDcheckR",
                                    contentType: "application/json;utf-8",
                                    dataType: "json",
                                    data: JSON.stringify(RJR),
                                    success: function (result) {
                                        swal({
                                            title: 'Reject成功!!',
                                            /*text: "審核已通過!",*/
                                            type: 'success',
                                            showCancelButton: false,
                                            confirmButtonColor: '#3085d6',
                                            cancelButtonColor: '#EA0000',
                                        });
                                        /* window.location.href = "/2.EmployeeList.aspx";*/
                                        setTimeout(function () { window.location.reload(); }, 1000)
                                    },
                                    error: function () {
                                        swal('失敗', '審核未送出', 'error')
                                    }
                                });
                            }
                            else {
                                reject('Please enter a valid text');
                            }
                        });
                    }
                  
                    });
                } else {
                    swal('Error', '請勾選項目!', 'error');
                }


            });
            $("#checkall").click(function () {

                if ($("#checkall").prop("checked")) {
                    $("input[class='mycheckbox']").each(function () {
                        $(this).prop("checked", true);
                    });
                } else {
                    $("input[class='mycheckbox']").each(function () {
                        $(this).prop("checked", false);
                    });
                }

            });
        });
        

    </script>
</asp:Content>

