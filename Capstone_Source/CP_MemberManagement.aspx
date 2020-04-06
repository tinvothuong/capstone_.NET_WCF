<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_MemberManagement.aspx.cs" Inherits="CP_MemberManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        table.tftable
        {
            font-size: 12px;
            color: #333333;
            width: 100%;
            border-width: 1px;
            border-color: #729ea5;
            border-collapse: collapse;
        }
        table.tftable th
        {
            font-size: 12px;
            background-color: #acc8cc;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #729ea5;
            text-align: left;
        }
        table.tftable tr
        {
            background-color: #ffffff;
        }
        table.tftable td
        {
            font-size: 12px;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #729ea5;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            //dialog thêm thành viên
            $('#newPerson').dialog({
                autoOpen: false,
                draggable: true,
                title: "Thêm mới thành viên",
                width: 'auto',
                open: function (type, data) {
                    $(this).parent().appendTo("form");
                }
            });

            //dialog sửa thành viên
            $('#editPerson').dialog({
                autoOpen: false,
                draggable: true,
                title: "Sửa thông tin thành viên",
                open: function (type, data) {
                    $(this).parent().appendTo("form");
                }
            });
        });

        function showDialog(id) {
            $('#' + id).dialog("open");
        }

        function closeDialog(id) {
            $('#' + id).dialog("close");
        }
              
    </script>
    
    <div>
        <div class="page-header">
            <h1 style="color: Blue">
                QUẢN TRỊ THÀNH VIÊN HỆ THỐNG</h1>
        </div>
        <div style="text-align: right">
            <input id="btnAdd" type="button" onclick="showDialog('newPerson');" value="Thêm mới thành viên"
                class="btn" />
        </div>
        <asp:UpdatePanel ID="upGrid" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="head">
                            <div class="isw-grid">
                            </div>
                            <h1>
                                Danh sách thành viên</h1>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                    <div class="block-fluid">
                        <div id="tSortable_2_wrapper">
                            <asp:GridView ID="grvMember" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ForeColor="#333333" GridLines="None" Font-Names="Tahoma" Width="100%" OnRowDeleting="grvMember_RowDeleting"
                                CssClass="tftable">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSelect" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ImageField DataImageUrlField="Image">
                                        <ControlStyle Width="70px" />
                                    </asp:ImageField>
                                    <asp:TemplateField HeaderText="UserName">
                                        <ItemTemplate>
                                            <asp:Label ID="lbUserName" runat="server" Text='<%#Eval("UserName") %>' ForeColor="Blue"
                                                Font-Bold="True"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FullName" HeaderText="Họ tên" />
                                    <asp:BoundField DataField="Birthday" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Sinh nhật" />
                                    <asp:BoundField DataField="Address" HeaderText="Địa chỉ" NullDisplayText="Null" />
                                    <asp:BoundField DataField="Gender" HeaderText="Giới tính" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />
                                    <asp:TemplateField HeaderText="Quyền">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DateCreate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày tạo" />
                                    <asp:BoundField DataField="Status" HeaderText="Hoạt động" />
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                        <div class="block-fluid">
                            <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                            <div class="row-form">
                                &nbsp &nbsp
                                <asp:Button ID="btChan" runat="server" Text="Chặn tài khoản" class="btn" CausesValidation="false"
                                    OnClick="btChan_Click" />
                                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btChan"
                                    ConfirmText="Chặn các tài khoản này?">
                                </asp:ConfirmButtonExtender>
                                &nbsp &nbsp
                                <asp:Button ID="btHuyChan" runat="server" Text="Cấp phép tài khoản" class="btn" CausesValidation="false"
                                    OnClick="btHuyChan_Click" />
                                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="btHuyChan"
                                    ConfirmText="Cấp phép hoạt động cho các tài khoản này?">
                                </asp:ConfirmButtonExtender>
                                 &nbsp &nbsp
                                <asp:Button ID="btRole" runat="server" Text="Quản lý quyền" class="btn" 
                                    CausesValidation="false" onclick="btRole_Click"
                             />
                            </div>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!--Update form--->
    <div id='newPerson'>
        <asp:UpdatePanel ID="upNewUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true"
            runat="server">
            <ContentTemplate>
                <div class="block-fluid">
                    <div class="row-form">
                        <div class="span1">
                            UserName</div>
                        <div class="span3">
                            <asp:TextBox ID="txtUserName" runat="server" Width="80%"></asp:TextBox>
                            <asp:Label ID="lbMess" runat="server" Text="Đã tồn tại tài khoản này" ForeColor="Red"
                                Visible="false"></asp:Label>
                            <asp:RequiredFieldValidator ID="rqName" runat="server" ErrorMessage="(*)" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Từ 6-20 kí tự"
                                ControlToValidate="txtUserName" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="row-form">
                        <div class="span1">
                            Họ tên</div>
                        <div class="span3">
                            <asp:TextBox ID="txtName" runat="server" Width="80%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                                ControlToValidate="txtName"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="row-form">
                        <div class="span1">
                            Mật khẩu</div>
                        <div class="span3">
                            <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" Width="80%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)"
                                ControlToValidate="txtNewPass"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Từ 6-20 kí tự"
                                ControlToValidate="txtNewPass" ValidationExpression="\w{6,20}"></asp:RegularExpressionValidator>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="row-form">
                        <div class="span1">
                            Nhập lại Mật khẩu</div>
                        <div class="span3">
                            <asp:TextBox ID="txtComfPass" runat="server" TextMode="Password" Width="80%"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="(*)" ControlToCompare="txtNewPass"
                                ControlToValidate="txtComfPass"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)"
                                ControlToValidate="txtComfPass"></asp:RequiredFieldValidator>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="row-form">
                        <div class="span1">
                            Quyền hạn</div>
                        <div class="span3">
                            <asp:DropDownList ID="ddlRole" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="row-form">
                        <div class="span5" style="text-align: center">
                            <asp:Button ID="btAdd" runat="server" Text="Thêm mới" class="btn" OnClick="btnAdd_Click" />
                        </div>
                        <div class="clear">
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
