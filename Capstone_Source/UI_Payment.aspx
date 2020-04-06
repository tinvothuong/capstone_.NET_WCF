<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_Payment.aspx.cs" Inherits="UI_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="padding: 10px; color: blue; font-weight: bold">
        Thông tin đặt Tour</p>
    <div style="color: Navy; padding-left: 40px; line-height: 200%">
        <div style="width: 25%; float: left">
            ID Tour:</div>
        <div style="width: 75%">
            <asp:Label ID="lbIDTour" runat="server" Text="0000001" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Tên Tour:</div>
        <div style="width: 75%">
            <asp:Label ID="lbNameTour" runat="server" Text="Hà Nội - Đà nẵng - Sài Gòn" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Họ tên:</div>
        <div style="width: 75%">
            <asp:Label ID="lbName" runat="server" Text="Võ Thương Tín" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Địa chỉ:</div>
        <div style="width: 75%">
            <asp:Label ID="lbAddress" runat="server" Text="K36/3 Quang Trung, Đà Nẵng" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Điện thoại:</div>
        <div style="width: 75%">
            <asp:Label ID="lbPhone" runat="server" Text="0947843356" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Email:
        </div>
        <div style="width: 75%">
            <asp:Label ID="lbMail" runat="server" Text="thuongtin@gmail.com" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Số lượng vé:
        </div>
        <div style="width: 75%">
            <asp:Label ID="lbNumber" runat="server" Text="0" Font-Bold="True"></asp:Label></div>
        <div style="width: 25%; float: left">
            Giá vé:
        </div>
        <div style="width: 75%">
            <asp:Label ID="lbPrice" runat="server" Text="0" Font-Bold="True"></asp:Label>
            &nbsp VNĐ
        </div>
        <div style="width: 25%; float: left">
            Tổng tiền:
        </div>
        <div style="width: 75%">
            <asp:Label ID="lbMoney" runat="server" Text="10000" Font-Bold="True" ForeColor="Red"></asp:Label>
            &nbsp VNĐ</div>
    </div>
    <p>**Vui lòng thanh toán trước 24 giờ tới. Chúng tôi sẽ hủy giao dịch nếu quá thời hạn này</p>
    <p style="text-align: center; padding: 20px">
        <asp:Button ID="btCancel" runat="server" Text="Hủy giao dịch" class="btn" 
            onclick="btCancel_Click" />
        &nbsp&nbsp&nbsp
        <asp:Button ID="btPayment" runat="server" Text="Tiếp tục thanh toán" class="btn"
            OnClick="btPayment_Click" />
        <br />
        <br />
        <br />
        <img src="Images/chapnhanthanhtoan.png" alt="Chấp nhận thanh toán tối ưu qua ngân lượng" />
    </p>
</asp:Content>
