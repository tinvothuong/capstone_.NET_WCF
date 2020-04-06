using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_MenuControlPanel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    FunctionMethod fc = new FunctionMethod();
    protected void Profile_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_Profile.aspx");
    }
    protected void Article_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_ArticleManagement.aspx");
    }

    protected void MemberManagement_Click(object sender, EventArgs e)
    {
        string user = Session["UserLogin"].ToString();
        if (fc.getRoleAcc(user) != "Admin")
            Response.Write("<script>alert('Bạn không có quyền thực hiện chức năng này')</script>");
        else
        {
            Session["UserLogin"] = Session["UserLogin"];
            Response.Redirect("CP_MemberManagement.aspx");
        }
    }

    protected void TourCompany_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_TourCompanyManagement.aspx");
    }
    protected void TourManagement_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_TourManagement.aspx");
    }
    //Contact_Click
    protected void Contact_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_Contact.aspx");
    }
    //Contact_Click
    protected void Terms_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_Terms.aspx");
    }
    protected void Introduction_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_Introduction.aspx");
    }
    protected void Log_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_Log.aspx");
    }
}