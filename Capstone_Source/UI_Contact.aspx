<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_Contact.aspx.cs" Inherits="UI_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="padding: 20px; text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Thông tin liên hệ" Font-Bold="True" Font-Names="Times New Roman"
                Font-Size="Large" ForeColor="#FF3300"></asp:Label></div>
        <div style="text-align: center">
            <span style="text-align: center; font-family: Times New Roman; font-size: 16px">Express
                Tour Travel
                <br />
                Địa chỉ: K7/25 Quang Trung, Đà Nẵng
                <br />
                Tel: 0947843356
                <br />
                Email:myel91@outlook.com </span>
        </div>
        <table class="style1" style="margin: 40px; width: 80%;">
             <tr>
                <td style="height: 16px">
                    <asp:Label ID="Label7" runat="server" ForeColor="Blue" Text="Tiêu đề: "></asp:Label>
                </td>
                <td style="height: 16px">
                    <asp:TextBox ID="txtTitle" runat="server" Height="25px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                        ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 16px">
                    <asp:Label ID="Label2" runat="server" ForeColor="Blue" Text="Họ và tên: "></asp:Label>
                </td>
                <td style="height: 16px">
                    <asp:TextBox ID="txtName" runat="server" Height="25px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" ForeColor="Blue" Text="Địa chỉ: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdd" runat="server" Height="25px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfAdd" runat="server" ControlToValidate="txtAdd"
                        ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" ForeColor="Blue" Text="Email: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="25px" Width="200px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rqEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Sai định dạng email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" ForeColor="Blue" Text="Số điện thoại: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" ForeColor="Blue" Text="Nội dung"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCont" runat="server" Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqfCont" runat="server" ControlToValidate="txtCont"
                        ErrorMessage="(*)"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td style="padding-top: 10px; padding-left: 10px">
                    <asp:Button ID="btSubmit" runat="server" Font-Bold="True" ForeColor="Blue" Height="30px"
                        Text="Góp ý" Width="100px" OnClick="btSubmit_Click" class="btn"/>
                    &nbsp;
                    <asp:Button ID="btVietLai" runat="server" Font-Bold="True" ForeColor="Blue" Height="30px"
                        Text="Viết lại" Width="100px" OnClick="btVietLai_Click" class="btn"
                        CausesValidation="False" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
