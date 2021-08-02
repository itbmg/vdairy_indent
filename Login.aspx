<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="Server">
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
             var uid = document.getElementById('txtUserName').value;
             var pwd = document.getElementById('txtPassword').value;
             var data = { 'op': 'ValidateLogin', 'UID': uid, 'PWD': pwd };
             var s = function (msg) {
                 if (msg) {
                     if (msg == "Success") {
                         window.location = "Default.aspx";
                     }
                     else if (msg == "Change Password")
                     {
                         window.location = "ChangePassword.aspx";

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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <%--<asp:UpdateProgress ID="updateProgress1" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0;
                    right: 0; left: 0; z-index: 9999; background-color: #FFFFFF; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="thumbnails/loading.gif"
                        Style="padding: 10px; position: absolute; top: 27%; left: 25%; z-index: 99999;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>--%>
    </div>
    <asp:UpdatePanel ID="updbusBook" runat="server">
        <ContentTemplate>
            <div class="title" style="text-align: center; width: 100%;">
                <img src="Images/Vyshnavilogo.png" />
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
                    <input type="text" id="txtUserName" placeholder="Enter User Name" class="btnBookTickets" Style="padding: .2em .4em;"/>
                       <%-- <asp:TextBox ID="txtUserName" CssClass="btnBookTickets" placeholder="Enter User Name"
                            Style="padding: .2em .4em;" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUserName"
                            ForeColor="Red" runat="server"  Font-Size="16px" Font-Bold="true" ErrorMessage="***"></asp:RequiredFieldValidator>--%>
                        <br />
                        <br />
                        <br />

                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="password" id="txtPassword" placeholder="Enter Password" class="btnBookTickets" Style="padding: .2em .4em;"/>
                       <%-- <asp:TextBox ID="txtPassword" CssClass="btnBookTickets" TextMode="Password" Style="padding: .2em .4em;"
                            placeholder="Enter Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword"
                            ForeColor="Red" runat="server" Font-Size="16px" Font-Bold="true" ErrorMessage="***"></asp:RequiredFieldValidator>--%>
                                  <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                    <input type="submit" id="btnLogIn" class="ContinueButton"  value="Login" onclick="Authenticate()"></input>
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