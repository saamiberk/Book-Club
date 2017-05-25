using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;


    protected void joinButton_Click(object sender, EventArgs e)
    {
       
        Register signup = new Register();
        string icon;

        if (icon1.Checked == true)
            icon = "usericon1.png";
        else if
            (icon2.Checked == true)
            icon = "usericon2.png";
        else if (icon3.Checked == true)
            icon = "usericon3.png";
        else if (icon4.Checked == true)
            icon = "usericon4.png";
        else
            icon = "usericon5.png";


        signup.insertUser(joinEmail.Text.Trim(), joinName.Text.Trim(), joinPassword.Text.Trim(),icon);
        joinlabel.Visible = true;

    }




    public void login(string name, string password)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        int i;
        

        SqlCommand cmd = new SqlCommand("select * from dbo.Register WHERE Name=@name and Password=@password", connection);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@password", password);
        SqlDataReader reader = cmd.ExecuteReader();
        


        if (reader.Read())
        {
            Session.Add("name", name);
            i = Convert.ToInt32(reader["Puan"]);
            Session.Add("puan", i);
            Response.Redirect("Default.aspx");           

        }
        else

        {
            logNamelabel.Visible = true;

        }

        connection.Close();

    }

    public void llogin(string name)

    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        string icon;

        SqlCommand cmd1 = new SqlCommand("select dbo.Register.Icon from dbo.Register where Name = @Name", connection);
        cmd1.Parameters.AddWithValue("@Name", name);
        SqlDataReader dr = cmd1.ExecuteReader();


        if (dr.Read())
        {
            //icon = dr.GetString(dr.GetOrdinal("Icon"));
            icon = dr["Icon"].ToString();
            Session.Add("icon", icon);
        }


    }


    protected void loginbtn_Click(object sender, EventArgs e)
    {
        llogin(loginName.Text);
        login(loginName.Text, loginPassword.Text);
    }

    protected void msjbtn_Click(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('YOU MUST LOGIN FIRST');</script>");

        else
        {
            Response.Redirect("mesaj.aspx");


        }
    }
}