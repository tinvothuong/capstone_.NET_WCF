using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Tour : System.Web.UI.Page
{
    FunctionMethod fc = new FunctionMethod();
    ConnectDatabase cnDB = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        string qr = "select * from TourInfor where Verify = 'TRUE' and DepartDate > (GETDATE()-2)";
        object dtTour = cnDB.xlDataDSet(qr);
        dtlTour.DataSource = dtTour;
        dtlTour.DataBind();
    }
}