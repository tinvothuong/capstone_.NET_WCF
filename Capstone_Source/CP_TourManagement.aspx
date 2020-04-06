<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_TourManagement.aspx.cs" Inherits="CP_TourManagement" %>

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
      <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>--%>
                <div>
                    <div class="page-header">
                        <h1 style="color: Blue">
                            QUẢN TRỊ TOUR</h1>
                    </div>
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
                    <%--Search--%>
                    <div class="input-append" style="text-align: right">
                        <asp:TextBox ID="txtSearch" runat="server" placeholder="Tên Tour" Width="100px"></asp:TextBox>
                        <asp:Button ID="btSearch" runat="server" class="btn" Text="Tìm" OnClick="btSearch_Click" />
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="head">
                                <div class="isw-grid">
                                </div>
                                <h1>
                                    Danh sách Tour</h1>
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
                                    AllowPaging="True" OnPageIndexChanging="grvTour_PageIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSelect" runat="server" class="checker" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IDTour" HeaderText="ID" />
                                        <asp:BoundField DataField="NameTour" HeaderText="Tên Tour" />
                                        <asp:BoundField DataField="PriceTour" HeaderText="Giá" />
                                        <asp:BoundField DataField="Duration" HeaderText="Thời gian" />
                                        <asp:BoundField DataField="OrderQuantity" HeaderText="Số lượng vé" />
                                        <asp:BoundField DataField="DepartPosition" HeaderText="Khởi hành" />
                                        <asp:BoundField DataField="DepartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày đi" />
                                        <asp:BoundField DataField="DayUpdate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày update" />
                                        <asp:BoundField DataField="TransMethod" HeaderText="Phương tiện" />
                                        <asp:BoundField DataField="EmailNganLuongAcc" HeaderText="Email NganLuong" />
                                        <asp:BoundField DataField="IDCompany" HeaderText="Công ty" />
                                        <asp:CheckBoxField DataField="Verify" HeaderText="Kiểm duyệt" />
                                        <asp:TemplateField HeaderText="Xem">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgBtDetail" runat="server" CommandName='<%#Eval("IDTour") %>'
                                                    ImageUrl="~/Images/Preview-icon.png" OnClick="imgBtDetail_Click" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Vé">
                                        <ItemTemplate>
                                        <asp:Button ID="btBooking" runat="server" Text="Vé" class="btn" 
                                                CommandName='<%#Eval("IDTour") %>' onclick="btBooking_Click"/>
                                        </ItemTemplate>
                                        </asp:TemplateField>
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
                                <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
                            </div>
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
            <%--</ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger ControlID="imgBtDetail" EventName="Click" />

            </Triggers>
        </asp:UpdatePanel>--%>
                            
</asp:Content>
