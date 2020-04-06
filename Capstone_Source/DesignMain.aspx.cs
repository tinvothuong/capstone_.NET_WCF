using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class DesignMain : System.Web.UI.Page
{
    ConnectDatabase cnDtb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        // menu động Category
        string qrMenu = "select * from Category where Priority != 0 ORDER BY Priority ASC";
        object dt = cnDtb.xlDataDSet(qrMenu);
        dtlCategory.DataSource = dt;
        dtlCategory.DataBind();
    }
}