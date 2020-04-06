using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CKFinder;
using System.Data;
public partial class CP_UpdateArticle : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fm = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null || Session["UserLogin"] == "")
            Response.Redirect("CP_Login.aspx");
        Response.Write("<title>Update Article</title>");
       
        try
        {
            if (!IsPostBack)
            {
                // List City and category
                getDropdownList();
                if (Request.QueryString["id"] == "" || Request.QueryString["id"]==null)
                {
                    // Add - form add
                    lbInfor.Text = "Thêm mới bài đăng";
                    btUpdate.Visible = false;
                    btAdd.Visible = true;
                }
                else { 
                    // Update from
                    lbInfor.Text = "Chỉnh sửa bài đăng";
                    btAdd.Visible = false;
                    btUpdate.Visible = true;
                    getArticle();
                }
            }
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
       // Response.Write("Hello, " + Session["UserLogin"]);



        CKFinder.FileBrowser fb = new FileBrowser();
        fb.BasePath = "ckfinder/";
        fb.SetupCKEditor(editorContent);
    }
    private string getIDArticle(){
        return Request.QueryString["id"];
    }
    //get
    private void getArticle() {
       
        txtTilte.Text = fm.getArticle("Title", getIDArticle());
        txtSource.Text = fm.getArticle("Source", getIDArticle());
        txtDate.Text = fm.getArticle("DateOfPost", getIDArticle());
        txtMapAdd.Text = fm.getArticle("MapAdd", getIDArticle());
        editorContent.Text = fm.getArticle("Contents", getIDArticle());
        ddlCity.SelectedValue =fm.getArticle("IDCity", getIDArticle());
        ddlCategory.SelectedValue = fm.getArticle("IDCategory", getIDArticle());
      
    }
    //Edit Article
    protected void btUpdate_Click(object sender, EventArgs e)
    {
        string dir = fm.getArticle("Image", getIDArticle());
        if (FileUploadImages.HasFile)
        {
            FileUploadImages.SaveAs(Server.MapPath("~/ImagesArticle/images/") + FileUploadImages.FileName);
            //dir = "ImagesArticle/images/" + FileUploadImages.PostedFile.FileName;
            dir = "ImagesArticle/images/" + FileUploadImages.FileName;
        }
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("updateArticle", cnDb.conn);
        cmd.CommandText = "updateArticle";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@IDArticle", getIDArticle());
        cmd.Parameters.AddWithValue("@Title", txtTilte.Text);
        cmd.Parameters.AddWithValue("@Contents", editorContent.Text);
       // var today = DateTime.Now;
        //var duration = new TimeSpan(0, 0, 0, 0);
        //DateTime day = today.Add(duration);
       // cmd.Parameters.AddWithValue("@DateOfPost", day);
        cmd.Parameters.AddWithValue("@Source", txtSource.Text);        
        cmd.Parameters.AddWithValue("@MapAdd", txtMapAdd.Text);
        cmd.Parameters.AddWithValue("@IDCategory", ddlCategory.SelectedValue);
        cmd.Parameters.AddWithValue("@IDCity", ddlCity.SelectedValue);
        cmd.Parameters.AddWithValue("@UserName", Session["UserLogin"]);
        cmd.Parameters.AddWithValue("@Image", dir);       
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
        fm.logTask(Session["UserLogin"].ToString(), "Edit bài viết: " + txtTilte.Text);
        Response.Write("<script>alert('Bạn đã cập nhật thành công')</script>");
    }
    // List City and category
    private void getDropdownList() {
        string qrDM = "select * from Category";
        object ds = cnDb.xlDataDSet(qrDM);
        ddlCategory.DataTextField = "NameCategory";
        ddlCategory.DataValueField = "IDCategory";
        ddlCategory.DataSource = ds;
        ddlCategory.DataBind();
        object dbCity = cnDb.xlDataDSet("select * from City");
        ddlCity.DataTextField = "CityName";
        ddlCity.DataValueField = "IDCity";
        ddlCity.DataSource = dbCity;
        ddlCity.DataBind();
    }

   // Add new Article
    protected void btAdd_Click(object sender, EventArgs e)
    {
        if (!FileUploadImages.HasFile) // Null image
            lbMessFile.Visible = true;
        else
        {
            lbMessFile.Visible = false;
            try
            {
                string dir = "ImagesArticle/images/Vietnam_Timeless_Charm.PNG";
                if (FileUploadImages.HasFile)
                {
                    FileUploadImages.SaveAs(Server.MapPath("~/ImagesArticle/images/") + FileUploadImages.FileName);
                    //dir = "ImagesArticle/images/" + FileUploadImages.PostedFile.FileName;
                    dir = "ImagesArticle/images/" + FileUploadImages.FileName;
                }
                cnDb.connect();
                SqlCommand cmd = new SqlCommand("insertArticle", cnDb.conn);
                cmd.CommandText = "insertArticle";
                cmd.CommandType = CommandType.StoredProcedure;
                //var today = DateTime.Now;
                //var duration = new TimeSpan(0, 0, 0, 0);
                //DateTime day = today.Add(duration);
                cmd.Parameters.AddWithValue("@Title", txtTilte.Text);
                cmd.Parameters.AddWithValue("@Contents", editorContent.Text);
                //cmd.Parameters.AddWithValue("@DateOfPost", day);
                cmd.Parameters.AddWithValue("@Source", txtSource.Text);
                cmd.Parameters.AddWithValue("@MapAdd", txtMapAdd.Text);
                cmd.Parameters.AddWithValue("@IDCategory", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@IDCity", ddlCity.SelectedValue);
                cmd.Parameters.AddWithValue("@UserName", Session["UserLogin"]);
                cmd.Parameters.AddWithValue("@Image", dir);
                cmd.ExecuteNonQuery();
                cnDb.conn.Close();
                fm.logTask(Session["UserLogin"].ToString(), "Thêm bài viết: " + txtTilte.Text);
                Response.Write("<script>alert('Bạn đã cập nhật thành công')</script>");
                Response.Redirect("CP_ArticleManagement.aspx");
            }
            catch (Exception)
            {
                cnDb.conn.Close();
                Response.Write("<script>alert('Không thành công. Vui lòng thử lại sau.')</script>");
            }
        }
    }
    protected void btClear_Click(object sender, EventArgs e)
    {
        txtMapAdd.Text = null;
        txtTilte.Text = null;
        txtSource.Text = null;
        editorContent.Text = null;
       
    }
}