<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_ArticleManagement.aspx.cs" Inherits="CP_ArticleManagement" %>


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
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
    <div>
        <div class="page-header">
            <h1 style="color: Blue">
                QUẢN TRỊ BÀI VIẾT</h1>
        </div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        
       
        <%--Thống kê--%>
        <div style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="Từ ngày "></asp:Label>
            <asp:TextBox ID="txtStart" runat="server" Width="100px"></asp:TextBox>
            <asp:CalendarExtender ID="txtTuNgay_CalendarExtender" runat="server" Enabled="True"
                TargetControlID="txtStart" Format="dd/MM/yyyy">
            </asp:CalendarExtender>
            Đến ngày &nbsp<asp:TextBox ID="txtEnd" runat="server" Width="100px"></asp:TextBox>
            <asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtEnd"
                Format="dd/MM/yyyy">
            </asp:CalendarExtender>
            <asp:Button ID="Button1" runat="server" class="btn" Text="Thống kê" OnClick="Button1_Click" />
        </div>
        <div>
            <div style="padding: 10px; float:left">
                <!--Bt Add new,...-->
                <asp:Button ID="btCategory" runat="server" Text="Danh mục" class="btn" 
                    onclick="btCategory_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btAddArticle" runat="server" Text="Thêm mới" class="btn" OnClick="btAddArticle_Click" />
            </div>
            <%--Search--%>
            <div class="input-append" style="text-align: right">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Tên bài viết" Width="100px"></asp:TextBox>
                <asp:Button ID="btSearch" runat="server" class="btn" Text="Tìm" OnClick="btSearch_Click" />
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Danh sách bài viết</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
             
            <div class="block-fluid">
                <div id="tSortable_2_wrapper">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                    
                    
                    <asp:GridView ID="grvArticle" runat="server" AutoGenerateColumns="False" 
                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="tftable"
                        Font-Names="Tahoma" AllowPaging="True" 
                        onpageindexchanging="grvArticle_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Chọn">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" runat="server" class="checker" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="IDArticle" HeaderText="ID">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NameCategory" HeaderText="Danh mục" />
                            <asp:ImageField DataImageUrlField="Image" HeaderText="Hình ảnh">
                                <ControlStyle Height="40px" Width="40px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:ImageField>
                            <asp:BoundField DataField="Title" HeaderText="Tiêu đề" />
                            <asp:BoundField DataField="DateOfPost" HeaderText="Ngày cập nhật" />
                            <asp:BoundField DataField="Source" HeaderText="Tác giả" NullDisplayText="N/A" />
                            <asp:CheckBoxField DataField="Verify" HeaderText="Kiểm duyệt" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:TemplateField HeaderText="Xem/Sửa">
                                <ItemTemplate>
                                    <asp:Button ID="btView" runat="server" Text="View/Edit" CommandName='<%#Eval("IDArticle") %>'
                                        class="btn" OnClick="btView_Click" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#B0CBD2" ForeColor="#660066" 
                            CssClass="tftable" Font-Bold="True" Font-Italic="False" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
               
            </div>
        </div>
        
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btVerify" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="btUnVerify" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="btDelete" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
        <div style="text-align: center">
            <span style="padding-right: 10px">
                <asp:Button ID="btVerify" runat="server" Text="Kiểm duyệt" class="btn" OnClick="btVerify_Click" />
                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btVerify"
                    ConfirmText="Kiểm duyệt các bài này?">
                </asp:ConfirmButtonExtender>
            </span><span style="padding-right: 10px">
                <asp:Button ID="btUnVerify" runat="server" Text="Hủy kiểm duyệt" class="btn" OnClick="btUnVerify_Click" />
                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="btUnVerify"
                    ConfirmText="Hủy kiểm duyệt các bài này?">
                </asp:ConfirmButtonExtender>
            </span>
            <asp:Button ID="btDelete" runat="server" Text="Xóa" class="btn" OnClick="btDelete_Click" />
            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender3" runat="server" TargetControlID="btDelete"
                ConfirmText="Bạn có chắc chắn muốn xóa?">
            </asp:ConfirmButtonExtender>
        </div>
        
    </div>
</asp:Content>
