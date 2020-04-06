<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CP_DetailContact.aspx.cs" Inherits="CP_DetailContact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chi tiết liên hệ</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height:500px; width: 700px">
        <div style="text-align: center; padding: 10px">
            <asp:Label ID="Label1" runat="server" Text="Chi tiết liên hệ" ForeColor="Blue" 
                Font-Bold="True"></asp:Label></div>
                 <div>
                     <table class="style1" style="border: 1px dashed #000080">
                         <tr>
                             <td>
                                 ID</td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbID" runat="server" ForeColor="Blue" Text="Label"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 Họ tên: 
                             </td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbName" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Địa chỉ:</td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbAddress" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Điện thoại:</td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbPhone" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Email:
                             </td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbEmail" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Ngày liên hệ:</td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbDate" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Tiêu đề</td>
                             <td style="text-align: right">
                                 <asp:Label ID="lbTitle" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         <tr>
                             <td>
                                 Nội dung:</td>
                             <td style="text-align: right">
                                <asp:Label ID="lbContents" runat="server" ForeColor="Blue" Text="Label"></asp:Label></td>
                         </tr>
                         </table>
        </div>
        <div style="text-align:center">
            <asp:Button ID="Button1" runat="server" Text="Đóng"  OnClientClick="window.close();" /></div>
    </div>
   
    </form>
</body>
</html>
