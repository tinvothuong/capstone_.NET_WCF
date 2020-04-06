using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_Contact : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            loadData();
    }
    private void loadData() {
        string total = cnDb.getOneData("select COUNT(*) from Contact").ToString();
        string contacted = cnDb.getOneData("select COUNT(*) from Contact where Contacted='TRUE'").ToString();
        lbThongKe.Text = "Tổng số liên hệ: " + total + "<br>Đã liên hệ: " + contacted;
        string qr = "select * from Contact order by IDContact desc";
        object dt = cnDb.xlDataDSet(qr);
        grvContact.DataSource = dt;
        grvContact.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton bt = (ImageButton)sender;        
        Response.Write("<script src='Scripts/jsSubForm.js' type='text/javascript'></script>");
        Response.Write("<script>showSubWindow1('CP_DetailContact.aspx?contact=" + bt.CommandName + "')</script>");
    }
    protected void btContacted_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvContact.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvContact.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string id = grvContact.Rows[i].Cells[1].Text;
                string qrUpdate = "update Contact set Contacted = 'True', [UserName] = '" 
                    + Session["UserLogin"] + "' where IDContact ='" + id + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
            }
        }
        loadData();
    }
    protected void btUnContacted_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grvContact.Rows.Count; i++)
        {
            CheckBox cb = (CheckBox)grvContact.Rows[i].FindControl("cbSelect");
            if (cb.Checked)
            {
                string id = grvContact.Rows[i].Cells[1].Text;
                string qrUpdate = "update Contact set Contacted = 'False', [UserName] = '" 
                    + Session["UserLogin"] + "' where IDContact ='" + id + "'";
                cnDb.xlExecuteNonQuery(qrUpdate);
            }
        }
        loadData();
    }
   
}