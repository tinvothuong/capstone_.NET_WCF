using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_UpdateCategory : System.Web.UI.Page
{
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            Response.Redirect("CP_Login.aspx");
        else {
            ConnectDatabase cnDb = new ConnectDatabase();
            lbID.Text = Request.QueryString["id"].ToString();
            txtName.Text = cnDb.getOneData("select NameCategory from Category where IDCategory= '"+lbID.Text+"'").ToString();
          //  ddlPri.SelectedValue = cnDb.getOneData("select Priority from Category where IDCategory= '" + lbID.Text + "'").ToString();
        }
    }
    protected void btEdit_Click(object sender, EventArgs e)
    {
        func.editCategory(lbID.Text, txtName.Text, ddlPri.SelectedValue);
        func.logTask(Session["UserLogin"].ToString(), "Edit danh mục: "+txtName.Text);
        Response.Write("<script language='javascript'> window.close();</javascript>");
    }
  
}