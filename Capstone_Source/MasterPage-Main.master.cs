using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class MasterPage_Main : System.Web.UI.MasterPage
{
    ConnectDatabase cnDtb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        // menu động Category
        string qrMenu = "select * from Category where Priority != 0 ORDER BY Priority ASC";
        object dt = cnDtb.xlDataDSet(qrMenu);
        dtlCategory.DataSource = dt;
        dtlCategory.DataBind();
        //Menu Zone Tour
        string qrZone = "select * from Zone order by ZoneName ASC";
        object dtZone = cnDtb.xlDataDSet(qrZone);
        dtlTourZone.DataSource = dtZone;
        dtlTourZone.DataBind();
        //Hot Tour
        string qr = "select top 5 * from TourInfor where Verify = 'TRUE' and DepartDate > (GETDATE()-2)";
        object dtTour = cnDtb.xlDataDSet(qr);
        dtlTourHot.DataSource = dtTour;
        dtlTourHot.DataBind();



    }
}
