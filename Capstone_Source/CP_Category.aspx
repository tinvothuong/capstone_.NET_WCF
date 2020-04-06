<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    EnableEventValidation="false" AutoEventWireup="true" CodeFile="CP_Category.aspx.cs"
    Inherits="CP_Category" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //dialog Add
            $('#newPerson').dialog({
                autoOpen: false,
                draggable: true,
                title: "Thêm mới Danh mục",
                width: 'auto',
                open: function (type, data) {
                    $(this).parent().appendTo("form");
                }
            });

            //dialog Edit
            $('#editPerson').dialog({
                autoOpen: false,
                draggable: true,
                title: "Sửa thông tin Danh mục",
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
                QUẢN TRỊ DANH MỤC</h1>
        </div>
        <div style="padding: 10px">
            <!--Bt Add new,...-->
            <input id="btnAdd" type="button" onclick="showDialog('newPerson');" value="Thêm mới Danh mục"
                class="btn" />
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Danh sách danh mục</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="block-fluid">
                <div id="tSortable_2_wrapper">
                    <!--Table-->
                    <asp:GridView ID="grvCategory" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" Font-Names="Tahoma" GridLines="None" CssClass="tftable">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IDCategory" HeaderText="Mã số" />
                            <asp:BoundField DataField="NameCategory" HeaderText="Tên Danh mục" />
                            <asp:BoundField DataField="Priority" HeaderText="Độ ưu tiên" NullDisplayText="0" />
                            <asp:TemplateField HeaderText="Thao tác">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgBtEdit" ImageUrl="~/Images/Pencil-icon.png" runat="server"
                                        AlternateText="Chỉnh sửa" OnClick="btEdit_Click" CommandName='<%#Eval("IDCategory") %>'
                                        CausesValidation="false" />
                                    <asp:ImageButton ID="imgBtDelete" ImageUrl="~/Images/Delete-icon.png" runat="server"
                                        AlternateText="Xóa" OnClick="btDelete_Click" CommandName='<%#Eval("IDCategory") %>'
                                        CausesValidation="false" />
                                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgBtDelete"
                                        ConfirmText="Bạn có chắc chắn muốn xóa? Xóa danh mục này sẽ làm mất một số bài viết.">
                                    </asp:ConfirmButtonExtender>
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
            </div>
        </div>
        *Độ ưu tiên bằng 0 sẽ không được hiển thị trên hệ thống. Độ ưu tiên càng nhỏ thì sẽ được xếp phía trên Danh mục
        <div style="text-align: center">
            <!--Button...-->
        </div>
    </div>
    <!--Insert form--->
    <div id='newPerson'>
        <div class="block-fluid">
            <div class="row-form">
                <div class="span1">
                    Tên Danh mục</div>
                <div class="span3">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqtxtName" runat="server" ErrorMessage="(*)" ControlToValidate="txtName">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span1">
                    Độ ưu tiên</div>
                <div class="span3">
                    <asp:DropDownList ID="ddlPri" runat="server">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span5" style="text-align: center">
                    <asp:Button ID="btAdd" runat="server" Text="Thêm mới" class="btn" OnClick="btAddCategory_Click" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
