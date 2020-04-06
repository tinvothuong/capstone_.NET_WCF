using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_TourDetail : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.QueryString["tour"] == null)
            Response.Redirect("UI_Tour.aspx");
        else{
             string id =Request.QueryString["tour"].ToString();
            string query = "select * from TourInfor where IDTour = '" + id + "'";
            object dt = cnDb.xlDataDSet(query);
            dtlDetailTour.DataSource = dt;
            dtlDetailTour.DataBind();
        }
    
    }
    protected void btBooking_Click(object sender, EventArgs e)
    {
        Button btBooking = (Button)sender as Button;
        Response.Redirect("UI_BookingTour.aspx?tour=" + btBooking.CommandName + "");
    }
    protected void imgBtBooking_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btBooking = (ImageButton)sender as ImageButton;
        Response.Redirect("UI_BookingTour.aspx?tour=" + btBooking.CommandName + "");
    }
}