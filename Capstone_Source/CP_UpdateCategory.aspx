<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CP_UpdateCategory.aspx.cs"
    Inherits="CP_UpdateCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width: 600px">
    <div style="background-image: url('Images/table_back.gif'); background-repeat: repeat-x;
        color: blue; font-weight: bold; line-height: 200%;">
        <div style="text-align: center; padding: 20px">
            CHỈNH SỬA DANH MỤC</div>
        <div>
            <div style="float: left; width: 30%">
                Mã Danh mục</div>
            <div>
                <asp:Label ID="lbID" runat="server" Text="0"></asp:Label>
            </div>
            <div class="clear">
            </div>
        </div>
        <div>
            <div style="float: left; width: 30%">
                Tên Danh mục</div>
            <div>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                    ControlToValidate="txtName">
                </asp:RequiredFieldValidator>
            </div>
            <div class="clear">
            </div>
        </div>
        <div>
            <div style="float: left; width: 30%">
                Độ ưu tiên</div>
            <div>
                <asp:DropDownList ID="ddlPri" runat="server" Width="100px">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="clear" style="color: black; font-weight: normal">
                *Độ ưu tiên bằng 0 sẽ không được hiển thị trên website</div>
        </div>
        <div class="row-form">
            <div class="span5" style="text-align: center">
                <asp:Button ID="btEdit" runat="server" Text="Chỉnh sửa" class="btn" Font-Bold="True"
                    ForeColor="Blue" OnClick="btEdit_Click" />
                &nbsp &nbsp
                <asp:Button ID="Button1" runat="server" Text="Đóng" class="btn" Font-Bold="True"
                    ForeColor="Blue" OnClientClick="window.close();" />
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
