using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Terms : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string qr = "select top 1 Contents from Terms where Verify='true' order by IDTerms desc";
            lbContents.Text = cnDb.getOneData(qr).ToString();
            btRegister.Visible = true;
        }
        catch (Exception) {
            lbContents.Text = "Hệ thống tạm thời chưa thể đăng tải các điều khoản và chính sách sử dụng, chúng tôi sẽ khắc phục sớm nhất có thể. Các bạn vui lòng đăng ký sau.";
            btRegister.Visible = false;
        }
    }
    protected void btRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("UI_RegisterCompany.aspx");
    }
}