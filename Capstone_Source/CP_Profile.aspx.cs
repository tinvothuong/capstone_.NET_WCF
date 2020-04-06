using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CP_Profile : System.Web.UI.Page
{
    FunctionMethod f = new FunctionMethod();
    ConnectDatabase cnDB = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null || Session["UserLogin"] == "")
            Response.Redirect("CP_Login.aspx");
        Response.Write("<title>My Profile</title>");
        if(!IsPostBack)
             getAccount();
    }
    private void getAccount() {
        string user = Session["UserLogin"].ToString();
        txtAdress.Text = f.getAccount("Address", user);
        try
        {
            txtBirth.Text = f.getAccount("Birthday", user).Substring(0, 10);
        }
        catch (Exception) {
            txtBirth.Text = "01/01/1900";
        }
        txtEmail.Text = f.getAccount("Email", user);
        txtName.Text = f.getAccount("FullName", user);
        txtPhone.Text = f.getAccount("PhoneNumber", user);       
        imgAvatar.ImageUrl = f.getAccount("Image", user);
        lbUser.Text = f.DecodeFrom64(user);
        ddlSex.SelectedValue = f.getAccount("Gender", user);
        lbRole.Text = "Vị trí: "+f.getRoleAcc(user);
    }

    protected void btChangeProfile_Click(object sender, EventArgs e)
    {
        string user = Session["UserLogin"].ToString();   
        string dirAvatar = f.getAccount("Image", user);
        if (fileUploadImage.HasFile)
        {
            fileUploadImage.SaveAs(Server.MapPath("~/ImagesAcc/") + fileUploadImage.FileName);
            //dir = "ImagesArticle/images/" + FileUploadImages.PostedFile.FileName;
            dirAvatar = "ImagesAcc/" + fileUploadImage.FileName;
        }

        try
        {
            cnDB.connect();
            SqlCommand cmd = new SqlCommand("sp_updateAccount", cnDB.conn);
            cmd.CommandText = "sp_updateAccount";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", user);
            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Address", txtAdress.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Gender", ddlSex.SelectedValue);
            cmd.Parameters.AddWithValue("@Image", dirAvatar);
            DateTime birthDay = DateTime.Parse(txtBirth.Text);
            cmd.Parameters.AddWithValue("@Birthday", birthDay);
            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
            cmd.ExecuteNonQuery();
            cnDB.conn.Close();
            Response.Write("<script>alert('Bạn đã cập nhật thành công')</script>");
            //lbMess.Visible = true;
            //lbMess.Text = "Bạn đã cập nhật thành công";
            getAccount();
        }
        catch (Exception) {
            cnDB.conn.Close();
            Response.Write("<script>alert('Có lỗi. Vui lòng thử lại sau')</script>");
            //lbMess.Visible = true;
            //lbMess.Text = "Có lỗi. Vui lòng thử lại sau";
        }

    }
    protected void btClear_Click(object sender, EventArgs e)
    {
        txtAdress.Text = null;
        txtBirth.Text = null;
        txtEmail.Text = null;
        txtName.Text = null;
        txtPhone.Text = null;
    }
   


    protected void btChangePass_Click(object sender, EventArgs e)
    {
        Session["UserLogin"] = Session["UserLogin"];
        Response.Redirect("CP_ChangePass.aspx");
    }
}