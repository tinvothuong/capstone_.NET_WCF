<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true" CodeFile="UI_DetailArticle.aspx.cs" Inherits="UI_DetailArticle" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>

<%@ Register src="UC_Comment.ascx" tagname="UC_Comment" tagprefix="uc1" %>

<%@ Register src="UC_OtherArticle.ascx" tagname="UC_OtherArticle" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    
    <asp:DataList ID="dtlDetail" runat="server">
        <ItemTemplate>
            <div style="padding:5px">
                <span>
                   <a href=""> <h4 style="float:left">
                       <%#Eval("NameCategory") %> >> </h4></a>
                   <h4>
                       <%#Eval("Title") %></h4>
                </span>
               <p style="text-align:right"> <%#Eval("DateOfPost") %> </p>
               <p style="padding:5px"> <%#Eval("Contents") %> </p>
       
            </div>
        </ItemTemplate>
     </asp:DataList>
    
    
    <div style="padding-left:4%">
         <cc1:GMap ID="GMap1" runat="server" />
    </div>
    <p style="font-style:italic; float:right; padding-right: 10px; margin-top: 10px"> <asp:Label ID="lbSource" runat="server" Text="Author"></asp:Label></p>
   
</div>
<br /><br />
<!--- Comment -->
<div style="width:100%; margin-bottom: 10px">


    <uc1:UC_Comment ID="UC_Comment1" runat="server" />


</div>
<div style="margin: 10px; padding:10px"></div>
<!--Tin mới -->
<div style="margin-top:10px">
    
    <uc2:UC_OtherArticle ID="UC_OtherArticle1" runat="server" />
    
</div>
</asp:Content>

