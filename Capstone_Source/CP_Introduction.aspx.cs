using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class CP_Introduction : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            loadData();
    }

    private void loadData()
    {

        lbDate.Text = cnDb.getOneData("select top 1 DateUpdate from Introduction").ToString();
        string a = cnDb.getOneData("select top 1 UserName from Introduction").ToString();
        lbUserName.Text = fc.DecodeFrom64(a);
        editorContent.Text = cnDb.getOneData("select top 1 Contents from Introduction").ToString();

    }
    protected void btUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            cnDb.connect();
            SqlCommand cmd = new SqlCommand("sp_UpdateIntroduction", cnDb.conn);
            cmd.CommandText = "sp_UpdateIntroduction";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Contents", editorContent.Text);
            cmd.Parameters.AddWithValue("@UserName", Session["UserLogin"].ToString());
            cmd.ExecuteNonQuery();
            cnDb.conn.Close();
            loadData();
            Response.Write("<script>alert('Cập nhật thành công " + editorContent.Text + "')</script>");
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            Response.Write("<script>alert('Cập nhật thất bại')</script>");
        }
    }
}