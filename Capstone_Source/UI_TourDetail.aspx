<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true" EnableEventValidation="false"
    CodeFile="UI_TourDetail.aspx.cs" Inherits="UI_TourDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Infor tour--%>
    <asp:DataList ID="dtlDetailTour" runat="server">
    <ItemTemplate>
    
    <div>
        <p style="color: Blue; font-size: large; font-weight: bold; padding: 20px">
            <%#Eval("NameTour")%>
        </p>
        <div style="color:#D2691E; font-weight: bold; line-height: 150%">
            <div style="float: left; width: 40%">
                <img src="<%#Eval("ImageTour")%>" alt="" width="100%" /><br /><br /><br /><br /><br />
            </div>
            <div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Mã tour:</div>
                <div>
                    <%#Eval("IDTour")%></div>
                 <%--<div style="float: left; width: 25%; margin-left: 15px">
                   Điểm đến:</div>
                <div>
                    <%#Eval("DepartPosition")%></div>--%>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Khởi hành từ:</div>
                <div>
                    <%#Eval("DepartPosition")%></div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Ngày đi</div>
                <div>
                    <%#DataBinder.Eval(Container.DataItem, "[DepartDate]", "{0:dd/MM/yyyy}")%></div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Thời gian:</div>
                <div><%#Eval("Duration")%>
                    </div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Phương tiện:</div>
                <div>
                    <%#Eval("[TransMethod]")%></div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Công ty:</div>
                <div>
                    <%#Eval("[IDCompany]")%></div>
                <div style="float: left; width: 25%; margin-left: 15px">
                    Giá:</div>
                <div>
                    <%#DataBinder.Eval(Container.DataItem, "PriceTour", "{0:#,###.##}")%>&nbsp;VNĐ</div>
                <%--<div style="float: left; width: 25%; margin-left: 15px">
                    Đặt tour:</div>--%>
                <div style="float: right; padding-right:30px">
                    <asp:Button ID="btBooking" runat="server" onclick="btBooking_Click" Text=">>Đặt Tour Này>>" class="btn" Width="142px" CommandName ='<%#Eval("IDTour") %>' /><br />
                    <a href="UI_BookingTour.aspx?tour=<%#Eval("IDTour") %>"> <img src="Images/btn-paynow-125.png" alt=""/></a></div>
            </div>
        </div>
       <%-- Content tour--%>
        <div style="margin-top: 150px">
            <%#Eval("Description")%>
        </div>
    </div>
    </ItemTemplate>
    </asp:DataList>
    
</asp:Content>
