<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_UpdateArticle.aspx.cs" Inherits="CP_UpdateArticle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="color: Blue">
        <asp:Label ID="lbInfor" runat="server" Text="Add new"></asp:Label>
    </h1>
    <div class="row-fluid">
        <div class="head">
            <div class="isw-documents">
            </div>
            <h1>
                Bài đăng</h1>
            <div class="clear">
            </div>
        </div>
        <div class="block-fluid">
            <div class="row-form">
                <div class="span2">
                    Tiêu đề</div>
                <div class="span6">
                    <asp:TextBox ID="txtTilte" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqTitle" runat="server" ErrorMessage="Không để trống Tiêu đề"
                        ControlToValidate="txtTilte"></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Danh mục</div>
                <div class="span2">
                    <asp:DropDownList ID="ddlCategory" runat="server">
                        <asp:ListItem Value="-1">--Chọn Danh mục--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="span2" style="padding-left: 1%">
                    Tỉnh/ Thành phố</div>
                <div class="span2">
                    <asp:DropDownList ID="ddlCity" runat="server">
                        <asp:ListItem Value="-1">--Chọn Tỉnh thành--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Tác giả/ Nguồn</div>
                <div class="span2">
                    <asp:TextBox ID="txtSource" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqSource" runat="server" ErrorMessage="Điền đủ thông tin"
                        ControlToValidate="txtSource"></asp:RequiredFieldValidator>
                </div>
                <div class="span2" style="padding-left: 1%">
                    Ngày đăng
                </div>
                <div class="span2">
                    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate">
                    </asp:CalendarExtender>
                </div>
                <div class="clear">
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Nội dung</div>
                <div class="span10">
                    <CKEditor:CKEditorControl ID="editorContent" runat="server" Skin="moonocolor" Language="en"></CKEditor:CKEditorControl>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Ảnh đại diện</div>
                <div class="span6">
                    <asp:FileUpload ID="FileUploadImages" runat="server" Width="500px" />
                    <asp:RegularExpressionValidator ID="validatorFileUpLoad" runat="server" ErrorMessage="(*)"
                        ControlToValidate="FileUploadImages" ValidationExpression="^([0-9a-zA-Z_\-~ :\\()])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$">
                    </asp:RegularExpressionValidator>
                    <asp:Label ID="lbMessFile" runat="server" Text="(*)" ForeColor="Red" Visible="False"></asp:Label>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Địa chỉ Map</div>
                <div class="span3">
                    <asp:TextBox ID="txtMapAdd" runat="server" placeholder="Example: 16.4304, 108.13423"></asp:TextBox>
                  
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMapAdd" ErrorMessage="Sai định dạng"></asp:RegularExpressionValidator>--%>
                   
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div style="text-align: center">
                    <asp:Button ID="btAdd" runat="server" Text="Thêm mới" class="btn" OnClick="btAdd_Click" />
                    &nbsp;
                    <asp:Button ID="btUpdate" runat="server" Text="Sửa đổi" class="btn" OnClick="btUpdate_Click" />
                    &nbsp;
                    <asp:Button ID="btClear" runat="server" Text="Làm mới" class="btn" CausesValidation="False"
                        OnClick="btClear_Click" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
