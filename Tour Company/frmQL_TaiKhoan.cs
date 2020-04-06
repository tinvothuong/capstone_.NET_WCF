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
    public partial class frmQL_TaiKhoan : Form
    {
        public frmQL_TaiKhoan()
        {
            InitializeComponent();
        }
        private Service1Client ws = new Service1Client();
        public static string company=string.Empty; 
        string idCompany = company;
        private void frmQL_TaiKhoan_Load(object sender, EventArgs e)
        {
            txtTenCTY.Text = ws.getCompanyName(idCompany);
            txtDaiDien.Text = ws.getLegalRep(idCompany);
            txtDiaChi.Text = ws.getAddress(idCompany);
            txtEmail.Text = ws.getEmail(idCompany);
            txtGiaoDich.Text = ws.getTransName(idCompany);
            txtWeb.Text = ws.getWeb(idCompany);
            txtThue.Text = ws.getTaxCode(idCompany);
            txtNgayCap.Text = ws.getCerDate(idCompany);
            txtSDT.Text = ws.getPhone(idCompany);
            txtGiayPhep.Text = ws.getBusiLicense(idCompany);
            txtTen.Text = idCompany;

            
        }

        frmDoiMatKhau mk = new frmDoiMatKhau();
        private void lblChangeMK_Click(object sender, EventArgs e)
        {
            this.Hide();
            mk.Show();   
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDiaChi.Text.Length < 10 || txtSDT.Text == "" || txtEmail.Text == "")
                    MessageBox.Show("Nhập đủ thông tin");
                else
                {
                    ws.updateComInfo(idCompany, txtDiaChi.Text, txtSDT.Text, txtEmail.Text, txtWeb.Text);
                    MessageBox.Show("Cập nhật thành công!", "Thông báo");
                }
            }
            catch (Exception) {
                MessageBox.Show("Vui lòng thử lại sau", "Thông báo");
            }
        }

        private void lblChangeMK_Click_1(object sender, EventArgs e)
        {
            frmDoiMatKhau.companyID = idCompany;
            frmDoiMatKhau mk = new frmDoiMatKhau();
            mk.ShowDialog();
        }

       

        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            //this.Hide();
            this.Close();
        }

       
    }
}
