using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tour_Company.ServiceReference1;
namespace Tour_Company
{
    public partial class frmCustomer : Form
    {
        public frmCustomer()
        {
            InitializeComponent();
        }

        private Service1Client ws = new Service1Client();
        BindingSource bind = new BindingSource();
        public static string companyTour = string.Empty;
        
        private void frmCustomer_Load(object sender, EventArgs e)
        {
            loadData();
        }
        private void loadData() {
            try
            {
                grvCus.AutoGenerateColumns = false;
                bind.DataSource = ws.getCustomer(companyTour).Tables[0];
                bindingNavigator1.BindingSource = bind;
                grvCus.DataSource = bind;
                lbNumberCus.Text = "Tổng số khách hàng: "+ws.getNumberCus(companyTour);
            }
            catch (Exception) { }
        }

        private void txtName_TextChanged(object sender, EventArgs e)
        {
            try
            {

                grvCus.AutoGenerateColumns = false;
                bind.DataSource = ws.findCustomer(txtName.Text, companyTour).Tables[0];
                bindingNavigator1.BindingSource = bind;
                grvCus.DataSource = bind;
            }
            catch (Exception) { }
        }

        private void btFind_Click(object sender, EventArgs e)
        {
            try
            {

                grvCus.AutoGenerateColumns = false;
                bind.DataSource = ws.findCustomer(txtName.Text, companyTour).Tables[0];
                bindingNavigator1.BindingSource = bind;
                grvCus.DataSource = bind;
            }
            catch (Exception) { }
        }

        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            //frmTrangChu tr = new frmTrangChu();
            //tr.Show();
            this.Hide();
        }
    }
}
