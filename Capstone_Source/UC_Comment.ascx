<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Comment.ascx.cs" Inherits="UC_Comment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<div style="width: 95%">
    <div id="title_category">
        Bình luận</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--Data-->
            <div style="margin: 5px">
                <asp:DataList ID="dtlComment" runat="server" Width="100%">
                    <ItemTemplate>
                        <div style="padding-top: 10px">
                            <span>
                                <%#Eval("ContentCom") %></span>
                            <div style="width: 95%; padding-bottom: 10px">
                                <span style="float: left">
                                    <h4>
                                        <%#Eval("Fullname") %></h4>
                                </span><span style="float: right">
                                    <h4>
                                        <%#Eval("Date") %></h4>
                                </span>
                            </div>
                        </div>
                        <br />
                        <hr style="border: 1px dashed #0000FF" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <!--Comment-->
                <div>
                    <div>
                        <div style="float: left; width: 50%">
                            <span>
                                <asp:TextBox ID="txtCommenter" runat="server" class="textbox" placeholder="Tên của bạn"
                                    Width="90%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqCommenter" runat="server" ErrorMessage="(*)" ControlToValidate="txtCommenter"></asp:RequiredFieldValidator>
                            </span>
                            <br />
                            <span>
                                <asp:TextBox ID="txtEmail" runat="server" class="textbox" placeholder="Email" Width="90%"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="vltEmail" runat="server" ErrorMessage="(*)" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </span>
                        </div>
                        <div style="float: right; width: 48%; padding-right: 5px">
                            <span>
                                <asp:TextBox ID="txtContent" runat="server" MaxLength="200" Height="75px" Width="90%"
                                    TextMode="MultiLine" class="textbox" placeholder="Nội dung"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rqContent" runat="server" ErrorMessage="(*)" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>
                    ..
                    <div style="width: 100%; height: auto">
                        <div style="float: left; padding-right: 10px">
                            <div style="float: left">
                                <cc1:CaptchaControl ID="CaptchaControl1" runat="server" CaptchaWidth="150" CaptchaLength="3"
                                    Width="150px" CaptchaHeight="32" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <asp:TextBox ID="txtCaptcha" runat="server" class="textbox" placeholder="Mã bảo vệ"
                                Width="100px"></asp:TextBox>
                            <asp:Label ID="lbMessCaptcha" runat="server" ForeColor="Red" Text="(*)" Visible="False"></asp:Label>
                        </div>
                        <div style="float: right; padding-right: 20px">
                            <asp:Button ID="btnComment" runat="server" Text="Bình luận" class="btn" OnClick="btnComment_Click" /></div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
