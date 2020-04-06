using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class MasterPage_ControlPanel : System.Web.UI.MasterPage
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null || Session["UserLogin"] == "")
        {
            Response.Redirect("CP_Login.aspx");
          }
        else{
             //string id = func.EncodeTo64(getUser());
            string id = getUser();
            string qr = "select FullName from Account where UserName= '" + id + "'";
            string getFullname = cnDb.getOneData(qr).ToString();
            lbUser.Text = getFullname;
            imgUser.ImageUrl = cnDb.getOneData("select Image from Account where UserName= '" + id + "'").ToString();
          }
        
    }
    public string getUser()
    {
        
        return Session["UserLogin"].ToString();
    }
    protected void linkLogout_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = null;
        Response.Redirect("CP_Login.aspx");
    }
    protected void linkProfile_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = getUser();
        Response.Redirect("CP_Profile.aspx");
    }
}
