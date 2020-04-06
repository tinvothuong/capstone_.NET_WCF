<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignMain.aspx.cs" Inherits="DesignMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="CSS/stylesMain.css" rel="stylesheet" type="text/css" media="screen" />
    <!--
    <link href="CSS/Responsive.css" rel="stylesheet" type="text/css" media="screen and max-width: 1000px" />
    -->
    <script type="text/javascript" src="Scripts/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="Scripts/Javascrip.js"></script>
    <!--script search-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="Scripts/jquery.color.js"></script>
	<script type="text/javascript" src="Scripts/script.js"></script>
    <!--end script search-->
    <!---script menu doc--->
    <script type="text/javascript" src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src="Scripts/menu_jquery.js"></script>
    <script type="text/javascript">
        function slideSwitch() {
            var $active = $('#slideshow IMG.active');
            if ($active.length == 0) $active = $('#slideshow IMG:last');
            var $next = $active.next().length ? $active.next()
                        : $('#slideshow IMG:first');
            $active.addClass('last-active');
            $next.css({ opacity: 0.0 })
                    .addClass('active')
                    .animate({ opacity: 1.0 }, 1000, function () {
                        $active.removeClass('active last-active');
                    });
        }
        $(function () {
            setInterval("slideSwitch()", 5000);
        });

    </script>
    

</head>
<body>
    <form id="form1" runat="server">
    <!--Begin Content-->
    <div id="content">
        <div id="header">
    
	    <div id="logo">
        
		    <h1>&nbsp;&nbsp;&nbsp; <a href="#">Express Travel</a></h1>

		

	        </div>
            <!--Menu-->
	          <div class="xmenu"><ul id="xmenu"><li id="nl"></li>
           
                   <li><a class="hm" href="#" title="Express Travel" style="margin-top: -29px; ">Destination Information </a>
                   <a class="nm" href="#" title="Express Travel"> ..::Home page::. </a></li>
           
           
                   <li><a class="hm" href="#" title="Tour Travel" style="margin-top: -29px; ">-Tour Travel-</a>
                   <a class="nm" href="#" title="Tour Travel">-Tour Travel-</a></li>
          
                   <li><a class="hm" href="#" title="Contact" style="margin-top: -29px; ">-Contact-</a>
                   <a class="nm" href="#" title="Contact">-Contact-</a></li> 
           
                    
                   <li><a class="hm" href="#" title="About as" style="margin-top: -29px; ">-About as-</a>
                   <a class="nm" href="#" title="About as">-About as-</a></li>
           
                   <li><a class="hm" href="#" title="Register" style="margin-top: -29px; ">-Register-</a>
                   <a class="nm" href="#" title="Register">-Register-</a></li>          
                   <!--
                   <li><a class="hm" href="#" title="xxx" style="margin-top: -29px; ">xxx</a>
                   <a class="nm" href="#" title="xxx">xxx</a></li>
                   -->
                   <!--
                   <li class="last"><a class="hm" href="#" title=" zzzzzệ " rel="nofollow" style="margin-top: -29px; ">  -zzzzz-  </a>
                   <a class="nm" href="#" title="  zzzz  " rel="nofollow">   -zzzz-  </a></li>
                    -->
               
                   <li style="padding-top:3px">
                      
                   </li>          
              
                  
                </ul>
               
           </div>
              <!--End menu->
	        <!--Banner slide show-->
	        <div>
	           <div id="slideshow">
	  
            <img src="Banner/hl.gif" alt="Slideshow Image 1" />
            <img src="Banner/BannerTravel.jpg" alt="Slideshow Image 2" class="active"/>
            <img src="Banner/hl.gif" alt="Slideshow Image 3" />
            <img src="Banner/hp.jpg" alt="Slideshow Image 4" />
            <img src="Banner/cau rong.jpg" alt="Slideshow Image 5" />
            <img src="Banner/viet nam timeless.jpg" alt="Slideshow Image 6"  />
    
        </div>
	        </div>
            <!--end Banner slide show-->
        </div>	
        <!-- header ends -->
        <!-- Main begins -->
        <div id="main">
          
            <!-- DIV Left begin -->
            <div id ="left">
            <!--Category-->
            <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)">
               <div class="left_title"> //Destination </div>              
               <div class="left_content">
                   <div id="menu11">
                             
                           <asp:DataList ID="dtlCategory" runat="server" Width="100%">
                              
                                <ItemTemplate>
                                   <ul>
                                        <li style="list-style:none;"><a href='#' title='<%#Eval("NameCategory") %>'> <%#Eval("NameCategory")%></a></li>
                                   </ul>
                                    
                                </ItemTemplate>
                                
                            </asp:DataList>
                   
                    </div>
               
               </div>
               </div>
               <!--Enb Category-->
               <!--Tour-Dia diem -->
               <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)">
               <div class="left_title"> //Tour Travel </div>              
               <div class="left_content">
                   <div id="cssmenu">
                    <ul>
                       <li></li>
                       <li class="has-sub"><a href='#'><span>Mien Bac</span></a>
                          <ul>
                             <li><a href="#"><span>Ha noi</span></a></li>
                             <li><a href="#"><span>Quang Ninh</span></a></li>
                             <li class="last"><a href="#"><span>Mien Bac</span></a></li>
                          </ul>
                       </li>
                       <li class="has-sub"><a href='#'><span>Mien Nam</span></a>
                          <ul>
                             <li><a href="#"><span>Ho Chi Minh city</span></a></li>
                             <li class="last"><a href="#"><span>Can Tho</span></a></li>
                          </ul>
                       </li>
                       <li class="has-sub"><a href='#'><span>Mien Trung</span></a>
                          <ul>
                             <li><a href="#"><span>Quang Ngai</span></a></li>
                             <li><a href="#"><span>Hue</span></a></li>
                             <li><a href="#"><span>Da Nang</span></a></li>
                             <li><a href="#"><span>Khanh Hoa</span></a></li>
                             <li><a href="#"><span>Binh Thuan</span></a></li>
                          </ul>
                       </li>
                    </ul>
                    </div>
               
               </div>
               </div>
               <!--Enb Dia diem Tour-->
            </div>
            <!-- END DIV Left -->
            <!-- Main content MID Noi dung chinh trong nay-->
            <div id="mid-main">
                  <!-- Chữ chạy-->
                <div>
                    <marquee onmouseover="this.stop()" onmouseout="this.start()" direction="left" scrolldelay="2"
                        scrollamount="2">
		                <em><h4>.::Vietnam timeless charm - Việt Nam vẻ đẹp bất tận - 越南无尽的美感 - Вьетнам бесконечные красоты::.</h4></em></marquee>
                  
                </div>
                <!-- End chữ chạy-->
                <div>
                Noi dung chinh
                <br /> Content
                </div>
               
              

            </div>
            <!-- end Main content MID -->
            <!-- Div RIGHT -->
            <div id="right">
                <!--Search Tour--->
               <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)">
                     <div class="right_title">&nbsp;&nbsp;&nbsp; Search</div>
                     <div class="right_content">
                            Noi dung tim
                            <br />trong nay
                     </div>
               </div>
                <!--End Search Tour--->
                <!--Tour Moi nhat--->
                <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)"><!--Bong vien--->
                    <div class="right_title">&nbsp;&nbsp;&nbsp; New Tour</div>
                    <div class="right_content">
                        Noi dung tim
                        <br />trong nay
                    </div>
                </div>
                <!--End new Tour--->
                <!--Logo Tour Company--->
                <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)"><!--Bong vien--->
                    <div class="right_title">&nbsp;&nbsp;&nbsp; Tour Company</div>
                    <div class="right_content">
                         <marquee onmouseover="this.stop()" onmouseout="this.start()" direction="up" scrolldelay="2" scrollamount="1" height="200px">                    
                            &nbsp;<a href="#">&nbsp;<img width="100%" height="100%" alt="" src ="ImagesTourCompany/dtan.gif" /></a>            
                            &nbsp;<a href="#">&nbsp;<img width="100%" height="100%" alt="" src ="ImagesTourCompany/logo asiaworld.jpg" /></a>
                            <a href="#">&nbsp;<img width="100%" height="100%" alt="" src ="ImagesTourCompany/Victory_tour.jpg" /></a>
                        </marquee>
                    </div>
                </div>
                <!--End Logo company--->
                 <!--Dem truy cap--->
                <div style="box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1)"><!--Bong vien--->
                    <div class="right_title">&nbsp;&nbsp;&nbsp; Flag Counter</div>
                    <div class="right_content">
                      <a href="http://info.flagcounter.com/WDV7">
                      &nbsp;&nbsp;&nbsp;<img src="http://s05.flagcounter.com/count/WDV7/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_12/viewers_3/labels_1/pageviews_1/flags_0/" alt="Flag Counter" border="0"></a>
                    </div>
                </div>
                <!--End dem truy cap--->

            </div> <!---Div cua class right-->
            
            <!--END DIV RIGHT -->
            <div id="footer">
                <p>Copyright © 2014</p>
                <p>Design by O3T Group</p>
                <p>K7/25 Quang Trung St, Hai Chau, Da Nang city</p>
               
            </div>
        </div>
        <!-- Main end -->



    </div>
    <!--End Content-->
    </form>
</body>
</html>

