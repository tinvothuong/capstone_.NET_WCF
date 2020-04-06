using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_TourZone : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["zone"] == null)
        {
            Response.Redirect("UI_Tour.aspx");
        }
        else
        {
            lbZone.Text = "Vùng " + cnDb.getOneData("select ZoneName from Zone where IDZone ='" + Request.QueryString["zone"] + "'").ToString();
            string qr = "select top 30 * from TourInfor where Verify = 'TRUE' "
                + "and DepartDate > (GETDATE()+2) and IDZone ='"+Request.QueryString["zone"]+"'";
            object dtTour = cnDb.xlDataDSet(qr);
            dtlTour.DataSource = dtTour;
            dtlTour.DataBind();
        }
    }
}