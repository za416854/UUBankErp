<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="1.louis/forDefault/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" />
    <script src="https://vuejs.org/js/vue.js"></script>
    <style>
        .timeMin {
            min-width: 370px;
        }

        .myCard {
            background-color: lightgray !important;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" id="defaultPage">
        <div class="row">
            <div class="col-lg-6 grid-margin stretch-card col-xl-3">
                <div class="card myCard">
                    <div class="card-body">
                        <p class="card-title text-md-center text-xl-left">美金匯率</p>
                        <div class="d-flex flex-wrap justify-content-between ">
                            <p style="font-size: x-large">USD$:<input type="text" disabled="disabled" style="background-color: white; font-size: x-large; width: 200px; border: unset" v-model.number="currency1(usd)" /></p>
                            <i class="flag-icon flag-icon-us" title="us" id="us"></i>
                        </div>
                        <input type="text" id="ntdToUsd" style="width: 150px" class="mb-0 mt-2 text-warning col-md-12" placeholder="請輸入新台幣" v-model.number="ntdToUsd" />
                        <span class="text-black col-lg-12"><small>今日匯率:{{usd}}</small></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title text-md-center text-xl-left">英鎊匯率</p>
                        <div class="d-flex flex-wrap justify-content-between ">
                            <p style="font-size: x-large">GBP$:<input type="text" disabled="disabled" style="background-color: white; font-size: x-large; width: 200px; border: unset" v-model.number="currency2(gbp)" /></p>
                            <i class="flag-icon flag-icon-gb" title="gb" id="gb"></i>
                        </div>
                        <input type="text" id="ntdToEur" style="width: 150px" class="mb-0 mt-2 text-warning col-md-12" placeholder="請輸入新台幣" v-model.number="ntdToGbp" />
                        <span class="text-black col-lg-12"><small>今日匯率:{{gbp}}</small></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card col-xl-3">
                <div class="card myCard">
                    <div class="card-body">
                        <p class="card-title text-md-center text-xl-left">日圓匯率</p>
                        <div class="d-flex flex-wrap justify-content-between ">
                            <p style="font-size: x-large">JPY$:<input type="text" disabled="disabled" style="background-color: white; font-size: x-large; width: 200px; border: unset" v-model.number="currency3(jpy)" /></p>
                            <i class="flag-icon flag-icon-jp" title="jp" id="jp"></i>
                        </div>
                        <input type="text" id="ntdToJpy" style="width: 150px" class="mb-0 mt-2 text-warning col-md-12" placeholder="請輸入新台幣" v-model.number="ntdToJpy" />
                        <span class="text-black col-lg-12"><small>今日匯率:{{jpy}}</small></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title text-md-center text-xl-left">澳幣匯率</p>
                        <div class="d-flex flex-wrap justify-content-between ">
                            <p style="font-size: x-large">AUD$:<input type="text" disabled="disabled" style="background-color: white; font-size: x-large; width: 200px; border: unset" v-model.number="currency4(aud)" /></p>
                            <i class="flag-icon flag-icon-au" title="au" id="au"></i>
                        </div>
                        <input type="text" id="ntdToAud" style="width: 150px" class="mb-0 mt-2 text-warning col-md-12" placeholder="請輸入新台幣" v-model.number="ntdToAud" />
                        <span class="text-black col-lg-12"><small>今日匯率:{{aud}}</small></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body ml-3">
                        <div class="d-flex flex-wrap col-xl-12" style="margin-left: 30px;">
                            <div class="timeMin col-xl-4">
                                <div class="littleclock col-xl-4" id="ClockInclockUk">
                                </div>
                                <br />
                                <h3 style="margin-left: 140px">London</h3>
                            </div>
                            <div class="timeMin col-xl-4">
                                <div class="littleclock col-xl-4" id="ClockInclock">
                                </div>
                                <br />
                                <h3 style="margin-left: 150px">Taipei</h3>
                            </div>
                            <div class="timeMin col-xl-4">
                                <div class="littleclock col-xl-4" id="ClockInclockUs">
                                </div>
                                <br />
                                <h3 style="margin-left: 135px">New York</h3>
                            </div>
                        </div>
                        <%--<canvas id="order-chart"></canvas>--%>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-9 grid-margin" style="width: 1200px">
                <div class="card border-0 position-relative">
                    <div class="card-body">
                        <div id="performanceOverview" class="carousel slide performance-overview-carousel position-static" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active" style="height: 330px">
                                    <img src="images/louis/defaultSlide1.png" />
                                </div>
                                <div class="carousel-item" style="height: 330px">
                                    <img src="images/louis/defaultSlide2.png" />
                                </div>
                                <div class="carousel-item" style="height: 330px">
                                    <img src="images/louis/defaultSlide3.png" />
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#performanceOverview" role="button" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            </a>
                            <a class="carousel-control-next" href="#performanceOverview" role="button" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <%--todolist--%>
            <div class="col-md-3 grid-margin stretch-card" style="width: 400px; height: 370px">
                <div class="card">
                    <div class="card-body" style="background-color:khaki">
                        <h4 class="card-title" style="font-weight:bolder;font-size:larger">我的待辦事項MEMO</h4>
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <div class="list-wrapper pt-2" style="height: 230px;overflow:hidden">
                            <ul class="d-flex flex-column-reverse todo-list todo-list-custom" v-for="item in toDoList">
                                <li id="todoli" style="height:30px;background-color:burlywood" >
                                    <i class="fa fa-caret-square-o-right menu-icon"></i>
                                    <div class="form-check form-check-flat">
                                        <label class="form-check-label">
                                            <%--<input class="checkbox" type="checkbox">--%>
                                            {{item.myEvent}}
                                        </label>
                                    </div>
                                    
                                    <button type="button" :id="item.myEvent" class="removeToDo btn btn-icon text-primary" v-on:click="al($event)">x</button>
                                    <%--<i class="remove ti-close"></i>--%>
                                </li>
                            </ul>
                        </div>
                        <div class="add-items d-flex mb-0 mt-2">
                            <input id="toDoTxt" type="text" class="form-control todo-list-input" value="交報表給經理">
                            <button id="addToDo" class="add btn btn-icon text-primary todo-list-add-btn bg-transparent"><i class="ti-location-arrow"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<%--        <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
                <div class="card position-relative">
                    <div class="card-body">
                        <p class="card-title">Detailed Reports</p>
                        <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-center">
                                            <div class="ml-xl-4">
                                                <h1>$34040</h1>
                                                <h3 class="font-weight-light mb-xl-4">North America</h3>
                                                <p class="text-muted mb-2 mb-xl-0">The total number of sessions within the date range. It is the period time a user is actively engaged with your website, page or app, etc</p>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xl-9">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="table-responsive mb-3 mb-md-0">
                                                        <table class="table table-borderless report-table">
                                                            <tr>
                                                                <td class="text-muted">Illinois</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">713</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Washington</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">583</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Mississippi</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">924</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">California</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">664</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Maryland</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">560</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Alaska</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">793</h5>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <canvas id="north-america-chart"></canvas>
                                                    <div id="north-america-legend"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-12 col-xl-3 d-flex flex-column justify-content-center">
                                            <div class="ml-xl-4">
                                                <h1>$61321</h1>
                                                <h3 class="font-weight-light mb-xl-4">South America</h3>
                                                <p class="text-muted mb-2 mb-xl-0">It is the period time a user is actively engaged with your website, page or app, etc. The total number of sessions within the date range. </p>
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-xl-9">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="table-responsive mb-3 mb-md-0">
                                                        <table class="table table-borderless report-table">
                                                            <tr>
                                                                <td class="text-muted">Brazil</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">613</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Argentina</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">483</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Peru</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">824</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Chile</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">564</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Colombia</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">460</h5>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text-muted">Uruguay</td>
                                                                <td class="w-100 px-0">
                                                                    <div class="progress progress-md mx-4">
                                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h5 class="font-weight-bold mb-0">693</h5>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <canvas id="south-america-chart"></canvas>
                                                    <div id="south-america-legend"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#detailedReports" role="button" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                            </a>
                            <a class="carousel-control-next" href="#detailedReports" role="button" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>

                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 stretch-card grid-margin grid-margin-md-0">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title mb-0">Projects</p>
                        <div class="table-responsive">
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th class="ps-0 border-bottom">Places</th>
                                        <th class="border-bottom">Orders</th>
                                        <th class="border-bottom">Users</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-muted ps-0">Kentucky</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">65</span>(2.15%)</p>
                                        </td>
                                        <td class="text-muted">65</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0">Ohio</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">54</span>(3.25%)</p>
                                        </td>
                                        <td class="text-muted">51</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0">Nevada</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">22</span>(2.22%)</p>
                                        </td>
                                        <td class="text-muted">32</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0">North Carolina</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">46</span>(3.27%)</p>
                                        </td>
                                        <td class="text-muted">15</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0">Montana</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">17</span>(1.25%)</p>
                                        </td>
                                        <td class="text-muted">25</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0">Nevada</td>
                                        <td>
                                            <p class="mb-0"><span class="font-weight-bold me-2">52</span>(3.11%)</p>
                                        </td>
                                        <td class="text-muted">71</td>
                                    </tr>
                                    <tr>
                                        <td class="text-muted ps-0 pb-0">Louisiana</td>
                                        <td class="pb-0">
                                            <p class="mb-0"><span class="font-weight-bold me-2">25</span>(1.32%)</p>
                                        </td>
                                        <td class="text-muted pb-0">14</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 stretch-card">
                <div class="row">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-title">Charts</p>
                                <div class="charts-data">
                                    <div class="mt-3">
                                        <p class="text-muted mb-0">Orders</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="progress progress-md flex-grow-1 me-4">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mb-0">5k</p>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p class="text-muted mb-0">Users</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="progress progress-md flex-grow-1 me-4">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mb-0">3k</p>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p class="text-muted mb-0">Downloads</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="progress progress-md flex-grow-1 me-4">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 48%" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mb-0">992</p>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <p class="text-muted mb-0">Visitors</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="progress progress-md flex-grow-1 me-4">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <p class="text-muted mb-0">687</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 stretch-card grid-margin grid-margin-md-0">
                        <div class="card data-icon-card-primary">
                            <div class="card-body">
                                <p class="card-title text-white">Number of Meetings</p>
                                <div class="row">
                                    <div class="col-8 text-white">
                                        <h3>3404</h3>
                                        <p class="text-white font-weight-light mb-0">The total number of sessions within the date range. It is the period time</p>
                                    </div>
                                    <div class="col-4 background-icon">
                                        <i class="ti-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 stretch-card">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title">Notifications</p>
                        <ul class="icon-data-list">
                            <li>
                                <p class="text-primary mb-1">Isabella Becker</p>
                                <p class="text-muted">Sales dashboard have been created</p>
                                <small class="text-muted">9:30 am</small>
                            </li>
                            <li>
                                <p class="text-primary mb-1">Adam Warren</p>
                                <p class="text-muted">You have done a great job #TW11109872</p>
                                <small class="text-muted">10:30 am</small>
                            </li>
                            <li>
                                <p class="text-primary mb-1">Leonard Thornton</p>
                                <p class="text-muted">Sales dashboard have been created</p>
                                <small class="text-muted">11:30 am</small>
                            </li>
                            <li>
                                <p class="text-primary mb-1">George Morrison</p>
                                <p class="text-muted">Sales dashboard have been created</p>
                                <small class="text-muted">8:50 am</small>
                            </li>
                            <li>
                                <p class="text-primary mb-1">Ryan Cortez</p>
                                <p class="text-muted">Herbs are fun and easy to grow.</p>
                                <small class="text-muted">9:00 am</small>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" runat="Server">
    <script src="1.louis/forDefault/jquery.thooClock.js"></script>
    <script>
        $(function () {
            var jsthis = this;
            var app = new Vue({
                el: '#defaultPage',
                data: {
                    ntdToUsd: "",
                    ntdToGbp: "",
                    ntdToJpy: "",
                    ntdToAud: "",
                    usd: "",
                    gbp: "",
                    jpy: "",
                    aud: "",
                    toDoList: [],


                },
                created: function () {
                    var toDoData = {
                        userName: $("#ContentPlaceHolder1_HiddenField1").val(),
                    };
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        url: "WebService.asmx/GetMyToDoList",
                        contentType: "application/json;utf-8",
                        dataType: "json",
                        data: JSON.stringify(toDoData),
                        success: function (result) {
                            self.toDoList = result.d;
                        },
                    });

                    $.ajax({
                        url: 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/twd/usd.json',
                        type: "get",
                        dataType: 'json',
                        success: function (info) {
                            console.log(info.usd);
                            self.usd = info.usd
                        },
                    });
                    $.ajax({
                        url: 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/twd/gbp.json',
                        type: "get",
                        dataType: 'json',
                        success: function (info) {
                            console.log(info.gbp);
                            self.gbp = info.gbp
                        },
                    });
                    $.ajax({
                        url: 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/twd/jpy.json',
                        type: "get",
                        dataType: 'json',
                        success: function (info) {
                            console.log(info.jpy);
                            self.jpy = info.jpy
                        },
                    });
                    $.ajax({
                        url: 'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/twd/aud.json',
                        type: "get",
                        dataType: 'json',
                        success: function (info) {
                            console.log(info.aud);
                            self.aud = info.aud
                        },
                    });

                },

                methods: {
                    currency1: function (rate) {
                        return (Math.floor((this.ntdToUsd * rate) * 1000))/1000;
                    },
                    currency2: function (rate) {
                        return (Math.floor((this.ntdToGbp * rate) * 1000)) / 1000;
                    },
                    currency3: function (rate) {
                        return (Math.floor((this.ntdToJpy * rate) * 1000)) / 1000;
                    },
                    currency4: function (rate) {
                        return (Math.floor((this.ntdToAud * rate) * 1000)) / 1000;
                    },
                    al: function (event) {
                        /*alert(event.currentTarget.id);*/

                        var deleteData = {
                            userName: $("#ContentPlaceHolder1_HiddenField1").val(),
                            myEvent: event.currentTarget.id
                        };
                        $.ajax({
                            type: 'POST',
                            url: "WebService.asmx/DeleteMyToDo",
                            contentType: "application/json;utf-8",
                            dataType: "json",
                            data: JSON.stringify(deleteData),
                            success: function (result) {
                                window.location.reload();
                            },
                        });
                    },

                }
            });


            //ShowTime的函式
            $('#ClockInclockUs').thooClock({
                size: 350,
                dialColor: '#000000',
                dialBackgroundColor: 'transparent',
                secondHandColor: 'transparent',
                minuteHandColor: '#222222',
                hourHandColor: '#222222',
                alarmHandColor: '#FFFFFF',
                alarmHandTipColor: '#026729',
                timeCorrection: {
                    operator: '-',
                    hours: 13,
                    minutes: 0
                },
                alarmCount: 1,
                showNumerals: true,
                numerals: [
                    { 1: "" },
                    { 2: "" },
                    { 3: "III" },
                    { 4: "" },
                    { 5: "" },
                    { 6: "VI" },
                    { 7: "" },
                    { 8: "" },
                    { 9: "IX" },
                    { 10: "" },
                    { 11: "" },
                    { 12: "XII" }
                ],
                sweepingMinutes: true,
                sweepingSeconds: false,
                numeralFont: 'arial',
                brandFont: 'arial'
            });

            $('#ClockInclock').thooClock({
                size: 350,
                dialColor: '#000000',
                dialBackgroundColor: 'transparent',
                secondHandColor: '#222222',
                minuteHandColor: '#222222',
                hourHandColor: '#222222',
                alarmHandColor: '#FFFFFF',
                alarmHandTipColor: '#026729',
                timeCorrection: {
                    operator: '+',
                    hours: 0,
                    minutes: 0
                },
                alarmCount: 1,
                showNumerals: true,
                numerals: [
                    { 1: "" },
                    { 2: "" },
                    { 3: "III" },
                    { 4: "" },
                    { 5: "" },
                    { 6: "VI" },
                    { 7: "" },
                    { 8: "" },
                    { 9: "IX" },
                    { 10: "" },
                    { 11: "" },
                    { 12: "XII" }
                ],
                sweepingMinutes: true,
                sweepingSeconds: false,
                numeralFont: 'arial',
                brandFont: 'arial'
            });

            $('#ClockInclockUk').thooClock({
                size: 350,
                dialColor: '#000000',
                dialBackgroundColor: 'transparent',
                secondHandColor: 'transparent',
                minuteHandColor: '#222222',
                hourHandColor: '#222222',
                alarmHandColor: '#FFFFFF',
                alarmHandTipColor: '#026729',
                timeCorrection: {
                    operator: '-',
                    hours: 8,
                    minutes: 0
                },
                alarmCount: 1,
                showNumerals: true,
                numerals: [
                    { 1: "" },
                    { 2: "" },
                    { 3: "III" },
                    { 4: "" },
                    { 5: "" },
                    { 6: "VI" },
                    { 7: "" },
                    { 8: "" },
                    { 9: "IX" },
                    { 10: "" },
                    { 11: "" },
                    { 12: "XII" }
                ],
                sweepingMinutes: true,
                sweepingSeconds: false,
                numeralFont: 'arial',
                brandFont: 'arial'
            });


            function ShowTime() {
                var NowDate = new Date();
                var h = NowDate.getHours();
                var m = NowDate.getMinutes();
                var s = NowDate.getSeconds();
                document.getElementById('showbox').innerHTML = h + '時' + m + '分' + s + '秒';
                setTimeout('ShowTime()', 1000);
            }
            //Ajax上班打卡

            $("#addToDo").click(function () {
                var addtoDoData = {
                    userName: $("#ContentPlaceHolder1_HiddenField1").val(),
                    myEvent: $("#toDoTxt").val()
                };
                var self = this;
                $.ajax({
                    type: 'POST',
                    url: "WebService.asmx/AddToDoList",
                    contentType: "application/json;utf-8",
                    dataType: "json",
                    data: JSON.stringify(addtoDoData),
                    success: function (result) {

                    },
                });

            });






        })

    </script>
</asp:Content>
