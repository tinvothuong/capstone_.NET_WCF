using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_TourManagement : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                getData();
            }
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
    }
    private void getData() {
        string qr = "select * from TourInfor, TourCompany where TourCompany.IDCompany=TourInfor.IDCompany order by IDTour DESC";
        object dt = cnDb.xlDataDSet(qr);
        grvTour.DataSource = dt;
        grvTour.DataBind();
    }
    private string getUser()
    {
        string user = Session["UserLogin"].ToString();
        //  return func.DecodeFrom64(user);
        return user;
    }
    protected void btVerify_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvTour.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvTour.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string idCom = grvTour.Rows[i].Cells[1].Text;
                string qrUpdate = "UPDATE TourInfor SET Verify = 'TRUE' WHERE IDTour='" + idCom + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
                fc.logTask(getUser(), "Kiểm duyệt Tour: "+idCom);
            }

        }
        
        getData();
        Response.Write("<script>alert('Đã kiểm duyệt.')</script>");
    }
    protected void btUnVerify_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvTour.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvTour.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string idCom = grvTour.Rows[i].Cells[1].Text;
                string qrUpdate = "UPDATE TourInfor SET Verify = 'FALSE' WHERE IDTour='" + idCom + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
                fc.logTask(getUser(), "Hủy kiểm duyệt Tour: " + idCom);
            }

        }
        getData();
        Response.Write("<script>alert('Đã hủy kiểm duyệt các tour này.')</script>");
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        string qr = "select * from TourInfor where NameTour like N'%" + txtSearch.Text + "%'";
        object dt = cnDb.xlDataDSet(qr);
        grvTour.DataSource = dt;
        grvTour.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Thống kê
        try
        {
            string qr = "select * from TourInfor where DayUpdate BETWEEN convert(datetime,'" 
                + txtStart.Text + "', 103) and convert(datetime,'" 
                + txtEnd.Text + "', 103)";
            object tb = cnDb.xlDataDSet(qr);
            grvTour.DataSource = tb;
            grvTour.DataBind();

        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }


    }
    protected void imgBtDetail_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton bt = (ImageButton) sender;
        //Response.Redirect("CP_DetailTour.aspx?tour="+bt.CommandName);
        Response.Write("<script src='Scripts/jsSubForm.js' type='text/javascript'></script>");
        Response.Write("<script>showSubWindow1('CP_DetailTour.aspx?tour=" + bt.CommandName + "')</script>");
    }
    protected void grvTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvTour.PageIndex = e.NewPageIndex;
        getData();
    }
    protected void btBooking_Click(object sender, EventArgs e)
    {
        Button bt = (Button)sender;
        Response.Redirect("CP_ListBookingTour.aspx?idTour=" + bt.CommandName);
    }
}