using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class CP_Category : System.Web.UI.Page
{
    ConnectDatabase cnDb = new ConnectDatabase();
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            getData();
        }
    }
    private void getData() {
        string qr = "select * from Category";
        object dtCategory = cnDb.xlDataDSet(qr);
        grvCategory.DataSource = dtCategory;
        grvCategory.DataBind();
    }
    protected void btEdit_Click(object sender, EventArgs e)
    {
        ImageButton bt = (ImageButton)sender;
        Response.Write("<script src='Scripts/jsSubForm.js' type='text/javascript'></script>");
        Response.Write("<script>showSubWindow2('CP_UpdateCategory.aspx?id=" + bt.CommandName + "')</script>");
    }
    protected void btAddCategory_Click(object sender, EventArgs e)
    {
        Page.Validate("Add");
        fc.insertCategory(txtName.Text, ddlPri.SelectedValue);
        getData();
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        ImageButton bt = (ImageButton)sender;
        cnDb.xlExecuteNonQuery("delete from Category where IDCategory='" + bt.CommandName + "'");
        getData();
    }
}