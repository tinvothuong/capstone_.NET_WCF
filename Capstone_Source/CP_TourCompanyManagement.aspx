<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_TourCompanyManagement.aspx.cs" Inherits="CP_TourCompanyManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<script type="text/javascript">
        window.onload = function () {
            var tfrow = document.getElementById('tfhover').rows.length;
            var tbRow = [];
            for (var i = 1; i < tfrow; i++) {
                tbRow[i] = document.getElementById('tfhover').rows[i];
                tbRow[i].onmouseover = function () {
                    this.style.backgroundColor = '#f3f8aa';
                };
                tbRow[i].onmouseout = function () {
                    this.style.backgroundColor = '#ffffff';
                };
            }
        };
    </script>--%>
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
    <div>
        <div class="page-header">
            <h1 style="color: Blue">
                QUẢN TRỊ CÔNG TY DU LỊCH</h1>
        </div>
        <%--Search--%>
        <div class="input-append" style="text-align: right">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Tên công ty"></asp:TextBox>
            <asp:Button ID="btSearch" runat="server" class="btn" Text="Tìm" OnClick="btSearch_Click" />
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Danh sách Công ty du lịch</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="block-fluid">
                <div id="tSortable_2_wrapper">
                    <asp:GridView ID="grvCompany" runat="server" AutoGenerateColumns="False" Width="100%"
                        CssClass="tftable" CellPadding="4" Font-Names="tahoma" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" runat="server" class="checker" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="IDCompany" HeaderText="ID" />
                            <asp:BoundField DataField="CompanyName" HeaderText="Tên công ty" />
                            <asp:BoundField DataField="Address" HeaderText="Địa chỉ" NullDisplayText="N/A" />
                            <asp:BoundField DataField="Phone" HeaderText="Điện thoại" NullDisplayText="N/A" />
                            <asp:BoundField DataField="Email" HeaderText="Email" NullDisplayText="N/A" />
                            <asp:BoundField DataField="WebAddress" HeaderText="Website" NullDisplayText="N/A" />
                            <asp:CheckBoxField DataField="Verify" HeaderText="Kiểm duyệt" />
                            <asp:BoundField DataField="ActivationDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày hoạt động"
                                NullDisplayText="Chưa Active" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btDetail" runat="server" Text="Chi tiết" class="btn" 
                                    OnClick="btDetail_Click" CommandName='<%#Eval("IDCompany") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <%--button--%>
                <div style="text-align: center; padding: 20px">
                    <span style="padding-right: 10px">
                        <asp:Button ID="btVerify" runat="server" Text="Kiểm duyệt" class="btn" OnClick="btVerify_Click" />
                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btVerify"
                            ConfirmText="Kiểm duyệt các công ty này?">
                        </asp:ConfirmButtonExtender>
                    </span><span style="padding-right: 10px">
                        <asp:Button ID="btUnVerify" runat="server" Text="Hủy kiểm duyệt" class="btn" OnClick="btUnVerify_Click" />
                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" TargetControlID="btUnVerify"
                            ConfirmText="Hủy kiểm duyệt các công ty này?">
                        </asp:ConfirmButtonExtender>
                    </span>
                </div>
                <%-- end button--%>
            </div>
        </div>
    </div>
</asp:Content>
