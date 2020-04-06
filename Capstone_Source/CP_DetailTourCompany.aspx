<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CP_DetailTourCompany.aspx.cs" Inherits="CP_DetailTourCompany" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:700px">
        
        <table class="style1" 
            style="border: 1px dashed #0000FF; padding: 10px; line-height: 200%">
            <tr>
                <td>
                    Tên công ty</td>
                <td style="text-align: right">
                    <asp:Label ID="lbID" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Đại diện pháp luật</td>
                <td style="text-align: right">
                    <asp:Label ID="lbLegal" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Tên giao dịch</td>
                <td style="text-align: right">
                    <asp:Label ID="lbTrans" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Mã số thuế</td>
                <td style="text-align: right">
                    <asp:Label ID="lbTaxCode" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Số giấy phép kinh doanh</td>
                <td style="text-align: right">
                    <asp:Label ID="lbBussinessLicense" runat="server" Font-Bold="True" 
                        ForeColor="Blue" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày cấp</td>
                <td style="text-align: right">
                    <asp:Label ID="lbCerti" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Địa chỉ</td>
                <td style="text-align: right">
                    <asp:Label ID="lbAddress" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Số điện thoại</td>
                <td style="text-align: right">
                    <asp:Label ID="lbPhone" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td style="text-align: right">
                    <asp:Label ID="lbEmail" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Mật khẩu</td>
                <td style="text-align: right">
                    <asp:Label ID="lbPass" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Website</td>
                <td style="text-align: right">
                    <asp:Label ID="lbWeb" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
