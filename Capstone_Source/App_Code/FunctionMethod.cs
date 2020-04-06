using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Data;
/// <summary>
/// Summary description for FunctionMethod
/// </summary>
public class FunctionMethod
{
    ConnectDatabase cnDb = new ConnectDatabase();
	public FunctionMethod()
	{
		
	}
    //Comment Article 
    public void addComment(string idArticle, string name, string email, string contents) {
        var  today = DateTime.Now;          
        var  duration = new TimeSpan(0, 0, 0, 0);            
        DateTime day = today.Add(duration);
        //string date = day.ToString();
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("sp_insertComment", cnDb.conn);
        cmd.CommandText = "sp_insertComment";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Date", day);
        cmd.Parameters.AddWithValue("@ContentCom", contents);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@IDArticle", idArticle);
        cmd.Parameters.AddWithValue("@Fullname", name);
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
     



    }
    //View Tin moi
    public object viewOtherArticle(string idAr) {
        string a = cnDb.getOneData("select IDCategory from Article where IDArticle ='" + idAr+ "'").ToString();
        string qr = "select top 10 * from Article where IDCategory = '" + a + "' and Verify ='1' ORDER BY DateOfPost DESC";
        object tb = cnDb.xlDataDSet(qr);
        return tb;
    }
    //Endcode MD5
    public string EncodeTo64(string toEncode)
    {
        var toEncodeAsBytes = Encoding.ASCII.GetBytes(toEncode);
        var returnValue = System.Convert.ToBase64String(toEncodeAsBytes);
        return returnValue;

    }
    //Decode
    public string DecodeFrom64(string encodedData)
    {
        try
        {
            var encodedDataAsBytes = System.Convert.FromBase64String(encodedData);
            var returnValue = Encoding.ASCII.GetString(encodedDataAsBytes);
            return returnValue;
        }
        catch (Exception)
        {
            return "";
        }
    }
    // Ktra quyen

    public string checkRole(string user, string roleName) {
        try
        {
            //   string userDecode = DecodeFrom64(user);
            return cnDb.getOneData("select DR." + roleName + " from Account A, Role R, RoleDetail DR where A.IDRole =R.IDRole and R.IDRole=DR.IDRole and A.UserName='" + user + "'").ToString();
            //return "True";
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            return "False";
        }
    }
    //get field Article
    public string getArticle(string field, string id) {
        try
        {
            string s = cnDb.getOneData("select " + field + " from Article where IDArticle = '" + id + "'").ToString();
            return s;
        }catch(Exception){
            cnDb.conn.Close();
            return "";
        }
    }
    //Get infor acc sys owner
    public string getAccount(string field, string user) {
        try
        {
            string s = cnDb.getOneData("select " + field + " from Account where UserName = '" + user + "'").ToString();
            return s;
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            return "";
        }
    }
    //get role
    public string getRoleAcc(string user) {
        try
        {
            string s = cnDb.getOneData("select RoleName from Role, Account where Role.IDRole = Account.IDRole and UserName='"+user+"'").ToString();
            return s;
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            return "";
        }
    }
    //Change Pass
    public void changePassAccount(string user, string newPass) {
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("sp_updatePasswordAccount", cnDb.conn);
        cmd.CommandText = "sp_updatePasswordAccount";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", user);
        cmd.Parameters.AddWithValue("@Password", newPass);
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
       
    }
    //add mem sys owner
    public void addNewMember(string user, string pass, string name, string role) {
        cnDb.connect();
        var today = DateTime.Now;
        var duration = new TimeSpan(0, 0, 0, 0);
        DateTime day = today.Add(duration);
       // string date = day.ToString();
        string image = "ImagesAcc/default_avatar.jpg";
        SqlCommand cmd = new SqlCommand("sp_insertAccount", cnDb.conn);
        cmd.CommandText = "sp_insertAccount";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", user);
        cmd.Parameters.AddWithValue("@Password", pass);
        cmd.Parameters.AddWithValue("@Status", "True");
        cmd.Parameters.AddWithValue("@IDRole", role);
        cmd.Parameters.AddWithValue("@FullName", name);
        cmd.Parameters.AddWithValue("@Image", image);
        cmd.Parameters.AddWithValue("@DateCreate", day);        
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
       
    }
    public bool ktraUser(string id) // Kiểm tra trùng lặp ID?!?
    {
        string kiemtra = "SELECT UserName FROM Account WHERE UserName = '" + id + "'";
        object a = cnDb.xlExecuteScalar(kiemtra);
        if (a == null)
            return false;        // Chưa có 
        else
            return true;    // Đã có
    }
    //booking tour
    public void bookingTour(string ID, string identityCard, string numberOfTickets, 
        string totalAmount, string fullName, string address, string gender, string phone,  string email)
    {
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("sp_bookingTour", cnDb.conn);
        cmd.CommandText = "sp_bookingTour";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@IDTour", ID);
        cmd.Parameters.AddWithValue("@IdentityCard", identityCard);
        cmd.Parameters.AddWithValue("@NumberOfTickets", numberOfTickets);
        cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
        cmd.Parameters.AddWithValue("@FullName", fullName);
        cmd.Parameters.AddWithValue("@Address", address);
        cmd.Parameters.AddWithValue("@Gender", gender);
        cmd.Parameters.AddWithValue("@Phone", phone);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
    }
    //get customer
    public string getCustomer(string field, string identityCard) {
        try
        {
            string s = cnDb.getOneData("select " + field + " from Customer where IdentityCard = '" + identityCard + "'").ToString();
            return s;
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            return "";
        }
    }
    //get tour
    public string getTour(string field, string idTour)
    {
        try
        {
            string s = cnDb.getOneData("select " + field + " from TourInfor where IDTour = '" + idTour + "'").ToString();
            return s;
        }
        catch (Exception)
        {
            cnDb.conn.Close();
            return "";
        }
    }
    //insert category
    public void insertCategory(string nameCategory, string priority)
    {
        try
        {
            cnDb.connect();
            SqlCommand cmd = new SqlCommand("sp_insertCategory", cnDb.conn);
            cmd.CommandText = "sp_insertCategory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NameCategory", nameCategory);
            cmd.Parameters.AddWithValue("@Priority", priority);            
            cmd.ExecuteNonQuery();
            cnDb.conn.Close();
        }
        catch (Exception) {
            cnDb.conn.Close();
        }
    }
    //update category
    public void editCategory(string idCategory, string nameCategory, string priority)
    {
        try
        {
            cnDb.connect();
            SqlCommand cmd = new SqlCommand("sp_updateCategory", cnDb.conn);
            cmd.CommandText = "sp_updateCategory";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDCategory", idCategory);
            cmd.Parameters.AddWithValue("@NameCategory", nameCategory);
            cmd.Parameters.AddWithValue("@Priority", priority);
            cmd.ExecuteNonQuery();
            cnDb.conn.Close();
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
    }
    //Insert contact
    public void insertContact(string fullName, string address, string phone, string email, string title, string contents) {
        try
        {
            cnDb.connect();
            SqlCommand cmd = new SqlCommand("sp_InsertContact", cnDb.conn);
            cmd.CommandText = "sp_InsertContact";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FullName", fullName);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Tiltle", title);
            cmd.Parameters.AddWithValue("@Contents", contents);
            cmd.ExecuteNonQuery();
            cnDb.conn.Close();
        }
        catch (Exception)
        {
            cnDb.conn.Close();
        }
    
    }
    public bool checkCompany(string idCompany) // Kiểm tra trùng lặp ID?!?
    {
        string kiemtra = "SELECT IDCompany FROM TourCompany WHERE IDCompany = '" + idCompany + "'";
        object a = cnDb.xlExecuteScalar(kiemtra);
        if (a == null)
            return false;        // Chưa có 
        else
            return true;    // Đã có
    }
    public void updateTerms(string user, string contents) {
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("sp_UpdateTerms", cnDb.conn);
        cmd.CommandText = "sp_UpdateTerms";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Contents", contents);
        cmd.Parameters.AddWithValue("@UserName", user);
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();
        
    }

    public void logTask(string user, string contents)
    {
        cnDb.connect();
        SqlCommand cmd = new SqlCommand("sp_Log", cnDb.conn);
        cmd.CommandText = "sp_Log";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", user);
        cmd.Parameters.AddWithValue("@Contents", contents);
        cmd.ExecuteNonQuery();
        cnDb.conn.Close();

    }
    //getDetail Company Tour
    public string getDetailCompany(string field, string idCom) {
        try
        {
            return cnDb.getOneData("SELECT "+field+" FROM TourCompany WHERE IDCompany='"+idCom+"'").ToString();
        }
        catch (Exception) {
            cnDb.conn.Close();
            return "";
        }
    }

   

}