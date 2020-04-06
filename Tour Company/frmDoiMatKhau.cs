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
    public partial class frmDoiMatKhau : Form
    {
        public frmDoiMatKhau()
        {
            InitializeComponent();
        }
        public static string companyID = string.Empty;
        private Service1Client ws = new Service1Client();
        private void btnThay_Click(object sender, EventArgs e)
        {
            //if (txtPass.Text != ws.getPassCompany(companyID))
            //    MessageBox.Show("Mật khẩu cũ không đúng");
            //else if (txtNewPass.Text.Length < 6 || txtNewPass.Text.Length > 20 || txtNewPass.Text == "")
            //    MessageBox.Show("Mật khẩu mới phải từ 6-30 kí tự");
            //else 
            //if (txtPassComf.Text == "" || txtPassComf.Text != txtNewPass.Text)
            ////    MessageBox.Show("Nhập lại mật khẩu không đúng");
            //    lblTBao.Text = "Mật khẩu không trùng khớp";
            //else
            //{
            if (txtPass.Text != ws.getPassCompany(companyID) || txtNewPass.TextLength < 6 || txtNewPass.TextLength > 20 || txtNewPass.Text == "" || txtPassComf.Text == "" || txtPassComf.Text != txtNewPass.Text)
            {
                lblTBao.Text ="Lỗi! Vui lòng thử lại!";
            }
            else
            {
                try
                {


                    ws.changePass(companyID, txtNewPass.Text);
                    MessageBox.Show("Đổi mật khẩu thành công");
                }
                catch (Exception)
                {
                    lblTBao.Visible = true;
                    lblTBao.Text = "Lỗi! Vui lòng thử lại sau";
                    //MessageBox.Show("Lỗi! Vui lòng thử lại sau.");
                }
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void txtPass_Validating(object sender, CancelEventArgs e)
        {

            if (txtPass.Text != ws.getPassCompany(companyID))
            {
                this.txtPass.Focus();
                lblTBao.Text = "Sai mật khẩu. Vui lòng kiểm tra lại!";
            }
        }
                
        private void txtNewPass_Validating(object sender, CancelEventArgs e)
        {
            if (txtNewPass.TextLength > 20 || txtNewPass.TextLength < 6)
            {
                this.txtNewPass.Focus();
                lblTBao.Text = "Mật khẩu từ 6-20 kí tự";
            }
        }
               
        private void txtPassComf_Validating(object sender, CancelEventArgs e)
        {
            if (txtPassComf.Text == "" || txtPassComf.Text != txtNewPass.Text)
            {
                this.txtPassComf.Focus();
                lblTBao.Text = "Mật khẩu không trùng khớp";
            }
        }

        private void txtNewPass_TextChanged(object sender, EventArgs e)
        {
            if (txtNewPass.Text.Length < 6 || txtNewPass.Text.Length > 30)
            {
                lblTBao.Visible = true;
                lblTBao.Text = "Mật khẩu từ 6-20 kí tự";
                btnThay.Enabled = false;
            }
            else {
                lblTBao.Visible = false;
                if (txtPassComf.Text == txtNewPass.Text)
                    btnThay.Visible = true;
            }
        }

        private void txtPassComf_TextChanged(object sender, EventArgs e)
        {
            if (txtPassComf.Text != txtNewPass.Text)
            {
                lblTBao.Visible = true;
                lblTBao.Text = "Mật khẩu không khớp";
                btnThay.Enabled = false;
            }
            else
            {
                lblTBao.Visible = false;
                if (txtPass.Text == ws.getPassCompany(companyID))
                    btnThay.Enabled = true;
            }
        }

        private void txtPass_TextChanged(object sender, EventArgs e)
        {
            if (txtPass.Text != ws.getPassCompany(companyID))
            {
                lblTBao.Visible = true;
                lblTBao.Text = "Mật khẩu cũ không đúng";
                btnThay.Enabled = false;
            }
            else {
                lblTBao.Visible = false;
            }
        }

                       
    }
}
