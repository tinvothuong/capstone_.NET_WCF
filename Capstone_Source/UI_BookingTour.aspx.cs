using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class UI_BookingTour : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod func = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tour"] == null)
            Response.Redirect("UI_Tour.aspx");
        else
        {
            string id = Request.QueryString["tour"].ToString();
            string qr = "select * from TourInfor where IDTour='" + id + "'";
            object dt = cnDb.xlDataDSet(qr);
            dtlDetailTour.DataSource = dt;
            dtlDetailTour.DataBind();
            lbMess.Visible = false;
            try
            {
                string qrCheckTicket = "if exists (select 1 from BookingTour where IDTour='" + id + "') "
                          + " select OrderQuantity-(select sum(NumberOfTickets) from BookingTour where IDTour ='" + id + "') "
                          + " from TourInfor where IDTour ='" + id + "' "
                          + " else select OrderQuantity from TourInfor where IDTour='" + id + "' ";
                lbVeCon.Text = cnDb.getOneData(qrCheckTicket).ToString();
            }
            catch (Exception)
            {
                cnDb.conn.Close();
                lbVeCon.Text = "0";
            }
        }
    }
    protected void btThanhToan_Click(object sender, EventArgs e)
    {
        int soVeDat = int.Parse(txtNumber.Text);
        int soVeCon = int.Parse(lbVeCon.Text);
        if (soVeCon < soVeDat)
            lbMess.Visible = true;
        else
        {
            try
            {
                string idTour = Request.QueryString["tour"].ToString();
                func.bookingTour(idTour, txtIdentityCard.Text, txtNumber.Text, "0",
                    txtFullName.Text, txtAddress.Text, ddlGender.SelectedValue, txtPhone.Text, txtMail.Text);
                Response.Redirect("UI_Payment.aspx?tour=" + idTour + "&customer=" + txtIdentityCard.Text + "&numbertickets=" + txtNumber.Text);

            }
            catch (Exception)
            {
                cnDb.conn.Close();
                Response.Write("<script>alert('Lỗi! Vui lòng cập nhật lại sau')</script>");

            }
        }
    }
}