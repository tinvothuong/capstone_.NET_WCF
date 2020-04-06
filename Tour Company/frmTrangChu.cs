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
    public partial class frmTrangChu : Form
    {
        public frmTrangChu()
        {
            InitializeComponent();
        }
        private Service1Client ws = new Service1Client();
        public static string userName = string.Empty;
        //public static string companyName = string.Empty;
        private void frmTrangChu_Load(object sender, EventArgs e)
        {
            
            GbUser.Text = "Xin chào, " + userName;
            //LbNameCo.Text = companyName;
            try
            {
                lbAddress.Text = ws.getAddress(userName);
                LbNameCo.Text = ws.getCompanyName(userName);
                lbPhone.Text = "Hotline: "+ws.getPhone(userName);
            }
            catch (Exception) { }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btTour_Click(object sender, EventArgs e)
        {
            frmQL_Tour.idCompany = userName;
            frmQL_Tour tour = new frmQL_Tour();
            tour.Show();
        }

        private void btAccount_Click(object sender, EventArgs e)
        {
            frmQL_TaiKhoan.company = userName;
            frmQL_TaiKhoan acc = new frmQL_TaiKhoan();
            acc.Show();
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            frmCustomer.companyTour = userName;
            frmCustomer cus = new frmCustomer();
            cus.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmThongKe.idCompany = userName;
            frmThongKe fTK = new frmThongKe();
            fTK.Show();
        }
    }
}
