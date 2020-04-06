<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master"
    AutoEventWireup="true" CodeFile="CP_Terms.aspx.cs" Inherits="CP_Terms" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     <asp:ToolkitScriptManager ID="ToolkitScriptManager2" runat="server">
                    </asp:ToolkitScriptManager>
    <div>
        <div class="page-header">
            <h1 style="color: Blue">
                ĐIỀU KHOẢN</h1>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div class="head">
                    <div class="isw-grid">
                    </div>
                    <h1>
                        Thông tin</h1>
                    <div class="clear">
                    </div>
                </div>
            </div>
            <div class="block-fluid">
               <div class="row-form">
                <div class="span2">
                    Ngày chỉnh sửa cuối</div>
                <div class="span6">                   
                    <asp:Label ID="lbDate" runat="server" Text=""></asp:Label>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="row-form">
                <div class="span2">
                    Người chỉnh sửa</div>
                <div class="span2">
                    <asp:Label ID="lbUserName" runat="server" Text=""></asp:Label>
                </div>
                
                <div class="clear">
                </div>
            </div>
            
            <div class="row-form">
                <div class="span2">
                    Nội dung</div>
                <div class="span10">                   
                    <CKEditor:CKEditorControl ID="editorContent" runat="server" Skin="moonocolor" Language="en">
                    </CKEditor:CKEditorControl>
                     <asp:RequiredFieldValidator ID="rqTitle" runat="server" ErrorMessage="(*)"
                        ControlToValidate="editorContent"></asp:RequiredFieldValidator>
                </div>
                <div class="clear">
                </div>
            </div>
           
          
            <div class="row-form">
                <div style="text-align: center">                  
                    <asp:Button ID="btUpdate" runat="server" Text="Sửa đổi" class="btn" 
                        onclick="btUpdate_Click" />
                   
                </div>
                <div class="clear">
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
