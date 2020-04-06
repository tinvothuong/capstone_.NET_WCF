using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_HomePage : System.Web.UI.Page
{
    ConnectDatabase cnDtb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Slide news
            string id1 = cnDtb.getOneData("select top 1 * from (select top 1 * from Article order by IDArticle desc) q order by IDArticle asc").ToString();
            string id2 = cnDtb.getOneData("select top 1 * from (select top 2 * from Article order by IDArticle desc) q order by IDArticle asc").ToString();
            string id3 = cnDtb.getOneData("select top 1 * from (select top 3 * from Article order by IDArticle desc) q order by IDArticle asc").ToString();
            string id4 = cnDtb.getOneData("select top 1 * from (select top 4 * from Article order by IDArticle desc) q order by IDArticle asc").ToString();
            string img1 = cnDtb.getOneData("select Image from Article where IDArticle='" + id1 + "'").ToString();
            string img2 = cnDtb.getOneData("select Image from Article where IDArticle='" + id2 + "'").ToString();
            string img3 = cnDtb.getOneData("select Image from Article where IDArticle='" + id3 + "'").ToString();
            string img4 = cnDtb.getOneData("select Image from Article where IDArticle='" + id4 + "'").ToString();
            string title1 = cnDtb.getOneData("select Title from Article where IDArticle='" + id1 + "'").ToString();
            string title2 = cnDtb.getOneData("select Title from Article where IDArticle='" + id2 + "'").ToString();
            string title3 = cnDtb.getOneData("select Title from Article where IDArticle='" + id3 + "'").ToString();
            string title4 = cnDtb.getOneData("select Title from Article where IDArticle='" + id4 + "'").ToString();
            string content1 = cnDtb.getOneData("select left(Contents, 80) from Article where IDArticle='" + id1 + "'").ToString();
            string content2 = cnDtb.getOneData("select left(Contents, 80) from Article where IDArticle='" + id2 + "'").ToString();
            string content3 = cnDtb.getOneData("select left(Contents, 80) from Article where IDArticle='" + id3 + "'").ToString();
            string content4 = cnDtb.getOneData("select left(Contents, 80) from Article where IDArticle='" + id4 + "'").ToString();
            hiddenID1.Value = id1;
            hiddenID2.Value = id2;
            hiddenID3.Value = id3;
            hiddenID4.Value = id4;
            imgSmall1.ImageUrl = img1;
            imgSmall2.ImageUrl = img2;
            imgSmall3.ImageUrl = img3;
            imgSmall4.ImageUrl = img4;

            ImageBig1.ImageUrl = img1;
            ImageBig2.ImageUrl = img2;
            ImageBig3.ImageUrl = img3;
            ImageBig4.ImageUrl = img4;

            lbTitleSmall1.Text = title1;
            lbTitleSmall2.Text = title2;
            lbTitleSmall3.Text = title3;
            lbTitleSmall4.Text = title4;

            lbCtenTitle1.Text = title1;
            lbCtenTitle2.Text = title2;
            lbCtenTitle3.Text = title3;
            lbCtenTitle4.Text = title4;

            lbContent1.Text = content1;
            lbContent2.Text = content2;
            lbContent3.Text = content3;
            lbContent4.Text = content4;
            // End slide news

            //Category
            string qrCategory = "select * from Category where Priority != 0 ORDER BY Priority ASC";
            object dtMain = cnDtb.xlDataDSet(qrCategory);
            DataLMain.DataSource = dtMain;
            DataLMain.DataBind();
            //Article in Category
            foreach (DataListItem item in DataLMain.Items)
            {
                Label lb = (Label)item.FindControl("lbCategory");
                Label lbID = (Label)item.FindControl("lbIDCategory");
                DataList dtl = (DataList)item.FindControl("dtLContent");

                string qrTT = "select top 3 IDArticle, Title, Image, substring(Contents,0,230) as Content from Article where IDCategory = '" + lbID.Text + "' and Verify ='1' ORDER BY IDArticle DESC";
                object tbTT = cnDtb.xlDataDSet(qrTT);
                dtl.DataSource = tbTT;
                dtl.DataBind();
            }
        }
        catch (Exception) {
            cnDtb.conn.Close();
        }
       
        

    }
}