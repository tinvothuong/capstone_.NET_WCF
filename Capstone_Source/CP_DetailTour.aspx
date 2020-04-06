<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CP_DetailTour.aspx.cs" Inherits="CP_DetailTour" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 700px; height:600px">
    <div style="text-align:center"><asp:Label ID="lbTitle" runat="server" Text="Title" 
            Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"></asp:Label></div>
        <asp:Label ID="lbContents" runat="server" Text="Contents"></asp:Label>
    </div>
    <div style="padding: 20px; text-align:center">
        <asp:Button ID="Button1" runat="server" Text="Đóng" OnClientClick="window.close();"/></div>
    </form>
</body>
</html>
