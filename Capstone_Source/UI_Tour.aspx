﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-Main.master" AutoEventWireup="true"
    CodeFile="UI_Tour.aspx.cs" Inherits="UI_Tour" %>

<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div style="color:Blue; font-size:x-large; padding: 20px; font-weight:bold">
TOUR DU LỊCH
</div>
<div>
    <uc1:UC_Search ID="UC_Search1" runat="server" />
</div>
    <div style="margin-left: 25px">
        <div class="grid-block-container">
            <asp:DataList ID="dtlTour" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                <ItemStyle BorderColor="Gray" />
                <ItemTemplate>
                    <div class="grid-block slide" style="margin: 1px; border-style: dashed; border-color: #129643;
                        border-width: 1px">
                        <div class="caption">
                        <a href="UI_TourDetail.aspx?tour=<%#Eval("IDTour") %>" >
                            <h3>
                                <span style="color:Yellow"><%#Eval("NameTour")%></span>
                                <p style="width: 190px">
                                    <div>Ngày đi:<//div>
                                    <div style="float: right">
                                        <%#DataBinder.Eval(Container.DataItem, "[DepartDate]", "{0:dd/MM/yyyy}")%></div>
                                    <div>Khởi hành từ:<//div>
                                    <div style="float: right">
                                        <%#Eval("DepartPosition")%></div>
                                    <div>Thời gian:<//div>
                                    <div style="float: right">
                                        <%#Eval("Duration") %></div>
                                    <div>Phương tiện:<//div>
                                    <div style="float: right">
                                        <%#Eval("TransMethod") %></div>
                                        <div>Giá:<//div>
                                    <div style="float: right; color:Yellow">
                                        <%#DataBinder.Eval(Container.DataItem, "PriceTour", "{0:#,###.##}")%>&nbsp;VNĐ</div>
                                </p>
                            </h3>
                            </a>
                        </div>
                    <img src="<%#Eval("ImageTour") %>" width="180px" height="180px" alt=""/>
                    <div style="color:#129643; text-align:center"><h3><%#Eval("NameTour")%></h3></div>
                    <div style="color:red">
                    <h3><%#DataBinder.Eval(Container.DataItem, "PriceTour", "{0:#,###.##}")%> &nbsp;VNĐ</h3></div>
                    </div>
                    <!--/.grid-block-->
                </ItemTemplate>
            </asp:DataList>
        </div>
        <!--/.grid-container-->
    </div>
    <!---------- JS ---------->
    <script type="text/javascript">
        $(document).ready(function () {
            $('.standard').hover(
		function () {
		    $(this).find('.caption').show();


		},
		function () {
		    $(this).find('.caption').hide();
		}
	);
            $('.fade').hover(
		function () {
		    $(this).find('.caption').fadeIn(250);
		},
		function () {
		    $(this).find('.caption').fadeOut(250);
		}
	);
            $('.slide').hover(
		function () {
		    $(this).find('.caption').slideDown(250);
		},
		function () {
		    $(this).find('.caption').slideUp(250);
		}
	);
        });
    </script>
 
</asp:Content>
