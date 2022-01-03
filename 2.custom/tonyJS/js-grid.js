(function ($) {
    'use strict';

    $(function () {
        jsGrid.locale("zh-tw");
        //basic config
        if ($("#js-grid").length) {

            var mySelect = [
                
                { Name: "同意", Bool: true },
                { Name: "駁回", Bool: false }
            ]

            $("#js-grid").jsGrid({
                height: "500px",
                width: "100%",
                filtering: true,
                editing: true,
                inserting: true,
                sorting: true,
                paging: true,
                pageLoading: true,
                autoload: true,
                pageSize: 5,
                pageButtonCount: 5,
                pageIndex:1,
                deleteConfirm: "可以刪除嗎?",
                fields: [
                    {
                        name: "Id2",
                        title: "申請編號",
                        type: "number",
                        width: 80,
                        validate: "required"
                    },
                    { name: "ClubName2", title: "社團名稱", type: "textarea", width: 100, validate: "required"},
                    { name: "ClubFounderId2", title: "申請人員工編號", type: "textarea", width: 100, validate: "required" },
                    {
                        name: "ClubFounderName2",
                        title: "申請人姓名",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name:"ClubScript2",
                        title: "社團描述(30字內)",
                        type: "textarea",
                        width: 100,
                        validate: "required"
                    },
                    {
                        name: "DetailClubScript2",
                        title: "社團詳細描述",
                        type: "textarea",
                        width: 300,
                        validate: "required"
                    },
                    {
                        name:"PeopleCount2",
                        title: "社團人數",
                        type: "number",
                        width: 80,
                        validate: "required" 
                    },
                    {
                        name: "Approve2",
                        title: "核准",
                        type: "select",
                        sorting: true,
                        items: mySelect,
                        valueField: "Bool",
                        textField:"Name",
                        width:80
                       
                    },
                    {
                        type: "control"
                    }
                ],
                controller: {
                    loadData: function (filter) {
                        var myData = null;
                        var itemCount = 0;
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: "TonyWebService.asmx/GetTemporaryClub",
                            data: JSON.stringify({
                                pageSize: filter.pageSize,
                                pageIndex: filter.pageIndex
                            }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                myData = data.d.Products;
                                itemCount = data.d.TotalCount;
                               
                            },
                            failure: function (errMsg) {
                                alert(errMsg);
                            }
                        });
                        return {
                            data: myData,
                            itemsCount: itemCount
                        };

                    },
                    insertItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/InsertTemporaryClub",
                            data: JSON.stringify({ club: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已新增', 'success') }
                        });
                    },
                    updateItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/EditTemporaryClub",
                            data: JSON.stringify({ club: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已修改', 'success') }
                        });
                    },
                    deleteItem: function (item) {
                        $.ajax({
                            type: "POST",
                            url: "TonyWebService.asmx/DeleteTemporaryClub",
                            data: JSON.stringify({ club: item }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) { swal('完成!', '資料已刪除', 'success') }
                        });
                    },
                },

            });
        }


        /* Static*/
        if ($("#js-grid-static").length) {
            $("#js-grid-static").jsGrid({
                height: "500px",
                width: "100%",

                sorting: true,
                paging: true,

                data: myProducts,

                fields: [
                    {
                        name: "Name",
                        type: "text",
                        width: 150,
                        validate: "required"
                    },
                    { name: "Price", type: "number", width: 50 },
                    { name: "Desc", type: "text", width: 200 },
                    {
                        name: "Category",
                        type: "select",
                        items: myCategories,
                        valueField: "Id",
                        textField: "Name"
                    },
                    {
                        name: "CreditCard",
                        type: "checkbox",
                        title: "UseCreditCard",
                        sorting: false
                    },
                ]
            });
        }

        //sortable
        //if ($("#js-grid-sortable").length) {
        //  $("#js-grid-sortable").jsGrid({
        //    height: "300px",
        //    width: "100%",

        //    autoload: true,
        //    selecting: false,

        //    controller: db,

        //    fields: [{
        //        name: "Name",
        //        type: "text",
        //        width: 150
        //      },
        //      {
        //        name: "Age",
        //        type: "number",
        //        width: 50
        //      },
        //      {
        //        name: "Address",
        //        type: "text",
        //        width: 200
        //      },
        //      {
        //        name: "Country",
        //        type: "select",
        //        items: db.countries,
        //        valueField: "Id",
        //        textField: "Name"
        //      },
        //      {
        //        name: "Married",
        //        title: "Is Married",
        //        itemTemplate: function(value, item) {
        //          return $("<div>")
        //            .addClass("form-check mt-0")
        //            .append(
        //              $("<label>").addClass("form-check-label")
        //              .append(
        //                $("<input>").attr("type", "checkbox")
        //                .addClass("form-check-input")
        //                .attr("checked", value || item.Checked)
        //                .on("change", function() {
        //                  item.Checked = $(this).is(":checked");
        //                })
        //              )
        //              .append('<i class="input-helper"></i>')
        //            );
        //        }
        //      }
        //    ]
        //  });
        //}

        //if ($("#sort").length) {
        //  $("#sort").on("click", function() {
        //    var field = $("#sortingField").val();
        //    $("#js-grid-sortable").jsGrid("sort", field);
        //  });
        //}

    });
})(jQuery);