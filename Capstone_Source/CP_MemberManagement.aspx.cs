using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_MemberManagement : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] == null)
            Response.Redirect("CP_Login.aspx");
        try
        {
            
            if (!IsPostBack)
            {
                getAllUser();
                decodeUserName();
                getRole();
               
            }
          
              
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
    }
    private void getAllUser() {
        string qr = "select * from Account join Role on Account.IDRole = Role.IDRole ORDER BY Role.IDRole ASC";
        object tb = cnDb.xlDataDSet(qr);
        grvMember.DataSource = tb;
        grvMember.DataBind();
    }
    protected void decodeUserName() // Decode UserName trong database
    {
        for (int i = 0; i < grvMember.Rows.Count; i++)
        {
            Label lb = (Label)grvMember.Rows[i].FindControl("lbUserName");
            lb.Text = func.DecodeFrom64(lb.Text);
         
            
        }
    }
   
    protected void grvMember_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            string id = e.Values["UserName"].ToString();
            cnDb.xlExecuteNonQuery("delete from Account where UserName='" + id + "'");
            Response.Write("<script>alert('Xóa thành công')</script>");
            getAllUser();
            decodeUserName();
        }
        catch (Exception) {
            Response.Write("<script>alert('Xóa không thành công. Thử lại sau')</script>");
        }


    }
    private void getRole() {
        if (!IsPostBack) {
            string qrQuyen = "select * from Role where IDRole <> 1";
            object tbQ = cnDb.xlDataDSet(qrQuyen);
            ddlRole.DataTextField = "RoleName";
            ddlRole.DataValueField = "IDRole";
            ddlRole.DataSource = tbQ;
            ddlRole.DataBind();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Page.Validate("Add");        
        if (Page.IsValid)
        {
            string userName= func.EncodeTo64(txtUserName.Text);
            string pass = func.EncodeTo64(txtNewPass.Text);
            //getRole
            getRole();
            if (func.ktraUser(userName) == true)
                lbMess.Visible = true;
            else
            {
                try
                {
                    lbMess.Visible = false;
                    //insert
                    func.addNewMember(userName, pass, txtName.Text, ddlRole.SelectedValue);
                    //load gridview user
                    getAllUser();
                    decodeUserName();
                  //  CloseDialog("newPerson");
                    upGrid.Update();
                  //  Response.Write("<script>alert('Thêm thành công')</script>");
                }
                catch (Exception)
                {
                 //   CloseDialog("newPerson");
                    Response.Write("<script>alert('Thêm không thành công. Thử lại sau')</script>");
                }  
            }
        }
    }
    private void CloseDialog(string dialogId)
    {
        string script = string.Format(@"closeDialog('{0}')", dialogId);
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, script, true);
    }


    protected void btDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvMember.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvMember.Rows[i].FindControl("cbSelect");
            Label lbUserName = (Label)grvMember.Rows[i].FindControl("lbUserName");
            if (cb.Checked)
            {
                string id = func.EncodeTo64(lbUserName.Text);
                string qrDelete = "delete from Account where UserName = '"+id+"'";
                cnDb.xlExecuteNonQuery(qrDelete);
            }
        }
           
            getAllUser();         
            decodeUserName();
            upGrid.Update();
      //  Response.Redirect("CP_MemberManagement.aspx");
       //  Response.Write("<script>alert('Xóa thành công')</script>");
            
    }
    protected void btChan_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvMember.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvMember.Rows[i].FindControl("cbSelect");
            Label lbUserName = (Label)grvMember.Rows[i].FindControl("lbUserName");
            if (cb.Checked)
            {
                string id = func.EncodeTo64(lbUserName.Text);
                string qr = "UPDATE Account SET[Status] = 'False' WHERE UserName = '" + id + "' and IDRole != '1'";
                cnDb.xlExecuteNonQuery(qr);
            }
        }

        getAllUser();
        decodeUserName();
        upGrid.Update();
    }
    protected void btHuyChan_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvMember.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvMember.Rows[i].FindControl("cbSelect");
            Label lbUserName = (Label)grvMember.Rows[i].FindControl("lbUserName");
            if (cb.Checked)
            {
                string id = func.EncodeTo64(lbUserName.Text);
                string qr = "UPDATE Account SET[Status] = 'TRUE' WHERE UserName = '" + id + "'";
                cnDb.xlExecuteNonQuery(qr);
            }
        }

        getAllUser();
        decodeUserName();
        upGrid.Update();
    }
    protected void btRole_Click(object sender, EventArgs e)
    {
        Response.Redirect("CP_RoleManagement.aspx");
    }
}