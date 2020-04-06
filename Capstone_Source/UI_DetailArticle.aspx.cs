using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Subgurim.Controles;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Globalization;
public partial class UI_DetailArticle : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["article"] == null)
            Response.Redirect("UI_HomePage.aspx");
       try {
        string qr = "select * from Article, Category where Article.IDCategory =Category.IDCategory and Article.IDArticle = '" + Request.QueryString["article"] + "'";
        object tb = cnDb.xlDataDSet(qr);
        dtlDetail.DataSource = tb;
        dtlDetail.DataBind();
        lbSource.Text = cnDb.getOneData("select Source from Article where IDArticle = '" + Request.QueryString["article"] + "' ").ToString();

        }catch(Exception){
            Response.Redirect("UI_HomePage.aspx");
        }

       try
       {
           //Map
           GMap1.addControl(new GControl(GControl.preBuilt.GOverviewMapControl));
           GMap1.addControl(new GControl(GControl.preBuilt.LargeMapControl));
           string toaDo = cnDb.getOneData("select MapAdd from Article where IDArticle = '" + Request.QueryString["article"] + "' ").ToString();
           toaDo = toaDo.Trim();
           string[] kinhViDo = Regex.Split(toaDo, ",");
           double kinhDo = double.Parse(kinhViDo[0], System.Globalization.NumberStyles.Any, CultureInfo.InvariantCulture);
           double viDo = double.Parse(kinhViDo[1], System.Globalization.NumberStyles.Any, CultureInfo.InvariantCulture);
           GMarker marker = new GMarker(new GLatLng(kinhDo, viDo));         
           GInfoWindow window = new GInfoWindow(marker, "<center><b>Điểm đến</b></center>", true);
           GMap1.addInfoWindow(window);
       }catch(Exception){
            // Tọa độ sai
           GMap1.Visible = false;
       }

         


    }
}