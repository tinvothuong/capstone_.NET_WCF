<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_OtherArticle.ascx.cs" Inherits="UC_OtherArticle" %>
<div style="width:95%; margin-top: 10px">
    <div id="title_category" style="width:95%">BÀI VIẾT MỚI</div>
    <div style="padding-left:10px">
        <asp:DataList ID="dtlArticle" runat="server">
            <ItemTemplate>
                <span>
                    <asp:Label ID="Label1" runat="server" Text=" :: " Font-Bold="True" 
                    ForeColor="Red"></asp:Label>
                    <a href="UI_DetailArticle.aspx?article=<%#Eval("IDArticle") %>"><asp:Label ID="Label2" runat="server" Text='<%#Eval("Title") %>' ForeColor="Blue"></asp:Label></a>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/newnew.gif" />
                </span>
            </ItemTemplate>
        </asp:DataList>
        
    </div>
</div>
