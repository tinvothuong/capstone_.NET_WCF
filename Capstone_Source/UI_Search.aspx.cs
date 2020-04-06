using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Search : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["option"] == null || Request.QueryString["key"] == null || Request.QueryString["zone"] == null)
        {
            //no get DATA
            lbTitle.Text = "";
        }
        else {
            string query = ""; ;
            string option = Request.QueryString["option"].ToString();
            string key = Request.QueryString["key"].ToString();
            string zone = Request.QueryString["zone"].ToString();
            lbTitle.Text = "Kết quả tìm kiếm cho từ khóa: " + key;
            if (option == "article")
            {
                if (key == "all")
                    query = "select top 100 IDArticle, Title, Image, substring(Contents,0,150) as Content from Article "
                        + "where Verify ='1' ORDER BY IDArticle DESC";
                else
                    query = "select top 100 IDArticle, Title, Image, substring(Contents,0,150) as Content from Article "
                         + "where Verify ='1' and Title like N'%" + key + "%' ORDER BY IDArticle DESC";

                //Data Article
                object tbTT = cnDb.xlDataDSet(query);
                dtLContent.DataSource = tbTT;
                dtLContent.DataBind();
            }
            else {
                if (key == "all")
                {
                    query = "select top 30 * from TourInfor where Verify = 'TRUE' "
                         + "and DepartDate > (GETDATE()+2) and IDZone ='" + zone + "'";
                }
                else
                    query = "select top 30 * from TourInfor where Verify = 'TRUE' "
                         + "and DepartDate > (GETDATE()+2) and IDZone ='" + zone + "' and NameTour like N'%"+key+"%'";
                //Data tour
                object dtTour = cnDb.xlDataDSet(query);
                dtlTour.DataSource = dtTour;
                dtlTour.DataBind();
            }


        }
    }
}