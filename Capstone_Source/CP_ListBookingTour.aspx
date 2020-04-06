<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_ListBookingTour.aspx.cs" Inherits="CP_ListBookingTour" %>

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
                            DANH SÁCH VÉ</h1>
                    </div>
                    <div style="padding: 10px">
                        <asp:Label ID="lbNameTour" runat="server" Text="Nmae Tour" Font-Bold="True" 
                            Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                    </div>
                    <asp:Label ID="lbNumber" runat="server" Text="Số người đặt" ForeColor="Blue" Font-Size="Larger"></asp:Label>---
                    <asp:Label ID="lbTickets" runat="server" Text="Tổng số vé" ForeColor="Blue" Font-Size="Larger"></asp:Label>---
                    <asp:Label ID="lbCost" runat="server" Text="Tổng tiền" ForeColor="Blue" Font-Size="Larger"></asp:Label>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="head">
                                <div class="isw-grid">
                                </div>
                                <h1>
                                    Danh sách vé</h1>
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                        
                        <div class="block-fluid">
                            <div id="tSortable_2_wrapper">
                                <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                                <asp:GridView ID="grvBookingTour" runat="server" AutoGenerateColumns="False" Width="100%"
                                    CssClass="tftable" CellPadding="4" Font-Names="tahoma" ForeColor="#333333" GridLines="None"
                                    AllowPaging="True" OnPageIndexChanging="grvTour_PageIndexChanging" PageSize="20">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="IdentityCard" HeaderText="Chứng minh thư" />
                                        <asp:BoundField DataField="FullName" HeaderText="Họ tên" />
                                        <asp:BoundField DataField="Address" HeaderText="Địa chỉ" />
                                        <asp:BoundField DataField="Phone" HeaderText="Điện thoại" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                        <asp:BoundField DataField="NumberOfTickets" HeaderText="Số vé đặt" />
                                        <asp:BoundField DataField="TotalAmount" HeaderText="Tổng tiền" />
                                        <asp:BoundField DataField="DateBooking" HeaderText="Ngày đặt" />
                                        <asp:BoundField DataField="Status" HeaderText="Thanh toán" />
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
