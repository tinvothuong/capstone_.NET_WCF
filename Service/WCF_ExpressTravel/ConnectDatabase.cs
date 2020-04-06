using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectDatabase
/// </summary>
public class ConnectDatabase
{
	public ConnectDatabase()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public SqlConnection conn = new SqlConnection();
    public void connect()
    {
        //ket noi
        conn.ConnectionString = @"Data Source=.;Initial Catalog=Capstone;Integrated Security=True";
        conn.Open();
    }

    public object xlExecuteScalar(string query)
    {

        connect();
        SqlCommand comm = new SqlCommand();
        comm.CommandText = query;
        comm.Connection = conn;
        object abc = comm.ExecuteScalar();
        conn.Close();
        return abc;
    }
    //update, insert, delete
    public void xlExecuteNonQuery(string query)
    {
        connect();
        SqlCommand comm = new SqlCommand();
        comm.CommandText = query;
        comm.Connection = conn;
        comm.ExecuteNonQuery();
        conn.Close();

    }

    public SqlDataReader xlExecuteReader(string query)
    {
        //ket noi
        connect();
        SqlCommand comm = new SqlCommand();
        comm.CommandText = query;
        comm.Connection = conn;
        SqlDataReader abc = comm.ExecuteReader();
        conn.Close();
        return abc;
    }

    public DataSet xlDataDSet(string query)  //dataset > table
    {
        try
        {
            connect();
            SqlDataAdapter comm = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            comm.Fill(ds);
            conn.Close();
            return ds;
        }
        catch (Exception) {
            conn.Close();
            return null;
        }
    }
    // Lấy 1 dữ liệu
    public object getOneData(string str)
    {
        connect();
        SqlCommand cm = new SqlCommand(str, conn);
        object obj = cm.ExecuteScalar();
        conn.Close();
        return obj;
    }
    public bool ktraTontai(string chuoiQr) // Kiểm tra tồn tại?!?
    {

        object a = xlExecuteScalar(chuoiQr);
        if (a == null)
            return false;        // Chưa có 
        else
            return true;    // Đã có
    }
    
}
