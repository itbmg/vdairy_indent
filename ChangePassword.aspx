<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <link href="MobileCss/Scripts/default.css" rel="stylesheet" type="text/css" />
    <link href="MobileCss/Scripts/style.css" rel="stylesheet" type="text/css" />
     <script src="Js/jquery.blockUI.js" type="text/javascript"></script>
    <style type="text/css">
        #container
        {
            margin: 0 auto;
            text-align: left;
            height: 600px;
        }
        .shells
        {
            position: relative;
            border-radius: 4px 4px 4px 4px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            window.history.forward(1);
        });
    </script>
     <script type ="text/javascript">
         function Authenticate() {
             var currentpassword = '<%=Session["PWD"] %>';
             var loginname = '<%=Session["logingname"] %>';
             var uid = document.getElementById('txtUserName').value;
             if (uid == "") {
                 alert("Please Provide Current Password");
                 return false;
             }
             if (uid != "") {
                 if (currentpassword == "") {
                     window.location = "Login.aspx";
                 }
                 if (uid != currentpassword) {
                     alert("Please Provide Current Password");
                     return false;
                 }
             }
             var pwd = document.getElementById('txtPassword').value;
             var pwdconfirm = document.getElementById('txtpasswordConfirm').value;
             if (pwd == pwdconfirm) {
                 var data = { 'op': 'changepassword', 'UID': uid, 'PWD': pwd, 'PWDConfirm': pwdconfirm, 'loginname': loginname };
                 var s = function (msg) {
                     if (msg) {
                         if (msg == "Success") {
                             window.location = "Login.aspx";
                         }
                         else {
                             alert(msg);
                             window.location = "Login.aspx";
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
                 alert("Please Provide correct confirmation Password");
                 return false;
             }
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:UpdatePanel ID="updbusBook" runat="server">
        <ContentTemplate>
            <div class="title" style="text-align: center; width: 100%;">
                <img src="Images/VLogo.png" />
                <br />
                <span>Powered by VT Dairy</span>
            </div>
            <table style="border: 1px; height: 100%; width: 100%;">
                <tr>
                    <td>
                        <br />      <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="password" id="txtUserName" maxlength="6" placeholder="Enter Current Password" class="btnBookTickets" Style="padding: .2em .4em;"/>
                       
                        <br />
                        <br />
                        <br />

                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="password" id="txtPassword" maxlength="6" placeholder="New Password" class="btnBookTickets" Style="padding: .2em .4em;"/>
                      
                                  <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                 <td>
                    <input type="password" id="txtpasswordConfirm" maxlength="6" placeholder="Confirm Password" class="btnBookTickets" Style="padding: .2em .4em;"/>
                                  <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="submit" id="btnLogIn" class="ContinueButton"  value="Submit" onclick="Authenticate()"></input>
                      <%--  <asp:Button ID="btnLogIn" runat="server" Text="Login" CssClass="ContinueButton" OnClick="btnLogin_Click" />--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="" ForeColor="Red" runat="server" Font-Size="16px" ID="lbl_validation"></asp:Label>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

