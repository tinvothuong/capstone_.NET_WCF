using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class CP_RoleManagement : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadData();
            pnUpdate.Visible = false;
        }
    }
    private void loadData()
    {
        string qr = "select * from Role, RoleDetail where Role.IDRole=RoleDetail.IDRole";
        object dt = cnDb.xlDataDSet(qr);
        grvRole.DataSource = dt;
        grvRole.DataBind();
    }
    protected void imgBtEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgBt = (ImageButton)sender;
        if (imgBt.CommandName == "1")
            Response.Write("<script>alert('Không chỉnh sửa Admin')</script>");
        else
        {
            pnUpdate.Visible = true;
            txtDesc.Text = cnDb.getOneData("select Description from Role where IDRole='" + imgBt.CommandName + "'").ToString();
            txtNameRole.Text = cnDb.getOneData("select RoleName from Role where IDRole='" + imgBt.CommandName + "'").ToString();
            cbAddArticle.Checked = Convert.ToBoolean(cnDb.getOneData("select AddArticle from RoleDetail where IDRole='"
                + imgBt.CommandName + "'").ToString());
            cbEditArticle.Checked = Convert.ToBoolean(cnDb.getOneData("select EditArticle from RoleDetail where IDRole='"
                + imgBt.CommandName + "'").ToString());
            cbDeleteArticle.Checked = Convert.ToBoolean(cnDb.getOneData("select DeleteArticle from RoleDetail where IDRole='"
                + imgBt.CommandName + "'").ToString());
            cbVerifyArticle.Checked = Convert.ToBoolean(cnDb.getOneData("select VerifyArticle from RoleDetail where IDRole='"
                + imgBt.CommandName + "'").ToString());
            cbVerifyTour.Checked = Convert.ToBoolean(cnDb.getOneData("select VerifyTour from RoleDetail where IDRole='"
                + imgBt.CommandName + "'").ToString());
            lbID.Text = imgBt.CommandName;
        }
    }
    protected void btAdd_Click(object sender, EventArgs e)
    {
        if (cnDb.ktraTontai("select RoleName from Role where RoleName='" + txtNameRole.Text + "'") == true && lbID.Text == "0")
            Response.Write("<script>alert('Đã tồn tại tên quyền này')</script>");
        else
        {
            string addArticle = "False", editArticle = "False", deleteArticle = "False", verifyArticle = "False", verifyTour = "False";
            if (cbAddArticle.Checked)
                addArticle = "True";
            if (cbEditArticle.Checked)
                editArticle = "True";
            if (cbDeleteArticle.Checked)
                deleteArticle = "True";
            if (cbVerifyArticle.Checked)
                verifyArticle = "True";
            if (cbVerifyTour.Checked)
                verifyTour = "True";
            cnDb.connect();
            SqlCommand cmd = new SqlCommand("sp_UpdateRole", cnDb.conn);
            cmd.CommandText = "sp_UpdateRole";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDRole", lbID.Text);
            cmd.Parameters.AddWithValue("@RoleName", txtNameRole.Text);
            cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
            cmd.Parameters.AddWithValue("@AddArticle", addArticle);
            cmd.Parameters.AddWithValue("@EditArticle", editArticle);
            cmd.Parameters.AddWithValue("@DeleteArticle", deleteArticle);
            cmd.Parameters.AddWithValue("@VerifyArticle", verifyArticle);
            cmd.Parameters.AddWithValue("@VerifyTour", verifyTour);
            cmd.ExecuteNonQuery();
            cnDb.conn.Close();
            //close panel
            pnUpdate.Visible = false;
            loadData();
        }
    }
    protected void btAddPannel_Click(object sender, EventArgs e)
    {
        pnUpdate.Visible = true;
        txtNameRole.Text = "";
        txtDesc.Text = "";
        lbID.Text = "0";
        cbVerifyTour.Checked = false;
        cbVerifyArticle.Checked = false;
        cbEditArticle.Checked = false;
        cbDeleteArticle.Checked = false;
        cbAddArticle.Checked = false;
    }
}