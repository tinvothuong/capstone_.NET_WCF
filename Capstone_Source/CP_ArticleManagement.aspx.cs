using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using AjaxControlToolkit;

public partial class CP_ArticleManagement : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
   
    private void getTableArticle() {
        string qr = "select * from Article left join Category on Category.IDCategory = Article.IDCategory ORDER BY IDArticle DESC";
        object tb = cnDb.xlDataDSet(qr);
        grvArticle.DataSource = tb;
        grvArticle.DataBind();

        //Phan trang
       
        //End Phan Trang


    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null)
            Response.Redirect("CP_Login.aspx");
        try
        {
            if (!IsPostBack)
            {
                getTableArticle();
               
            }
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
    }
    protected void btView_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Button bt = (Button)sender;
        String url = "CP_UpdateArticle.aspx?id=" + bt.CommandName;
        Response.Redirect(url);
      
    }
    private string getUser() {
        string user = Session["UserLogin"].ToString();
     //  return func.DecodeFrom64(user);
        return user;
    }
    protected void btVerify_Click(object sender, EventArgs e)//verify
    {
        string role = func.checkRole(getUser(), "VerifyArticle");
        if (role != "True")
            Response.Write("<script>alert('Bạn không có quyền thực hiện chức năng này')</script>");
        else {
            for (int i = 0; i < grvArticle.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)grvArticle.Rows[i].FindControl("cbSelect");
                if (cb.Checked)
                {
                    string idAr = grvArticle.Rows[i].Cells[1].Text;
                    string qrUpdate = "update Article set Verify = 'True' where IDArticle ='" + idAr + "'";
                    cnDb.xlExecuteNonQuery(qrUpdate);
                    func.logTask(getUser(), "Kiểm duyệt bài viết: "+idAr);
                }
            }
           // func.logTask(getUser(), "Kiểm duyệt một số bài viết");
            getTableArticle();
            //UpdatePanel2.Update();
           // Response.Write("<script>alert('Đã kiểm duyệt')</script>");            
        }
    }
    protected void btUnVerify_Click(object sender, EventArgs e)// Unverify
    {
        string role = func.checkRole(getUser(), "VerifyArticle");
        if (role != "True")
            Response.Write("<script>alert('Bạn không có quyền thực hiện chức năng này')</script>");
        else
        {
            for (int i = 0; i < grvArticle.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)grvArticle.Rows[i].FindControl("cbSelect");
                if (cb.Checked)
                {
                    string idAr = grvArticle.Rows[i].Cells[1].Text;
                    string qrUpdate = "update Article set Verify = 'False' where IDArticle ='" + idAr + "'";
                    cnDb.xlExecuteNonQuery(qrUpdate);
                    func.logTask(getUser(), "Hủy Kiểm duyệt bài viết: " + idAr);
                }
            }
           // func.logTask(getUser(), "Hủy kiểm duyệt một số bài viết");
            getTableArticle();
           // Response.Write("<script>alert('Thao tác thành công')</script>");
        }
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        //Delete Article
        string role = func.checkRole(getUser(), "DeleteArticle");
        if (role != "True")
            Response.Write("<script>alert('Bạn không có quyền thực hiện chức năng này')</script>");
        else
        {
            for (int i = 0; i < grvArticle.Rows.Count; i++)
            {
                CheckBox cb = (CheckBox)grvArticle.Rows[i].FindControl("cbSelect");
                if (cb.Checked)
                {
                    
                    string idAr = grvArticle.Rows[i].Cells[1].Text;
                    func.logTask(getUser(), "Xóa bài viết: "+idAr);
                    string qrUpdate = "delete from Article where IDArticle ='" + idAr + "'";
                    cnDb.xlExecuteNonQuery(qrUpdate);
                }
            }
         //   func.logTask(getUser(), "Xóa một số bài viết");
            getTableArticle();
         //   Response.Write("<script>alert('Đã xóa thành công')</script>");
        }

    }
    protected void btAddArticle_Click(object sender, EventArgs e)
    {
        Response.Redirect("CP_UpdateArticle.aspx");
    }

    protected void HtmlEditorExtender1_ImageUploadComplete(object sender, AjaxFileUploadEventArgs e)
    {
        string fullpath = Server.MapPath("~/ImagesArticle/") + e.FileName;
        var ajaxFileUpload = (AjaxFileUpload)sender;
        //HtmlEditorExtender1.AjaxFileUpload.SaveAs(fullpath);
        ajaxFileUpload.SaveAs(fullpath);
        e.PostedUrl = Page.ResolveUrl("~/ImagesArticle/" + e.FileName);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Thống kê
        try
        {
            string qr = "select * from Article join Category on Category.IDCategory = Article.IDCategory "
                +"and DateOfPost BETWEEN convert(datetime,'"
                + txtStart.Text + "', 103) and convert(datetime,'"
                + txtEnd.Text + "', 103)";
            object tb = cnDb.xlDataDSet(qr);
            grvArticle.DataSource = tb;
            grvArticle.DataBind();
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }

    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        {
            getTableArticle();
        }
        else
        {
            string qr = "select * from Article join Category on Category.IDCategory = Article.IDCategory " +
                "and Title like N'%" + txtSearch.Text + "%' or Contents like N'%" + txtSearch.Text + "%'";
            object dt = cnDb.xlDataDSet(qr);
            grvArticle.DataSource = dt;
            grvArticle.DataBind();
        }
    }
    protected void btCategory_Click(object sender, EventArgs e)
    {
        Response.Redirect("CP_Category.aspx");
    }
    protected void grvArticle_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvArticle.PageIndex = e.NewPageIndex;
        getTableArticle();
    }
}