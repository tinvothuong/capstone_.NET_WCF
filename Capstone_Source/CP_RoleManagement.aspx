<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_RoleManagement.aspx.cs" Inherits="CP_RoleManagement" %>

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
                QUẢN TRỊ QUYỀN HỆ THỐNG</h1>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Danh sách quyền</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="block-fluid">
                <div id="tSortable_2_wrapper">
                    <asp:GridView ID="grvRole" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" Font-Names="Tahoma" Width="100%" CssClass="tftable">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RoleName" HeaderText="Tên quyền" />
                            <asp:BoundField DataField="Description" HeaderText="Mô tả" />
                            <asp:CheckBoxField DataField="AddArticle" HeaderText="Thêm bài viết" />
                            <asp:CheckBoxField DataField="EditArticle" HeaderText="Sửa bài viết" />
                            <asp:CheckBoxField DataField="DeleteArticle" HeaderText="Xóa bài viết" />
                            <asp:CheckBoxField DataField="VerifyArticle" HeaderText="Kiểm duyệt bài viết" />
                            <asp:CheckBoxField DataField="VerifyTour" HeaderText="Kiểm duyệt Tour" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtEdit" runat="server" CausesValidation="false" ImageUrl="~/Images/Pencil-icon.png"
                                        OnClick="imgBtEdit_Click" CommandName='<%#Eval("IDRole") %>' />
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
                <div class="block-fluid">
                    <div class="row-form">
                        <%--button--%>
                      <%--  <input id="btnAdd" type="button" onclick="showDialog('newPerson');" value="Thêm mới quyền"
                            class="btn" />--%>
                        <asp:Button ID="btAddPannel" runat="server" Text="Thêm mới" 
                            CausesValidation="false" class="btn" onclick="btAddPannel_Click"/>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <!--Update form--->
        <asp:Panel ID="pnUpdate" runat="server" Visible="False">
            <div class="block-fluid">
                <div class="row-form">
                <div class="span1">
                        ID: &nbsp<asp:Label ID="lbID" runat="server" Text="0"></asp:Label></div>                    
                    <div class="span1">
                        Tên quyền</div>
                    <div class="span3">
                        <asp:TextBox ID="txtNameRole" runat="server" Width="80%"></asp:TextBox>                       
                        <asp:RequiredFieldValidator ID="rqName" runat="server" ErrorMessage="(*)" ControlToValidate="txtNameRole"></asp:RequiredFieldValidator>
                       
                    </div>
                   
                    <div class="span1">
                        Mô tả</div>
                    <div class="span4">
                        <asp:TextBox ID="txtDesc" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                            ControlToValidate="txtDesc"> </asp:RequiredFieldValidator>                           
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="row-form">
                  
                    <div class="span10">
                       <asp:CheckBox ID="cbAddArticle" runat="server" />Thêm bài viết &nbsp&nbsp&nbsp
                       <asp:CheckBox ID="cbEditArticle" runat="server" /> Sửa bài viết &nbsp&nbsp&nbsp
                       <asp:CheckBox ID="cbDeleteArticle" runat="server" /> Xóa bài viết &nbsp&nbsp&nbsp
                       <asp:CheckBox ID="cbVerifyArticle" runat="server" /> Kiểm duyệt bài viết &nbsp&nbsp&nbsp
                       <asp:CheckBox ID="cbVerifyTour" runat="server" /> Kiểm duyệt Tour &nbsp
                    </div>
                    <div class="clear">
                    </div>
                </div>               
               
                <div class="row-form">
                    <div class="span5" style="text-align: center">
                        <asp:Button ID="btAdd" runat="server" Text="Chỉnh sửa" class="btn" 
                            onclick="btAdd_Click" />&nbsp&nbsp&nbsp                        
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
</asp:Content>
