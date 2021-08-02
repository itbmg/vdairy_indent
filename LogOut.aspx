<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LogOut.aspx.cs" Inherits="LogOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Js/jquery-1.4.4.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {
         window.history.forward(1);

     });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

