using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class UI_RegisterCompany : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbCapcha.Visible = false;
    }
    protected void btRegister_Click(object sender, EventArgs e)
    {
        if (fc.checkCompany(txtIDCompany.Text) == true)
            Response.Write("<script>alert('Đã tồn tại Tên đăng nhập này')</script>");
        else
        {
            try
            {
                CaptchaControl1.ValidateCaptcha(txtCapscha.Text);
            }
            catch (Exception) {
                lbCapcha.Visible = true;
                return;
            }
            if (!CaptchaControl1.UserValidated)
            {
                lbCapcha.Visible = true;
                return;
            }
            else
            {
                try
                {
                    DateTime certifiedDate = DateTime.Parse(txtCertifiedDate.Text);
                    cnDb.connect();
                    SqlCommand cmd = new SqlCommand("sp_AddTourCompany", cnDb.conn);
                    cmd.CommandText = "sp_AddTourCompany";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IDCompany", txtIDCompany.Text);
                    cmd.Parameters.AddWithValue("@CompanyName", txtNameCompay.Text);
                    cmd.Parameters.AddWithValue("@LegalRepresentative", txtLegalRepresentative.Text);
                    cmd.Parameters.AddWithValue("@TransactionName", txtTransactionName.Text);
                    cmd.Parameters.AddWithValue("@TaxCode", txtTaxCode.Text);
                    cmd.Parameters.AddWithValue("@BusinessLicense", txtBusinessLicense.Text);
                    cmd.Parameters.AddWithValue("@CertifiedDate", certifiedDate);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    cmd.Parameters.AddWithValue("@WebAddress", txtWebsite.Text);
                    cmd.ExecuteNonQuery();
                    cnDb.conn.Close();
                    Response.Redirect("UI_CompleteRegister.aspx");
                }
                catch (Exception)
                {
                    cnDb.conn.Close();
                    Response.Write("<script>alert('Vui lòng đăng ký lại sau.')</script>");
                }
            }
        }
    }
}