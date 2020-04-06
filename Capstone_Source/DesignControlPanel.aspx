<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignControlPanel.aspx.cs" Inherits="DesignControlPanel" %>

<%@ Register src="UC_MenuControlPanel.ascx" tagname="UC_MenuControlPanel" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Control Panel</title>
    
    
    <link href="CSSControlPanel/stylesheets.css" rel="stylesheet" type="text/css" />
    <link rel='stylesheet' type='text/css' href='CSSControlPanel/fullcalendar.print.css' media='print' />
    
    <script type='text/javascript' src='JSControlPanel/jquerymin17.js'></script>
    <script type='text/javascript' src='JSControlPanel/jquery-uimin18.js'></script>
    <script type='text/javascript' src='JSControlPanel/plugins/jquery/jquery.mousewheel.min.js'></script>
    
    <script type='text/javascript' src='JSControlPanel/plugins/cookie/jquery.cookies.2.2.0.min.js'></script>
    
    <script type='text/javascript' src='JSControlPanel/plugins/bootstrap.min.js'></script>
    
    <script type='text/javascript' src='JSControlPanel/plugins/charts/jquery.flot.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/charts/jquery.flot.stack.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/charts/jquery.flot.pie.js'></script>
    <script type='text/javascript' src='JSControlPanel/plugins/charts/jquery.flot.resize.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/sparklines/jquery.sparkline.min.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/fullcalendar/fullcalendar.min.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/select2/select2.min.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/uniform/uniform.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/maskedinput/jquery.maskedinput-1.3.min.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/validation/languages/jquery.validationEngine-en.js' charset='utf-8'></script>
    <script type='text/javascript' src='JSControlPanel/plugins/validation/jquery.validationEngine.js' charset='utf-8'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js'></script>
    <script type='text/javascript' src='JSControlPanel/plugins/animatedprogressbar/animated_progressbar.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/qtip/jquery.qtip-1.0.0-rc3.min.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/cleditor/jquery.cleditor.js'></script>    
    <script type='text/javascript' src='JSControlPanel/plugins/dataTables/jquery.dataTables.min.js'></script>        
    <script type='text/javascript' src='JSControlPanel/plugins/fancybox/jquery.fancybox.pack.js'></script>    
    <script type='text/javascript' src='JSControlPanel/cookies.js'></script>
    <script type='text/javascript' src='JSControlPanel/actions.js'></script>
    <script type='text/javascript' src='JSControlPanel/charts.js'></script>
    <script type='text/javascript' src='JSControlPanel/plugins.js'></script>


</head>
<body>
    <form id="form1" runat="server">
    <!--Header-->
       <div class="header">
            <a class="logo" href="#">
                <span style="font-size:large; font-family:Arial; font-weight:bold; color:White; padding-left:10px">Express Travel -  Control Panel</span>
            </a>
            <ul class="header_menu">
                <li class="list_icon"><a href="#">&nbsp;</a></li>
            </ul>    
        </div>
    <!--End Header-->
     <!--Menu-->
     <div class="menu">                
        
        <div class="breadLine">            
            <div class="arrow"></div>
            <div class="adminControl active">
                Hi, Ten nguoi dung
            </div>
        </div>
        
        <div class="admin" style="display: block;">
            <div class="image">
                <img src="img/users/aqvatarius.jpg" class="img-polaroid">                
            </div>
            <ul class="control">                
                
                <li><span class="icon-cog"></span> <a href="#Profile">Profile</a></li>
                <li><span class="icon-share-alt"></span> <a href="#Login">Logout</a></li>
            </ul>
            
        </div>
        <!--Menu-->
         <div style="margin-top:100px"> <!--Design xong bo Margin-->
         
             <uc1:UC_MenuControlPanel ID="UC_MenuControlPanel1" runat="server" />
         
         </div>

        <!---End Menu-->
        <div class="dr"><span></span></div>
        
        <div class="widget-fluid">
            <div id="menuDatepicker" class="hasDatepicker">
            <div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;">
            <div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
            <a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="Prev">
            <span class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="Next">
            <span class="ui-icon ui-icon-circle-triangle-e">Next</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-month"></span>&nbsp;<span class="ui-datepicker-year"></span></div></div><table class="ui-datepicker-calendar">
            <thead><tr><th class="ui-datepicker-week-end"><span title="Sunday">Su</span></th><th><span title="Monday">Mo</span></th><th><span title="Tuesday">Tu</span></th><th><span title="Wednesday">We</span></th><th><span title="Thursday">Th</span></th><th><span title="Friday">Fr</span></th><th class="ui-datepicker-week-end"><span title="Saturday">Sa</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">1</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">2</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">3</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">4</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">8</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">9</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">10</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">11</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">15</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">16</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">17</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">18</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">22</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">23</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-current-day ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default ui-state-highlight ui-state-active ui-state-hover" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2013"><a class="ui-state-default" href="#">30</a></td></tr></tbody></table></div></div>
        </div>               
        
        <div class="dr"><span></span></div>
            <div class="widget-fluid">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    ShowGridLines="True" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </div>
         <div class="dr"><span></span></div>
    </div><!---End thanh ben trai-->
    <!---Content-->
     <div class="content">
        <div class="breadLine">
            <ul class="breadcrumb">
                <li><a href="#">Control Pannel</a> <span class="divider">&gt;</span></li>                
                <li class="active">Profile</li>
            </ul>
        </div>
        <!---Khung làm việc-->
        <div class="workplace">
          



        </div> <!--End Khung làm việc-->
       
     </div> <!---end Content-->
     <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>

    </form>
</body>
</html>
