<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_Category.aspx.cs" Inherits="UI_Category" %>

<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    
        <uc1:UC_Search ID="UC_Search1" runat="server" />
    
    </div>
    
    <div style="padding: 5px">
        <span>
            <h2>
                <asp:Label ID="lbNameCategory" runat="server" Text="Category"></asp:Label></h2>
        </span>
        <div>
            <asp:DataList ID="dtLContent" runat="server">
                <ItemTemplate>
                    <div style="border-color: Green; border-style: solid; border-width: thin; padding: 1px;
                        margin-top: 2px">
                        <div style="float: left; width: 70px; height: 70px; padding-right: 10px">
                            <a href="UI_DetailArticle.aspx?article=<%#Eval("IDArticle") %>">
                                <img src="<%#Eval("Image") %>" alt="" height="70px" width="70px" /></a>
                        </div>
                        <div style="height: 70px; padding-left: 10px">
                            <span style="font-size: large; font-weight: lighter"><a href="UI_DetailArticle.aspx?article=<%#Eval("IDArticle") %>">
                                <h4>
                                    <%#Eval("Title")%></h4>
                            </a></span><span>
                                <asp:Label ID="lbContent" runat="server" Text='<%#Eval("Content")%>'></asp:Label>
                            </span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
