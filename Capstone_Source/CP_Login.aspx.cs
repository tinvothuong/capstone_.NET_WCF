using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_Login : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {
        //Encode
        string user = func.EncodeTo64(txtUser.Text);
        string pass = func.EncodeTo64(txtPass.Text);
        try
        {
            string query = "SELECT * FROM Account WHERE (UserName = '" + user + "' AND Password='" + pass + "')";
            object a = cnDb.xlExecuteScalar(query);
            if (IsPostBack)
            {
                if (a == null)
                {
                    lbMess.Visible = true;
                    lbMess.Text = "Đăng nhập thất bại.Sai Username hoặc Password";
                   // Response.Write("<script>alert('Đăng nhập thất bại.Sai Username hoặc Password')</script>");
                }
                else
                {
                    if (cnDb.getOneData("select Status from Account where UserName='"+user+"'").ToString() != "True")
                    {
                        lbMess.Visible = true;
                        lbMess.Text = "Tài khoản của bạn đã bị chặn";
                        //Response.Write("<script>alert('Tài khoản của bạn đã bị chặn')</script>");
                    }
                    else
                    {
                        func.logTask(user, "Đăng nhập hệ thống");
                        Session["UserLogin"] = user;
                        Response.Redirect("CP_Home.aspx");
                    }
                }

            }

        }
        catch (Exception)
        {
            cnDb.conn.Close();
            lbMess.Visible = true;
            lbMess.Text = "Đăng nhập thất bại";
        }
    }
}