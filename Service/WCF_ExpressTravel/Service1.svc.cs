using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace WCF_ExpressTravel
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class Service1 : IService1
    {
        ConnectDatabase datacon = new ConnectDatabase();
         
        public void updateComInfo(string idCompany, string address, string phone, string email, string web)
        {
            try
            {
                datacon.xlExecuteNonQuery("Update TourCompany set Address = '" + address + "', Phone = '" + phone + "', Email = '" 
                    + email + "', WebAddress = '" + web + "' where IDCompany = '" + idCompany + "'");
            }
            catch (Exception) {
                datacon.conn.Close();
            
            }
           }

        public string getIDCompany(string idCompany)
        {
            try
            {
                return datacon.getOneData("select IDCompany from TourCompany where IDCompany='" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getCompanyName(string idCompany)
        {

            try
            {
                return datacon.getOneData("select CompanyName from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }

        }

        public string getLegalRep(string idCompany)
        {
            try
            {
                return datacon.getOneData("select LegalRepresentative from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getTransName(string idCompany)
        {
            try
            {
                return datacon.getOneData("select TransactionName from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getTaxCode(string idCompany)
        {
            try
            {
                return datacon.getOneData("select TaxCode from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception) {
                datacon.conn.Close();
                return "";
            }
        }

        public string getBusiLicense(string idCompany)
        {
            try{
            return datacon.getOneData("select BusinessLicense from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getCerDate(string idCompany)
        {
            try{
            return datacon.getOneData("select CertifiedDate from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getAddress(string idCompany)
        {
           try{
            return datacon.getOneData("select Address from TourCompany where IDCompany = '" + idCompany + "'").ToString();
           }
           catch (Exception)
           {
               datacon.conn.Close();
               return "";
           }
        }

        public string getPhone(string idCompany)
        {
            try{
            return datacon.getOneData("select Phone from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getEmail(string idCompany)
        {
            try
            {
                return datacon.getOneData("select Email from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getWeb(string idCompany)
        {
            try{
            return datacon.getOneData("select WebAddress from TourCompany where IDCompany = '" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }
        public string getPassCompany(string idCompany)
        {
            try
            {
                return datacon.getOneData("select Password from TourCompany where IDCompany='" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public DataSet getData(string table)
        {
            return datacon.xlDataDSet("SELECT * FROM " + table);
        }

        //get 1 field in TourCompany table
        public string get1Data(string idCompany, string field)
        {
            return datacon.getOneData("Select '" + field + "' from TourCompany where IDCompany == '" + idCompany + "'").ToString();
        }

        public string getTourDetail(string idTour)
        {
            //  return datacon.xlExecuteScalar("select * from TourInfo where IDTour ='" + idTour+ "'");
            return null;
        }

        public void postTour(string nameTour, string description, string idCompany, string imageTour, string priceTour,
           string duration, string orderQuantity, string departPosition, string departDate,
           string idZone, string transMethod, string emailNganLuong)
        {
            DateTime dt_departDate = DateTime.Parse(departDate);
            //string date = day.ToString();
            datacon.connect();
            SqlCommand cmd = new SqlCommand("sp_PostTour", datacon.conn);
            cmd.CommandText = "sp_PostTour";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NameTour", nameTour);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@IDCompany", idCompany);
            cmd.Parameters.AddWithValue("@ImageTour", imageTour);
            cmd.Parameters.AddWithValue("@PriceTour", priceTour);
            cmd.Parameters.AddWithValue("@Duration", duration);
            cmd.Parameters.AddWithValue("@OrderQuantity", orderQuantity);
            cmd.Parameters.AddWithValue("@DepartPosition", departPosition);
            cmd.Parameters.AddWithValue("@DepartDate", dt_departDate);
            cmd.Parameters.AddWithValue("@IDZone", idZone);
            cmd.Parameters.AddWithValue("@TransMethod", transMethod);
            cmd.Parameters.AddWithValue("@EmailNganLuongAcc", emailNganLuong);
            cmd.ExecuteNonQuery();
            datacon.conn.Close();
        }

        public void demo(string name)
        {
            string qr = "insert into Zone(ZoneName) values('" + name + "')";
            datacon.xlExecuteNonQuery(qr);
        }


        public string getCusInfo(string idCompany, string identifyCard)
        {
            throw new NotImplementedException();
        }

        public string getTour(string idCompany, string idTour)
        {
            throw new NotImplementedException();
        }

        public string requestAndResponse(string idCompany, string title, string Content)
        {
            throw new NotImplementedException();
        }

        public void modifyTourInfo(string idTour, string nameTour, string description, string idCompany, string imageTour, string priceTour, string expiredDate, string duration, int orderQuantity, string departPosition, string departDate, string dayUpdate, string idCity, string TransMethod, string userName, string verify)
        {
            throw new NotImplementedException();
        }

        public void changeInfo(string idCompany, string companyName, string legalRepresentative, string transactionName, string taxCode, string businessLience, string certifiedDate, string address, string phoneNumber, string email, string passWord, string webAddress)
        {
            throw new NotImplementedException();
        }
        public System.Data.DataSet getAllTour(string idCompany)
        {

            datacon.connect();
            string qr = "select * "
                 + " from TourInfor  join Zone on TourInfor.IDZone =Zone.IDZone "
                 + " where IDCompany= '" + idCompany + "' ORDER BY IDTour DESC";
            SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
            DataSet ds = new DataSet();
            comm.Fill(ds);
            datacon.conn.Close();
            return ds;
        }
        public System.Data.DataSet getZone()
        {
            datacon.connect();
            string qr = "select * from Zone";
            SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
            DataSet ds = new DataSet();
            comm.Fill(ds);
            datacon.conn.Close();
            return ds;
        }
        public string getContentTour(string id)
        {
            try
            {
                return datacon.getOneData("select Description from TourInfor where IDTour='" + id + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }
        public System.Data.DataSet getBooking(string idTour)
        {
            datacon.connect();
            string qr = "select Customer.IdentityCard, FullName, Address, Gender, Phone, Email, NumberOfTickets, TotalAmount, Status, IDBooking from Customer "
                    + " join BookingTour on Customer.IdentityCard=BookingTour.IdentityCard "
                    + " and IDTour='" + idTour + "'";
            SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
            DataSet ds = new DataSet();
            comm.Fill(ds);
            datacon.conn.Close();
            return ds;
        }
        public string getTickets(string idTour)
        {
            try
            {
                return datacon.getOneData("select count(*) from BookingTour where IDTour='" + idTour + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }
        public string getNumberTour(string idCompany)
        {
            try
            {
                return datacon.getOneData("select count(*) from TourInfor where IDCompany='" + idCompany + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }
        public string numberTourVerified(string idCompany)
        {
            try
            {
                return datacon.getOneData("select count(*) from TourInfor where IDCompany='" + idCompany + "' and Verify='true'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }
        public string totalCost(string idTour)
        {
            try
            {
                return datacon.getOneData("select sum(TotalAmount) from BookingTour where IDTour='" + idTour + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getDepartDate(string idTour)
        {
            try
            {
                return datacon.getOneData(" select DepartDate from TourInfor where IDTour='" + idTour + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }
        }

        public string getDepartPosition(string idTour)
        {
            try
            {
                return datacon.getOneData(" select DepartPosition from TourInfor where IDTour='" + idTour + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "";
            }

        }
        public void changePass(string idCompany, string newPass)
        {
            try
            {
                datacon.xlExecuteNonQuery("UPDATE TourCompany SET Password ='" + newPass + "' WHERE IDCompany='" + idCompany + "'");
            }
            catch (Exception)
            {
                datacon.conn.Close();
            }
        }
        public void hasPaid(string idBooking, string status)
        {
            try
            {
                datacon.xlExecuteNonQuery("UPDATE BookingTour SET Status ='" + status + "' WHERE IDBooking='" + idBooking + "'");
            }
            catch (Exception)
            {
                datacon.conn.Close();
            }
        }
        public string checkVerifyTour(string idTour)
        {
            try
            {
                return datacon.getOneData("select Verify from TourInfor where IDTour='" + idTour + "'").ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "0";
            }

        }

        public void updateTour(string idTour, string nameTour, string desc, string imgTour,
                    string price, string duration, string orderQuatity, string departPosition,
                    string departDate, string idZone, string transMethod, string emailAcc)
        {
            DateTime dt_departDate = DateTime.Parse(departDate);
            //string date = day.ToString();
            datacon.connect();
            SqlCommand cmd = new SqlCommand("sp_UpdateTour", datacon.conn);
            cmd.CommandText = "sp_UpdateTour";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDTour", idTour);
            cmd.Parameters.AddWithValue("@NameTour", nameTour);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@ImageTour", imgTour);
            cmd.Parameters.AddWithValue("@PriceTour", price);
            cmd.Parameters.AddWithValue("@Duration", duration);
            cmd.Parameters.AddWithValue("@OrderQuantity", orderQuatity);
            cmd.Parameters.AddWithValue("@DepartPosition", departPosition);
            cmd.Parameters.AddWithValue("@DepartDate", dt_departDate);
            cmd.Parameters.AddWithValue("@IDZone", idZone);
            cmd.Parameters.AddWithValue("@TransMethod", transMethod);
            cmd.Parameters.AddWithValue("@EmailNganLuongAcc", emailAcc);
            cmd.ExecuteNonQuery();
            datacon.conn.Close();
        }

        public System.Data.DataSet getCustomer(string idCompany)
        {
            try
            {
                datacon.connect();
                string qr = "select distinct Customer.*  from Customer "
                   + " join BookingTour on Customer.IdentityCard=BookingTour.IdentityCard "
                    + " join TourInfor on BookingTour.IDTour=TourInfor.IDTour "
                    + " and TourInfor.IDCompany='" + idCompany + "'";
                SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
                DataSet ds = new DataSet();
                comm.Fill(ds);
                datacon.conn.Close();
                return ds;
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return null;
            }
        }
        public System.Data.DataSet findCustomer(string name, string idCompany)
        {
            try
            {
                datacon.connect();
                string qr = "select distinct Customer.*  from Customer "
                   + " join BookingTour on Customer.IdentityCard=BookingTour.IdentityCard "
                    + " join TourInfor on BookingTour.IDTour=TourInfor.IDTour "
                    + " and TourInfor.IDCompany='" + idCompany + "' and FullName like N'%" + name + "%'";
                SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
                DataSet ds = new DataSet();
                comm.Fill(ds);
                datacon.conn.Close();
                return ds;
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return null;
            }
        }
        public string getNumberCus(string idCompay)
        {
            try
            {
                string qr = " select COUNT(1) from Customer "
                        + " where IdentityCard in (select BookingTour.IdentityCard from BookingTour, TourInfor "
                        + " WHERE BookingTour.IDTour=TourInfor.IDTour and IDCompany='" + idCompay + "')";
                return datacon.getOneData(qr).ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "0";
            }
        }
        public System.Data.DataSet thongKeTour(string idCompany)
        {
            try
            {
                datacon.connect();
                string qr = "select distinct TourInfor.IDTour,NameTour 'Tên Tour', DepartDate'Ngày đi', DepartPosition'Khởi hành',OrderQuantity'Số lượng đăng ký' ,sum(NumberOfTickets) AS 'Số vé đặt', "
                        + " SUM(TotalAmount) AS 'Tổng tiền' from TourInfor"
                        + " join BookingTour on TourInfor.IDTour=BookingTour.IDTour and Verify='true' and IDCompany='" + idCompany + "' "
                        + " group by TourInfor.IDTour,NameTour,DepartDate, DepartPosition,OrderQuantity"
                        + " union"
                        + " select distinct IDTour,NameTour'Tên Tour', DepartDate'Ngày đi', DepartPosition,OrderQuantity, 0 AS 'Số vé đặt', 0 AS'Tổng tiền' "
                        + " from TourInfor"
                        + " where IDTour not in (select IDTour from BookingTour where IDTour= TourInfor.IDTour) and IDCompany='" + idCompany + "' "
                        + " order by IDTour DESC";
                SqlDataAdapter comm = new SqlDataAdapter(qr, datacon.conn);
                DataSet ds = new DataSet();
                comm.Fill(ds);
                datacon.conn.Close();
                return ds;
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return null;
            }
        }
        public string totalOrder(string idCompany) {
            try
            {
                string qr = "select distinct SUM(NumberOfTickets) from BookingTour, TourInfor "
                    + " where BookingTour.IDTour=TourInfor.IDTour and IDCompany='" + idCompany + "' and Verify='true'";
                return datacon.getOneData(qr).ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "0";
            }
        }
        public string totalCostCompany(string idCompany) {
            try
            {
                string qr = "select distinct SUM(TotalAmount) from BookingTour, TourInfor "
                    + " where BookingTour.IDTour=TourInfor.IDTour and IDCompany='" + idCompany + "' and Verify='true'";
                return datacon.getOneData(qr).ToString();
            }
            catch (Exception)
            {
                datacon.conn.Close();
                return "0";
            }
        
        }
        public bool checkLogin(string user, string pass) {
            try
            {
                string qr = "select 1 from  TourCompany where IDCompany='" + user + "' and Password ='" + pass + "' and Verify='true'";
                object check = datacon.xlExecuteScalar(qr);
                if (check == null)
                    return false;
                else
                    return true;
            }
            catch (Exception) {
                datacon.conn.Close();
                return false;
            }
        }
            
    }
}
