using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_DetailTour : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tour"] == null)
            Response.Redirect("CP_Login.aspx");
        else {
            string id = Request.QueryString["tour"].ToString();
            lbTitle.Text = cnDb.getOneData("select NameTour from TourInfor where IDTour = '"+id+"'").ToString();
            lbContents.Text = cnDb.getOneData("select Description from TourInfor where IDTour = '" + id + "'").ToString();
        }
    }
}