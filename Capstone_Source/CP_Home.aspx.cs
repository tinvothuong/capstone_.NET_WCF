using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_Home : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserLogin"] == null || Session["UserLogin"] == "")
            Response.Redirect("CP_Login.aspx");
        else
        {
            try
            {
                lbTotalArticle.Text = cnDb.getOneData("select COUNT(1) from Article").ToString();
                lbVerifyArticle.Text = "Kiểm duyệt: " + cnDb.getOneData("select COUNT(1) from Article where Verify='true'").ToString();
                lbCity.Text = "Thành phố: " + cnDb.getOneData("select COUNT(1) from City").ToString();
                lbComment.Text = "Bình luận: " + cnDb.getOneData("select COUNT(1) from Comment").ToString();
                lbCategory.Text = "Danh mục: " + cnDb.getOneData("select COUNT(1) from Category").ToString();
                lbTour.Text = cnDb.getOneData("select COUNT(1) from TourInfor").ToString();
                lbVerifyTour.Text = "Kiểm duyệt: " + cnDb.getOneData("select COUNT(1) from TourInfor where Verify='true'").ToString();
                lbNumberBook.Text = "Số vé được đặt: " + cnDb.getOneData("select sum(NumberOfTickets) from BookingTour");
                lbTotalCost.Text = "Doanh thu: " + cnDb.getOneData("select sum(TotalAmount) from BookingTour") + " VNĐ";
                lbCompany.Text = cnDb.getOneData("select COUNT(1) from TourCompany").ToString();
                lbVerifyCompany.Text = "Kiểm duyệt: " + cnDb.getOneData("select COUNT(1) from TourCompany where Verify='true'").ToString();
                lbCustomer.Text = "Khách hàng: " + cnDb.getOneData("select COUNT(1) from Customer").ToString();
            }
            catch (Exception) {
                cnDb.conn.Close();
            }
        }       
        
       
       
    }
    public string getUser()
    {
        return Session["UserLogin"].ToString();
    }
}