using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_ChangePass : System.Web.UI.Page
{
    FunctionMethod f = new FunctionMethod();
    ConnectDatabase cndB = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbMess.Visible = false;
    }
    protected void btChangePass_Click(object sender, EventArgs e)
    {
        try
        {
            string pass = f.EncodeTo64(txtNewPass.Text);
            string user = Session["UserLogin"].ToString();
            f.changePassAccount(user, pass);
            lbMess.Visible = true;
        }
        catch (Exception) {
            lbMess.Visible = false;
            Response.Write("<script>alert('Có lỗi xảy ra. Vui lòng nhập lại sau')</script>");
            cndB.conn.Close();
        }
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CP_Profile.aspx");
    }
}