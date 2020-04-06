<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_RegisterCompany.aspx.cs" Inherits="UI_RegisterCompany" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding: 10px; color: Blue; font-weight: bold">
        Đăng ký Đối tác(Công ty du lịch)</div>
    <div>
        <table style="width: 100%; line-height: 250%;">
            <tr>
                <td>
                    Tài khoản đăng nhập<asp:Label ID="Label1" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtIDCompany" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtIDCompany"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Tên công ty<asp:Label ID="Label13" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:</td>
                <td>
                    <asp:TextBox ID="txtNameCompay" runat="server" class="inputs"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtNameCompay"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mật khẩu<asp:Label ID="Label2" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" class="inputs" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Nhập lại mật khẩu<asp:Label ID="Label3" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtComfPass" runat="server" class="inputs" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtComfPass"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="(**)" 
                        ControlToCompare="txtPass" ControlToValidate="txtComfPass"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Người đại diện pháp luật<asp:Label ID="Label4" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtLegalRepresentative" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtLegalRepresentative"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Tên giao dịch<asp:Label ID="Label5" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtTransactionName" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtTransactionName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mã số thuế<asp:Label ID="Label6" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtTaxCode" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rq1" runat="server" ErrorMessage="(*)" ControlToValidate="txtTaxCode"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Giấy phép kinh doanh số<asp:Label ID="Label7" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtBusinessLicense" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtBusinessLicense"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Ngày cấp<asp:Label ID="Label8" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtCertifiedDate" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtCertifiedDate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Địa chỉ công ty<asp:Label ID="Label9" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Số điện thoại công ty<asp:Label ID="Label10" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email<asp:Label ID="Label11" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Website:
                </td>
                <td>
                    <asp:TextBox ID="txtWebsite" runat="server" class="inputs"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <td>
                        <cc1:CaptchaControl ID="CaptchaControl1" runat="server" CaptchaWidth="150" CaptchaLength="3"
                            Width="150px" CaptchaHeight="32" />
                    </td>
            </tr>
            <tr>
                <td>
                    Mã xác thực<asp:Label ID="Label12" runat="server" Text="(*)" ForeColor="Red"></asp:Label>:
                </td>
                </td>
                <td>
                    <asp:TextBox ID="txtCapscha" runat="server" class="inputs"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="(*)"
                        ControlToValidate="txtCapscha"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lbCapcha" runat="server" Text="Mã xác nhận không đúng" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="text-align: center; padding: 10px">
        <asp:Button ID="btRegister" runat="server" Text="Đăng ký" class="btn" OnClick="btRegister_Click" /></div>
</asp:Content>
