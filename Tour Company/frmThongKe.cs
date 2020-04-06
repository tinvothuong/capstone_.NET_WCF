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
    public partial class frmThongKe : Form
    {
        public frmThongKe()
        {
            InitializeComponent();
        }
        private Service1Client ws = new Service1Client();
        BindingSource bind = new BindingSource();
        public static string idCompany = string.Empty;
        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            //this.Hide();
            this.Close();
        }

        private void frmThongKe_Load(object sender, EventArgs e)
        {
            bind.DataSource = ws.thongKeTour(idCompany).Tables[0];
            bindingNavigator1.BindingSource = bind;
            grvTK.DataSource = bind;
            lbCost.Text = "Tổng thu nhập: " + ws.totalCostCompany(idCompany)+" VNĐ";
            lbNumberOrder.Text = "Tổng số vé đặt: " + ws.totalOrder(idCompany);
        }
    }
}
