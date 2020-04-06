<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_ChangePass.aspx.cs" Inherits="CP_ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    
    <div class="span6">
        <asp:Label ID="lbMess" runat="server" Text="Mật khẩu của bạn đã được thay đổi.<br>" ForeColor="Blue"
            Font-Names="Segoe UI Light,Segoe UI,Segoe WP Light,Segoe WP,Segoe UI Latin Light,HelveticaNeue,Helvetica,Tahoma,ArialUnicodeMS,sans-serif"
            Font-Size="2.25em" Visible="False"></asp:Label>
            <br />
        <div class="head">
            <div class="isw-list">
            </div>
            <h1>
                ĐỔI MẬT KHẨU</h1>
            <div class="clear">
            </div>
        </div>
        <div class="block-fluid">
            <div class="row-form">
                <div class="span2">
                    <br />
                    Mật khẩu mới</div>
                <div class="span3">
                    <br />
                    <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" Font-Bold="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được trống"
                        ControlToValidate="txtNewPass"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Từ 6-20 kí tự"
                        ControlToValidate="txtNewPass" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    <br />
                    Nhập lại mật khẩu</div>
                <div class="span3">
                    <br />
                    <asp:TextBox ID="txtComfPass" runat="server" TextMode="Password" Font-Bold="False"
                        Font-Size="14px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Không khớp mật khẩu"
                        ControlToCompare="txtNewPass" ControlToValidate="txtComfPass"></asp:CompareValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span5" style="text-align: center">
                    <asp:Button ID="btChangePass" runat="server" Text="ĐỔI" class="btn" 
                        onclick="btChangePass_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btCancel" runat="server" Text="HỦY" class="btn" 
                        CausesValidation="False" onclick="btCancel_Click" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
