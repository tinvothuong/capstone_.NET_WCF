using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_DetailContact : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["contact"] == null)
            Response.Redirect("CP_Login.aspx");
        else {
            string id = Request.QueryString["contact"].ToString();
            lbID.Text = id;
            lbName.Text = getContact("FullName", id);
            lbPhone.Text = getContact("Phone", id);
            lbTitle.Text = getContact("Tiltle", id);
            lbEmail.Text = getContact("Email", id);
            lbContents.Text = getContact("Contents", id);
            lbDate.Text = getContact("Date", id);
            lbAddress.Text = getContact("Address", id);
          
        }
    }
    private string getContact(string fied, string id) {
        try
        {
            return cnDb.getOneData("select " + fied + " from Contact where IDContact ='"+id+"'").ToString();
        }
        catch (Exception) {
            cnDb.conn.Close();
            return "";
        }
    }
}