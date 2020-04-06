<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_BookingTour.aspx.cs" Inherits="UI_BookingTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="dtlDetailTour" runat="server" Width="100%">
        <ItemTemplate>
            <p style="color: Blue; font-weight: bold; padding: 20px">
                Tour du lịch:
                <%#Eval("NameTour")%>
            </p>
            <div id="title_category">
                THÔNG TIN TOUR
            </div>
            <%--Thông tin Tour--%>
            <div style="font-weight: bold; color: green; line-height: 150%">
                <div style="float: left; width: 40%; margin-left: 15px">
                    Mã tour:</div>
                <div>
                    <%#Eval("IDTour")%></div>
                <%--<div style="float: left; width: 40%; margin-left: 15px">
                   Điểm đến:</div>
                <div>
                    <%#Eval("DepartPosition")%></div>--%>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Khởi hành từ:</div>
                <div>
                    <%#Eval("DepartPosition")%></div>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Ngày đi</div>
                <div>
                    <%#DataBinder.Eval(Container.DataItem, "[DepartDate]", "{0:dd/MM/yyyy}")%></div>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Thời gian:</div>
                <div>
                    <%#Eval("Duration")%>
                </div>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Phương tiện:</div>
                <div>
                    <%#Eval("[TransMethod]")%></div>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Công ty:</div>
                <div>
                    <%#Eval("[IDCompany]")%></div>
                <div style="float: left; width: 40%; margin-left: 15px">
                    Giá:</div>
                <div>
                    <%#DataBinder.Eval(Container.DataItem, "PriceTour", "{0:#,###.##}")%>&nbsp;VNĐ</div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <%#Eval("NameTour")%>
    <div id="title_category">
        THÔNG TIN LIÊN LẠC
    </div>
    <div style="padding: 20px; line-height: 250%">
        <div style="float: left; width: 30%">
            Chứng minh thư
            <asp:Label ID="Label6" runat="server" Text="(*)" ForeColor="Red"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="txtIdentityCard" runat="server" class="inputs"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtIdentityCard"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtIdentityCard" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Họ tên
            <asp:Label ID="Label1" runat="server" Text="(*)" ForeColor="Red"></asp:Label></div>
        <div>
            <asp:TextBox ID="txtFullName" runat="server" class="inputs"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtFullName" ValidationExpression="^[\s\S]{4,50}$"></asp:RegularExpressionValidator></div>
        <br />
        <div style="float: left; width: 30%">
            Địa chỉ
            <asp:Label ID="Label2" runat="server" Text="(*)" ForeColor="Red"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="txtAddress" runat="server" class="inputs"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtAddress" ValidationExpression="^[\s\S]{4,50}$"></asp:RegularExpressionValidator>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Giới tính</div>
        <div>
            <asp:DropDownList ID="ddlGender" runat="server" Height="30px" Width="30%">
                <asp:ListItem>Nam</asp:ListItem>
                <asp:ListItem>Nữ</asp:ListItem>
                <asp:ListItem>Khác</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Số điện thoại
            <asp:Label ID="Label4" runat="server" Text="(*)" ForeColor="Red"></asp:Label></div>
        <div>
            <asp:TextBox ID="txtPhone" runat="server" class="inputs"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtPhone" ValidationExpression="^[\s\S]{10,20}$"></asp:RegularExpressionValidator>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Email
            <asp:Label ID="Label5" runat="server" Text="(*)" ForeColor="Red"></asp:Label></div>
        <div>
            <asp:TextBox ID="txtMail" runat="server" class="inputs"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtMail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Số vé đặt
            <asp:Label ID="Label3" runat="server" Text="(*)" ForeColor="Red"></asp:Label></div>
        <div>
            <asp:TextBox ID="txtNumber" runat="server" class="inputs" Text="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="(*)"
                ControlToValidate="txtNumber"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div style="float: left; width: 30%">
            Số vé còn:
        </div>
        <div>
            <asp:Label ID="lbVeCon" runat="server" Text="0" ForeColor="Red"></asp:Label></div>
        <br />
        <div style="text-align: center">
            <asp:Label ID="lbMess" runat="server" Text="Không đặt quá số lượng cho phép" ForeColor="Red"
                Visible="false"></asp:Label></div>
    </div>
    <div style="padding: 20px; text-align: center">
        <asp:Button ID="btThanhToan" runat="server" Text="Chấp nhận và thanh toán" class="btn"
            OnClick="btThanhToan_Click" /></div>
</asp:Content>
