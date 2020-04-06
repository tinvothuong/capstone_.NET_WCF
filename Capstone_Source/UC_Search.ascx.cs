using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UC_Search : System.Web.UI.UserControl
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            object dataCity = cnDb.xlDataDSet("select * from Zone order by ZoneName asc");
            ddlZone.DataSource = dataCity;
            ddlZone.DataTextField = "ZoneName";
            ddlZone.DataValueField = "IDZone";
            ddlZone.DataBind();
        }
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        string key = "";
        string zone = "";
        string option = "";
        if (rdoBt0.SelectedIndex == 0)
        {
            if (txtSearch.Text == "")
            {
                key = "all";
                zone = ddlZone.SelectedValue;
                option = "article";
            }
            else{
                key = txtSearch.Text;
                zone = ddlZone.SelectedValue;
                option = "article";
            }
              
        }
        else {
            if (txtSearch.Text == "")
            {
                key = "all";
                zone = ddlZone.SelectedValue;
                option = "tour";
            }
            else {
                key = txtSearch.Text;
                zone = ddlZone.SelectedValue;
                option = "tour";
            }
              
        }

        Response.Redirect("UI_Search.aspx?option="+option+"&zone="+zone+"&key="+key);
    }
}