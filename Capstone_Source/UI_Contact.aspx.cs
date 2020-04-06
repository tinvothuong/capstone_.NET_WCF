using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_Contact : System.Web.UI.Page
{
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {
        fc.insertContact(txtName.Text, txtAdd.Text, txtPhone.Text, txtEmail.Text, txtTitle.Text, txtCont.Text);
        Response.Write("<script>alert('Cảm ơn bạn đã liên hệ. Chúng tôi sẽ liên hệ với bạn sau.')</script>");
    }
    protected void btVietLai_Click(object sender, EventArgs e)
    {
        txtCont.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
        txtPhone.Text = "";
        txtTitle.Text = "";
        txtAdd.Text = "";
    }
}