using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class CP_Terms : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            loadData();
    }
    private void loadData()
    {

        lbDate.Text = cnDb.getOneData("select top 1 DateUpdate from Terms").ToString();
        string a = cnDb.getOneData("select top 1 UserName from Terms").ToString();
        lbUserName.Text = fc.DecodeFrom64(a);
        editorContent.Text = cnDb.getOneData("select top 1 Contents from Terms").ToString();

    }
    protected void btUpdate_Click(object sender, EventArgs e)
    {

        try
        {           
            fc.updateTerms(Session["UserLogin"].ToString(), editorContent.Text);
            loadData();
            Response.Write("<script>alert('Cập nhật thành công')</script>");
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            Response.Write("<script>alert('Cập nhật thất bại')</script>");
        }

    }
}