<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage-ControlPanel.master" AutoEventWireup="true" CodeFile="CP_Home.aspx.cs" Inherits="CP_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h1 style="color:Blue">TRANG CHỦ QUẢN TRỊ - EXPRESS TRAVEL SYSTEM</h1>
   <br /><br />
   <div class="row-fluid">

                <div class="span4">                    

                    <div class="wBlock red">                        
                        <div class="dSpace">
                            <h3>BÀI VIẾT</h3>                           
                                <canvas width="44" height="16" style="display: inline-block; width: 44px; height: 16px; vertical-align: top;"></canvas>
                            </span>
                            <span class="number">
                                <asp:Label ID="lbTotalArticle" runat="server" Text="0" Font-Size="Larger"></asp:Label></span>                    
                        </div>
                        <div class="rSpace">
                            <span><asp:Label ID="lbVerifyArticle" runat="server" Text="Kiểm duyệt : 0"></asp:Label></span>
                            <span><asp:Label ID="lbCity" runat="server" Text="Thành phố : 0"></asp:Label></span>
                            <span><asp:Label ID="lbComment" runat="server" Text="Bình luận : 0"></asp:Label></span>
                            <span><asp:Label ID="lbCategory" runat="server" Text="Danh mục : 0"></asp:Label></span>
                        </div>                          
                    </div>                     
                    
                </div>                
                
                <div class="span4">                    

                    <div class="wBlock green">                        
                        <div class="dSpace">
                            <h3>TOUR DU LỊCH</h3>                            
                                <canvas width="64" height="16" style="display: inline-block; width: 64px; height: 16px; vertical-align: top;"></canvas>
                            </span>
                            <span class="number"><asp:Label ID="lbTour" runat="server" Text="0" Font-Size="Larger"></asp:Label></span>                    
                        </div>
                        <div class="rSpace">
                            <span><asp:Label ID="lbVerifyTour" runat="server" Text="Kiểm duyệt : 0"></asp:Label></span>
                            <span><asp:Label ID="lbNumberBook" runat="server" Text="Số vé được đặt: 0"></asp:Label></span>
                            <span><asp:Label ID="lbTotalCost" runat="server" Text="Doanh thu: 0 VNĐ"></asp:Label></span>
                        </div>                          
                    </div>                    
                    <div class="clear"></div>                    
                    
                </div>

                <div class="span4">                    

                    <div class="wBlock blue">
                        <div class="dSpace">
                            <h3>CÔNG TY DU LỊCH</h3>                           
                            <canvas width="89" height="16" style="display: inline-block; width: 89px; height: 16px; vertical-align: top;"></canvas></span>  
                            <span class="number"><asp:Label ID="lbCompany" runat="server" Text="0" Font-Size="Larger"></asp:Label></span>
                        </div>
                        <div class="rSpace">     
                        <br />                                                    
                            <span><asp:Label ID="lbVerifyCompany" runat="server" Text="Kiểm duyệt: 1"></asp:Label></span> 
                            <span><asp:Label ID="lbCustomer" runat="server" Text="Khách hàng: 0"></asp:Label></span>                                                                             
                        </div>
                    </div>                      
                    
                </div>             
                   
            </div>
            
</asp:Content>

