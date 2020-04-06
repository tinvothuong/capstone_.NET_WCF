using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Introduction : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lbIntroduction.Text = cnDb.getOneData("select top 1 Contents from Introduction").ToString();
        }
        catch (Exception) {
            cnDb.conn.Close();
        }
    }
}