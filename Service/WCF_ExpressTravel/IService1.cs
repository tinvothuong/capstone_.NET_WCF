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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        void updateComInfo(string idCompany, string address, string phone, string email, string web);
        
        //----get company information----
        [OperationContract]
        string getIDCompany(string idCompany);

        [OperationContract]
        string getCompanyName(string idCompany);

        [OperationContract]
        string getLegalRep(string idCompany);
        
        [OperationContract]
        string getTransName(string idCompany);
        
        [OperationContract]
        string getTaxCode(string idCompany);

        [OperationContract]
        string getBusiLicense(string idCompany);

        [OperationContract]
        string getCerDate(string idCompany);

        [OperationContract]
        string getAddress(string idCompany);

        [OperationContract]
        string getPhone(string idCompany);

        [OperationContract]
        string getEmail(string idCompany);

        [OperationContract]
        string getWeb(string idCompany);
        //-----------------------------   


        [OperationContract]
        string getPassCompany(string idCompany);



        [OperationContract]
        DataSet getData(string table);

        [OperationContract]
        string get1Data(string idCompany, string field );

        // lay thong tin chi tiet cua 1 tour
        [OperationContract]
        string getTourDetail(string idTour);

        [OperationContract]
        void demo(string name);
       
        // Dang Tour
        [OperationContract]
        void postTour(string nameTour, string description, string idCompany, string imageTour, string priceTour,
            string duration, string orderQuantity, string departPosition, string departDate,
            string idZone, string transMethod, string emailNganLuong);
        
        // Lay thong tin khach hang
        [OperationContract]
        string getCusInfo(string idcCompany, string identifyCard);

        [OperationContract]
        string getTour(string idcCompany, string idTour);

        [OperationContract]
        string requestAndResponse(string idCompany, string title, string Content);

        // chinh sua 
        [OperationContract]
        void modifyTourInfo(string idTour, string nameTour, string description, string idCompany, string imageTour, string priceTour, string expiredDate, string duration, int orderQuantity, string departPosition, string departDate, string dayUpdate, string idCity, string TransMethod, string userName, string verify);

        // thay doi thong tin tai khoan company
        [OperationContract]
        void changeInfo(string idCompany, string companyName, string legalRepresentative, string transactionName, string taxCode, string businessLience, string certifiedDate, string address, string phoneNumber, string email, string passWord, string webAddress);
        
        // show thong tin all tours
        [OperationContract]
        DataSet getAllTour(string idCompany);

        [OperationContract]
        string getContentTour(string id);

        [OperationContract]
        //Dataset getZone;
        System.Data.DataSet getZone();

        //getBooking
        [OperationContract]
        System.Data.DataSet getBooking(string idTour);

        //get Number tickes of tour
        [OperationContract]
        string getTickets(string idTour);
        //get Number tour of company
        [OperationContract]
        string getNumberTour(string idCompany);
        //number tour verified
        [OperationContract]
        string numberTourVerified(string idCompany);
        [OperationContract]
        string totalCost(string idTour);
        // TODO: Add your service operations here

        [OperationContract]
        string getDepartDate(string idTour);
        [OperationContract]
        string getDepartPosition(string idTour);
        [OperationContract]
        void changePass(string idCompany, string newPass);
        [OperationContract]
        void hasPaid(string idBooking, string status);//Đã thanh toán
        //Check Verify Tour
        [OperationContract]
        string checkVerifyTour(string idTour);
        [OperationContract]
        void updateTour(string idTour, string nameTour, string desc, string imgTour, string price, string duration, string orderQuatity, string departPosition, string departDate, string idZone, string transMethod, string emailAcc);
        
        //getCus
        [OperationContract]
        System.Data.DataSet getCustomer(string idCompany);
        [OperationContract]
        System.Data.DataSet findCustomer(string name, string idCompany);
        //get number Customer of Compay
        [OperationContract]
        string getNumberCus(string idCompay);
        //thongkeTour
        [OperationContract]
        System.Data.DataSet thongKeTour(string idCompany);
        [OperationContract]
        string totalOrder(string idCompany);
        [OperationContract]
        string totalCostCompany(string idCompany);
        [OperationContract]
        bool checkLogin(string user, string pass);

    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
