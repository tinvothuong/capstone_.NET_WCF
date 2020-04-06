<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_Log.aspx.cs" Inherits="CP_Log" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager2" runat="server">
    </asp:ToolkitScriptManager>
    <div>
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
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div>
                    <div class="page-header">
                        <h1 style="color: Blue">
                            LOG</h1>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="head">
                                <div class="isw-grid">
                                </div>
                                <h1>
                                    Lịch sử công việc</h1>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        <div class="block-fluid">
                            <div id="tSortable_2_wrapper">
                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                                <asp:GridView ID="grvTour" runat="server" AutoGenerateColumns="False" Width="100%"
                                    CssClass="tftable" CellPadding="4" Font-Names="tahoma" ForeColor="#333333" GridLines="None"
                                    AllowPaging="True" OnPageIndexChanging="grvTour_PageIndexChanging" PageSize="20">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="DateTime" HeaderText="Ngày" />
                                        <asp:TemplateField HeaderText="Người thực hiện">
                                            <ItemTemplate>
                                                <asp:Label ID="lbUserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                        <asp:BoundField DataField="Contents" HeaderText="Nội dung công việc" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#B0CBD2" ForeColor="#660066" Font-Bold="True" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
