using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Tour_Company.ServiceReference1;

namespace Tour_Company
{
    public partial class frmQL_Tour : Form
    {
        public frmQL_Tour()
        {
            InitializeComponent();
        }

        private Service1Client ws = new Service1Client();
        BindingSource bind = new BindingSource();
        public static string idCompany = string.Empty;
        private void frmQL_Tour_Load(object sender, EventArgs e)
        {

            loadData();


        }
        private void loadData()
        {

            try
            {
                txtNumberTour.Text = "Kiểm duyệt: " + ws.numberTourVerified(idCompany) + "/ " + ws.getNumberTour(idCompany) + " Tour";
                //
                DataSet ds1 = new DataSet();
                ds1 = ws.getData("City");
                cbxKhoiHanh.DataSource = ds1.Tables[0];
                cbxKhoiHanh.DisplayMember = "CityName";
                cbxKhoiHanh.ValueMember = "CityName";
                DataSet ds2 = new DataSet();
                ds2 = ws.getData("City");
                cbxDiemDen.DataSource = ds2.Tables[0];
                cbxDiemDen.DisplayMember = "CityName";
                cbxDiemDen.ValueMember = "CityName";
                //
                BindingSource bdSZone = new BindingSource();
                bdSZone.DataSource = ws.getZone().Tables[0];
                cbxKhuVuc.DataSource = bdSZone;
                cbxKhuVuc.DisplayMember = "ZoneName";
                cbxKhuVuc.ValueMember = "IDZone";
                //
                dataGridView1.AutoGenerateColumns = false;
                bind.DataSource = ws.getAllTour(idCompany).Tables[0];
                bindingNavigator1.BindingSource = bind;
                dataGridView1.DataSource = bind;

                //
                this.txtTenTour.DataBindings.Add("text", bind, "NameTour");
                this.txtHinh.DataBindings.Add("text", bind, "ImageTour");
                this.txtGiaVe.DataBindings.Add("text", bind, "PriceTour");
                this.txtThoiGian.DataBindings.Add("text", bind, "Duration");
                this.txtSoLuong.DataBindings.Add("text", bind, "OrderQuantity");
                this.txtNganLuong.DataBindings.Add("text", bind, "EmailNganLuongACc");
                this.txtPhuongTien.DataBindings.Add("text", bind, "TransMethod");
                this.txtIDTour.DataBindings.Add("text", bind, "IDTour");
                this.cbxKhuVuc.DataBindings.Add("SelectedValue", bind, "IDZone");
                //this.cbxKhoiHanh.DataBindings.Add("SelectedValue", bind, "IDCity");

               
            }
            catch (Exception) { 
            
            }



        }
        private void btnDangTour_Click(object sender, EventArgs e)
        {

            int price, number, err = 0;
            try
            {
                price = Int32.Parse(txtGiaVe.Text);
                number = Int32.Parse(txtSoLuong.Text);
                if (price <= 100000)
                    err = 1;
                else if (number <= 10)
                    err = 2;
            }
            catch (Exception)
            {
                err = 3;
            }
            if (err == 1)
                MessageBox.Show("Giá phải lớn hơn 100000 VNĐ");
            else if (err == 2)
                MessageBox.Show("Số vé đăng ký phải lớn hơn 10");
            else if (err == 3)
                MessageBox.Show("Nhập dữ liệu số không hợp lệ");
            else
                if (txtTenTour.Text.Length < 6 || txtTenTour.Text.Length > 30 || txtTenTour.Text == "")
                    MessageBox.Show("Tên Tour từ 6-30 kí tự");
                else if (txtHinh.Text == "" || txtNganLuong.Text == "" || txtGiaVe.Text == "" || txtSoLuong.Text == "" || txtThoiGian.Text == "" || txtPhuongTien.Text == "" || winFormHtmlEditor1.Content.GetBodyHtml(true) == "")
                    MessageBox.Show("Phải nhập đủ thông tin");
                else
                {

                    try
                    {
                        string contents = winFormHtmlEditor1.Content.GetBodyHtml(true);
                        string idZone = "" + cbxKhuVuc.SelectedValue;                        
                        ws.postTour(txtTenTour.Text, winFormHtmlEditor1.Content.GetBodyHtml(true), idCompany, txtHinh.Text, txtGiaVe.Text,
                            txtThoiGian.Text, txtSoLuong.Text, cbxKhoiHanh.Text, dtpNgayDi.Text,
                            idZone, txtPhuongTien.Text, txtNganLuong.Text);                      
                        MessageBox.Show("Đã đăng tải thành công. Vui lòng đợi Express duyệt Tour của bạn. Xin cảm ơn");
                        loadData();
                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Lỗi, thử lại sau");
                    }
                }
        }

        private void txtIDTour_TextChanged(object sender, EventArgs e)
        {
            winFormHtmlEditor1.Content.SetBodyHtml(ws.getContentTour(txtIDTour.Text));
            cbxDiemDen.Text = ws.getDepartPosition(txtIDTour.Text);
            dtpNgayDi.Text = ws.getDepartDate(txtIDTour.Text);
        }

        private void cbxKhuVuc_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                grvBooking.AutoGenerateColumns = false;
                string idTour = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                //
                BindingSource bdSBooking = new BindingSource();
                bdSBooking.DataSource = ws.getBooking(idTour).Tables[0];
                bindingNavigator2.BindingSource = bdSBooking;
                grvBooking.DataSource = bdSBooking;

                lbNumberBooking.Text = "Tổng số vé: " + ws.getTickets(idTour);
                lbTotalCost.Text = "Tổng tiền: " + ws.totalCost(idTour);
            }
            catch (Exception) { }

        }

        private void dataGridView1_CellLeave(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                grvBooking.AutoGenerateColumns = false;
                string idTour = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
                //
                BindingSource bdSBooking = new BindingSource();
                bdSBooking.DataSource = ws.getBooking(idTour).Tables[0];
                bindingNavigator2.BindingSource = bdSBooking;
                grvBooking.DataSource = bdSBooking;

                lbNumberBooking.Text = "Tổng số vé: " + ws.getTickets(idTour);
                lbTotalCost.Text = "Tổng tiền: " + ws.totalCost(idTour);
            }
            catch (Exception) { }
        }

        private void winFormHtmlEditor1_HtmlChanged(object sender, EventArgs e)
        {

        }

        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            //this.Hide();
            this.Close();
        }

        private void btPaymented_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            for (int i = 0; i < grvBooking.Rows.Count; i++)
            { 
                 row = grvBooking.Rows[i];
                 if (Convert.ToBoolean(row.Cells[0].Value) == true)//select checkbox
                 {
                     string idBooking = Convert.ToString(row.Cells[1].Value);
                     ws.hasPaid(idBooking, "TRUE"); 
                 
                 }
            }
            loadData();
        }

        private void btUnPayment_Click(object sender, EventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            for (int i = 0; i < grvBooking.Rows.Count; i++)
            {
                row = grvBooking.Rows[i];
                if (Convert.ToBoolean(row.Cells[0].Value) == true)//select checkbox
                {
                    string idBooking = Convert.ToString(row.Cells[1].Value);
                    ws.hasPaid(idBooking, "FALSE");

                }
            }
            loadData();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtGiaVe.Text = "";
            txtHinh.Text = "";
            txtNganLuong.Text = "";
            txtPhuongTien.Text = "";
            txtSoLuong.Text = "";
            txtTenTour.Text = "";
            txtThoiGian.Text = "";
            winFormHtmlEditor1.Content.SetBodyHtml("");
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ws.checkVerifyTour(txtIDTour.Text) == "True")
                MessageBox.Show("Tour này đã được Express Tour Kiểm duyệt. \n Bạn không thể chỉnh sửa lại thông tin Tour. Xin cảm ơn.");
            else {
                try
                {

                    int price, number, err = 0;
                    try
                    {
                        price = Int32.Parse(txtGiaVe.Text);
                        number = Int32.Parse(txtSoLuong.Text);
                        if (price <= 100000)
                            err = 1;
                        else if (number <= 10)
                            err = 2;
                    }
                    catch (Exception)
                    {
                        err = 3;
                    }
                    if (err == 1)
                        MessageBox.Show("Giá phải lớn hơn 100000 VNĐ");
                    else if (err == 2)
                        MessageBox.Show("Số vé đăng ký phải lớn hơn 10");
                    else if (err == 3)
                        MessageBox.Show("Nhập dữ liệu số không hợp lệ");
                    else
                        if (txtTenTour.Text.Length < 6 || txtTenTour.Text.Length > 30 || txtTenTour.Text == "")
                            MessageBox.Show("Tên Tour từ 6-30 kí tự");
                        else if (txtHinh.Text == "" || txtNganLuong.Text == "" || txtGiaVe.Text == "" || txtSoLuong.Text == "" || txtThoiGian.Text == "" || txtPhuongTien.Text == "" || winFormHtmlEditor1.Content.GetBodyHtml(true) == "")
                            MessageBox.Show("Phải nhập đủ thông tin");
                        else
                        {

                            try
                            {
                                string contents = winFormHtmlEditor1.Content.GetBodyHtml(true);
                                string idZone = "" + cbxKhuVuc.SelectedValue;                               

                                ws.updateTour(txtIDTour.Text, txtTenTour.Text, contents, txtHinh.Text, txtGiaVe.Text, txtThoiGian.Text, txtSoLuong.Text, 
                                    cbxKhoiHanh.Text, dtpNgayDi.Text, idZone, txtPhuongTien.Text, txtNganLuong.Text);                   

                                MessageBox.Show("Chỉnh sửa thành công");
                                loadData();
                            }
                            catch (Exception)
                            {
                                MessageBox.Show("Lỗi, thử lại sau");
                            }
                        }
                   
                }
                catch (Exception) {
                    MessageBox.Show("Xảy ra lỗi! Vui lòng thử lại sau.");
                }
            }
        }

        private void txtNumberTour_Click(object sender, EventArgs e)
        {

        }




    }
}
