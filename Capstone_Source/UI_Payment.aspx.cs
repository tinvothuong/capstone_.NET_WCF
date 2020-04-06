using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Payment : System.Web.UI.Page
{
    FunctionMethod fc = new FunctionMethod();
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tour"] == null || Request.QueryString["customer"] == null || Request.QueryString["numbertickets"]==null)
            Response.Redirect("UI_Tour.aspx");
        else
        {
            string tour = Request.QueryString["tour"];
            string customer = Request.QueryString["customer"];
            lbAddress.Text = fc.getCustomer("Address", customer);
            lbName.Text = fc.getCustomer("FullName", customer);
            lbMail.Text = fc.getCustomer("Email", customer);
            lbPhone.Text = fc.getCustomer("Phone", customer);
            //Tour
            lbIDTour.Text = tour;
            double price = Double.Parse(fc.getTour("PriceTour", tour));
            lbPrice.Text = price.ToString();
            int numberTicket = int.Parse(Request.QueryString["numbertickets"]);
            lbNumber.Text = "" + numberTicket;
            lbNameTour.Text = fc.getTour("NameTour", tour);
            double total = price * numberTicket;
            lbMoney.Text = "" + total;
         
        }
    }
    protected void btPayment_Click(object sender, EventArgs e)
    {
        //update Total Amount
        string tour = Request.QueryString["tour"];
        string customer = Request.QueryString["customer"];
        string qr = "select top 1 IDBooking from BookingTour where IdentityCard ='"
            + customer + "' and IDTour = '" + tour + "' order by IDBooking desc";
        string idBooking = cnDb.getOneData(qr).ToString();
        string qrUpdateBooking = "update BookingTour set TotalAmount = '"+lbMoney.Text+"' where IDBooking='"+idBooking+"'";
        cnDb.xlExecuteNonQuery(qrUpdateBooking);
        //Thanh toán
        string receiver = fc.getTour("EmailNganLuongAcc", tour);
        string returnURL = "http://localhost:2125/Capstone_Source/UI_HomePage.aspx";
        string linkNganLuong = "https://www.nganluong.vn/button_payment.php?receiver="
            +receiver+"&product_name="+lbNameTour.Text
            +"&price="+lbMoney.Text+"&return_url="+returnURL+"&comments="+customer+"";
        Response.Redirect(linkNganLuong);

    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        //update Total Amount
        string tour = Request.QueryString["tour"];
        string customer = Request.QueryString["customer"];
        string qr = "select top 1 IDBooking from BookingTour where IdentityCard ='"
            + customer + "' and IDTour = '" + tour + "' order by IDBooking desc";
        string idBooking = cnDb.getOneData(qr).ToString();
        string qrDeleteBooking = "delete from BookingTour where IDBooking='" + idBooking + "'";
        cnDb.xlExecuteNonQuery(qrDeleteBooking);
    }
}