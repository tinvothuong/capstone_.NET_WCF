using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CP_DetailTourCompany : System.Web.UI.Page
{
    FunctionMethod fc = new FunctionMethod();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["company"] == null)
            Response.Redirect("CP_Login.aspx");
        else
        {
            string idCom = Request.QueryString["company"].ToString();
            lbAddress.Text = fc.getDetailCompany("Address", idCom);
            lbBussinessLicense.Text = fc.getDetailCompany("BusinessLicense", idCom);
            lbCerti.Text = fc.getDetailCompany("CertifiedDate", idCom); 
            lbEmail.Text = fc.getDetailCompany("Email", idCom);
            lbID.Text = fc.getDetailCompany("CompanyName", idCom);
            lbLegal.Text = fc.getDetailCompany("LegalRepresentative", idCom);
            lbPass.Text = fc.getDetailCompany("Password", idCom);
            lbPhone.Text = fc.getDetailCompany("Phone", idCom);
            lbTaxCode.Text = fc.getDetailCompany("TaxCode", idCom);
            lbTrans.Text = fc.getDetailCompany("TransactionName", idCom);
            lbWeb.Text = fc.getDetailCompany("WebAddress", idCom);  
         

        }
    }
}