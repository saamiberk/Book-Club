using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for Register
/// </summary>
public partial class Register
{
    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;


    public void insertUser(string email, string name, string password, string icon)

    {



        SqlConnection connection = new SqlConnection(connectionString);

        connection.Open();

        SqlCommand command = new SqlCommand("INSERT INTO dbo.Register(Email,Name,Password,Icon)Values(@email,@name,@password,@icon)", connection);

        command.Parameters.AddWithValue("@email", email);
        command.Parameters.AddWithValue("@name", name);
        command.Parameters.AddWithValue("@password", password);
        command.Parameters.AddWithValue("@icon", icon);
        command.ExecuteNonQuery();
        connection.Close();


    }




}