<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <script src="Js/jquery-1.4.4.js?v=3003" type="text/javascript"></script>
      <script src="Js/JTemplate.js?v=3003" type="text/javascript"></script>
    <script src="Js/jquery.blockUI.js?v=3003" type="text/javascript"></script>
    <link href="Css/style.css?v=3003" rel="stylesheet" type="text/css" />
    <link href="Css/VyshnaviStyles.css?v=3004" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*.datepicker
        {
            border: 1px solid gray;
            background: url("Images/CalBig.png") no-repeat scroll 99%;
              width: 100%;
            top: 0;
            left: 0;
            height: 60px;
            font-weight: 700;
            font-size: 18px;
            cursor: pointer;
            border: 1px solid gray;
            margin: .5em 0;
            padding: .6em 20px;
            border-radius: 10px 10px 10px 10px;
            filter: Alpha(Opacity=0);
            box-shadow: 3px 3px 3px #ccc;
        }*/
        input[type=number]::-webkit-inner-spin-button,
         input[type=number]::-webkit-outer-spin-button
        {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <script type="text/javascript">
        $(function () {
//            if (datatab.length == 0) {
                GetPermissions();
//            }
//            else {
//                UserName = msg[0].UserName;
//                Permissions = msg[0].Permision;
//                count = msg[0].Count;
//                GetValues();

//            }
        });
        
    </script>
    <script type="text/javascript">
        var UserName = "";
        var Permissions = "";
        var datatab;
        function GetPermissions() {
            var data = { 'op': 'GetPermissions' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    UserName = msg[0].UserName;
                    Permissions = msg[0].Permision;
                    count = msg[0].Count;
                    GetValues();
                    datatab = msg;
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var count = 0;
        var StatusDropDown = "";
        function GetValues() {
            window.history.forward(1);
            document.getElementById('txtUser').innerHTML = UserName;
            Permissions = Permissions;
            var Permns = [];
            Permns = Permissions.split(';');
            for (var i = 0; i < Permns.length; i++) {
                switch (Permns[i]) {
                    case "O":
                        $('#divOrders').css('display', 'block');
                        $('#divIndentReporting').css('display', 'block');
                        $('#divOrderReport').css('display', 'block');
                        $('#divProductReport').css('display', 'block');
                        
                        StatusDropDown = "Order";
                        if (count > 1) {
                            $('#divRouteOrder').css('display', 'block');
                            $('#divReporting').css('display', 'none');
                            $('#divShortage').css('display', 'none');
                            FillDispatchRoutes();
                        }
                        else {
                            $('#divRouteOrder').css('display', 'none');
                            $('#divReporting').css('display', 'none');
                            $('#divShortage').css('display', 'none');
                            FillDispatchBrach();
                        }
                        break;

                    case "D":
                        $('#divDelivers').css('display', 'block');
                        StatusDropDown = "Deliver";
                        if (count > 1) {
                            $('#divRouteOrder').css('display', 'none');
                            $('#divDeliverReport').css('display', 'none');
                            $('#divInventaryReport').css('display', 'none');
                            $('#divReports').css('display', 'block');
                            $('#divOrderReport').css('display', 'none');
                            $('#divCollectionReport').css('display', 'none');
                            $('#divShortage').css('display', 'block');
                            FillDispatchRoutes();
                        }
                        else {
                            $('#divRouteOrder').css('display', 'none');
                            $('#divDeliverReport').css('display', 'none');
                            $('#divInventaryReport').css('display', 'none');
                            $('#divReports').css('display', 'block');
                            $('#divOrderReport').css('display', 'none');
                            $('#divCollectionReport').css('display', 'none');
                            $('#divShortage').css('display', 'block');
                            FillDispatchBrach();
                        }
                        break;
                    case "C":
                        $('#divCollections').css('display', 'block');
                        $('#divCollectionReport').css('display', 'none');
                        $('#tableEmployee').css('display', 'none');
                        break;
                    case "Dispatcher":

                        $('#divRouteOrder').css('display', 'block');
                        $('#divOrders').css('display', 'none');
                        $('#divIndentReporting').css('display', 'none');
                        $('#divDelivers').css('display', 'none');
                        $('#divCollections').css('display', 'none');
                        $('#divCollectionReport').css('display', 'none');
                        $('#divReports').css('display', 'none');
                        $('#divReporting').css('display', 'block');
                        $('#divDispatch').css('display', 'block');
                        $('#divDispreport').css('display', 'block');
//                        $('#divDispTransfer').css('display', 'block');
                        $('#divSOTransfer').css('display', 'block');
                        $('#tableOrder').css('display', 'none');
                        $('#divVerifyInventory').css('display', 'block');
                        $('#divSOTransfer').css('display', 'none');

                        FillPlantDispatches();
                        fillcsoroutes();
                        break;
                    case "SODispatcher":

//                        $('#divPlantDespatch').css('display', 'block');
                        $('#divSOTransfer').css('display', 'block');
                        $('#divSalesOfficeDespatch').css('display', 'block');
                        $('#divOrders').css('display', 'none');
                        $('#divIndentReporting').css('display', 'none');
                        $('#divDelivers').css('display', 'none');
                        $('#divCollections').css('display', 'none');
                        $('#divCollectionReport').css('display', 'none');
                        $('#divReports').css('display', 'none');
                        $('#divReporting').css('display', 'none');
                        $('#divDispatch').css('display', 'none');
                        $('#divDispreport').css('display', 'none');
//                        $('#divDispTransfer').css('display', 'block');
                        $('#tableOrder').css('display', 'none');
                        $('#divVerifyInventory').css('display', 'none');
                        $('#divInvReporting').css('display', 'block');
                        $('#divFinalDC').css('display', 'block');
                        $('#divSpacialSale').css('display', 'block');
                        $('#divSalesOfficeLeaks').css('display', 'block');
//                        $('#divDispTransfer').css('display', 'block');
//                        FillPlantDispatches();
                        fillcsoroutes();
                        break;
                }
            }
        }
    </script>
    <script type="text/javascript">
        function GetBranchStatus(RouteId) {
            var data = { 'op': 'GetIndentStatus', 'RouteId': RouteId };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    ColorChangeDropdown(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function fillEmployeeName() {
            var data = { 'op': 'GetSOEmployeeNames' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindEmployeeName(msg);

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindEmployeeName(msg) {
            var ddlEmployee = document.getElementById('ddlEmployee');
            var length = ddlEmployee.options.length;
            ddlEmployee.options.length = null;
            var opt = document.createElement('option');
            opt.innerHTML = "select";
            ddlEmployee.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i].UserName != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].UserName;
                    opt.value = msg[i].Sno;
                    ddlEmployee.appendChild(opt);
                }
            }
        }
        function fillcsoroutes() {
            var data = { 'op': 'GetCsodispatchRoutes' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindRouteName(msg);

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function fillIndentType(RouteId) {
            //            $('#DivIndentType').css('display', 'none');
            var data = { 'op': 'GetIndentType', 'RouteId': RouteId };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    if (msg.length > 1) {
                        $('#DivIndentType').css('display', 'block');
                        //                        $('#DivDispatchType').css('display', 'none');
                        BindIndentType(msg);
                    }
                    else {
                        BindIndentType(msg);
                        $('#DivIndentType').css('display', 'none');
                        if (Permissions == "Dispatcher") {
                            //                            $('#DivDispatchType').css('display', 'block');
                            $('#DivIndentType').css('display', 'none');
                            $('#tableOrder').css('display', 'none');
                            $('#divDelivers').css('display', 'none');
                            $('#divCollections').css('display', 'none');
                            $('#divDispatch').css('display', 'block');
                            $('#divDispreport').css('display', 'block');
//                            $('#divDispTransfer').css('display', 'block');
                            $('#divSOTransfer').css('display', 'block');
                            $('#divCollectionReport').css('display', 'none');
                            $('#divShortage').css('display', 'block');
                            $('#divVerifyInventory').css('display', 'block');
                            $('#divDeliverReport').css('display', 'none');
                            $('#divInventaryReport').css('display', 'none');

                        }
                        if (Permissions == "SODispatcher") {
                            $('#tableEmployee').css('display', 'block');
                            $('#divback').css('display', 'block');
                            $('#divHide').css('display', 'none');
                            $('#divRouteOrder').css('display', 'block');
                            $('#divFillScreen').css('display', 'block');
                            $('#divDispatch').css('display', 'block');
                            $('#divVerifyInventory').css('display', 'block');
                            $('#divShortage').css('display', 'block');
                            $('#divDispreport').css('display', 'block');
                            $('#divPlantDespatch').css('display', 'none');
                        }
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }

        function BindDisBranch() {
            var routeID = document.getElementById('ddlRouteName').value;
            var data = { 'op': 'GetDisTypeChange', 'TripId': routeID };
            var s = function (msg) {
                if (msg) {
                    BindBranchName(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindIndentType(msg) {
            var ddlIndentType = document.getElementById('ddlIndentType');
            var length = ddlIndentType.options.length;
            ddlIndentType.options.length = null;
            var opt = document.createElement('option');
            for (var i = 0; i < msg.length; i++) {
                if (msg[i].IndentType != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].IndentType;
                    opt.value = msg[i].IndentType;
                    ddlIndentType.appendChild(opt);
                }
            }
        }
        function FillDispatchRoutes() {
            var data = { 'op': 'GetDispatchAgents' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindRouteName(msg);
                    var routeID = document.getElementById('ddlRouteName').value;
                    fillIndentType();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function FillDispatchBrach() {
            var data = { 'op': 'GetDispatchBranch' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindBranchName(msg);
                    if (StatusDropDown == "Order") {
                        if (count > 1) {
                        }
                        else {
                            var id = "";
                            GetBranchStatus(id);
                            fillIndentType(id);
                        }
                    }

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function ColorChangeDropdown(data) {
            var select = document.getElementById('ddlBranchName');
            for (var i = 0; i < data.length; i++) {
                var Branchid = data[i].bid;
                for (var j = 0; j < select.options.length; j++) {
                    var Sbid = select.options[j].value;
                    if (Branchid == Sbid) {
                        select.options[j].style.backgroundColor = 'Gray';
                    }
                }
            }
        }
        function FillCategeoryname() {
            var data = { 'op': 'FillCategeoryname' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindCategeoryname(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        };
        function BindCategeoryname(msg) {
            var brnchprdtcatgryname = document.getElementById('cmb_brchprdt_Catgry_name');
            var length = brnchprdtcatgryname.options.length;
            brnchprdtcatgryname.options.length = null;
            var opt = document.createElement('option');
            opt.innerHTML = "select";
            brnchprdtcatgryname.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i].categoryname != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].categoryname;
                    opt.value = msg[i].sno;
                    brnchprdtcatgryname.appendChild(opt);
                }
            }
        }
        function productsdata_categoryname_onchange() {
            var cmbcatgryname = document.getElementById("cmb_brchprdt_Catgry_name").value;
            var data = { 'op': 'get_product_subcategory_data', 'cmbcatgryname': cmbcatgryname };
            var s = function (msg) {
                if (msg) {
                    fillproductsdata_subcatgry(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
           //AscCallHandler(data, s, e);
        };
        function fillproductsdata_subcatgry(msg) {
            var brnchsubcategory = document.getElementById('cmb__brnch_subcatgry');
            var length = brnchsubcategory.options.length;
            document.getElementById("cmb__brnch_subcatgry").options.length = null;
            document.getElementById("cmb__brnch_subcatgry").value = "select";
            //        for (i = 0; i < length; i++) {
            //            prdtsubcategory.options[i] = null;
            //        } 
            var opt = document.createElement('option');
            opt.innerHTML = "Select";
            brnchsubcategory.appendChild(opt);

            for (var i = 0; i < msg.length; i++) {
                if (msg[i].subcategorynames != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].subcategorynames;
                    opt.value = msg[i].sno;
                    brnchsubcategory.appendChild(opt);
                }
            }
        }
        function productsdata_subcategory_onchange() {
            var cmbsubcatgryname = document.getElementById("cmb__brnch_subcatgry").value;
            //    var e = document.getElementById("cmb__brnch_subcatgry");
            //    var cmbsubcatgryname = e.options[e.selectedIndex].value;
            var data = { 'op': 'get_products_data', 'cmbsubcatgryname': cmbsubcatgryname };
            var s = function (msg) {
                if (msg) {
                    fillproductsdata_products(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
           // AscCallHandler(data, s, e);
        };
        function fillproductsdata_products(msg) {
            var cmbprdtname = document.getElementById('cmb_productname');
            var length = cmbprdtname.options.length;
            document.getElementById("cmb_productname").options.length = null;
            document.getElementById("cmb_productname").value = "select";
            //    for (i = 0; i < length; i++) {
            //        cmbprdtname.options[i] = null;
            //    }
            var opt = document.createElement('option');
            opt.innerHTML = "Select";
            cmbprdtname.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i].productName != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].productName;
                    opt.value = msg[i].Sno;
                    cmbprdtname.appendChild(opt);
                }
            }
        }
        var DairyStatus = "";
        function divOrdersclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            }
            DairyStatus = "Orders";
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('Orders10.htm');
            $('#divFillScreen').processTemplate();
            if (bid != "") {
                BranchChane();
                GetOrderStatus();
            }
        }
        
        function OrderTubQtyChange(TubQty) {
            if (TubQty.value == "") {

            }
            else {
                var invQty = $(TubQty).closest("tr").find("#hdninvQty").val();
                var unitQty = $(TubQty).closest("tr").find("#hdnUnitQty").val();
                var tubval = TubQty.value;
                var totalpkts = parseFloat(tubval * invQty);
                var totltr = parseFloat(totalpkts * unitQty);
                var totltrvalue = parseFloat(totltr / 1000);

                $(TubQty).closest("tr").find("#txtUnitQty").val(parseFloat(totltrvalue).toFixed(2));
                $(TubQty).closest("tr").find("#txtDupUnitQty").text(parseFloat(totltrvalue).toFixed(2))
                $(TubQty).closest("tr").find("#txtQtypkts").val(parseFloat(totalpkts).toFixed(2));
                var val = parseFloat(totltrvalue).toFixed(2);
                OrderUnitChange(TubQty);
            }
        }
        function OrderPktQtyChange(PktQty) {
            if (PktQty.value == "") {

            }
            else {
                var invQty = $(PktQty).closest("tr").find("#hdninvQty").val();
                var unitQty = $(PktQty).closest("tr").find("#hdnUnitQty").val();
                var pktval = PktQty.value;
                var totltr = parseFloat(pktval * unitQty);
                var totltrvalue = parseFloat(totltr / 1000);
                var totaltub = parseFloat(pktval / invQty);

                $(PktQty).closest("tr").find("#txtUnitQty").val(parseFloat(totltrvalue).toFixed(2));
                $(PktQty).closest("tr").find("#txtDupUnitQty").text(parseFloat(totltrvalue).toFixed(2))
                $(PktQty).closest("tr").find("#txtTubQty").val(parseFloat(totaltub).toFixed(2));
                var val = parseFloat(totltrvalue).toFixed(2);
                OrderUnitChange(PktQty);
            }
        }
        var FinalAmount;
        function calcTot() {
            var qty=0.0;
            var rate = 0;
            var total = 0;
            var totalltr = 0;
            var cnt = 0;
            $('.Unitqtyclass').each(function (i, obj) {
                //var qtyclass = $(this).next.next.next.text();
                var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();
                if (qtyclass == "" || qtyclass == "0") {
                }
                else {
                    totalltr += parseFloat(qtyclass);
                    cnt++;
                }
            });

            document.getElementById('txt_totqty').innerHTML = parseFloat(totalltr).toFixed(2);
            $('.rateclass').each(function (i, obj) {
                rate += parseFloat($(this).text());
            });
            document.getElementById('txt_totRate').innerHTML = parseFloat(rate).toFixed(2);
            $('.totalclass').each(function (i, obj) {
                total += parseFloat($(this).text());
            });
            document.getElementById('txt_total').innerHTML = parseFloat(total).toFixed(2);
            FinalAmount = total;

        }
        var OfferFinalAmount;

        function OffercalcTot() {
            var qty = 0.0;
            var rate = 0;
            var total = 0;
            var totalltr = 0;
            var cnt = 0;
            $('.OfferUnitqtyclass').each(function (i, obj) {
                //var qtyclass = $(this).next.next.next.text();
                var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();
                if (qtyclass == "" || qtyclass == "0") {
                }
                else {
                    totalltr += parseFloat(qtyclass);
                    cnt++;
                }
            });

            document.getElementById('txt_Offertotqty').innerHTML = parseFloat(totalltr).toFixed(2);
            $('.offerrateclass').each(function (i, obj) {
                rate += parseFloat($(this).text());
            });
            document.getElementById('txt_offertotRate').innerHTML = parseFloat(rate).toFixed(2);
            $('.Offertotalclass').each(function (i, obj) {
                total += parseFloat($(this).text());
            });
            document.getElementById('txt_offertotal').innerHTML = parseFloat(total).toFixed(2);
            FinalAmount = total;

        }
        function CalcDeliveryqty() {
            var Deliveryqty=0;
            $('.Returnqtyclass').each(function (i, obj) {
                Deliveryqty += parseFloat($(this).val());
                var TIqty = $(this).closest("tr").find("#txtRemainingQty").text();
                var Dqty = $(this).val();
                var TotalIndentQty = parseFloat(TIqty).toFixed(2) - parseFloat(Dqty);
                $(this).closest("tr").find("#txtRemainingQty").text(TotalIndentQty.toFixed(2));
            });
            document.getElementById('txt_RetunQty').innerHTML = parseFloat(Deliveryqty).toFixed(2);
        }

        function BindRouteName(msg) {
            document.getElementById('ddlRouteName').options.length = "";

            var veh = document.getElementById('ddlRouteName');
            var length = veh.options.length;
            for (i = length - 1; i >= 0; i--) {
                veh.options[i] = null;
            }
            var opt = document.createElement('option');
            opt.innerHTML = "Select Route";
            opt.value = "";
            veh.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i] != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].RouteName;
                    opt.value = msg[i].rid;
                    veh.appendChild(opt);
                }
            }

        }
        function GetEmployeeNames(RouteSno) {
            var data = { 'op': 'GetRouteEmployeeNames', 'TripId': RouteSno };
            var s = function (msg) {
                if (msg) {
                    $('#tableEmployee').css('display', 'block');
                    if (msg.length > 0) {
//                        $('#divEdit').css('display', 'block');
                        BindEmployeeName(msg);
                        if (DeleteStatus == "true") {
                            document.getElementById("btnDispatch").style.backgroundColor = "#FA7E75";
                        }
                        else {
                            document.getElementById("btnDispatch").style.backgroundColor = "#59FA87";
                        }
                    }
                    else {
//                        $('#divEdit').css('display', 'none');
                        fillEmployeeName();
                        document.getElementById("btnDispatch").style.backgroundColor = "#59FA87";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var DeleteStatus = "";
        function ddlEditChange() {
            var ddlEdit = document.getElementById('ddlEdit').value;
            $('#tableEmployee').css('display', 'block');
            if (ddlEdit == "Edit") {
                DeleteStatus = "False";
                fillEmployeeName();
                document.getElementById("btnDispatch").style.backgroundColor = "#59FA87";
            }
            if (ddlEdit == "Delete") {
                if (!confirm("Do you really want Delete Data")) {
                    return false;
                }
                DeleteStatus = "true";
                document.getElementById("btnDispatch").style.backgroundColor = "#FA7E75";
                GetEmployeeNames(RouteSno)
            }
        }
        var RouteSno=0;
        function ddlRouteNameChange(Id) {
            RouteSno = Id.value;
            if (Permissions == "Dispatcher" ) {
                $('#tableOrder').css('display', 'none');
                fillIndentType(Id.value);
                GetEmployeeNames(RouteSno);
            }
            if (Permissions == "SODispatcher") {
                if (AgentSale == "True") {
                    FillAgent(RouteSno);
                }
                else {
                    $('#tableEmployee').css('display', 'block');
                    //                fillIndentType(Id.value);
                    GetEmployeeNames(RouteSno);
                }
            }
            else {
                var data = { 'op': 'GetRouteNameChange', 'TripId': Id.value };
                var s = function (msg) {
                    if (msg) {
                        BindBranchName(msg);
                        if (StatusDropDown == "Order") {
                            GetBranchStatus(Id.value);
                            fillIndentType(Id.value);
                        }
                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                };
                $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                callHandler(data, s, e);
            }
        }
        function FillAgent(RouteSno) {
            var data = { 'op': 'GetRouteNameChange', 'TripId': RouteSno };
            var s = function (msg) {
                if (msg) {
                    BindBranchName(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }

        function BindBranchName(msg) {
            document.getElementById('ddlBranchName').options.length = "";
          
                var veh = document.getElementById('ddlBranchName');
                var length = veh.options.length;
                for (i = length - 1; i >= 0; i--) {
                    veh.options[i] = null;
                }
                var opt = document.createElement('option');
                opt.innerHTML = "Select Agent";
                opt.value = "";
                veh.appendChild(opt);
                for (var i = 0; i < msg.length; i++) {
                    if (msg[i] != null || msg[i].BranchName != "" || msg[i].BranchName != null) {
                        var opt = document.createElement('option');
                        opt.innerHTML = msg[i].BranchName;
                        opt.value = msg[i].b_id;
                        opt.id = msg[i].mobile;
                        veh.appendChild(opt);
                    }
                }
            
        }
        var bid = "";
        var phone = "";
        var HdnIndentNo;
        function ddlBranchNameChange(bname) {
            bid = bname.options[bname.selectedIndex].value;
            phone = bname.options[bname.selectedIndex].id;
            document.getElementById('lblBranch').innerHTML = bname.options[bname.selectedIndex].text + "(" + phone + ")";
        }
        var CollectionType = "";
        function BranchChane() {
            ChangebtnText();
            var IndentType = document.getElementById('ddlIndentType').value;
            if (DairyStatus != "Collections") {
                var RouteID = document.getElementById('ddlRouteName').value;
                var data = { 'op': 'getBranchValues', 'bid': bid, 'DairyStatus': DairyStatus, 'IndentType': IndentType, 'RouteID': RouteID };
                var s = function (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    if (msg) {
                        if (DairyStatus == "Orders") {
                            BindOrdersclick(msg);
                            calcTot();
                            //OffercalcTot();
                        }
                        if (DairyStatus == "Delivers") {
                            BindDeliversclick(msg);
                            CalcDeliveryqty();
                        }
                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                };
                $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                callHandler(data, s, e);
            }
            else {
                 $('#divFillScreen').setTemplateURL('Collections11.htm');
                $('#divFillScreen').processTemplate();
                var data = { 'op': 'getBranchValuesamount', 'bid': bid };
                var s = function (msg) {
                    if (msg) {
                        if (msg == "Session Expired") {
                            alert(msg);
                            window.location = "Login.aspx";
                        }
                        BindLeakeges();
                        var txtAmountPayable = msg[0].TotalAmount;
                        var txtTodayAmont = msg[0].TodayAmount;
                        HdnIndentNo = msg[0].IndentNo;
                        var rr = $('#hdnIndentNo').val(msg[0].IndentNo);

                        var PayAmount = 0;
                        //                        if (msg[0].TotalAmount == 0) {
                        PayAmount = parseFloat(msg[0].TotalAmount);
                        //                        }
                        //                        else {
                        //                            PayAmount = parseFloat(msg[0].TotalAmount);
                        //                        }
                        document.getElementById('txtAmountPayable').innerHTML = PayAmount.toFixed(2);
                        document.getElementById('txtTodayAmont').innerHTML = txtTodayAmont.toFixed(2);
                        document.getElementById('txtDeductions').innerHTML = 0;
                        var TotAmount = parseFloat(txtTodayAmont);
                        document.getElementById('txtTotalAmount').innerHTML = TotAmount.toFixed(2);
                        
                        BindDeliverInventory();
                        GetCollectionStatus();

                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                };
                $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                callHandler(data, s, e);
            }
        }
        
        var Changebutton = "";
        function ChangebtnText() {
            var data = { 'op': 'getTodayDate', 'bid': bid };
            var s = function (msg) {
                if (msg) {
                    if (msg != null) {
                        Changebutton = "Edit";
                    }
                    else {
                        Changebutton = "Save";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindLeakeges() {
            var RouteID = document.getElementById('ddlRouteName').value;
            var data = { 'op': 'getBranchLeakeges', 'bid': bid, 'RouteID': RouteID };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#divleakes').setTemplateURL('Leakages9.htm');
                    $('#divleakes').processTemplate(msg);
                    CollectionCal();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function DeliverCal() {
            $('.GivenQtyclass').each(function (i, obj) {
                var Qty = $(this).closest("tr").find('.InvQtyClass').text();
                if (Qty == "" || Qty == "0") {
                    var GivenQty = $(this).val();
                    if (GivenQty == "") {
                        GivenQty = "0";
                    }
                    var balanceQty = parseInt(Qty) + parseInt(GivenQty);
                    $(this).closest("tr").find('.ClassbalanceQty').text(balanceQty);
                }
                else {
                    var GivenQty = $(this).val();
                    if (GivenQty == "0" || GivenQty == "") {
                        GivenQty = 0;
                        var balanceQty = parseInt(Qty) + parseInt(GivenQty);
                        $(this).closest("tr").find('.ClassbalanceQty').text(balanceQty);
                    }
                    else {
                        var balanceQty = parseInt(Qty) + parseInt(GivenQty);
                        $(this).closest("tr").find('.ClassbalanceQty').text(balanceQty);
                    }
                }
            });
        }
        function InvenCal() {
            $('.ReceivedQtyclass').each(function (i, obj) {
                var InvQtyClass = $(this).closest("tr").find('.InvQtyClass').text();
                if (InvQtyClass == "" || InvQtyClass == "0") {
                }
                else {
                    var Qty = $(this).closest("tr").find('.InvQtyClass').text();
                    var ReceivedQty = $(this).val();
                    if (ReceivedQty == "0" || ReceivedQty == "") {
                        ReceivedQty = 0;
                        var balanceQty = parseInt(Qty) - parseInt(ReceivedQty);
                        $(this).closest("tr").find('.ClassbalanceQty').text(balanceQty);
                    }
                    else {
                        var balanceQty = parseInt(Qty) - parseInt(ReceivedQty);
                        $(this).closest("tr").find('.ClassbalanceQty').text(balanceQty);
                    }
                }
            });
        }
        function CollectionCal() {
            var TotRate = 0.0;
            $('.TotalRateClass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    TotRate += parseFloat($(this).text());
                }
            });
            document.getElementById('TotRate').innerHTML = TotRate.toFixed(2);
        }
        function CountChange(count) {
            var TotalCash = 0;
            var Total = 0;
            if (count.value == "") {
                $(count).closest("tr").find(".TotalClass").text(Total);
                document.getElementById('txtSubmittedAmount').value = Total;
                return false;
            }
            var Cash = $(count).closest("tr").find(".CashClass").text();
            if (Cash == "Vouchers") {
                Cash = 1;
            }
            Total = parseInt(count.value) * parseInt(Cash);
            $(count).closest("tr").find(".TotalClass").text(Total);
            $('.TotalClass').each(function (i, obj) {
                TotalCash += parseInt($(this).text());
            });
            document.getElementById('txt_Total').innerHTML = TotalCash;
            document.getElementById('txtSubmittedAmount').value = TotalCash;
        }
        function OrderUnitChange(UnitQty) {
            var totalqty;
            var qty = 0.0;
            var Rate = 0;
            var rate = 0;
            var total = 0;
            var totalltr = 0;
            var TotalRate = 0;
            var cnt = 0;
            if (UnitQty.value == "") {
                $(UnitQty).closest("tr").find("#txtOrderTotal").text(parseFloat(total).toFixed(2));
                $('.Unitqtyclass').each(function (i, obj) {
                   // var qtyclass = $(this).val();
                    var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();

                    if (qtyclass == "" || qtyclass == "0") {
                    }
                    else {
                        totalltr += parseFloat(qtyclass);

                        cnt++;
                    }
                });
                //                var FloatQty = qty.toFixed(2)
                //                alert(cnt);
                document.getElementById('txt_totqty').innerHTML = parseFloat(totalltr).toFixed(2);
                $('.rateclass').each(function (i, obj) {
                    rate += parseFloat($(this).text());
                });
                var Floatrate = rate.toFixed(2)
                document.getElementById('txt_totRate').innerHTML = parseFloat(Floatrate).toFixed(2);
                $('.totalclass').each(function (i, obj) {
                    total += parseFloat($(this).text());
                });
                document.getElementById('txt_total').innerHTML = parseFloat(total).toFixed(2);
                return false;
            }
            var Qty = $(UnitQty).closest("tr").find("#hdnUnitQty").val();
            var Units = $(UnitQty).closest("tr").find("#hdnUnits").val();
            Rate = $(UnitQty).closest("tr").find("#txtOrderRate").text();
            var Units = $(UnitQty).closest("tr").find("#hdnUnits").val();
            var unitqty = $(UnitQty).closest("tr").find("#txtUnitQty").val();
            if (Units == "ml") {
               
                totalqty = parseFloat(unitqty);
            }
            if (Units == "ltr") {
                totalqty = parseInt(unitqty);
            }
            if (Units == "gms") {
                totalqty = parseFloat(unitqty);
            }
            if (Units == "kgs") {
                totalqty = parseInt(unitqty);
            }
            if (Units == "Pkts") {
                totalqty = parseInt(unitqty);
            }
            $(UnitQty).closest("tr").find("#hdnQty").val(totalqty)
            var FinalRate = 0;
            FinalRate = unitqty * Rate;
            $(UnitQty).closest("tr").find("#txtOrderTotal").text(parseFloat(FinalRate).toFixed(2));
            cnt = 0;
            $('.Unitqtyclass').each(function (i, obj) {
               // var qtyclass = $(this).val();
                var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();

                if (qtyclass == "" || qtyclass == "0") {
                }
                else {
                    totalltr += parseInt(qtyclass);

                    cnt++;
                }
            });
//            alert(cnt);
            //            var FloatQty = qty.toFixed(2)
            document.getElementById('txt_totqty').innerHTML = parseFloat(totalltr).toFixed(2);
            rate = 0;
            $('.rateclass').each(function (i, obj) {
                rate += parseFloat($(this).text());
            });
            document.getElementById('txt_totRate').innerHTML = parseFloat(rate).toFixed(2);
            total = 0;
            $('.totalclass').each(function (i, obj) {
                total += parseFloat($(this).text());
            });
            document.getElementById('txt_total').innerHTML = parseFloat(total).toFixed(2);
        }
        function OfferOrderUnitChange(UnitQty) {
            var totalqty;
            var qty = 0.0;
            var Rate = 0;
            var rate = 0;
            var total = 0;
            var totalltr = 0;
            var TotalRate = 0;
            var cnt = 0;
            if (UnitQty.value == "") {
                $(UnitQty).closest("tr").find("#txtOfferOrderTotal").text(total);
                $('.OfferUnitqtyclass').each(function (i, obj) {
                    // var qtyclass = $(this).val();
                    var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();

                    if (qtyclass == "" || qtyclass == "0") {
                    }
                    else {
                        totalltr += parseFloat(qtyclass);

                        cnt++;
                    }
                });
                //                var FloatQty = qty.toFixed(2)
                //                alert(cnt);
                document.getElementById('txt_Offertotqty').innerHTML = parseFloat(totalltr).toFixed(2);
                $('.offerrateclass').each(function (i, obj) {
                    rate += parseFloat($(this).text());
                });
                var Floatrate = rate.toFixed(2)
                document.getElementById('txt_offertotRate').innerHTML = parseFloat(Floatrate).toFixed(2);
                $('.Offertotalclass').each(function (i, obj) {
                    total += parseFloat($(this).text());
                });
                document.getElementById('txt_offertotal').innerHTML = parseFloat(total).toFixed(2);
                return false;
            }
            var Qty = $(UnitQty).closest("tr").find("#offerhdnUnitQty").val();
            var Units = $(UnitQty).closest("tr").find("#offerhdnUnits").val();
            Rate = $(UnitQty).closest("tr").find("#txtofferOrderRate").text();
            var Units = $(UnitQty).closest("tr").find("#offerhdnUnits").val();
            if (Units == "ml") {
                totalqty = parseFloat(UnitQty.value);
            }
            if (Units == "ltr") {
                totalqty = parseInt(UnitQty.value);
            }
            if (Units == "gms") {
                totalqty = parseFloat(UnitQty.value);
            }
            if (Units == "kgs") {
                totalqty = parseInt(UnitQty.value);
            }
            $(UnitQty).closest("tr").find("#offerhdnQty").val(totalqty)
            var FinalRate = 0;
            FinalRate = UnitQty.value * Rate;
            $(UnitQty).closest("tr").find("#txtOfferOrderTotal").text(FinalRate);
            cnt = 0;
            $('.OfferUnitqtyclass').each(function (i, obj) {
                // var qtyclass = $(this).val();
                var qtyclass = $(this).closest('tr').find('#txtUnitQty').val();

                if (qtyclass == "" || qtyclass == "0") {
                }
                else {
                    totalltr += parseInt(qtyclass);

                    cnt++;
                }
            });
            //            alert(cnt);
            //            var FloatQty = qty.toFixed(2)
            document.getElementById('txt_Offertotqty').innerHTML = parseFloat(totalltr).toFixed(2);
            rate = 0;
            $('.offerrateclass').each(function (i, obj) {
                rate += parseFloat($(this).text());
            });
            document.getElementById('txt_offertotRate').innerHTML = parseFloat(rate).toFixed(2);
            total = 0;
            $('.Offertotalclass').each(function (i, obj) {
                total += parseFloat($(this).text());
            });
            document.getElementById('txt_offertotal').innerHTML = parseFloat(total).toFixed(2);
        }
        function FillInventory() {
            var data = { 'op': 'GetInventoryNames' };
            var s = function (msg) {
                if (msg) {
                    BindInventoryName(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindInventoryName(msg) {
            document.getElementById('cmb_Inventory').options.length = "";
            var veh = document.getElementById('cmb_Inventory');
            var length = veh.options.length;
            for (i = length - 1; i >= 0; i--) {
                veh.options[i] = null;
            }
            var opt = document.createElement('option');
            opt.innerHTML = "Select Inventory";
            opt.value = "";
            veh.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i] != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].InventoryName;
                    opt.value = msg[i].InventorySno;
                    veh.appendChild(opt);
                }
            }
        }
        function AddInventory() {
            FillInventory();
            $('#divMainAddNewRow').css('display', 'block');
        }
        var InventoryTable;
        function AddInventoryRows() {
            InventoryTable = [];
            var txtsno = 0;
            var txtInvName = "";
            var txtInvSno = "";
            var txtInvqty = "";
            var txtbalanceQty = "";
            var rows = $("#tableInventory tr:gt(0)");
            var Inventory = document.getElementById('cmb_Inventory');
            var InventorySno = Inventory.options[Inventory.selectedIndex].value;
            var InventoryName = Inventory.options[Inventory.selectedIndex].text;
            var Checkexist = false;
            $('.InventoryClass').each(function (i, obj) {
                var IName = $(this).text();
                if (IName == InventoryName) {
                    alert("Inventory Already Added");
                    Checkexist = true;
                }
            });
            if (Checkexist == true) {
                return;
            }
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "") {
                    txtsno = $(this).find('#txtSno').text();
                    txtInvName = $(this).find('#txtInvName').text();
                    txtInvSno = $(this).find('#hdnInvSno').val();
                    txtInvqty = $(this).find('#txtInvqty').text();
                    txtbalanceQty = $(this).find('#txtbalanceQty').text();
                    InventoryTable.push({ Sno: txtsno, InventoryName: txtInvName, InventorySno: txtInvSno, Qty: txtInvqty });
                }
            });
            var Sno = parseInt(txtsno) + 1;
            var txtInvqty = 0;
            InventoryTable.push({ Sno: Sno, InventoryName: InventoryName, InventorySno: InventorySno, Qty: txtInvqty });
            $('#divInventory').setTemplateURL('DeliverInventory6.htm');
            $('#divInventory').processTemplate(InventoryTable);
            DeliverCal();
        }
        function btnInventoryAddClick() {
            var InventoryName = document.getElementById('cmb_Inventory').value;
            if (InventoryName == "select Inventory" || InventoryName == "") {
                alert("Select Inventory Name");
                return false;
            }
            AddInventoryRows();
        }
        function CollectionLeakQtyQtyChange(Leakageqty) {
            if (Leakageqty.value == "") {
                var AQty = $(Leakageqty).closest("tr").find("#txtqty").text();
                var DQty = parseFloat(AQty) - parseFloat(0);
                $(Leakageqty).closest("tr").find("#txtReturnqty").val(DQty);
                var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
                var TotRate = parseFloat(DQty) * parseFloat(Rate);
                $(Leakageqty).closest("tr").find("#txtTotal").text(TotRate);
                return false;
            }
            var AQty = $(Leakageqty).closest("tr").find("#txtqty").text();
            var DQty = parseFloat(AQty) - parseFloat(Leakageqty.value);
            $(Leakageqty).closest("tr").find("#txtReturnqty").val(DQty);
            var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
            var TotRate = parseFloat(DQty) * parseFloat(Rate);
            TotRate = parseFloat(TotRate).toFixed(2);
            $(Leakageqty).closest("tr").find("#txtTotal").text(TotRate);
            var TotRate = 0.0;
            $('.TotalRateClass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    TotRate += parseFloat($(this).text());
                }
            });
            TotRate = parseFloat(TotRate).toFixed(2);
            document.getElementById('TotRate').innerHTML = TotRate;
            var hdnDqty = $(Leakageqty).closest("tr").find("#hdnDelQty").val();
            var ChangeDqty = $(Leakageqty).closest("tr").find("#txtReturnqty").val();
            var totDqty = hdnDqty - ChangeDqty;
            var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
            var DelRate = parseFloat(totDqty) * parseFloat(Rate)
            var AmountPayable = document.getElementById('txtAmountPayable').innerHTML;
            $(Leakageqty).closest("tr").find("#hdnTotChange").text(DelRate);
            var TotChange = 0;
            $('.hdnTotChangeClass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    TotChange += parseFloat($(this).text());
                }
            });
            document.getElementById('hdnqty').innerHTML = TotChange;
            document.getElementById('txtTodayAmont').innerHTML = TotChange;
            var TotalAmount = parseFloat(AmountPayable) - parseFloat(TotChange);
            document.getElementById('txtTotalAmount').innerHTML = TotalAmount;

        }
        function CollectionReturnQtyChange(Leakageqty) {
            if (Leakageqty.value == "") {
//                var AQty = $(Leakageqty).closest("tr").find("#txtqty").text();
                var DQty = 0;
                var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
                var TotRate = parseFloat(DQty) * parseFloat(Rate);
                $(Leakageqty).closest("tr").find("#txtTotal").text(TotRate);
                return false;
            }
//            var AQty = $(Leakageqty).closest("tr").find("#txtqty").text();
            var DQty = parseFloat(Leakageqty.value);
            var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
            var TotRate = parseFloat(DQty) * parseFloat(Rate);
            $(Leakageqty).closest("tr").find("#txtTotal").text(TotRate);
            var TotRate = 0.0;
            $('.TotalRateClass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    TotRate += parseFloat($(this).text());
                }
            });
            document.getElementById('TotRate').innerHTML = TotRate;
            var hdnDqty = $(Leakageqty).closest("tr").find("#hdnDelQty").val();
            var ChangeDqty = Leakageqty.value;
            var totDqty = hdnDqty - ChangeDqty;
            var Rate = $(Leakageqty).closest("tr").find("#hdnCost").val();
            var DelRate = parseFloat(totDqty) * parseFloat(Rate)
            var AmountPayable = document.getElementById('txtAmountPayable').innerHTML;
            $(Leakageqty).closest("tr").find("#hdnTotChange").text(DelRate);
            var TotChange = 0;
            $('.hdnTotChangeClass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    TotChange += parseFloat($(this).text());
                }
            });
            document.getElementById('hdnqty').innerHTML = TotChange;
//            document.getElementById('txtTodayAmont').innerHTML = TotChange;
//            var TotalAmount = parseFloat(AmountPayable) - parseFloat(TotChange);
            document.getElementById('txtTodayAmont').innerHTML = document.getElementById('TotRate').innerHTML;
            var PayAmount = document.getElementById('txtAmountPayable').innerHTML;
            var txtTodayAmont = document.getElementById('txtTodayAmont').innerHTML;
            var TotAmount = parseFloat(PayAmount) + parseFloat(txtTodayAmont);
            document.getElementById('txtTotalAmount').innerHTML = TotAmount;
            var PaidAmount = document.getElementById('txtPaidAmount').value;
            if (PaidAmount == "") {
                PaidAmount = 0;
            }
            document.getElementById('txtBalanceAmount').innerHTML = parseFloat(TotAmount) - parseFloat(PaidAmount);
        }
        function DeliverReturnQtyChange(Qty) {
            var Returnqty = 0;
            var LQty = 0;
            var cqty = 0;
            if (Qty.value == "") {
                $('.Returnqtyclass').each(function (i, obj) {
                    if ($(this).val() == "") {
                    }
                    else {
                        Returnqty += parseFloat($(this).val());
                        LQty = $(Qty).closest("tr").find("#txtLeakQty").val();
                        cqty = Qty.value;
                        //                        if (parseFloat(AQty) < parseFloat(cqty)) {
                        var IndentQty = parseFloat(LQty) + parseFloat(0);
                        var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
                        var TotalIndent = parseFloat(Totalqty) - parseFloat(IndentQty);
                        $(Qty).closest("tr").find("#txtRemainingQty").text(TotalIndent.toFixed(2));
                        //                        }
                    }
                });
//                Returnqty = 0;
                document.getElementById('txt_RetunQty').innerHTML = Returnqty;
                return false;
            }

            LQty = $(Qty).closest("tr").find("#txtLeakQty").val();
             cqty = Qty.value;
//              if (parseFloat(AQty) <parseFloat(cqty)) {
             var IndentQty = parseFloat(LQty) + parseFloat(Qty.value);
                  var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
                  var TotalIndent = parseFloat(Totalqty) - Math.abs(parseFloat(IndentQty));
                  $(Qty).closest("tr").find("#txtRemainingQty").text(TotalIndent.toFixed(2));
//              }
            $('.Returnqtyclass').each(function (i, obj) {
                Returnqty += parseFloat($(this).val());
            });
            document.getElementById('txt_RetunQty').innerHTML = Returnqty;
        }
        function DeliverDirectQtyChange(Qty) {
         var Remainqty = 0;
            var LQty = 0;
            var cqty = 0;
            if (Qty.value == "") {
                var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
                Remainqty = parseFloat(Totalqty);
                $(Qty).closest("tr").find("#txtRemainingQty").text(Remainqty.toFixed(2));
                DirectSaleCal();
                return false;
            }
            var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
            Remainqty = parseFloat(Totalqty) - Math.abs(parseFloat(Qty.value));
            $(Qty).closest("tr").find("#txtRemainingQty").text(Remainqty.toFixed(2));
            DirectSaleCal();
        }
        function leakqtychange(Qty) {
            var Leakqty = 0;
            if (Qty.value == "") {
                //  Qty.value = 0;
            }
            var DQty = $(Qty).closest("tr").find("#hdnReturnqty").val();
            var leakQty = $(Qty).closest("tr").find("#txtLeakQty").val();
            var returnQty = $(Qty).closest("tr").find("#txtrtnqty").val();
            if (leakQty == "") {
                leakQty = 0;
            }
            if (returnQty == "") {
                returnQty = 0;
            }
            var totleakreturn = parseFloat(leakQty) + parseFloat(returnQty);
            var totdelivery = parseFloat(DQty) - parseFloat(totleakreturn);
            totdelivery = parseFloat(totdelivery).toFixed(2)
            $(Qty).closest("tr").find("#txtReturnqty").val(totdelivery);
        }
        function returnqtychange(Qty) {

        }
        function LeakQtyQtyChange(Qty) {
            var Leakqty = 0;
            if (Qty.value == "") {
                var AQty = $(Qty).closest("tr").find("#txtqty").text();
                var DQty = parseFloat(AQty) - parseFloat(0);
                $(Qty).closest("tr").find("#txtReturnqty").val(DQty);
                var IndentQty = parseFloat(0);
                var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
                var TotalIndent = parseFloat(Totalqty) - parseFloat(IndentQty);
                $(Qty).closest("tr").find("#txtRemainingQty").text(TotalIndent.toFixed(2));
                return false;
            }
            var AQty = $(Qty).closest("tr").find("#txtqty").text();
            var DQty = parseFloat(AQty) - parseFloat(Qty.value);
            $(Qty).closest("tr").find("#txtReturnqty").val(DQty);
            var dcQty = parseFloat(Qty.value) + parseFloat(DQty);
            var IndentQty = parseFloat(dcQty);
            var Totalqty = $(Qty).closest("tr").find("#hdnRemainingQty").val();
            var TotalIndent = parseFloat(Totalqty) - parseFloat(IndentQty);
            $(Qty).closest("tr").find("#txtRemainingQty").text(TotalIndent.toFixed(2));
        }
        function CallHandlerUsingJson(d, s, e) {
            $.ajax({
                type: "GET",
                url: "Bus.axd?json=",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(d),
                async: true,
                cache: true,
                success: s,
                error: e
            });
        }
        function callHandler(d, s, e) {
            $.ajax({
                url: 'Bus.axd',
                data: d,
                type: 'GET',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: true,
                cache: true,
                success: s,
                error: e
            });
        }
        function numberOnlyExample() {
            if ((event.keyCode < 48) || (event.keyCode > 57))
                return false;
        }

        function divReportsclick() {
            $('#divDelivers').css('display', 'none');
            $('#divCollections').css('display', 'none');
            $('#divReports').css('display', 'none');
            $('#divReporting').css('display', 'none');
            $('#divShortage').css('display', 'none');
            $('#tableOrder').css('display', 'none');
            

            $('#divOrderReport').css('display', 'block');
            $('#divCollectionReport').css('display', 'block');
            $('#divDeliverReport').css('display', 'block');
            $('#divInventaryReport').css('display', 'block');
        }
        $(document).ready(function () {
            $("#divback").hide();
        });
        function BindOrdersclick(data) {
            $('#divFillScreen').processTemplate(data);
            if (data[0].IndentNo != "") {
                $('#hdnIndentNo').val(data[0].IndentNo);
            }
            //by sundeep OrderRefresh();
            getofferproducts();
        }
        function getofferproducts() {
         var IndentType = document.getElementById('ddlIndentType').value;
         var RouteID = document.getElementById('ddlRouteName').value;
            var data = { 'op': 'getofferBranchValues', 'bid': bid, 'IndentType': IndentType, 'RouteID': RouteID };
            var s = function (msg) {
                if (msg == "Session Expired") {
                    alert(msg);
                    window.location = "Login.aspx";
                }
                if (msg) {
                    if (msg[0].sno != "") {
                        $('#divoffers').setTemplateURL('Offers.htm');
                        $('#divoffers').processTemplate(msg);

                        OffercalcTot();
                        if (document.getElementById('BtnSave').value == "Edit") {
                            $(".OfferUnitqtyclass").attr("disabled", true);

                        }
                    }
                }

            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);

        }

        

        //////////////////Inventory//////////////////////
        function BindDeliverInventory() {
            var data = { 'op': 'GetDeliverInventory', 'bid': bid,'DairyStatus':DairyStatus };
            var s = function (msg) {
                if (msg) {
                    
                    //                    CollectionCal();
                    if (DairyStatus == "Delivers") {
                        $('#divInventory').setTemplateURL('DeliverInventory6.htm');
                        $('#divInventory').processTemplate(msg);
                        DeliverCal();
                    }
                    if (DairyStatus == "Collections") {
                        $('#divInventory').setTemplateURL('CollectionInventory6.htm');
                        $('#divInventory').processTemplate(msg);
                        InvenCal();
                    }

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var TotalInvqty = 0;
        function GivenQtyChange(Givenqty) {
            var Qty = $(Givenqty).closest("tr").find("#txtInvqty").text();
            if (Givenqty.value == "") {
                TotalInvqty = parseInt(Qty) + parseInt(0);
                $(Givenqty).closest("tr").find("#txtbalanceQty").text(TotalInvqty);
                return false;
            }
            TotalInvqty = parseInt(Qty) + parseInt(Givenqty.value);
            $(Givenqty).closest("tr").find("#txtbalanceQty").text(TotalInvqty);
        }
        function ReceivedQtyChange(ReceivedQty) {
            var Qty = $(ReceivedQty).closest("tr").find("#txtInvqty").text()
            if (ReceivedQty.value == "") {
                $(ReceivedQty).closest("tr").find("#txtbalanceQty").text(Qty);
                return false;
            }
            TotalInvqty = parseInt(Qty) - parseInt(ReceivedQty.value);
            $(ReceivedQty).closest("tr").find("#txtbalanceQty").text(TotalInvqty);
        }
        function BindFinalInventory() {
            var data = { 'op': 'GetDeliverInventory', 'bid': bid, 'DairyStatus': DairyStatus };
            var s = function (msg) {
                if (msg) {
                        $('#divInventory').setTemplateURL('FinalDCInventory.htm');
                        $('#divInventory').processTemplate(msg);
                        DeliverCal();   
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divFinalDCclick() {
            $('#divSOTransfer').css('display', 'none');
            $('#divInvReporting').css('display', 'none');
            $('#divSalesOfficeDespatch').css('display', 'none');
            $('#divPlantDespatch').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#tableOrder').css('display', 'block');
            $('#divgetDc').css('display', 'block');
            $('#divFinalDC').css('display', 'none');
            $('#divFillScreen').css('display', 'none');
//            $('#DivPlantDispatch').css('display', 'none');
            $('#divSpacialSale').css('display', 'none');
            $('#divSalesOfficeLeaks').css('display', 'none');
//            $('#divDispTransfer').css('display', 'none');
            $('#divRouteOrder').css('display', 'block');

            AgentSale = "True";
            //            BindDisBranch();
            BindSoRoutes();
        }
        function divGetDCclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            }
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('FinalDC2.htm');
            $('#divFillScreen').processTemplate();
            if (bid != "") {
                var data = { 'op': 'getFinalDC', 'bid': bid };
                var s = function (msg) {
                    if (msg) {
                        if (msg == "Session Expired") {
                            alert(msg);
                            window.location = "Login.aspx";
                        }
                        FillFinalDC(msg);
                        BindFinalInventory();
                        //BindDeliverInventory();
                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                };
                $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                callHandler(data, s, e);
            }
        }
        function FillFinalDC(msg) {
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('FinalDC2.htm');
            $('#divFillScreen').processTemplate(msg);
        }
        function divDeliveryclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            }
            DairyStatus = "Delivers";
            //            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('Delivers7.htm');
            $('#divFillScreen').processTemplate();
            if (bid != "") {
                BranchChane();
//                BindDeliverInventory();
            }
        }
        function divDispatchclick() {
            var ddlRouteName = document.getElementById('ddlRouteName').value;
            var EmpID = document.getElementById('ddlEmployee').value;
            //            var DispDate = document.getElementById('datepicker').value;
            if (ddlRouteName == "select" || ddlRouteName == "") {
                alert("Please Select Route Name");
                return false;
            }
            if (EmpID == "select" || EmpID == "") {
                alert("Please Select Emp Name");
                return false;
            }
            $('#divback').css('display', 'block');
            //            if (DispDate == "" || DispDate=="mm/dd/yyyy") {
//                alert("Please Select Date");
//                return false;
//            }
            GetTripNo();

            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            bindDispProductRoute();

        }
        function DispatchQtyChange(Qty) {
            if (Qty.Value == "") {
                var RemainQty = $(Qty).closest("tr").find("#hdnRemainQty").val();
                var PDispQty = $(Qty).closest("tr").find("#hdnDispQty").val();
                var DispQty = 0;
                var TDispQty = DispQty - PDispQty;
                var Total = parseFloat(RemainQty) - parseFloat(DispQty);
                Total = parseFloat(Total).toFixed(2);
                $(Qty).closest("tr").find("#txtRemainQty").text(Total);
            }
            else {
                var RemainQty = $(Qty).closest("tr").find("#hdnRemainQty").val();
                var PDispQty = $(Qty).closest("tr").find("#hdnDispQty").val();
                var DispQty = Qty.value;
                var TDispQty = DispQty - PDispQty;
                var Total = parseFloat(RemainQty) - parseFloat(TDispQty);
                Total = parseFloat(Total).toFixed(2);
                $(Qty).closest("tr").find("#txtRemainQty").text(Total);
            }
            DispTotCal();
        }
        function DispatchInventoryChange(Qty) {
            if (Qty.Value == "") {
                var RemainQty = $(Qty).closest("tr").find("#hdnInvRemainQty").val();
                var PDispQty = $(Qty).closest("tr").find("#hdnDispInvQty").val();
                var DispQty = 0;
                var TDispQty = DispQty - PDispQty;
                var Total = parseInt(RemainQty) - parseInt(TDispQty)
                $(Qty).closest("tr").find("#txtInvRemainQty").text(Total);
            }
            else {
                var RemainQty = $(Qty).closest("tr").find("#hdnInvRemainQty").val();
                var PDispQty = $(Qty).closest("tr").find("#hdnDispInvQty").val();
                var DispQty = Qty.value;
                var TDispQty = DispQty - PDispQty;
                var Total = parseInt(RemainQty) - parseInt(TDispQty)
                $(Qty).closest("tr").find("#txtInvRemainQty").text(Total);
            }
        }
        function BindVerifyInventory() {
            var ddlRouteName = document.getElementById('ddlRouteName').value;
            if (ddlRouteName == "") {
                alert("Please Select Route");
                return false;
            }
            else {
                var data = { 'op': 'GetVerifyInventory', 'RouteSno': ddlRouteName };
                var s = function (msg) {
                    if (msg) {
                        if (msg == "Session Expired") {
                            alert(msg);
                            window.location = "Login.aspx";
                        }
                        $('#divFillScreen').setTemplateURL('InventoryVerify8.htm');
                        $('#divFillScreen').processTemplate(msg);
                        BindLeakReporting();
                        BindReturnReporting();
                    }
                    else {
                    }
                };
                var e = function (x, h, e) {
                };
                $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
                callHandler(data, s, e);
            }
        }
        function BindLeakReporting() {
            var ddlRouteName = document.getElementById('ddlRouteName').value;
            if (ddlRouteName == "") {
                alert("Please Select Route");
                return false;
            }
            var data = { 'op': 'GetVerifyLeaks', 'RouteSno': ddlRouteName };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#LeakReporting').removeTemplate();
                    $('#LeakReporting').setTemplateURL('VerifyLeaks8.htm');
                    $('#LeakReporting').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindReturnReporting() {
            var ddlRouteName = document.getElementById('ddlRouteName').value;
            if (ddlRouteName == "") {
                alert("Please Select Route");
                return false;
            }
            var data = { 'op': 'GetVerifyReturns', 'RouteSno': ddlRouteName };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#ReturnReporting').removeTemplate();
                    $('#ReturnReporting').setTemplateURL('VarifyReturns8.htm');
                    $('#ReturnReporting').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnReturnsVarifySaveClick() {
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var rowsVarifyReturndetails = $("#VarifyReturndetails tr:gt(0)");
            var VarifyReturndetails = new Array();
            $(rowsVarifyReturndetails).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "" && $(this).find('#txtReturns').text() != "") {
                    VarifyReturndetails.push({ ProductID: $(this).find('#hdnProductSno').val(), ReturnsQty: $(this).find('#txtReturnsQty').val(), TripID: $(this).find('#hdnTripID').val() });
                }
            });
            var data = { 'op': 'btnReturnsVarifySaveClick', 'RouteLeakdetails': VarifyReturndetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                   BindReturnReporting();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function btnLeakVarifySaveClick() {
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var rowsVarifyRouteLeakdetails = $("#VarifyLeakdetails tr:gt(0)");
            var VarifyRouteLeakdetails = new Array();
            $(rowsVarifyRouteLeakdetails).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "" ) {
                    VarifyRouteLeakdetails.push({ ProductID: $(this).find('#hdnProductSno').val(),  LeaksQty: $(this).find('#txtLeaksQty').val(), TripID: $(this).find('#hdnTripID').val() });
                }
            });
            var data = { 'op': 'btnLeakVarifySaveClick', 'RouteLeakdetails': VarifyRouteLeakdetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                     BindLeakReporting();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function btnInventoryVerifySaveClick() {
            if (!confirm("Do you really want Save")) {
                return false;
            }
//            var tripID = $(id).closest("tr").find('#hdntripID').val();
//            var InvSno = $(id).closest("tr").find('#hdnInvSno').val();
//            var SubmittQty = $(id).closest("tr").find('#txtSubmittQty').val();
            var rows = $("#tableInventoryVerify tr:gt(0)");
            var InvDatails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtSno').text() != "" || $(this).find('#txtSubmittQty').val() != "") {
                    InvDatails.push({ SNo: $(this).find('#hdnInvSno').val(), Qty: $(this).find('#txtSubmittQty').val(), TripID: $(this).find('#hdntripID').val() });
                }
            });
            var rowsVarifyRouteLeakdetails = $("#VarifyRouteLeakdetails tr:gt(0)");
            var VarifyRouteLeakdetails = new Array();
            $(rowsVarifyRouteLeakdetails).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "" || $(this).find('#txtSubmittQty').val() != "") {
                    VarifyRouteLeakdetails.push({ ProductID: $(this).find('#hdnProductSno').val(), ReturnsQty: $(this).find('#txtReturnsQty').val(), LeaksQty: $(this).find('#txtLeaksQty').val(), TripID: $(this).find('#hdnTripID').val() });
                }
            });
            var data = { 'op': 'btnInventoryVerifySaveClick', 'InvDatails': InvDatails, 'RouteLeakdetails': VarifyRouteLeakdetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    BindVerifyInventory();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function divVerifyInventoryclick() {
            var ddlRouteName = document.getElementById('ddlRouteName').value;
            if (ddlRouteName == "") {
                alert("Please Select Route");
                return false;
            }
            else {
                $('#divback').css('display', 'block');
                $('#divHide').css('display', 'none');
                $('#divRouteOrder').css('display', 'none');
                $('#divFillScreen').css('display', 'block');

                BindVerifyInventory();
                $('#divFillScreen').setTemplateURL('InventoryVerify8.htm');
                $('#divFillScreen').processTemplate();
            }
        }
        var TripId = "";
        function GetTripNo() {
//            var EmpID = document.getElementById('ddlEmployee').value;
            //            var DispDate = document.getElementById('datepicker').value;
            //            if (EmpID == "select") {
            //                alert("Please Select Emp Name");
            //                return false;
            //            }
            var data = { 'op': 'GetTripNo', 'RouteSno': RouteSno };
            var s = function (msg) {
                if (msg == "") {
                    TripId = "";
                }
                else {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }

                    else {
                        TripId = msg;
                    }
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function bindDispProductRoute() {
            var IndentType = document.getElementById('ddlIndentType').value;
            var EmpID = document.getElementById('ddlEmployee').value;
//            var txtDispDate = document.getElementById('datepicker').value;

            var data = { 'op': 'GetDispProducts', 'RouteId': RouteSno, 'IndentType': IndentType, 'EmpID': EmpID };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#divFillScreen').setTemplateURL('Dipatch9.htm');
                    $('#divFillScreen').processTemplate(msg);
                    DispTotCal();
                    BindInventory();
                    if (TripId == "") {
                        $(".DispQtyclass").attr("disabled", false);
                        document.getElementById('BtnSave').value = "Save";

                    }
                    else {
                        $(".DispQtyclass").attr("disabled", true);
                        document.getElementById('BtnSave').value = "Edit";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function DispTotCal() {
            var IndQty = 0;
            $('.IndQtyclass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    IndQty += parseFloat($(this).text());
                }
            });
            var DispQty = 0;
            $('.DispQtyclass').each(function (i, obj) {
                if ($(this).val() == "") {
                }
                else {
                    DispQty += parseFloat($(this).val());
                }
            });
            document.getElementById('txtIndQty').innerHTML = IndQty;
            document.getElementById('txt_TotQty').innerHTML = DispQty;
        }
        function BindInventory() {
            var data = { 'op': 'GetDispInventory' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#DivDispatchInverntory').removeTemplate();
                    $('#DivDispatchInverntory').setTemplateURL('DispatchInventory8.htm');
                    $('#DivDispatchInverntory').processTemplate(msg);
                    if (TripId == "") {
                        $(".dispInvQtyclass").attr("disabled", false);
                    }
                    else {
                        $(".dispInvQtyclass").attr("disabled", true);
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnDispatchSaveClick() {
            var BtnSave = document.getElementById('BtnSave').value;
//            var DispDate = document.getElementById('datepicker').value;
            if (BtnSave == "Edit") {
                if (!confirm("Do you really want Edit")) {
                    return false;
                }
                $(".DispQtyclass").attr("disabled", false);
                $(".dispInvQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var rows = $("#tableDispdetails tr:gt(0)"); // skip the header row
            var Dispdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "") {
                }
                else {
                    if ($(this).find('#txtDispQty').val() == "" ){
                    }
                    else {
                        Dispdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), RemainQty: $(this).find('#txtDispQty').val() });
                    }
                }
            });
            var rowsInventory = $("#tableDispInventorydetails tr:gt(0)"); // skip the header row
            var tableDispInventorydetails = new Array();
            $(rowsInventory).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "") {
                }
                else {
                    if ($(this).find('#txtDispInvQty').val() == "" || $(this).find('#txtDispInvQty').val() == "0") {
                    }
                    else {
                        tableDispInventorydetails.push({ SNo: $(this).find('#txtsno').text(), InvSno: $(this).find('#hdnInvSno').val(), ReceivedQty: $(this).find('#txtDispInvQty').val() });
                    }
                }
            });
            if (tableDispInventorydetails.length == 0) {
                alert("Please Fill  Inventory Qty");
                return false;
            }
            var EmpName = document.getElementById('ddlEmployee').value;
            var EditMode = document.getElementById('ddlEdit').value;
            var Data = { 'op': 'btnDispatchSaveClick', 'data': Dispdetails, 'EmpName': EmpName, 'RouteId': RouteSno, 'Inventorydetails': tableDispInventorydetails, 'Mode': EditMode };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    $(".DispQtyclass").attr("disabled", true);
                    $(".dispInvQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                }
                else {
                    alert(msg);
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(Data, s, e);
        }
        function btnShoratageSaveClick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".LeakQtyclass").attr("disabled", false);
                $(".ShortQtyclass").attr("disabled", false);
                $(".FreeMilkQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var rows = $("#tableShortagedetails tr:gt(0)"); // skip the header row
            var Dispdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "") {
                }
                else {
                    if ($(this).find('#txtLeakQty').val() == "" && $(this).find('#txtShortQty').val() == "" && $(this).find('#txtFreeMilkQty').val() == "") {
                    }
                    else {
                        Dispdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), LeakQty: $(this).find('#txtLeakQty').val(), ShortQty: $(this).find('#txtShortQty').val(), FreeMilk: $(this).find('#txtFreeMilkQty').val() });
                    }
                }
            });
            var Data = { 'op': 'btnShoratageSaveClick','data': Dispdetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".LeakQtyclass").attr("disabled", true);
                    $(".ShortQtyclass").attr("disabled", true);
                    $(".FreeMilkQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(Data, s, e);
        }
        function BindDeliversclick(data) {
            $('#divFillScreen').processTemplate(data);
            $('#divInventory').setTemplateURL('DeliverInventory6.htm');
            $('#divInventory').processTemplate();
            BindDeliverInventory();
            getofferproducts();
        }
        function GetCollectionStatus() {
            var data = { 'op': 'GetCollectionStatus','BranchID':bid };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    if (msg == "0") {
                        document.getElementById('txtPaidAmount').value = "0";
                        var txtTodayAmont = document.getElementById('txtTodayAmont').innerHTML;
                        var PaidAmount = document.getElementById('txtPaidAmount').value;
                        var balance = parseFloat(txtTodayAmont) - parseFloat(PaidAmount);
                        if (balance == "NAN") {
                            balance = parseFloat(txtTodayAmont);
                        }
                        document.getElementById('txtBalanceAmount').innerHTML = parseFloat(balance).toFixed(2);
                        if (CollectionType == "DUE") {
                            $(".ReceivedQtyclass").attr("disabled", false);
                            $(".Returnqtyclass").attr("disabled", true);
                            $(".LeakQtyclass").attr("disabled", true);
                        }
                        else {
                            $(".ReceivedQtyclass").attr("disabled", false);
                            $(".Returnqtyclass").attr("disabled", false);
                            $(".LeakQtyclass").attr("disabled", false);
                            document.getElementById('BtnSave').value = "Save";
                        }
                    }
                    else {
                        $(".ReceivedQtyclass").attr("disabled", true);
                        $(".Returnqtyclass").attr("disabled", true);
                        $(".LeakQtyclass").attr("disabled", true);
                        document.getElementById('BtnSave').value = "Edit";
                        document.getElementById('txtPaidAmount').value = msg;
                        var txtTodayAmont = document.getElementById('txtTodayAmont').innerHTML;
                       //// document.getElementById('txtPaidAmount').disabled = true;
                        var PaidAmount = document.getElementById('txtPaidAmount').value;
                        if (txtTodayAmont == "                ") {
                            txtTodayAmont = "0";
                        }
                        var balance = parseFloat(txtTodayAmont) - parseFloat(PaidAmount);
                        if (balance == "NAN") {
                            balance = "0";
                        }
                        document.getElementById('txtBalanceAmount').innerHTML = parseFloat(balance).toFixed(2);
                        document.getElementById('BtnSave').value = "Edit";

                    }
                    //                    BindReporting(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divCollectionsclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            }
            DairyStatus = "Collections";
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('Collection7.htm');
            $('#divFillScreen').processTemplate();
            //            FillBranch();
            if (bid != "") {
                BranchChane();
//                $('#divInventory').setTemplateURL('CollectionInventory6.htm');
//                $('#divInventory').processTemplate();
            }
        }
        function BindReturnLeakReport() {
            var ddlDispatchType = ""; //document.getElementById('ddlDispatchType').value;
            var data = { 'op': 'GetReturnLeakReport', 'ddlDispatchType': ddlDispatchType };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    ReturnLeakReport(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function ReturnLeakReport(msg) {
            $('#RouteRetunLeak').removeTemplate;
            $('#RouteRetunLeak').setTemplateURL('RouteReturnLeak9.htm');
            $('#RouteRetunLeak').processTemplate(msg);
        }
        function BindInvReporting() {
           
            var data = { 'op': 'GetInvReport' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindReporting(msg);
                    BindReturnLeakReport();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindReporting(data) {
            $('#divFillScreen').setTemplateURL('ReportingInventory8.htm');
            $('#divFillScreen').processTemplate(data);
        }
        function bindReportAmount() {
            var RouteID = "";
            if (Permissions == "Dispatcher" || Permissions == "SODispatcher") {
                RouteID = document.getElementById('ddlRouteName').value;
            }
            else {
                RouteID = "";
            }
            var data = { 'op': 'getReportAmount', 'RouteID': RouteID };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    document.getElementById('txtAmount').innerHTML = parseFloat(msg).toFixed(2);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divReportingclick() {
////            BindInvReporting();
////            bindReportAmount();
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'block');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'none');
            $('#DivIndentType').css('display', 'none');
//            $('#DivDispatchType').css('display', 'none');

            $('#divOrders').css('display', 'none');
            $('#divIndentReporting').css('display', 'none');

            $('#divDelivers').css('display', 'none');
            $('#divCollections').css('display', 'none');
            $('#divReports').css('display', 'none');
            $('#divDispatch').css('display', 'none');
//            $('#divEdit').css('display', 'none');
            $('#divDispreport').css('display', 'none');
//            $('#divDispTransfer').css('display', 'none');
            $('#divSOTransfer').css('display', 'none');
            
            $('#divShortage').css('display', 'none');
            $('#divCollectionReport').css('display', 'none');
            $('#divReporting').css('display', 'none');
            $('#divInvReporting').css('display', 'block');
            $('#divAmountReporting').css('display', 'block');
            $('#divVerifyInventory').css('display', 'none');
            $('#tableEmployee').css('display', 'none');
//            $('#DivDispDate').css('display', 'none');
            $('#divDeliverReport').css('display', 'none');
            $('#divInventaryReport').css('display', 'none');
            
////            $('#divFillScreen').setTemplateURL('Reporting8.htm');
            ////            $('#divFillScreen').processTemplate();
        }
        function divInvReportingclick() {
            if (Permissions == "SODispatcher") {
                $('#divSOTransfer').css('display', 'none');
                $('#divSalesOfficeDespatch').css('display', 'none');
                $('#divback').css('display', 'block');
                $('#divPlantDespatch').css('display', 'block');
            }
            $('#divFillScreen').css('display', 'block');
            $('#divInvReporting').css('display', 'none');
            $('#divAmountReporting').css('display', 'none');
            $('#divFinalDC').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            $('#divSpacialSale').css('display', 'none');
            $('#divSalesOfficeLeaks').css('display', 'none');
//            $('#divDispTransfer').css('display', 'none');

            //            BindReturnLeakReport();
            var DispType = "ReturnDC";
            FillPlantDispatches(DispType);
            BindInvReporting();
        }
        function btnReportingInventoryclick() {
            var ddlDispName = "";
            if (Permissions == "SODispatcher") {
                ddlDispName = document.getElementById('ddlDispName').value;
                if (ddlDispName == "" || ddlDispName == "Select Dispatch Name") {
                    alert("Select Dispatch Name");
                    return false;
                }
            }
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                if (!confirm("Do you really want Edit")) {
                    return false;
                }
                $(".SubmittQtyClass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var rows = $("#tableInventory tr:gt(0)");
            var InvDatails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtSno').text() != "" || $(this).find('#txtSubmittQty').val() != "" || $(this).find('#txtSubmittQty').val() != "0") {
                    InvDatails.push({ SNo: $(this).find('#hdnInvSno').val(), Qty: $(this).find('#txtSubmittQty').val() });
                }
            });
            var rowsRouteLeakdetails = $("#tableRouteLeakdetails tr:gt(0)");
            var RouteLeakdetails = new Array();
            $(rowsRouteLeakdetails).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "") {
                    RouteLeakdetails.push({ ProductID: $(this).find('#hdnProductSno').val(), ReturnsQty: $(this).find('#txtReturnsQty').val(), LeaksQty: $(this).find('#txtLeaksQty').val() });
                }
            });
            var data = { 'op': 'btnReportingInventoryclick', 'InvDatails': InvDatails, 'RouteLeakdetails': RouteLeakdetails, 'DispSno': ddlDispName };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    $(".SubmittQtyClass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    BindInvReporting();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function divAmountReportingclick() {
            bindReportAmount();
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('Reporting8.htm');
            $('#divFillScreen').processTemplate();
        }
        function divCollectionReportsclick() {
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divRouteOrder').css('display', 'none');
            $('#divHide').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var data = { 'op': 'CollectionReports' };
            var s = function (msg) {
                if (msg) {
                    BindColletionReport(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);

        }
        function divDeliverReportclick() {
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divRouteOrder').css('display', 'none');
            $('#divHide').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var data = { 'op': 'InventaryReportclick' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#divFillScreen').removeTemplate();
                    $('#divFillScreen').setTemplateURL('DeliveryReport6.htm');
                    $('#divFillScreen').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindColletionReport(msg) {
            $('#divFillScreen').setTemplateURL('CollectionReport6.htm');
            $('#divFillScreen').processTemplate(msg);
             var TotalAmount = 0;
             $('.CollectionAmountClass').each(function (i, obj) {
                 TotalAmount += parseFloat($(this).text());
             });
             document.getElementById('txt_totqty').innerHTML = parseFloat(TotalAmount).toFixed(2);
        }

        function divInventaryReportclick() {
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divRouteOrder').css('display', 'none');
            $('#divHide').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var data = { 'op': 'InventaryReportclick' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    bindinventorydetailsreport(msg);
                    //$('#divFillScreen').removeTemplate();
                    //$('#divFillScreen').setTemplateURL('InventaryReport.htm');
                    //$('#divFillScreen').processTemplate(msg);
                    
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }

        function bindinventorydetailsreport(msg) {
            //$('#divFillScreen').removeTemplate();
            $('#divFillScreen').setTemplateURL('InventaryReport.htm');
            $('#divFillScreen').processTemplate(msg);
            $('.Opp_bal').each(function (i, obj) {
                TotalOpp += parseFloat($(this).text());
            })
            var TotalOpp = 0; var TotalIssue = 0; var TotalReceived = 0; var TotalClosing = 0;

            $('.OppbalClass').each(function (i, obj) {
                TotalOpp += parseFloat($(this).text());
            });
            document.getElementById('spnOpp').innerHTML = parseFloat(TotalOpp).toFixed(2);
            
            $('.IssuedCratesClass').each(function (i, obj) {
                TotalIssue += parseFloat($(this).text());
            });
            document.getElementById('spnIssued').innerHTML = parseFloat(TotalIssue).toFixed(2);

            $('.ReceivedCratesClass').each(function (i, obj) {
                TotalReceived += parseFloat($(this).text());
            });
            document.getElementById('spnReceived').innerHTML = parseFloat(TotalReceived).toFixed(2);

            $('.CloBalClass').each(function (i, obj) {
                TotalClosing += parseFloat($(this).text());
            });
            document.getElementById('spnClo').innerHTML = parseFloat(TotalClosing).toFixed(2);
        }

       

        function btnReportingSaveClick() {
            var Remarks = document.getElementById('txtRemarks').value;
            if (Remarks == "") {
                alert("Enter Remarks");
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
          
            var rowsdenominations = $("#tableReportingDetails tr:gt(0)");
            var DenominationString = "";
            $(rowsdenominations).each(function (i, obj) {
                if ($(this).closest("tr").find(".CashClass").text() == "") {
                }
                else {
                    DenominationString += $(this).closest("tr").find(".CashClass").text() + 'x' + $(this).closest("tr").find(".qtyclass").val() + "+";
                }
            });
            var ColAmount = document.getElementById('txtAmount').innerHTML;
            var SubAmount = document.getElementById('txtSubmittedAmount').value;
            var data = { 'op': 'btnRemarksSaveClick', 'Remarks': Remarks,  'Denominations': DenominationString, 'ColAmount': ColAmount, 'SubAmount': SubAmount };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    document.getElementById('txtRemarks').value = "";
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function Denominationsclick() {
            $('#divMainCollections').css('display', 'block');
        }
        function btnbackclick() {
            AgentSale = "False";
            if (Permissions == "Dispatcher") {
                $('#tableOrder').css('display', 'none');
                $('#divFillScreen').css('display', 'none');
                $('#divHide').css('display', 'block');
                $('#divback').css('display', 'none');
                $('#divRouteOrder').css('display', 'block');
                $('#divReporting').css('display', 'block');
                $('#divInvReporting').css('display', 'none');
                $('#divAmountReporting').css('display', 'none');
                $('#tableEmployee').css('display', 'block');
                $('#divVerifyInventory').css('display', 'block');
                $('#DivIndentType').css('display', 'none');
                $('#tableEmployee').css('display', 'block');
                $('#divDelivers').css('display', 'none');
                $('#divCollections').css('display', 'none');
                $('#divDispatch').css('display', 'block');
                $('#divDispreport').css('display', 'block');
                $('#divSOTransfer').css('display', 'block');
                $('#divCollectionReport').css('display', 'none');
                $('#divShortage').css('display', 'block');
                $('#divVerifyInventory').css('display', 'block');
                $('#divDeliverReport').css('display', 'none');
                $('#divInventaryReport').css('display', 'none');
                $('#divInvReporting').css('display', 'none');
                $('#divAmountReporting').css('display', 'none');
                
            }
            else if (Permissions == "SODispatcher") {
                $('#divHide').css('display', 'block');
                $('#divback').css('display', 'none');
                $('#divRouteOrder').css('display', 'none');
                $('#divPlantDespatch').css('display', 'none');
                $('#divSOTransfer').css('display', 'block');
                $('#divSalesOfficeDespatch').css('display', 'block');
                $('#divOrders').css('display', 'none');
                $('#divIndentReporting').css('display', 'none');
                $('#divDelivers').css('display', 'none');
                $('#divCollections').css('display', 'none');
                $('#divCollectionReport').css('display', 'none');
                $('#divReports').css('display', 'none');
                $('#divReporting').css('display', 'none');
                $('#divDispatch').css('display', 'none');
                $('#divDispreport').css('display', 'none');
                $('#tableOrder').css('display', 'none');
                $('#divVerifyInventory').css('display', 'none');
                $('#divShortage').css('display', 'none');
                $('#tableEmployee').css('display', 'none');
                $('#divFillScreen').css('display', 'none');
                $('#divAmountReporting').css('display', 'none');
                $('#divInvReporting').css('display', 'block');
                $('#divFinalDC').css('display', 'block');
                $('#divgetDc').css('display', 'none');
                $('#divSpacialSale').css('display', 'block');
                $('#divAgentInventory').css('display', 'none');
                $('#divDirectSale').css('display', 'none');
                $('#divSalesOfficeLeaks').css('display', 'block');
                $('#divSale').css('display', 'none');
                $('#divProductTransfer').css('display', 'none');
            }
            else if (Permissions == "O;C") {
                $('#tableOrder').css('display', 'block');
                $('#divFillScreen').css('display', 'none');
                $('#divHide').css('display', 'block');
                $('#divOrders').css('display', 'block');
                $('#divIndentReporting').css('display', 'block');
                $('#divDelivers').css('display', 'none');
                $('#divCollections').css('display', 'block');
                $('#divReports').css('display', 'none');
                $('#divDispatch').css('display', 'none');
                $('#divDispreport').css('display', 'none');
                $('#divSOTransfer').css('display', 'none');
                $('#divShortage').css('display', 'none');
                $('#divCollectionReport').css('display', 'block');
                $('#divReporting').css('display', 'none');
                $('#divInvReporting').css('display', 'none');
                $('#divAmountReporting').css('display', 'none');
                $('#divDeliverReport').css('display', 'none');
                $('#divInventaryReport').css('display', 'none');
            }
            else {
                DairyStatus = "";
                $('#tableOrder').css('display', 'block');
                $('#divFillScreen').css('display', 'none');
                $('#divHide').css('display', 'block');
                $('#divOrders').css('display', 'none');
                $('#divIndentReporting').css('display', 'none');
                $('#divDelivers').css('display', 'block');
                $('#divCollections').css('display', 'block');
                $('#divReports').css('display', 'none');
                $('#divDispatch').css('display', 'none');
                $('#divDispreport').css('display', 'none');
                $('#divSOTransfer').css('display', 'none');
                $('#divShortage').css('display', 'block');
                $('#divCollectionReport').css('display', 'none');
                $('#divReporting').css('display', 'block');
                $('#divInvReporting').css('display', 'none');
                $('#divAmountReporting').css('display', 'none');
                $('#divDeliverReport').css('display', 'none');
                $('#divDeliverReport').css('display', 'none');
                $('#divInventaryReport').css('display', 'none');
                $('#divReports').css('display', 'block');
                $('#divOrderReport').css('display', 'none');
                if (count > 1) {
                    $('#divRouteOrder').css('display', 'block');
                }
                else {

                    $('#divRouteOrder').css('display', 'none');
                }
                $('#divback').css('display', 'none');
                var ddlroute = "";
                if (count > 1) {
                    ddlroute = document.getElementById('ddlRouteName').value;
                }
                if (StatusDropDown == "Order") {
                    $('#tableOrder').css('display', 'block');
                    $('#divFillScreen').css('display', 'none');
                    $('#divHide').css('display', 'block');
                    $('#divOrders').css('display', 'block');
                    $('#divIndentReporting').css('display', 'block');
                    $('#divDelivers').css('display', 'none');
                    $('#divCollections').css('display', 'none');
                    $('#divReports').css('display', 'none');
                    $('#divDispatch').css('display', 'none');
//                    $('#divEdit').css('display', 'none');
                    $('#divDispreport').css('display', 'none');
//                    $('#divDispTransfer').css('display', 'none');
                    $('#divSOTransfer').css('display', 'none');
                    
                    $('#divShortage').css('display', 'none');
                    $('#divCollectionReport').css('display', 'none');
                    $('#divReporting').css('display', 'none');
                    $('#divInvReporting').css('display', 'none');
                    $('#divAmountReporting').css('display', 'none');
                    $('#divDeliverReport').css('display', 'none');
                    $('#divInventaryReport').css('display', 'none');
                    $('#divOrderReport').css('display', 'block');
                    GetBranchStatus(ddlroute);
                }
            }
        }
        function btnordersRefreshClick() {
            if (!confirm("Do you really want Refresh")) {
                return false;
            }
            document.getElementById('ddlBranchName').value = "Select Agent";
            document.getElementById('txt_totRate').innerHTML = "";
            document.getElementById('txt_totRate').value = "";
            document.getElementById('txt_total').innerHTML = "";
            document.getElementById('BtnSave').value = "Save";
            var rows = $("#tabledetails tr:gt(0)");
            $(rows).each(function (i, obj) {
                var nullValue = "0";
                $(this).remove();
            });
        }
        function divShortageclick() {
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var data = { 'op': 'GetShortageProducts' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    $('#divFillScreen').setTemplateURL('Shortages8.htm');
                    $('#divFillScreen').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function GetOrderStatus() {
            var IndentType = document.getElementById('ddlIndentType').value;
            var data = { 'op': 'getOrderStatus', 'Bid': bid, 'IndentType': IndentType };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Indent Completed") {
                        $(".Unitqtyclass").attr("disabled", true);

                        document.getElementById('BtnSave').value = "Edit";
                        return false;
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnorderssaveclick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".Unitqtyclass").attr("disabled", false);
                $(".OfferUnitqtyclass").attr("disabled", false);

                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            var totqty = document.getElementById('txt_totRate').innerHTML;
            //            var totrate = document.getElementById('txt_totRate').value;
            var totTotal = document.getElementById('txt_total').innerHTML;
            var IndentNo = $('#hdnIndentNo').val();
            var rows = $("#tabledetails tr:gt(0)");
            var Orderdetails = new Array();
            $(rows).each(function (i, obj) {
                var txtsno = $(this).find('#txtsno').text();
                var txtUnitQty = $(this).find('#txtUnitQty').val();
                if (txtsno == "" || txtUnitQty == "") {
                }
                else {
                    Orderdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), Rate: $(this).find('#hdnRate').val(), Total: $(this).find('#txtOrderTotal').text(), Unitsqty: $(this).find('#txtUnitQty').val(), Qty: $(this).find('#hdnQty').val(), UnitCost: $(this).find('#txtOrderRate').text(), tubQty: $(this).find('#txtTubQty').val(), PktQty: $(this).find('#txtQtypkts').val(), Invqty: $(this).find('#hdninvQty').val(), UnitQty: $(this).find('#hdnUnitQty').val() });
                }
            });
            var offerrows = $("#table_offerdetails tr:gt(0)");
            var OfferOrderdetails = new Array();
            $(offerrows).each(function (i, obj) {
                var txtsno = $(this).find('#txtsno').text();
                var txtUnitQty = $(this).find('#txtUnitQty').val();
                if (txtsno == "" || txtUnitQty == "") {
                }
                else {
                    OfferOrderdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnofferProductSno').val(), Product: $(this).find('#txtproduct').text(), Rate: $(this).find('#hdnRate').val(), Total: $(this).find('#txtOfferOrderTotal').text(), Unitsqty: $(this).find('#txtUnitQty').val(), Qty: $(this).find('#offerhdnQty').val(), UnitCost: $(this).find('#txtofferOrderRate').text() });
                }
            });
            var TotalPrice = parseFloat(totTotal) - parseFloat(FinalAmount);
            var Indenttype = document.getElementById('ddlIndentType').value;
            var Data = { 'op': 'btnOrderSaveClick', 'BranchID': BranchName, 'data': Orderdetails, 'offerdata': OfferOrderdetails, 'totqty': totqty, 'totTotal': totTotal, 'IndentNo': IndentNo, 'TotalPrice': TotalPrice, 'IndentType': Indenttype };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".Unitqtyclass").attr("disabled", true);
                    $(".OfferUnitqtyclass").attr("disabled", true);
                    
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                        OrderRefresh();
                    }
                }
                else {

                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
        function OrderRefresh() {
            if (Changebutton == "Edit") {
//                $(".Unitqtyclass").attr("disabled", true);
            }
            if (Changebutton == "Save") {
//                $(".Unitqtyclass").attr("disabled", false);
            }
        }
        function btnCollectionsRefreshClick() {
            if (!confirm("Do you really want Refresh")) {
                return false;
            }
            document.getElementById('ddlBranchName').value = "Select Agent";
            document.getElementById('txtPaidAmount').value = "";
            document.getElementById('txtAmountPayable').value = "";
        }
        var SaveType = "Save";
        function btnCollectionssaveclick() {
            var PaidAmount = document.getElementById('txtPaidAmount').value;
            if (PaidAmount == "") {
                alert("Enter Paid Amont");
                $('#txtPaidAmount').focus();
                return false;
            }
            
            var BranchName = document.getElementById('ddlBranchName').value;
            var ddlPayMentType = document.getElementById('ddlPaymntType').value;
            var IndentNo = HdnIndentNo;
            var BalanceAmount = document.getElementById('txtBalanceAmount').innerHTML;
            var btnvalue = document.getElementById('BtnSave').value;
            var rows = $("#tableCollectionDetails tr:gt(0)");
            var DenominationString = "";
            if (ddlPayMentType == "Cash") {
                $(rows).each(function (i, obj) {
                    if ($(this).closest("tr").find(".CashClass").text() == "") {
                    }
                    else {
                        //// If Client need this feature we can enable --06/20/2021
                      ////  DenominationString += $(this).closest("tr").find(".CashClass").text() + 'x' + $(this).closest("tr").find(".qtyclass").val() + "+";
                    }
                });
            }
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtReceivedQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), ReceivedQty: $(this).find('#txtReceivedQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
            if (Inventorydetails.length == 0) {
                alert("Please Fill Inventory Qty");
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            if (ddlPayMentType == "Cheque") {
                DenominationString = document.getElementById('txtchequeNo').value;
            }
            var data = { 'op': 'CollectionSaveClick', 'BranchID': BranchName, 'DenominationString': DenominationString, 'PaidAmount': PaidAmount, 'IndentNo': IndentNo, 'BalanceAmount': BalanceAmount, 'PaymentType': ddlPayMentType, 'btnvalue':btnvalue };
            var s = function (msg) {
                if (msg) {
                    CollectionInventrySaveClick();
                    alert(msg);
                   // document.getElementById('txtPaidAmount').disabled = true;
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    ////window.location.reload();
                    divCollectionsclick();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function CollectionInventrySaveClick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            var ddlPayMentType = document.getElementById('ddlPaymntType').value;
            var IndentNo = HdnIndentNo;
            var BalanceAmount = document.getElementById('txtBalanceAmount').innerHTML;
            var btnvalue = document.getElementById('BtnSave').value;
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtReceivedQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), ReceivedQty: $(this).find('#txtReceivedQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
            if (Inventorydetails.length == 0) {
                alert("Please Fill Received Qty");
                return false;
            }
            var data = { 'op': 'CollectioninventrySaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'IndentNo': IndentNo, 'btnvalue': btnvalue };
            var s = function (msg) {
                if (msg) {
                    receiveInventorydetailssave();
                    alert(msg);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function BtnOKClick() {
            document.getElementById('txtPaidAmount').value = document.getElementById('txt_Total').innerHTML;
            $('#divMainCollections').css('display', 'none');
        }
        function CloseClick() {
            $('#divMainCollections').css('display', 'none');
        }
        function PaidAmountChange(Paidamont) {
            if (Paidamont.value == "") {
                var TotalAmount = document.getElementById('txtTotalAmount').innerHTML;
                var BalanceAmount = parseFloat(TotalAmount) - parseFloat(0);
                document.getElementById('txtBalanceAmount').innerHTML = BalanceAmount;
                return false;
            }
            var TotalAmount = document.getElementById('txtTotalAmount').innerHTML;
            if (TotalAmount != "") {
                var BalanceAmount = parseFloat(TotalAmount) - parseFloat(Paidamont.value);
            }
            else {
                var BalanceAmount = parseFloat(Paidamont.value);
            }
            document.getElementById('txtBalanceAmount').innerHTML = BalanceAmount;
        }
        var DataTable;
        function addrowsOrders() {
            DataTable = [];
            var txtsno = 0;
            var txtProductName = "";
            var txtProductSno = "";
            var txtOrderQty = "";
            var txtOrderRate = "";
            var txtOrderTotal = "";
            var txtUnitqty = "";
            var txtUnits = "";
            var txtTubQty = "";
            var txtQtypkts = "";
            var orderunitqty = "";
            var Qty = 0;
            var Rate = 0;
            var Total = 0;
            var txtPrvQty = 0;
            var txtinvqty = 0;

            var txtDescription;
            var rows = $("#tabledetails tr:gt(0)");
            var Product = document.getElementById('cmb_productname');
            var ProductSno = Product.options[Product.selectedIndex].value;
            var ProductName = Product.options[Product.selectedIndex].text;
            var txt_totqty = document.getElementById('txt_totqty').innerHTML;
            var txt_totRate = document.getElementById('txt_totRate').innerHTML;
            var txt_total = document.getElementById('txt_total').innerHTML;
            var Checkexist = false;
            $('.ProductClass').each(function (i, obj) {
                var PName = $(this).text();
                if (PName == ProductName) {
                    alert("Product Already Added");
                    Checkexist = true;
                }
            });
            if (Checkexist == true) {
                return;
            }
            var IndentNo = $('#hdnIndentNo').val();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "") {
                    txtsno = $(this).find('#txtsno').text();
                    txtProductName = $(this).find('#txtproduct').text();
                    txtProductSno = $(this).find('#hdnProductSno').val();
                    txtOrderQty = $(this).find('#txtOrderQty').val();
                    txtorderunitRate = $(this).find('#txtOrderRate').text();
                    txtOrderTotal = $(this).find('#txtOrderTotal').text();
                    orderunitqty = $(this).find('#txtUnitQty').val();
                    txtUnitqty = $(this).find('#hdnUnitQty').val();
                    txtinvqty = $(this).find('#hdninvQty').val();
                    txtUnits = $(this).find('#hdnUnits').val();
                    txtUnits = $(this).find('#hdnUnits').val();
                    txtOrderRate = $(this).find('#hdnRate').val();
                    txtDescription = $(this).find('#txtDescription').text();
                    txtPrvQty = $(this).find('#txtPrvQty').text();
                    txtTubQty = $(this).find('#txtTubQty').val();
                    txtQtypkts = $(this).find('#txtQtypkts').val();
                    DataTable.push({ sno: txtsno, ProductCode: txtProductName, Productsno: txtProductSno, Qty: txtOrderQty, Rate: txtOrderRate, Total: txtOrderTotal, Unitqty: txtUnitqty, invqty: txtinvqty, Units: txtUnits, orderunitqty: orderunitqty, orderunitRate: txtorderunitRate, Desciption: txtDescription, PrevQty: txtPrvQty, Qtypkts: txtQtypkts, tubQty: txtTubQty });
                }
            });
            var Sno = parseInt(txtsno) + 1;
            var Prevqty = 0;
            DataTable.push({ sno: Sno, ProductCode: ProductName, Productsno: ProductSno, Qty: Qty, Rate: UnitPrice, invqty:invqty, Total: Total, Unitqty: UnitQty, Units: Units, orderunitqty: 0, orderunitRate: orderunitRate, Desciption: Description, PrevQty: Prevqty, Qtypkts: 0, tubQty: 0 });
            $('#divFillScreen').setTemplateURL('Orders10.htm');
            $('#divFillScreen').processTemplate(DataTable);
            getofferproducts();
            $('#hdnIndentNo').val(IndentNo);
            document.getElementById('txt_totqty').innerHTML = txt_totqty;
            document.getElementById('txt_totRate').innerHTML = txt_totRate;
            document.getElementById('txt_total').innerHTML = txt_total;
            var data = { 'op': 'AddBranchProducts', 'ProductSno': ProductSno, 'Rate': UnitPrice, 'bid': bid };
            var s = function (msg) {
                if (msg) {
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var DirectDeliverTable;

        function AddRowDirectDelivers() {
            DirectDeliverTable = [];
            var txtsno = 0;
            var txtProductName = "";
            var txtProductSno = "";
            var txthdnSno = "";
            var txtqty = "";
            var txtIndentNo = 0;
            var txtReturnqty = "";
            var ddlDelivered = "";
            var txtLeakqty = 0;
            var txtCost = 0;
            var HdnIndentSno = 0;
            var txtRemainingQty = 0;
            var rows = $("#tabledetails1 tr:gt(0)");
            var Product = document.getElementById('cmb_productname');
            var ProductSno = Product.options[Product.selectedIndex].value;
            var ProductName = Product.options[Product.selectedIndex].text;
            var Checkexist = false;
            $('.ProductClass').each(function (i, obj) {
                var PName = $(this).text();
                if (PName == ProductName) {
                    alert("Product Already Added");
                    Checkexist = true;
                }
            });
            if (Checkexist == true) {
                return;
            }
            $('#hdnIndent').val(txtIndentNo);
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "") {
                    txtsno = $(this).find('#txtsno').text();
                    txtProductName = $(this).find('#txtproduct').text();
                    txtProductSno = $(this).find('#hdnProductSno').val();
                    txtIndentNo = $(this).find('#hdnIndentNo').val();
                    txthdnSno = $(this).find('#hdn_Sno').val();
                    txtqty = $(this).find('#txtqty').text();
                    txtRemainingQty = $(this).find('#txtRemainingQty').text()
                    txtLeakqty = $(this).find('#txtLeakQty').val();
                    txtReturnqty = $(this).find('#txtReturnqty').val();
                    ddlDelivered = $(this).find('#ddlDelivered').val();
                    txtCost = $(this).find('#hdnCost').val();
                    DirectDeliverTable.push({ sno: txtsno, ProductCode: txtProductName, Productsno: txtProductSno, LeakQty: txtLeakqty, IndentNo: txtIndentNo, HdnSno: txthdnSno, Qty: txtqty, DQty: txtReturnqty, Status: ddlDelivered, orderunitRate: txtCost, HdnIndentSno: HdnIndentSno, RQty: txtRemainingQty });
                }
            });
            var Sno = parseInt(txtsno) + 1;
            var hdnISno = 0;
            var Delivered = "";
            var Qty = 0;
            var hdnISno = 0;
            var Cost = 0;
            var DIndentNo = 0;
            var leak = 0;
            var DQty = 0;
            var RQty = 0;
            DirectDeliverTable.push({ sno: Sno, ProductCode: ProductName, Productsno: ProductSno, LeakQty: leak, HdnSno: hdnISno, IndentNo: txtIndentNo, Qty: Qty, DQty: DQty, Status: Delivered, Rate: UnitPrice, HdnIndentSno: HdnIndentSno, RQty: RemainQty });
            $('#divFillScreen').setTemplateURL('DirectAgentSale2.htm');
            $('#divFillScreen').processTemplate(DirectDeliverTable);
            GetAgentInventory();
            $('#hdnIndent').val(txtIndentNo);
            
            var TotalCost = 0;
            $('.LeakQtyclass').each(function (i, obj) {
                var leakqty = $(this).val();
                var Aqty = $(this).closest("tr").find("#txtqty").text();
                var Dqty = parseFloat(Aqty) - parseFloat(leakqty);
                $(this).closest("tr").find("#txtReturnqty").val(Dqty);
                

            });
        }
        var DeliverTable;
        function AddRowDelivers() {
            DeliverTable = [];
            var txtsno = 0;
            var txtProductName = "";
            var txtProductSno = "";
            var txthdnSno = "";
            var txtqty = "";
            var txtIndentNo = 0;
            var txtReturnqty = "";
            var ddlDelivered = "";
            var txtLeakqty = 0;
            var txtCost = 0;
            var HdnIndentSno = 0;
            var txtRemainingQty = 0;
            var rows = $("#tabledetails tr:gt(0)");
            var Product = document.getElementById('cmb_productname');
            var ProductSno = Product.options[Product.selectedIndex].value;
            var ProductName = Product.options[Product.selectedIndex].text;
            var Checkexist = false;
            $('.ProductClass').each(function (i, obj) {
                var PName = $(this).text();
                if (PName == ProductName) {
                    alert("Product Already Added");
                    Checkexist = true;
                }
            });
            if (Checkexist == true) {
                return;
            }
            $('#hdnIndent').val(txtIndentNo);
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() != "") {
                    txtsno = $(this).find('#txtsno').text();
                    txtProductName = $(this).find('#txtproduct').text();
                    txtProductSno = $(this).find('#hdnProductSno').val();
                    txtIndentNo = $(this).find('#hdnIndentNo').val();
                    txthdnSno = $(this).find('#hdn_Sno').val();
                    txtqty = $(this).find('#txtqty').text();
                    txtRemainingQty = $(this).find('#txtRemainingQty').text()
                    txtLeakqty = $(this).find('#txtLeakQty').val();
                    txtReturnqty = $(this).find('#txtReturnqty').val();
                    ddlDelivered = $(this).find('#ddlDelivered').val();
                    txtCost = $(this).find('#hdnCost').val();
                    DeliverTable.push({ sno: txtsno, ProductCode: txtProductName, Productsno: txtProductSno, LeakQty: txtLeakqty, IndentNo: txtIndentNo, HdnSno: txthdnSno, Qty: txtqty, DQty: txtReturnqty, Status: ddlDelivered, orderunitRate: txtCost, HdnIndentSno: HdnIndentSno, RQty: txtRemainingQty });
                }
            });
            var Sno = parseInt(txtsno) + 1;
            var hdnISno = 0;
            var Delivered = "";
            var Qty = 0;
            var hdnISno = 0;
            var Cost = 0;
            var DIndentNo = 0;
            var leak = 0;
            var DQty = 0;
            var RQty = 0;
            DeliverTable.push({ sno: Sno, ProductCode: ProductName, Productsno: ProductSno, LeakQty: leak, HdnSno: hdnISno, IndentNo: txtIndentNo, Qty: Qty, DQty: DQty, Status: Delivered, orderunitRate: UnitPrice, HdnIndentSno: HdnIndentSno, RQty: RemainQty });
            $('#divFillScreen').setTemplateURL('Delivers7.htm');
            $('#divFillScreen').processTemplate(DeliverTable);

            //$('#divOfferindent').setTemplateURL('OfferDelivery.htm');
            //$('#divOfferindent').processTemplate(OfferIndent);


            BindDeliverInventory();
            $('#hdnIndent').val(txtIndentNo);
            //            document.getElementById('txt_totqty').innerHTML = txt_totqty;
            //            document.getElementById('txt_totRate').innerHTML = txt_totRate;
            //            document.getElementById('txt_total').innerHTML = txt_total;
            //            var data = { 'op': 'AddBranchProducts', 'ProductSno': ProductSno, 'Rate': UnitPrice, 'bid': bid };
            //            var s = function (msg) {
            //                if (msg) {
            //                }
            //                else {
            //                }
            //            };
            //            var e = function (x, h, e) {
            //            };
            //            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            //            callHandler(data, s, e);
            var TotalCost = 0;
            $('.LeakQtyclass').each(function (i, obj) {
                var leakqty = $(this).val();
                var Aqty = $(this).closest("tr").find("#txtqty").text();
                var Dqty = parseFloat(Aqty) - parseFloat(leakqty);
                $(this).closest("tr").find("#txtReturnqty").val(Dqty);
                //                var Rate = $(this).closest("tr").find("#hdnCost").val();
                //                TotalCost += parseFloat(Dqty) * parseFloat(Rate);

            });
        }
        function AddNewRowDirectSale() {
            FillCategeoryname();
            $('#divDirectDeliveryProducts').css('display', 'block');
        }
        function AddNewRowDelivers() {
            FillCategeoryname();
            $('#divDeliveryProducts').css('display', 'block');
        }
        function AddNewRowOrders() {
            //            FillProductName();
            FillCategeoryname();
            $('#divMainAddNewRow').css('display', 'block');
        }
        function OrdersCloseClick() {
            $('#divMainAddNewRow').css('display', 'none');
        }
        function DeliversCloseClick() {
            $('#divDeliveryProducts').css('display', 'none');
        }
        function btnDirectDeliversAddClick() {
            var CategoryName = document.getElementById('cmb_brchprdt_Catgry_name').value;
            if (CategoryName == "select" || CategoryName == "") {
                alert("Select Category Name");
                return false;
            }
            var SubCategoryName = document.getElementById('cmb__brnch_subcatgry').value;
            if (SubCategoryName == "Select" || SubCategoryName == "") {
                alert("Select Sub Category Name");
                return false;
            }
            var productname = document.getElementById('cmb_productname').value;
            if (productname == "Select" || productname == "") {
                alert("Select product Name");
                return false;
            }
            AddRowDirectDelivers();

        }
        function btnDeliversAddClick() {
            var CategoryName = document.getElementById('cmb_brchprdt_Catgry_name').value;
            if (CategoryName == "select" || CategoryName == "") {
                alert("Select Category Name");
                return false;
            }
            var SubCategoryName = document.getElementById('cmb__brnch_subcatgry').value;
            if (SubCategoryName == "Select" || SubCategoryName == "") {
                alert("Select Sub Category Name");
                return false;
            }
            var productname = document.getElementById('cmb_productname').value;
            if (productname == "Select" || productname == "") {
                alert("Select product Name");
                return false;
            }
            AddRowDelivers();
        }
        function btnOrdersAddClick() {
            var CategoryName = document.getElementById('cmb_brchprdt_Catgry_name').value;
            if (CategoryName == "select" || CategoryName == "") {
                alert("Select Category Name");
                return false;
            }
            var SubCategoryName = document.getElementById('cmb__brnch_subcatgry').value;
            if (SubCategoryName == "Select" || SubCategoryName == "") {
                alert("Select Sub Category Name");
                return false;
            }
            var productname = document.getElementById('cmb_productname').value;
            if (productname == "Select" || productname == "") {
                alert("Select product Name");
                return false;
            }
            addrowsOrders();
            
        }
        var UnitPrice;
        var Units;
        var UnitQty;
        var QtyUnit;
        var orderunitRate;
        var Description;
        var ProductSno = 0;
        var invqty = 0;
        function ProductNameChane(sno) {
            ProductSno = sno.value;
            var BranchID = document.getElementById('ddlBranchName').value;
            var data = { 'op': 'GetProductNamechange', 'ProductSno': ProductSno, 'BranchID': BranchID };
            var s = function (msg) {
                if (msg) {
                    UnitPrice = msg[0].orderunitRate;
                    UnitQty = msg[0].Unitqty;
                    QtyUnit = msg[0].Unitqty;
                    Units = msg[0].Units;
                    orderunitRate = msg[0].orderunitRate;
                    Description = msg[0].Desciption;
                    invqty = msg[0].invqty;
                    if (DairyStatus == "Delivers") {
                        getTotalIndentQty();
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        var RemainQty = 0;
        function getTotalIndentQty() {
            var data = { 'op': 'GetProductIndent', 'ProductSno': ProductSno };
            var s = function (msg) {
                if (msg) {
                    RemainQty = msg;
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function Refresh() {
            document.getElementById('ddlBranchName').value = "";
            document.getElementById('txtAmountPayable').value = "";
            document.getElementById('txtPaidAmount').value = "";
            document.getElementById('txt_Total').value = "";
            var rows = $("#tableCollectionDetails tr:gt(0)");
            $(rows).each(function (i, obj) {
                if ($(this).closest("tr").find(".CashClass").text() == "") {
                }
                else {
                    var nullValue = "";
                    $(this).closest("tr").find(".qtyclass").val(nullValue);
                    $(this).closest("tr").find(".TotalClass").text(nullValue);
                }
            });
        }
        function btndeliversRefreshClick() {
            if (!confirm("Do you really want Refresh")) {
                return false;
            }
            document.getElementById('ddlBranchName').value = "Select Agent";
            document.getElementById('txt_RetunQty').value = "";
            var rows = $("#tabledetails tr:gt(0)");
            $(rows).each(function (i, obj) {
                var nullValue = "0";
                $(this).remove();
            });
            var rowInventory = $("#tableInventory tr:gt(0)");
            $(rowInventory).each(function (i, obj) {
                var nullValue = "0";
                $(this).remove();
            });
        }
        function OrderLeftToRight(id) {
            var PrevQty = $(id).closest("tr").find('#txtPrvQty').text();
            $(id).closest("tr").find('#txtUnitQty').val(PrevQty);
            OrderUnitChange(PrevQty);
        }
        function DispTransferLeftToRight(id) {
            var Qty = $(id).closest("tr").find('#txtQty').text();
            $(id).closest("tr").find('#txtDispTransferQty').val(Qty);
        }
        function btndeliverssaveclick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".Returnqtyclass").attr("disabled", false);
                $(".GivenQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            //            var TotQty = document.getElementById('txt_TotQty').innerHTML;
            var RetunQty = document.getElementById('txt_RetunQty').value;
            //            var ExtraQty = document.getElementById('txt_ExtraQty').innerHTML;
            //            var chkDeliver = document.getElementById('chkDelivered').checked;
            //            if(chkDeliver==
            var TotalCost = 0;
            $('.Returnqtyclass').each(function (i, obj) {
                var qty = $(this).val();
                var Rate = $(this).closest("tr").find(".HdnRateClass").val();
                TotalCost+= parseFloat(qty) * parseFloat(Rate);
            });
            OrderRate: $(this).find('#hdnCost').val()
            var rows = $("#tabledetails tr:gt(0)"); // skip the header row
            var Deliverdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "" || $(this).find('#txtReturnqty').val() == "") {
                }
                else {
                    Deliverdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), Returnqty: $(this).find('#txtReturnqty').val(), Status: $(this).find('#ddlDelivered').val(), IndentNo: $(this).find('#hdnIndentNo').val(), hdnSno: $(this).find('#hdn_Sno').val(), HdnIndentSno: $(this).find('#HdnIndentSno').val(), orderunitRate: $(this).find('#hdnCost').val(), LeakQty: $(this).find('#txtLeakQty').val(), RemainQty: $(this).find('#txtLeakQty').text() });
                }
            });
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtGivenQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), GivenQty: $(this).find('#txtGivenQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
            if (Inventorydetails.length == 0) {
                alert("Please Fill Given Qty");
                return false;
            }
            var Indent = $('#hdnIndent').val();
            var Data = { 'op': 'btnDeliversSaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'data': Deliverdetails, 'RetunQty': RetunQty, 'TotalCost': TotalCost, 'IndentNo': Indent };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".Returnqtyclass").attr("disabled", true);
                    $(".GivenQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                    ////window.location.reload();
                    divDeliveryclick();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
        function finalDCSaveclick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".Returnqtyclass").attr("disabled", false);
                $(".GivenQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            var rows = $("#tabledcdetails tr:gt(0)"); // skip the header row
            var Deliverdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "") {
                }
                else {
                    Deliverdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), Returnqty: $(this).find('#txtReturnqty').val(), hdnSno: $(this).find('#hdn_Sno').val(), LeakQty: $(this).find('#txtLeakQty').val(), Rate: $(this).find('#hdnRate').val(), RtnQty: $(this).find('#txtrtnqty').val() });
                }
            });
            var rowInventory = $("#tabledcInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtGivenQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), ReceivedQty: $(this).find('#txtGivenQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
//            if (Inventorydetails.length == 0) {
//                alert("Please Fill Given Qty");
//                return false;
//            }
            var Indent = $('#hdnIndent').val();
            var Data = { 'op': 'btnFinalDCSaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'data': Deliverdetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".Returnqtyclass").attr("disabled", true);
                    $(".GivenQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
//        function get_OrdersInfo() {
//            var FromDate = document.getElementById('fdate').value;
//            var ToDate = document.getElementById('tdate').value;
//            if (FromDate == "") {
//                alert("Select From Date");
//                return false;
//            }
//            if (ToDate == "") {
//                alert("Select To Date");
//                return false;
//            }

//            //alert($("#fdate").val() + " " + $("#tdate").val());
//            var data = { 'op': 'getOrders_f_t_dates', 'fdate': FromDate, 'tdate': ToDate,'bid':bid };
//            var s = function (msg) {
//                if (msg) {
//                    if (msg == "Session Expired") {
//                        alert(msg);
//                        window.location = "Login.aspx";
//                    }
//                    BindOrders_fd_td(msg);
//                }
//                else {
//                }
//            };
//            var e = function (x, h, e) {
//            };
//            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
//            callHandler(data, s, e);
//            //  getOrders_f_t_dates

//        }
        function numberOnlyExample() {
            if ((event.keyCode < 48) || (event.keyCode > 57))
                return false;
        }
//        function BindOrders_fd_td(msg) {
//            $('#ReportDataViewer').setTemplateURL('ReportDataViewer8.htm');
//            $('#ReportDataViewer').processTemplate(msg);
//        }
        function btnCollectionsRefreshClick() {
            Refresh();
        }
        function LogOutClick() {
            window.location.href = "LogOut.aspx";
        }
        function ddlPaymntTypeChange(PayMentType) {
            if (PayMentType == "Cash") {
                $('#lblChequeNo').css('display', 'none');
                $('#divChequeNo').css('display', 'none');
            }
            if (PayMentType == "Cheque") {
                $('#lblChequeNo').css('display', 'block');
                $('#divChequeNo').css('display', 'block');
            }
        }
        function GetDispname() {
            var data = { 'op': 'GetDispname' };
            var s = function (msg) {
                if (msg) {
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    BindDispname(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindDispname(msg) {
            document.getElementById('ddlDispname').options.length = "";
            var ddlDispname = document.getElementById('ddlDispname');
            var length = ddlDispname.options.length;
            for (i = length - 1; i >= 0; i--) {
                ddlDispname.options[i] = null;
            }
            var opt = document.createElement('option');
            opt.innerHTML = "Select Dispatch Name";
            opt.value = "";
            ddlDispname.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i] != null || msg[i].DispName != "" || msg[i].DispName != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].DispName;
                    opt.value = msg[i].sno;
                    ddlDispname.appendChild(opt);
                }
            }
        }
        function divIndentReportingclick() {
            GetDispname();
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFillScreen').setTemplateURL('IndentReport1.htm');
            $('#divFillScreen').processTemplate();
        }
        function btnIndentReportSaveclick() {
            var ddlDispname = document.getElementById('ddlDispname').value;
            if (ddlDispname == "Select Dispatch Name" || ddlDispname == "") {
                alert("Please Select Dispatch Name");
                return false;
            }
            var MobNo = document.getElementById('txtMobNo').value;
//            if (MobNo == "") {
//                alert("Please Enter Mobile No");
//                return false;
//            }
            var Dispatch = document.getElementById('ddlDispname');
            var DispatchSno = Dispatch.options[Dispatch.selectedIndex].value;
            var DispatchName = Dispatch.options[Dispatch.selectedIndex].text;
            var data = { 'op': 'IndentReportSaveclick', 'MobNo': MobNo, 'DispatchSno': DispatchSno, 'DispatchName': DispatchName };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    if (msg == "Session Expired") {
                        alert(msg);
                        window.location = "Login.aspx";
                    }
                    document.getElementById('txtMobNo').value = "";
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divDispTransferclick() {
            $('#tableOrder').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'block');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'none');
            $('#DivIndentType').css('display', 'none');
//            $('#DivDispatchType').css('display', 'none');
            $('#divOrders').css('display', 'none');
            $('#divIndentReporting').css('display', 'none');
            $('#divDelivers').css('display', 'none');
            $('#divCollections').css('display', 'none');
            $('#divReports').css('display', 'none');
            $('#divDispatch').css('display', 'none');
//            $('#divEdit').css('display', 'none');
            $('#divDispreport').css('display', 'none');
            $('#divDispTransfer').css('display', 'none');
            $('#divSOTransfer').css('display', 'none');
            $('#divPlantDespatch').css('display', 'none');
            $('#divShortage').css('display', 'none');
            $('#divCollectionReport').css('display', 'none');
            $('#divReporting').css('display', 'none');
            $('#divInvReporting').css('display', 'none');
            $('#divAmountReporting').css('display', 'none');
            $('#divVerifyInventory').css('display', 'none');
            $('#tableEmployee').css('display', 'none');
//            $('#DivPlantDispatch').css('display', 'block');
            $('#divDeliverReport').css('display', 'none');
            $('#divInventaryReport').css('display', 'none');
            $('#divSalesOfficeDespatch').css('display', 'none');
            $('#divSpacialSale').css('display', 'none');
            $('#divFinalDC').css('display', 'none');
            $('#divSalesOfficeLeaks').css('display', 'none');
            FillSODispatches();
            GetDispname();
            BindPlantDispatchProducts();
            bindPlantDispatchInventory();

        }
        function FillSODispatches() {
            var data = { 'op': 'GetSODispatchClick' };
            var s = function (msg) {
                if (msg) {
//                    BindPlantDispatch(msg);
                    BindPlantDispatchProducts();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindPlantDispatchProducts() {
            var data = { 'op': 'GetPlantDispatchProducts' };
            var s = function (msg) {
                if (msg) {
                    $('#divback').css('display', 'block');
                    $('#divRouteOrder').css('display', 'none');
                    $('#divFillScreen').css('display', 'block');
//                    $('#DivPlantDispatch').css('display', 'block');
                    $('#divFillScreen').setTemplateURL('DisptchTransfer.htm');
                    $('#divFillScreen').processTemplate(msg);
                    bindPlantDispatchInventory();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function bindPlantDispatchInventory() {
            var data = { 'op': 'GetPlantDispatchInventory' };
            var s = function (msg) {
                if (msg) {
                    $('#DivTransferDispatchInverntory').setTemplateURL('InvTransfer.htm');
                    $('#DivTransferDispatchInverntory').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
//        function BindPlantDispatch(msg) {
//            document.getElementById('ddlPlantDispatch').options.length = "";
//            var ddlPlantDispatch = document.getElementById('ddlPlantDispatch');
//            var length = ddlPlantDispatch.options.length;
//            for (i = length - 1; i >= 0; i--) {
//                ddlPlantDispatch.options[i] = null;
//            }
//            var opt = document.createElement('option');
//            opt.innerHTML = "Select Dispatch Name";
//            opt.value = "";
//            ddlPlantDispatch.appendChild(opt);
//            for (var i = 0; i < msg.length; i++) {
//                if (msg[i] != null || msg[i].DispName != "" || msg[i].DispName != null) {
//                    var opt = document.createElement('option');
//                    opt.innerHTML = msg[i].DispName;
//                    opt.value = msg[i].Dispsno;
//                    ddlPlantDispatch.appendChild(opt);
//                }
//            }
//        }
        function divDispreportclick() {
            var data = { 'op': 'DispatchReportClick' };
            var s = function (msg) {
                if (msg) {
                    $('#tableOrder').css('display', 'block');
                    $('#divback').css('display', 'block');
                    $('#divHide').css('display', 'none');
                    $('#divRouteOrder').css('display', 'none');
                    $('#divFillScreen').css('display', 'block');
                    $('#divFillScreen').setTemplateURL('DispatchReport.htm');
                    $('#divFillScreen').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divSOTransferclick() {
            $('#divPlantDespatch').css('display', 'block');
            $('#divSOTransfer').css('display', 'none');
            $('#divInvReporting').css('display', 'none');
            $('#divSalesOfficeDespatch').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#tableOrder').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            $('#divFinalDC').css('display', 'none');
            $('#divFillScreen').css('display', 'none');
            //            $('#DivPlantDispatch').css('display', 'none');
            $('#divProductTransfer').css('display', 'block');
            $('#divSpacialSale').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            $('#divAgentInventory').css('display', 'none');
            $('#divDirectSale').css('display', 'none');

            $('#divSalesOfficeLeaks').css('display', 'none');
            //            $('#divDispTransfer').css('display', 'none');
            var DispType = "SalesTransfer";
            FillPlantDispatches(DispType);
        }
        function divProductTransferclick() {
            var ddlDispName = document.getElementById('ddlDispName').value;
            if (ddlDispName == "Select Dispatch Name" || ddlDispName == "") {
                alert("Select Dispatch Name");
                return false;
            }
            $('#divPlantDespatch').css('display', 'none');
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            $('#divFinalDC').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            SoGetProducts();
            SoGetInventory();
        }
        var PlantDispSno = "";
        function SoGetProducts() {
            PlantDispSno = document.getElementById('ddlDispName').value;
            if (PlantDispSno == "Select Dispatch Name") {
                alert("Select Dispatch Name");
                return false;
            }
             var data = { 'op': 'SoSalesOFFIceProducts', 'DispSno': PlantDispSno };
             var s = function (msg) {
                 if (msg) {
                     $('#divFillScreen').setTemplateURL('SoProductTransfer.htm');
                     $('#divFillScreen').processTemplate(msg);
                     SoGetInventory();
                 }
                 else {
                 }
             };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function SoGetInventory() {
            var data = { 'op': 'SoSalesOFFIceInventory', 'DispSno': PlantDispSno };
            var s = function (msg) {
                if (msg) {
                    $('#divSOInverntory').setTemplateURL('SoInventory.htm');
                    $('#divSOInverntory').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function FillPlantDispatches(SalesTransfer) {
            var data = { 'op': 'GetSOPlantDispatches', 'DispatchType': SalesTransfer };
            var s = function (msg) {
                if (msg) {
                    BindDispatches(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindDispatches(msg) {
            document.getElementById('ddlDispName').options.length = "";
            var ddlDispName = document.getElementById('ddlDispName');
            var length = ddlDispName.options.length;
            for (i = length - 1; i >= 0; i--) {
                ddlDispName.options[i] = null;
            }
            var opt = document.createElement('option');
            opt.innerHTML = "Select Dispatch Name";
            opt.value = "";
            ddlDispName.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i] != null || msg[i].DispName != "" || msg[i].DispName != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].DispName;
                    opt.value = msg[i].Sno;
                    ddlDispName.appendChild(opt);
                }
            }
        }
        function btnSOProductTransferSaveClick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                alert("Products already transfered");
                return false;
            }
            var DispSno = document.getElementById('ddlDispName').value;
            var rows = $("#tableSOTransferProductdetails tr:gt(0)"); // skip the header row
            var Productdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "" || $(this).find('#txttransQty').val() == "" || $(this).find('#txttransQty').val() == "0") {
                }
                else {
                    Productdetails.push({ SNo: $(this).find('#txtsno').text(), Productsno: $(this).find('#hdnProductSno').val(), Returnqty: $(this).find('#txttransQty').val() });
                }
            });
            var rowInventory = $("#tableSOTransferInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtGivenQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), TransQty: $(this).find('#txttransInvQty').val() });
                }
            });
            var Data = { 'op': 'btnSOProductTransferSaveClick', 'data': Productdetails, 'Inventorydetails': Inventorydetails, 'DispSno': DispSno };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    divSOTransferclick();
                    $(".transQtyclass").attr("disabled", true);
                    $(".transInvQtyQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
        function divSalesOfficeDespatchclick() {
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'block');
            $('#divRouteOrder').css('display', 'block');
            $('#divFillScreen').css('display', 'none');
            $('#divDispatch').css('display', 'block');
            $('#divVerifyInventory').css('display', 'block');
            $('#divShortage').css('display', 'none');
            $('#divDispreport').css('display', 'block');
            $('#divPlantDespatch').css('display', 'none');
            $('#divSOTransfer').css('display', 'none');
            $('#divSalesOfficeDespatch').css('display', 'none');
            $('#divReporting').css('display', 'none');
            $('#divInvReporting').css('display', 'none');
            $('#divFinalDC').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            $('#divSpacialSale').css('display', 'none');
            $('#divSalesOfficeLeaks').css('display', 'none');
//            $('#divDispTransfer').css('display', 'none');
            fillcsoroutes();
        }
        var AgentSale = "";
        function divSpacialSaleclick() {
            $('#divSOTransfer').css('display', 'none');
            $('#divInvReporting').css('display', 'none');
            $('#divSalesOfficeDespatch').css('display', 'none');
            $('#divPlantDespatch').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#tableOrder').css('display', 'block');
            $('#divgetDc').css('display', 'block');
            $('#divFinalDC').css('display', 'none');
            $('#divFillScreen').css('display', 'none');
//            $('#DivPlantDispatch').css('display', 'none');
            $('#divSale').css('display', 'block'); 
            $('#divSpacialSale').css('display', 'none');
            $('#divgetDc').css('display', 'none');
            $('#divAgentInventory').css('display', 'block');
            $('#divDirectSale').css('display', 'block');

            $('#divSalesOfficeLeaks').css('display', 'none');
//            $('#divDispTransfer').css('display', 'none');
            $('#divRouteOrder').css('display', 'block');
            AgentSale = "True";
//            BindDisBranch();
            BindSoRoutes();
        }
        function BindSoRoutes() {
            var data = { 'op': 'GetSoRoutes'};
            var s = function (msg) {
                if (msg) {
                    BindSoRouteName(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function BindSoRouteName(msg) {
            document.getElementById('ddlRouteName').options.length = "";

            var veh = document.getElementById('ddlRouteName');
            var length = veh.options.length;
            for (i = length - 1; i >= 0; i--) {
                veh.options[i] = null;
            }
            var opt = document.createElement('option');
            opt.innerHTML = "Select Route Name";
            opt.value = "";
            veh.appendChild(opt);
            for (var i = 0; i < msg.length; i++) {
                if (msg[i] != null) {
                    var opt = document.createElement('option');
                    opt.innerHTML = msg[i].RouteName;
                    opt.value = msg[i].rid;
                    veh.appendChild(opt);
                }
            }
        }
        function divLocalSaleclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            } 
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            GetAgentSale();
            GetAgentInventory();
        }
        function divDirectSaleclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            }
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            GetDirectSale();
            GetAgentInventory();
            GetAgentInventory();
        }
        function GetDirectSale() {
            var data = { 'op': 'GetDirectAgentProducts', 'bid': bid };
            var s = function (msg) {
                if (msg) {
                    $('#divFillScreen').setTemplateURL('DirectAgentSale2.htm');
                    $('#divFillScreen').processTemplate(msg);
                    DirectSaleCal();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function DirectSaleCal() {
            var IndQty = 0;
            $('.IndQtyclass').each(function (i, obj) {
                if ($(this).text() == "") {
                }
                else {
                    IndQty += parseFloat($(this).text());
                }
            });
            var DispQty = 0;
            $('.Returnqtyclass').each(function (i, obj) {
                if ($(this).val() == "") {
                }
                else {
                    DispQty += parseFloat($(this).val());
                }
            });
            document.getElementById('txtIndQty').innerHTML = IndQty;
            document.getElementById('txt_RetunQty').innerHTML = DispQty;
        }
        function btnDirectAgentProductSaveClick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".Returnqtyclass").attr("disabled", false);
                $(".GivenQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            var RetunQty = document.getElementById('txt_RetunQty').value;
            var TotalCost = 0;
            $('.Returnqtyclass').each(function (i, obj) {
                var qty = $(this).val();
                var Rate = $(this).closest("tr").find(".HdnRateClass").val();
                TotalCost += parseFloat(qty) * parseFloat(Rate);
            });
            OrderRate: $(this).find('#hdnCost').val()
            var rows = $("#tabledetails1 tr:gt(0)"); // skip the header row
            var Deliverdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "" || $(this).find('#txtReturnqty').val() == "") {
                }
                else {
                    Deliverdetails.push({ SNo: $(this).find('#txtsno').text(), Product: $(this).find('#txtproduct').text(), ProductSno: $(this).find('#hdnProductSno').val(), Returnqty: $(this).find('#txtReturnqty').val(), IndentNo: $(this).find('#hdnIndentNo').val(), UnitCost: $(this).find('#hdnCost').val() });
                }
            });
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtGivenQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), GivenQty: $(this).find('#txtGivenQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
            var Indent = $('#hdnIndent').val();
            var Data = { 'op': 'btnDirectAgentProductSaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'data': Deliverdetails, 'RetunQty': RetunQty, 'TotalCost': TotalCost, 'IndentNo': Indent };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".Returnqtyclass").attr("disabled", true);
                    $(".GivenQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
        function GetAgentSale() {
            var data = { 'op': 'GetAgentProducts', 'bid': bid };
            var s = function (msg) {
                if (msg) {
                    $('#divFillScreen').setTemplateURL('AgentSale.htm');
                    $('#divFillScreen').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function GetAgentInventory() {
            var data = { 'op': 'GetAgentInventory', 'bid': bid };
            var s = function (msg) {
                if (msg) {
                    $('#divInventory').setTemplateURL('AgentInventory.htm');
                    $('#divInventory').processTemplate(msg);
                    DeliverCal();
                    
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnAgentProductSaveClick() {
            var BtnSave = document.getElementById('BtnSave').value;
            if (BtnSave == "Edit") {
                $(".Returnqtyclass").attr("disabled", false);
                $(".GivenQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            var RetunQty = document.getElementById('txt_RetunQty').value;
            var TotalCost = 0;
            $('.Returnqtyclass').each(function (i, obj) {
                var qty = $(this).val();
                var Rate = $(this).closest("tr").find(".HdnRateClass").val();
                TotalCost += parseFloat(qty) * parseFloat(Rate);
            });
            OrderRate: $(this).find('#hdnCost').val()
            var rows = $("#tabledetails tr:gt(0)"); // skip the header row
            var Deliverdetails = new Array();
            $(rows).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "" || $(this).find('#txtReturnqty').val() == "") {
                }
                else {
                    Deliverdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), Returnqty: $(this).find('#txtReturnqty').val(), Status: $(this).find('#ddlDelivered').val(), IndentNo: $(this).find('#hdnIndentNo').val(), hdnSno: $(this).find('#hdn_Sno').val(), HdnIndentSno: $(this).find('#HdnIndentSno').val(), orderunitRate: $(this).find('#hdnCost').val(), LeakQty: $(this).find('#txtLeakQty').val(), RemainQty: $(this).find('#txtLeakQty').text() });
                }
            });
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtGivenQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), GivenQty: $(this).find('#txtGivenQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
//            if (Inventorydetails.length == 0) {
//                alert("Please Fill Given Qty");
//                return false;
//            }
            var Indent = $('#hdnIndent').val();
            var Data = { 'op': 'btnAgentProductSaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'data': Deliverdetails, 'RetunQty': RetunQty, 'TotalCost': TotalCost, 'IndentNo': Indent };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    $(".Returnqtyclass").attr("disabled", true);
                    $(".GivenQtyclass").attr("disabled", true);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }

                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            CallHandlerUsingJson(Data, s, e);
        }
        function divAgentColInventoryclick() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            } 
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            GetAgentColInventory();
        }
        function GetAgentColInventory() {
            var BranchName = document.getElementById('ddlBranchName').value;
            if (BranchName == "Select Agent" || BranchName == "") {
                alert("Please Select Agent Name");
                return false;
            } 
            var data = { 'op': 'GetAgentInventory', 'bid': bid };
            var s = function (msg) {
                if (msg) {
                    $('#divFillScreen').setTemplateURL('AgentColInventory.htm');
                    $('#divFillScreen').processTemplate(msg);
                    InvenCal();
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnAgentColInventorySaveClick() {
            var btnsave = document.getElementById('BtnSave').value;
            if (btnsave == "Edit") {
                if (!confirm("Do you really want Edit")) {
                    return false;
                }
                $(".ReceivedQtyclass").attr("disabled", false);
                $(".Returnqtyclass").attr("disabled", false);
                $(".LeakQtyclass").attr("disabled", false);
                document.getElementById('BtnSave').value = "Save";
                SaveType = "Edit";
                //document.getElementById('txtPaidAmount').disabled = false;
                return false;
            }
            if (!confirm("Do you really want Save")) {
                return false;
            }
            var BranchName = document.getElementById('ddlBranchName').value;
            var rowInventory = $("#tableInventory tr:gt(0)");
            var Inventorydetails = new Array();
            $(rowInventory).each(function (i, obj) {
                if ($(this).find('#txtSno').text() == "" || $(this).find('#txtReceivedQty').val() == "") {
                }
                else {
                    Inventorydetails.push({ SNo: $(this).find('#txtSno').text(), InvSno: $(this).find('#hdnInvSno').val(), ReceivedQty: $(this).find('#txtReceivedQty').val(), BalanceQty: $(this).find('#txtbalanceQty').text() });
                }
            });
            if (Inventorydetails.length == 0) {
                alert("Please Fill Received Qty");
                return false;
            }
            var data = { 'op': 'btnAgentColInventorySaveClick', 'BranchID': BranchName, 'Inventorydetails': Inventorydetails, 'SaveType': SaveType };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function SalesofficeLeakQtyChange(Qty) {
//            var LeakQty = Qty.value;
//            if (LeakQty == "") {
//                LeakQty = "0";
//                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
//                var leaks = parseFloat(BranchQty) - parseFloat(LeakQty);
//                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
//            }
//            else {
//                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
//                var leaks = parseFloat(BranchQty) - parseFloat(LeakQty);
//                leaks = parseFloat(leaks).toFixed(2);
//                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
//            }
            if (Qty.Value == "") {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
                
            }
            else {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
            }
        }
        function SalesofficeFreeQtyChange(Qty) {
            if (Qty.Value == "") {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);

            }
            else {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
            }
        }
        function SalesofficeShortQtyChange(Qty) {
            if (Qty.Value == "") {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);

            }
            else {
                var BranchQty = $(Qty).closest("tr").find("#hdnBranchQty").val();
                var leakqty = $(Qty).closest("tr").find("#txtLeakQty").val();
                var freeqty = $(Qty).closest("tr").find("#txtFreeQty").val();
                var shortqty = $(Qty).closest("tr").find("#txtShortQty").val();
                if (leakqty == "") {
                    leakqty = "0";
                }
                if (freeqty == "") {
                    freeqty = "0";
                }
                if (shortqty == "") {
                    shortqty = "0";
                }
                var totlsf = 0;
                totlsf = parseFloat(leakqty) + parseFloat(freeqty) + parseFloat(shortqty);
                var leaks = parseFloat(BranchQty) - parseFloat(totlsf);
                $(Qty).closest("tr").find("#txtBranchQty").text(leaks);
            }
        }
        function divSalesOfficeLeaksclick() {
            $('#divPlantDespatch').css('display', 'none');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            BindSalesOfficeLeaks();
        }
        function BindSalesOfficeLeaks() {
            var data = { 'op': 'GetSalesOfficeLeaks' };
            var s = function (msg) {
                if (msg) {
                    $('#divFillScreen').setTemplateURL('SalesOfficeLeaks1.htm');
                    $('#divFillScreen').processTemplate(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function btnSalesofficeLeakSaveClick() {
            var rowLeaks = $("#tableSalesOfficeLeaksdetails tr:gt(0)");
            var tableSalesOfficeLeaksdetails = new Array();
            $(rowLeaks).each(function (i, obj) {
                if ($(this).find('#txtsno').text() == "" || ($(this).find('#txtLeakQty').val() == "" && $(this).find('#txtShortQty').val() && $(this).find('#txtFreeQty').val())) {
                }
                else {
                    tableSalesOfficeLeaksdetails.push({ SNo: $(this).find('#txtsno').text(), ProductSno: $(this).find('#hdnProductSno').val(), Product: $(this).find('#txtproduct').text(), Qty: $(this).find('#txtBranchQty').text(), LeakQty: $(this).find('#txtLeakQty').val(), ShortQty: $(this).find('#txtShortQty').val(), FreeMilk: $(this).find('#txtFreeQty').val() });
                }
            });
            if (tableSalesOfficeLeaksdetails.length == 0) {
                alert("Please Fill Leak Qty");
                return false;
            }
            var data = { 'op': 'btnSalesofficeLeakSaveClick', 'data': tableSalesOfficeLeaksdetails };
            var s = function (msg) {
                if (msg) {
                    alert(msg);
                    document.getElementById('BtnSave').value = "Edit";
                    if (msg == "Session Expired") {
                        window.location = "Login.aspx";
                    }
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            CallHandlerUsingJson(data, s, e);
        }
        function divProductReportclick() {
            var RouteName = "";
            if (count > 1) {
                RouteName = document.getElementById('ddlRouteName').value;
                if (RouteName == "Select Route" || RouteName == "") {
                    alert("Please Select Route Name");
                    return false;
                }
            }
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var ddlIndentType = document.getElementById('ddlIndentType').value;
            var data = { 'op': 'GetProductReport', 'RouteID': RouteName, 'IndentType': ddlIndentType };
            var s = function (msg) {
                if (msg) {
                    bindProductReport(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function divOrderReportsclick() {
            var Permns = [];
            Permns = Permissions.split(';');
            for (var i = 0; i < Permns.length; i++) {
                switch (Permns[i]) {
                    case "O":
                        getOrderReport();
                        break;
                    case "D":
                        divOrd_Del_Reportsclick();
                        break;
                    case "C":
                        divOrd_Del_Reportsclick();
                        break;
                }
            }
            
        }
        function getOrderReport() {
            var RouteName = "";
            if (count > 1) {
                RouteName = document.getElementById('ddlRouteName').value;
                if (RouteName == "Select Route" || RouteName == "") {
                    alert("Please Select Route Name");
                    return false;
                }
            }
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var ddlIndentType = document.getElementById('ddlIndentType').value;
            var data = { 'op': 'GetOrderReport', 'RouteID': RouteName, 'IndentType': ddlIndentType };
            var s = function (msg) {
                if (msg) {
                    bindOrderReport(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function bindProductReport(msg) {
            $('#divFillScreen').removeTemplate();
            $('#divFillScreen').setTemplateURL('ProductReport.htm');
            $('#divFillScreen').processTemplate(msg);
        }
        function bindOrderReport(msg) {
            var dtIndent = [];
            var BranchName = "";
            for (var i = 0; i < msg.length; i++) {
                var ProductName = msg[i].ProductName;
                var UnitQty = msg[i].unitQty;
                if (msg[i].BranchName != BranchName) {
                    BranchName = msg[i].BranchName;
                    dtIndent.push({ BranchName: BranchName, ProductName: ProductName, UnitQty: UnitQty });
                }
                else {
                    var Agent = "";
                    dtIndent.push({ BranchName: Agent, ProductName: ProductName, UnitQty: UnitQty });
                }
            }
            $('#divFillScreen').removeTemplate();
            $('#divFillScreen').setTemplateURL('OrderReport.htm');
            $('#divFillScreen').processTemplate(dtIndent);
        }
        function divOrd_Del_Reportsclick() {
            var RouteName = "";
            if (count > 1) {
                RouteName = document.getElementById('ddlRouteName').value;
                if (RouteName == "Select Route" || RouteName == "") {
                    alert("Please Select Route Name");
                    return false;
                }
            }
            $('#tableOrder').css('display', 'block');
            $('#divback').css('display', 'block');
            $('#divHide').css('display', 'none');
            $('#divRouteOrder').css('display', 'none');
            $('#divFillScreen').css('display', 'block');
            var ddlIndentType = document.getElementById('ddlIndentType').value;
            var data = { 'op': 'GetOrderReport', 'RouteID': RouteName, 'IndentType': ddlIndentType,'ReportType':'Delivery' };
            var s = function (msg) {
                if (msg) {
                    bindOrd_Del_Report(msg);
                }
                else {
                }
            };
            var e = function (x, h, e) {
            };
            $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
            callHandler(data, s, e);
        }
        function bindOrd_Del_Report(msg) {
            var dtIndent = [];
            var BranchName = "";
            for (var i = 0; i < msg.length; i++) {
                var ProductName = msg[i].ProductName;
                var UnitQty = msg[i].unitQty;
                var DelQty = msg[i].DelQty;
                if (msg[i].BranchName != BranchName) {
                    BranchName = msg[i].BranchName;
                    dtIndent.push({ BranchName: BranchName, ProductName: ProductName, UnitQty: UnitQty, DelQty: DelQty });
                }
                else {
                    var Agent = "";
                    dtIndent.push({ BranchName: Agent, ProductName: ProductName, UnitQty: UnitQty, DelQty: DelQty });
                }
            }
            $('#divFillScreen').removeTemplate();
            $('#divFillScreen').setTemplateURL('Ord_Del_Report.htm');
            $('#divFillScreen').processTemplate(dtIndent);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%;">
        <div style="float: left;">
            <br />
            Welcome: <span id="txtUser" style="font-size: 26px; color: Red; font-weight: bold;">
            </span>
        </div>
        <div style="width: 39%; float: right;">
            <input type="button" value="LogOut" id="btnLogOut" class="logout" onclick=" return LogOutClick();" />
        </div>
        <br />
        <br />
        <br />
        <div id="divback" style="display: none">
        <span id="lblBranch" style="font-size:16px;color:Red;width:100%;padding-left:30%;font-weight:bold;"></span>
            <input type="button" value="Back" id="btn_back" class="inputButton" onclick=" return btnbackclick();" />
        </div>
         <div id="divPlantDespatch" style="display:none;">
       <table style="width: 100%;" >
            <tr>
                <td style="width: 20%; float: left;">
                    <label for="lblBranch">
                        Dispatch Name</label>
                </td>
                <td style="width: 80%; float: right;">
                    <select id="ddlDispName" class="ddlBranch"  >
                    </select>
                </td>
            </tr>
        </table>
      </div>
      <div id="divOrderRoute" >
            <div id="divRouteOrder" style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Route Name</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlRouteName" class="ddlBranch" onchange="ddlRouteNameChange(this);">
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
        <div id="divHide" >
        <div id="DivDispatchType" style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Type</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlDispatchType" class="ddlBranch" onchange="ddlDispatchTypeChange();">
                            <option>Dispatch</option>
                            <option>Delivery</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
          <div id="DivIndentType" style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                               Indent Type</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlIndentType" class="ddlBranch" >
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tableOrder">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Agent Name</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlBranchName" class="ddlBranch" onchange="ddlBranchNameChange(this);">
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tableEmployee" style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Employee Name</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlEmployee" class="ddlBranch">
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEdit" style="display:none;">
            <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Mode</label>
                        </td>
                        <td style="width: 80%; float: right;">
                <select id="ddlEdit" class="ddlBranch" onchange="ddlEditChange();">
                <option>Select</option>
                <option>Edit</option>
                <option>Delete</option>
                </select>
                 </td>
                    </tr>
                </table>
            </div>
           <%-- <div id="DivPlantDispatch" style="display:none;">
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 20%; float: left;">
                            <label for="lblBranch">
                                Dispatch Name</label>
                        </td>
                        <td style="width: 80%; float: right;">
                            <select id="ddlPlantDispatch" class="ddlBranch">
                            </select>
                        </td>
                    </tr>
                </table>
            </div>--%>
            <div id="divOrders" style="display:none;">
                <input type="button" value="Orders" id="btnorders" class="inputButton" onclick=" return divOrdersclick();" />
            </div>
            <div id="divOrderReport" style="display:none;">
                <input type="button" value="Order Report" id="Button18" class="inputButton" onclick=" return divOrderReportsclick();" />
            </div>
            <div id="divProductReport" style="display:none;">
                <input type="button" value="Product Report" id="Button19" class="inputButton" onclick=" return divProductReportclick();" />
            </div>
             <div id="divIndentReporting" style="display:none;">
                <input type="button" value="Indent Reporting" id="Button8" class="inputButton" onclick=" return divIndentReportingclick();" />
            </div>
            <div id="divDelivers" style="display:none;">
                <input type="button" value="Deliveries" id="btndeliveries" class="inputButton" onclick=" return divDeliveryclick();" />
            </div>
            <div id="divCollections" style="display:none;">
                <input type="button" value="Collections" id="btncollections" class="inputButton"
                    onclick=" return divCollectionsclick();" />
            </div>
            <div id="divReports" style="display:none;">
                <input type="button" value="Reports" id="btnreports" class="inputButton" onclick=" return divReportsclick();" />
            </div>
             <div id="divCollectionReport" style="display:none;">
                <input type="button" value="Collections Report" id="btnColRep" class="inputButton" onclick=" return divCollectionReportsclick();" />
            </div>
             <div id="divDeliverReport" style="display:none;">
                <input type="button" value="Delivery Report" id="Button7" class="inputButton" onclick=" return divDeliverReportclick();" />
            </div>
            <div id="divInventaryReport" style="display:none;">
                <input type="button" value="Inventory Report" id="Button21" class="inputButton" onclick=" return divInventaryReportclick();" />
            </div>
             <div id="divDispatch" style="display:none;">
                <input type="button" value="Dispatch" id="btnDispatch" class="inputButton" onclick=" return divDispatchclick();" />
            </div>
              <div id="divVerifyInventory" style="display:none;">
                <input type="button" value="Inventory Verifying" id="Button6" class="inputButton" onclick=" return divVerifyInventoryclick();" />
            </div>
            <div id="divReporting">
                <input type="button" value="Reporting" id="Button1" class="inputButton" onclick=" return divReportingclick();" />
            </div>
             <div id="divSOTransfer" style="display:none;">
                <input type="button" value="Sales Office Transfer" id="Button10" class="inputButton" onclick=" return divSOTransferclick();" />
            </div>
             <div id="divProductTransfer" style="display:none;">
                <input type="button" value="Transfer" id="Button17" class="inputButton" onclick=" return divProductTransferclick();" />
            </div>
             <div id="divSalesOfficeDespatch" style="display:none;">
                <input type="button" value="Sales Office Dispatch" id="Button11" class="inputButton" onclick=" return divSalesOfficeDespatchclick();" />
            </div>
          
            <div id="divShortage" style="display:none;">
                <input type="button" value="Leaks and Shortage" id="Button3" class="inputButton" onclick=" return divShortageclick();" />
            </div>
               <div id="divInvReporting" style="display:none;">
                <input type="button" value="Return DC" id="Button4" class="inputButton" onclick=" return divInvReportingclick();" />
            </div>
             <div id="divAmountReporting" style="display:none;">
                <input type="button" value="Amount Reporting" id="Button5" class="inputButton" onclick=" return divAmountReportingclick();" />
            </div>
              <div id="divDispreport" style="display:none;">
                <input type="button" value="Dispatch Report" id="Button9" class="inputButton" onclick=" return divDispreportclick();" />
            </div>
            <div id="divDispTransfer" style="display:none;">
                <input type="button" value="Dispatch Transfer" id="Button2" class="inputButton" onclick=" return divDispTransferclick();" />
            </div>
             <div id="divSpacialSale" style="display:none;">
                <input type="button" value="Office Sale" id="Button13" class="inputButton" onclick=" return divSpacialSaleclick();" />
            </div>
             <div id="divFinalDC" style="display:none;">
                <input type="button" value="FinalDC" id="btnFinalDCs" class="inputButton" onclick=" return divFinalDCclick();" />
            </div>
             <div id="divgetDc" style="display:none;">
                <input type="button" value="Dc Report" id="Button12" class="inputButton" onclick=" return divGetDCclick();" />
            </div>
              <div id="divSale" style="display:none;">
                <input type="button" value="Local Sale" id="Button14" class="inputButton" onclick=" return divLocalSaleclick();" />
            </div>
            <div id="divSalesOfficeLeaks" style="display:none;">
                <input type="button" value="Sales Office Leaks" id="Button16" class="inputButton" onclick=" return divSalesOfficeLeaksclick();" />
            </div>
            <div id="divDirectSale" style="display:none;">
                <input type="button" value="Direct Sale" id="Button20" class="inputButton" onclick=" return divDirectSaleclick();" />
            </div>
             <div id="divAgentInventory" style="display:none;">
                <input type="button" value="Agent Col Inventory" id="Button15" class="inputButton" onclick=" return divAgentColInventoryclick();" />
            </div>
        </div>
        <div style="width: 100%">
            <div id="divFillScreen">
            </div>
            
        </div>
    </div>
</asp:Content>
