using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_ListBookingTour : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["idTour"] == null)
            Response.Redirect("CP_Login.aspx");
        else {
            //if (!IsPostBack)
                loadData();
        }
    }
    private void loadData() {
        string id= Request.QueryString["idTour"].ToString();
        string qr = "select * from BookingTour, Customer "
              + " where BookingTour.IdentityCard= Customer.IdentityCard "
              + " and IDTour='" +id + "'";
        object dt = cnDb.xlDataDSet(qr);
        grvBookingTour.DataSource = dt;
        grvBookingTour.DataBind();

        string qrNumber = "select count(1) from BookingTour, Customer "
              + " where BookingTour.IdentityCard= Customer.IdentityCard "
              + " and IDTour='" + id + "'";
        string qrTotalCost = "select sum(TotalAmount) from BookingTour, Customer "
            + " where BookingTour.IdentityCard= Customer.IdentityCard "
            + " and IDTour='" + id + "'";
        string qrTickets = "select sum(NumberOfTickets) from BookingTour, Customer "
            + " where BookingTour.IdentityCard= Customer.IdentityCard "
            + " and IDTour='" + id + "'";
        try
        {
            lbNumber.Visible = true;
            lbNumber.Text = "Tổng số khách hàng: " + cnDb.getOneData(qrNumber).ToString();
            lbNameTour.Text = "Tour: " + cnDb.getOneData("select NameTour from TourInfor where IDTour='" + id + "'").ToString();
            lbCost.Text = "Tổng tiền: " + cnDb.getOneData(qrTotalCost).ToString() + " VNĐ";
            lbTickets.Text = "Tổng số vé được đặt: " + cnDb.getOneData(qrTickets).ToString();

        }
        catch (Exception) {
            cnDb.conn.Close();
           // lbNumber.Visible = false;
        }
    }
    protected void grvTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvBookingTour.PageIndex = e.NewPageIndex;
        loadData();
    }
}