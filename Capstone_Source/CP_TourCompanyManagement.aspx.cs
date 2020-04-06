using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_TourCompanyManagement : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                bindData();

            }
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }

    }

    public void bindData() {
        string qr = "select * from TourCompany order by IDCompany desc";
        object dt = cnDb.xlDataDSet(qr);
        grvCompany.DataSource = dt;
        grvCompany.DataBind();
    }

    protected void btVerify_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvCompany.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvCompany.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string idCom = grvCompany.Rows[i].Cells[1].Text;
                string qrUpdate = "UPDATE TourCompany SET Verify = 'TRUE',ActivationDate = getdate() WHERE IDCompany='" + idCom + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
            }

        }
        bindData();
        Response.Write("<script>alert('Đã kiểm duyệt')</script>");
    }
    protected void btUnVerify_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvCompany.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvCompany.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string idCom = grvCompany.Rows[i].Cells[1].Text;
                string qrUpdate = "UPDATE TourCompany SET Verify = 'FALSE', [ActivationDate] = null WHERE IDCompany='" + idCom + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
            }
        }
        bindData();
        Response.Write("<script>alert('Đã hủy kiểm duyệt')</script>");
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        string qr = "select * from TourCompany where CompanyName like N'%" + txtSearch.Text + "%' order by IDCompany desc";
        object dt = cnDb.xlDataDSet(qr);
        grvCompany.DataSource = dt;
        grvCompany.DataBind();
    }
    protected void btDetail_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        Response.Write("<script src='Scripts/jsSubForm.js' type='text/javascript'></script>");
        Response.Write("<script>showSubWindow1('CP_DetailTourCompany.aspx?company=" + bt.CommandName + "')</script>");
    }
}