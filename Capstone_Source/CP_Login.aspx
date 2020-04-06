<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CP_Login.aspx.cs" Inherits="CP_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>        
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

    <title>Login - Express Travel</title>

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
    
    <div class="loginBox">        
        <div class="loginHead">
            <asp:Label ID="lbTitle" runat="server" Text="Login-Express Travel" 
                Font-Size="Large" ForeColor="White" Font-Bold="True"></asp:Label>
        </div>
        <form class="form-horizontal" runat ="server">     
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>  
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
         
            <div class="control-group">
                <asp:TextBox ID="txtUser" runat="server" placeholder="Username"></asp:TextBox>
            </div>
            <div class="control-group">
                <asp:TextBox ID="txtPass" runat="server" placeholder="Password" 
                    TextMode="Password"></asp:TextBox>      
            </div>
            <div class="control-group" style="margin-bottom: 5px;">
                <asp:Label ID="lbMess" runat="server" Text="Sai Username hoặc Password" ForeColor="red" Visible=false></asp:Label>  
                <br />              
                Forgot your password? Contact the administrator.                                               
            </div>
            <div class="form-actions">
                <asp:Button ID="btSubmit" runat="server" Text="Sign in" class="btn btn-block" 
                    onclick="btSubmit_Click"/>
                
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>    
        </form>        
        
    </div>    
    
</body>
</html>
