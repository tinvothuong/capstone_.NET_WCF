using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Category : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["category"] == null)
        {
            Response.Redirect("UI_HomePage.aspx");
        }
        try
        {
            lbNameCategory.Text = cnDb.getOneData("select NameCategory from Category where IDCategory='" + Request.QueryString["category"] + "'").ToString();
            string qrTT = "select top 100 IDArticle, Title, Image, substring(Contents,0,150) as Content from Article where IDCategory = '" + Request.QueryString["category"] + "' and Verify ='1' ORDER BY IDArticle DESC";
            object tbTT = cnDb.xlDataDSet(qrTT);
            dtLContent.DataSource = tbTT;
            dtLContent.DataBind();
        }
        catch (Exception) { }
    }
}