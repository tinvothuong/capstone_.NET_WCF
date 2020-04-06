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
    public partial class frmTour : Form
    {
        public frmTour()
        {
            InitializeComponent();
        }
        //public static string userName = string.Empty();
        private Service1Client ws = new Service1Client();
        BindingSource bind = new BindingSource();
        private void frmTour_Load(object sender, EventArgs e)
        {
            //lblHello.Text = "Xin chào "+userName;
            bind.DataSource = ws.getAllTour("TC001").Tables[0];
            bindingNavigator1.BindingSource = bind;
            dataGridView1.DataSource = bind;
                       
            this.txtTenTour.DataBindings.Add("text", bind, "NameTour");
            //this.winFormHtmlEditor1.DataBindings.Add("text", bind, "Description");
            this.txtHinh.DataBindings.Add("text", bind, "ImageTour");
            this.txtGiaVe.DataBindings.Add("text", bind, "PriceTour");
            this.txtHanDat.DataBindings.Add("text", bind, "ExpiredDate");
            this.txtThoiGian.DataBindings.Add("text", bind, "Duration");
            this.txtSoLuong.DataBindings.Add("text", bind, "OrderQuantity");
            this.txtNganLuong.DataBindings.Add("text", bind, "EmailNganLuongACc");
            this.txtPhuongTien.DataBindings.Add("text", bind, "TransMethod");
            this.txtIDTour.DataBindings.Add("text", bind, "IDTour");
            this.dtpNgayDi.DataBindings.Add("value", bind, "DeparDate");
            this.cbxKhoiHanh.DataBindings.Add("SelectedValue", bind, "IDCity");
            this.cbxDiemDen.DataBindings.Add("selectedvalue", bind,"IDCity");
            this.cbxKhuVuc.DataBindings.Add("SelectedValue", bind, "IDZone");

            BindingSource bdSZone = new BindingSource();
            bdSZone.DataSource = ws.getZone().Tables[0];
            cbxKhuVuc.DataSource = bdSZone;
            cbxKhuVuc.DisplayMember = "ZoneName";
            cbxKhuVuc.ValueMember = "IDZone";
            
            cbxDiemDen.DataSource = ws.getData("City").Tables[0];
            cbxDiemDen.DisplayMember = "CityName";
            cbxKhoiHanh.ValueMember = "IDCity";
           
            DataSet ds1 = new DataSet();
            ds1 = ws.getData("City");
            cbxKhoiHanh.DataSource = ds1.Tables[0];
            cbxKhoiHanh.DisplayMember = "CityName";
            cbxKhoiHanh.ValueMember = "IDCity";
        }
    }
}
