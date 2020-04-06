<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true" CodeFile="UI_Terms.aspx.cs" Inherits="UI_Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="padding: 10px; color: Blue; font-weight:bold">ĐIỀU KHOẢN ĐĂNG KÝ ĐỐI TÁC</div>
<div style="padding: 10px"> 
    <asp:Label ID="lbContents" runat="server" Text="Nội dung"></asp:Label></div>
<div style="text-align:center"> 
    <asp:Button ID="btRegister" runat="server" 
        Text="Tôi đồng ý và tiếp tục đăng ký" class="btn" onclick="btRegister_Click"/></div>
</asp:Content>

