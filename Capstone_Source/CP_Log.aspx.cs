using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_Log : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                binData();
            }
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
        binData();
    }
    private void binData() {
        object dt = cnDb.xlDataDSet("select * from Log order by DateTime DESC");
        grvTour.DataSource = dt;
        grvTour.DataBind();
        decodeUserName();
    }
    protected void grvTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvTour.PageIndex = e.NewPageIndex;
        binData();
    }
    protected void decodeUserName() // Decode UserName trong database
    {
        for (int i = 0; i < grvTour.Rows.Count; i++)
        {
            Label lb = (Label)grvTour.Rows[i].FindControl("lbUserName");
            lb.Text = func.DecodeFrom64(lb.Text);


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Thống kê
      //  string qr = "select * from Log where DateTime between '" + txtStart.Text + "' and '" + txtEnd.Text + "' order by DateTime DESC";
    }
}