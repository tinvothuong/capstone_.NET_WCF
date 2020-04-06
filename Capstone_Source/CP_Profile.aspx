<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_Profile.aspx.cs" Inherits="CP_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0 auto">
   
        <div class="span6">
            <div style="text-align: right">
                <asp:Button ID="btChangePass" runat="server" Text="Đổi Password" class="btn" 
                    CausesValidation="False" onclick="btChangePass_Click" />
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
             <asp:Label ID="lbMess" runat="server" Text="Thay đổi thông tin thành công.<br>" ForeColor="Blue"
            Font-Names="Segoe UI Light,Segoe UI,Segoe WP Light,Segoe WP,Segoe UI Latin Light,HelveticaNeue,Helvetica,Tahoma,ArialUnicodeMS,sans-serif"
            Font-Size="2.25em" Visible="False"></asp:Label>--%>
            <div class="head">
                <div class="isw-list">
                </div>
                <h1>
                    Tài khoản của tôi</h1>
                <div class="clear">
                </div>
            </div>
            
            
           
            <div class="block-fluid">
                <div class="row-form">
                    <div style="margin: 0; padding: 0; float: left">
                        <asp:Image ID="imgAvatar" runat="server" ImageUrl="~/ImagesAcc/default_avatar.jpg"
                            Width="120px" /></div>
                    <div class="span3">
                        <asp:Label ID="lbUser" runat="server" Text="Tên ông lớn" Font-Bold="True" ForeColor="Navy"></asp:Label>
                        <br />
                        <asp:Label ID="lbRole" runat="server" Text="Role: Chức vụ lớn"></asp:Label>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Họ và tên</div>
                    <div class="span3">
                        <asp:TextBox ID="txtName" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqName" runat="server" ErrorMessage="(*)" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Ngày sinh</div>
                    <div class="span3">
                        <asp:TextBox ID="txtBirth" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                            ControlToValidate="txtBirth"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Giới tính</div>
                    <div class="span3">
                        <asp:DropDownList ID="ddlSex" runat="server" Width="80%">
                            <asp:ListItem>Nam</asp:ListItem>
                            <asp:ListItem>Nữ</asp:ListItem>
                            <asp:ListItem>Khác</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Địa chỉ</div>
                    <div class="span3">
                        <asp:TextBox ID="txtAdress" runat="server" Width="80%" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)"
                            ControlToValidate="txtAdress"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Điện thoại</div>
                    <div class="span3">
                        <asp:TextBox ID="txtPhone" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)"
                            ControlToValidate="txtPhone"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Email</div>
                    <div class="span3">
                        <asp:TextBox ID="txtEmail" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)"
                            ControlToValidate="txtEmail"> </asp:RequiredFieldValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span1">
                        Avatar</div>
                    <div class="span3">
                        <asp:FileUpload ID="fileUploadImage" runat="server" />
                        <asp:RegularExpressionValidator ID="validatorFileUpLoad" runat="server" ErrorMessage="(*)"
                            ControlToValidate="fileUploadImage" ValidationExpression="^([0-9a-zA-Z_\-~ :\\()])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"> </asp:RegularExpressionValidator>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                    <div class="span5" style="text-align: center">
                        <asp:Button ID="btChangeProfile" runat="server" Text="Thay đổi" class="btn" OnClick="btChangeProfile_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btClear" runat="server" Text="Làm mới" class="btn" CausesValidation="False"
                            OnClick="btClear_Click" />
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
             <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </div>
</asp:Content>
