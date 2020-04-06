using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UC_Comment : System.Web.UI.UserControl
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadComment();
    }
    private void loadComment() {
        string qr = "select * from Comment where IDArticle ='" + Request.QueryString["article"] + "'";
        object dt = cnDb.xlDataDSet(qr);
        dtlComment.DataSource = dt;
        dtlComment.DataBind();
    }
    protected void btnComment_Click(object sender, EventArgs e)
    {
        // 
        CaptchaControl1.ValidateCaptcha(txtCaptcha.Text);
        if (!CaptchaControl1.UserValidated)
        {
            lbMessCaptcha.Visible = true;
            return;
        }
        else {
            try
            {
                lbMessCaptcha.Visible = false;
                string id = Request.QueryString["article"];
                string name = txtCommenter.Text;
                string email = txtEmail.Text;
                string contents = txtContent.Text;
                func.addComment(id, name, email, contents);
                txtContent.Text = "";
                txtEmail.Text = "";
                txtCommenter.Text = "";
                txtCaptcha.Text = "";
                //Response.Write("<script>alert('Cảm ơn bạn đã góp ý')</script>");
                loadComment();
            }
            catch (Exception)
            {
                cnDb.conn.Close();
                Response.Write("<script>alert('Vui lòng phản hồi lại sau.')</script>");
                txtContent.Text = "";
                txtEmail.Text = "";
                txtCommenter.Text = "";
                txtCaptcha.Text = "";

            }
        }
    }
}