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
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }
        private Service1Client ws = new Service1Client();
        
        private void frmDangNhap_Load(object sender, EventArgs e)
        {
            
        }
        frmTrangChu home = new frmTrangChu();
        private void btnDangnhap_Click(object sender, EventArgs e)
        {

            try
            {
                if (ws.checkLogin(txtTen.Text, txtMK.Text) == true)
                {
                    frmTrangChu.userName = txtTen.Text;
                    home.Show();
                    this.Hide();
                }
                else
                {
                    txtTen.Text = "";
                    txtMK.Text = "";
                    lblThongBao.Text = "Sai tên tài khoản hoặc mật khẩu \n Tài khoản của bạn có để đã bị khóa";
                }
            }
            catch (Exception) {
                MessageBox.Show("Thời gian phản hồi từ Service bị gián đoạn. Vui lòng thử lại sau");
            }
            
        }

        private void txtTen_Validating(object sender, CancelEventArgs e)
        {
            if (txtTen.TextLength>20 || txtTen.TextLength<6)
            {
                this.txtTen.Focus();
                lblThongBao.Text = "Tên tài khoản từ 6-20 kí tự";
            }

        }

        private void txtMK_Validating(object sender, CancelEventArgs e)
        {
            if (txtMK.TextLength > 20 || txtMK.TextLength < 6)
            {
                this.txtMK.Focus();
                lblThongBao.Text = "Mật khẩu từ 6-20 kí tự";
            }
        }

           
    }
}
