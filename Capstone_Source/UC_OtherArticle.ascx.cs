using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UC_OtherArticle : System.Web.UI.UserControl
{
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        dtlArticle.DataSource = func.viewOtherArticle(Request.QueryString["article"]);
        dtlArticle.DataBind();

    }
}