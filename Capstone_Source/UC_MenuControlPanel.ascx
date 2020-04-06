<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_MenuControlPanel.ascx.cs"
    Inherits="UC_MenuControlPanel" %>
<div>
    <ul class="navigation">
        <li causesvalidation="False"><a href="CP_Home.aspx"><span class="isw-grid"></span><span
            class="text">Home</span> </a></li>
        <li causesvalidation="False"><a href="javascript:;" onserverclick="Article_Click"
            runat="server" causesvalidation="False"><span class="isw-grid"></span><span class="text">
                Quản trị bài viết</span> </a></li>
        <li causesvalidation="False"><a href="javascript:;" onserverclick="TourManagement_Click"
            runat="server" causesvalidation="False"><span class="isw-grid"></span><span class="text">
                Quản trị Tour</span> </a></li>
        <li causesvalidation="False"><a href="javascript:;" onserverclick="TourCompany_Click"
            runat="server" causesvalidation="False"><span class="isw-grid"></span><span class="text">
                Quản lý Công ty Tour</span> </a></li>
        <li causesvalidation="False"><a href="javascript:;" onserverclick="Profile_Click"
            runat="server" causesvalidation="False"><span class="isw-grid"></span><span class="text">
                Tài khoản cá nhân </span></a></li>
        <li causesvalidation="False"><a href="javascript:;" onserverclick="MemberManagement_Click"
            runat="server" causesvalidation="False"><span class="isw-grid"></span><span class="text">
                Quản lý thành viên</span> </a></li>
        <!---->
        <li class="openable"><a href="#"><span class="isw-list"></span><span class="text">Khác</span>
        </a>
            <ul>
                <li causesvalidation="False"><a href="javascript:;" onserverclick="Contact_Click"
            runat="server" causesvalidation="False"><span class="icon-th"></span><span class="text">Liên hệ</span> </a>
                </li>
                <li causesvalidation="False"><a href="javascript:;" onserverclick="Terms_Click"
            runat="server" causesvalidation="False"><span class="icon-th-large"></span><span class="text">Điều khoản</span>
                </a></li>
                <li causesvalidation="False"><a href="javascript:;" onserverclick="Introduction_Click"
            runat="server" causesvalidation="False"><span class="icon-chevron-right"></span><span class="text">Giới thiệu</span>
                </a></li>
                <li causesvalidation="False"><a href="javascript:;" onserverclick="Log_Click"
            runat="server" causesvalidation="False"><span class="icon-fire"></span><span class="text">Log</span> </a>
                </li>
            </ul>
        </li>
        <!---->
    </ul>
</div>
