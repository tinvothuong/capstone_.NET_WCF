<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master" EnableEventValidation="false"
    AutoEventWireup="true" CodeFile="CP_Contact.aspx.cs" Inherits="CP_Contact" %>

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
    <div>
        <div class="page-header">
            <h1 style="color: Blue">
                LIÊN HỆ</h1>
        </div>
       <div style="padding: 10px; color: Navy">
           <asp:Label ID="lbThongKe" runat="server" Text="0"></asp:Label></div>
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Danh sách các liên hệ</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="block-fluid">
                <div id="tSortable_2_wrapper">
                    <asp:GridView ID="grvContact" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Font-Names="Tahoma" Width="100%" 
                        CssClass="tftable">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Chọn">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IDContact" HeaderText="ID" />
                            <asp:BoundField DataField="Tiltle" HeaderText="Tiêu đề" />
                            <asp:BoundField DataField="FullName" HeaderText="Họ tên" />
                            <asp:BoundField DataField="Address" HeaderText="Địa chỉ" />
                            <asp:BoundField DataField="Date" HeaderText="Ngày" />
                            <asp:CheckBoxField DataField="Contacted" HeaderText="Đã liên hệ" >
                            <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:CheckBoxField>
                            <asp:TemplateField HeaderText="Chi tiết">
                            <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName ='<%#Eval("IDContact") %>'
                                ImageUrl="~/Images/Preview-icon.png" onclick="ImageButton1_Click"/>
                            </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
            </div>
        </div>
    </div>
    <div style="text-align:center; padding:10px">
        <asp:Button ID="btContacted" runat="server" Text="Đã liên hệ" class="btn" 
            onclick="btContacted_Click"/> &nbsp &nbsp
        <asp:Button ID="btUnContacted" runat="server" Text="Chưa liên hệ" class="btn" 
            onclick="btUnContacted_Click"/></div>
</asp:Content>
