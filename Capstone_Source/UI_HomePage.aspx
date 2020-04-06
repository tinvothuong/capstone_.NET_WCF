<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_HomePage.aspx.cs" Inherits="UI_HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <!--Slide News-->
        <div>
            <div id="featured">
                <ul class="ui-tabs-nav">
                    <li class="ui-tabs-nav-item" id="nav-fragment-1"><a href="#11">
                        <asp:Image ID="imgSmall1" runat="server" Width="50px" Height="50px" />
                        <span>
                            <asp:Label ID="lbTitleSmall1" runat="server" Text="Label"></asp:Label></span></a></li>
                    <li class="ui-tabs-nav-item" id="nav-fragment-2"><a href="#2">
                        <asp:Image ID="imgSmall2" runat="server" Width="50px" Height="50px" />
                        <span>
                            <asp:Label ID="lbTitleSmall2" runat="server" Text="Label"></asp:Label></span></a></li>
                    <li class="ui-tabs-nav-item" id="nav-fragment-3"><a href="#fragment-3">
                        <asp:Image ID="imgSmall3" runat="server" Width="50px" Height="50px" />
                        <span>
                            <asp:Label ID="lbTitleSmall3" runat="server" Text="Label"></asp:Label></span></a></li>
                    <li class="ui-tabs-nav-item" id="nav-fragment-4"><a href="#fragment-4">
                        <asp:Image ID="imgSmall4" runat="server" Width="50px" Height="50px" />
                        <span>
                            <asp:Label ID="lbTitleSmall4" runat="server" Text="Label"></asp:Label></span></a></li>
                </ul>
                <!-- First Content -->
                <div id="11" class="ui-tabs-panel" style="">
                    <asp:Image ID="ImageBig1" runat="server" Width="100%" Height="100%" />
                    <div class="info">
                        <asp:HiddenField ID="hiddenID1" runat="server" />
                        <h2>
                            <a href="UI_DetailArticle.aspx?article=<%=hiddenID1.Value %>">
                                <asp:Label ID="lbCtenTitle1" runat="server" Text="Label"></asp:Label></a></h2>
                        <p>
                            <asp:Label ID="lbContent1" runat="server" Text="Label"></asp:Label>...<a href="UI_DetailArticle.aspx?article=<%=hiddenID1.Value %>">read
                                more</a></p>
                    </div>
                </div>
                <!-- Second Content -->
                <div id="2" class="ui-tabs-panel ui-tabs-hide" style="">
                    <asp:Image ID="ImageBig2" runat="server" Width="100%" Height="100%" />
                    <div class="info">
                        <asp:HiddenField ID="hiddenID2" runat="server" />
                        <h2>
                            <a href="UI_DetailArticle.aspx?article=<%=hiddenID2.Value %>">
                                <asp:Label ID="lbCtenTitle2" runat="server" Text="Label"></asp:Label></a></h2>
                        <p>
                            <asp:Label ID="lbContent2" runat="server" Text="Label"></asp:Label>...<a href="UI_DetailArticle.aspx?article=<%=hiddenID2.Value %>">read
                                more</a></p>
                    </div>
                </div>
                <!-- Third Content -->
                <div id="fragment-3" class="ui-tabs-panel ui-tabs-hide" style="">
                    <asp:Image ID="ImageBig3" runat="server" Width="100%" Height="100%" />
                    <div class="info">
                        <asp:HiddenField ID="hiddenID3" runat="server" />
                        <h2>
                            <a href="UI_DetailArticle.aspx?article=<%=hiddenID3.Value %>">
                                <asp:Label ID="lbCtenTitle3" runat="server" Text="Label"></asp:Label></a></h2>
                        <p>
                            <asp:Label ID="lbContent3" runat="server" Text="Label"></asp:Label>...<a href="UI_DetailArticle.aspx?article=<%=hiddenID3.Value %>">read
                                more</a></p>
                    </div>
                </div>
                <!-- Fourth Content -->
                <div id="fragment-4" class="ui-tabs-panel ui-tabs-hide" style="">
                    <asp:Image ID="ImageBig4" runat="server" Width="100%" Height="100%" />
                    <div class="info">
                        <h2>
                            <a href="UI_DetailArticle.aspx?article=<%=hiddenID4.Value %>">
                                <asp:Label ID="lbCtenTitle4" runat="server" Text="Label"></asp:Label></a></h2>
                        <p>
                            <asp:HiddenField ID="hiddenID4" runat="server" />
                            <asp:Label ID="lbContent4" runat="server" Text="Label">...</asp:Label><a href="UI_DetailArticle.aspx?article=<%=hiddenID4.Value %>">read
                                more</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!--end Slide News-->
        <!--Danh muc-->
        <div>
            <br />
        </div>
        <div>
            <asp:DataList ID="DataLMain" runat="server">
                <ItemTemplate>
                    <div id="title_category">
                        <%#Eval("NameCategory") %></h5><asp:Label ID="lbIDCategory" runat="server" Text='<%#Eval("IDCategory") %>'
                            Visible="False"></asp:Label>
                    </div>
                    <asp:DataList ID="dtLContent" runat="server">
                        <ItemTemplate>
                            <div style="border-color: Green; border-style: solid; border-width: thin; padding: 1px;
                                margin-top: 2px">
                                <div style="float: left; width: 70px; height: 70px; margin-right: 10px">
                                    <a href="UI_DetailArticle.aspx?ariticle=<%#Eval("IDArticle") %>">
                                        <img src="<%#Eval("Image") %>" alt="" height="70px" width="70px" /></a>
                                </div>
                                <div style="height: 70px; padding-left: 10px; margin-left: 10px">
                                    <span style="font-size: large; font-weight: lighter"><a href="UI_DetailArticle.aspx?article=<%#Eval("IDArticle") %>">
                                        <h4>
                                            <%#Eval("Title")%></h4>
                                    </a></span><span>
                                        <asp:Label ID="lbContent" runat="server" Text='<%#Eval("Content")%>'></asp:Label>...
                                    </span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <div style="float: right; margin: 5px">
                        <a href="UI_Category.aspx?category=<%#Eval("IDCategory") %>">
                            <img src="Images/xemtatca.jpg" alt='<%#Eval("NameCategory") %>' />
                        </a>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
