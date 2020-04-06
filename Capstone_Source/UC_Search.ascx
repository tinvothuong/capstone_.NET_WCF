<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Search.ascx.cs" Inherits="UC_Search" %>


<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<table class="style1" width="90%" 
    style="border: 1px dashed #0000FF; font-weight: bold; padding: 10px; color: blue; line-height: 150%;">
    <tr>
        <td>
            Tìm theo:</td>
        <td>
    <div style="text-align:center">
    
   
      <asp:RadioButtonList ID="rdoBt0" runat="server" RepeatDirection="Horizontal" 
            CellPadding="4" CellSpacing="5">
          <asp:ListItem Selected="True">Bài viết</asp:ListItem>
          <asp:ListItem>Tour</asp:ListItem>
    </asp:RadioButtonList>
    </div>
        </td>
    </tr>
    <tr>
        <td>
            Vùng miền:</td>
        <td>
       <asp:DropDownList ID="ddlZone" runat="server" Height="25px">
           <asp:ListItem>Tất cả</asp:ListItem>
       </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" class="inputs" Width="100px" 
                placeholder="Từ khóa"></asp:TextBox>
       <asp:Button ID="btSearch" runat="server" Text="Tìm kiếm" class="btn" 
                onclick="btSearch_Click"/>
        </td>
    </tr>
    </table>


