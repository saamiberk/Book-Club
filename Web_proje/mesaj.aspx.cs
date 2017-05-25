using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class mesaj : System.Web.UI.Page
{
    string a;
    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
           
            ddr();
        }
        gettable();

    }

    public void ddr()

    {
        SqlConnection connection = new SqlConnection(connectionString);

        DataTable table = new DataTable();
        connection.Open();

        SqlDataAdapter adapter = new SqlDataAdapter("select dbo.Register.Name from dbo.Register",connection);

        adapter.Fill(table);
        DropDownList1.DataSource = table;
        DropDownList1.DataValueField = "Name";
        DropDownList1.DataBind();

        connection.Close();

    }

    public void sendMessage()
    {


        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into dbo.Messages(kim,kime,mesaj,tarih,saat,icon)values(@kim,@kime,@mesaj,@tarih,@saat,@icon)", connection);
        cmd.Parameters.AddWithValue("@kim", Session["name"].ToString());
        cmd.Parameters.AddWithValue("@kime", DropDownList1.Text);
        cmd.Parameters.AddWithValue("@mesaj", lblsendmessage.Text);
        cmd.Parameters.AddWithValue("@tarih", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@saat", DateTime.Now.ToLongTimeString());
        cmd.Parameters.AddWithValue("@icon", Session["icon"].ToString());

        cmd.ExecuteNonQuery();
        
        connection.Close();


    }
    public void gettable()
    {

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        DataTable table = new DataTable();

        SqlDataAdapter dt = new SqlDataAdapter("select dbo.Messages.icon ,dbo.Messages.tarih,dbo.Messages.mesaj,dbo.Messages.saat,dbo.Messages.Kim from dbo.Messages where dbo.Messages.Kime=@user", connection);
        dt.SelectCommand.Parameters.AddWithValue("@user", Session["name"]);
       
        dt.Fill(table);

        DataList1.DataSource = table;
        DataList1.DataBind();
        connection.Close();



    }








    protected void send_Click(object sender, EventArgs e)
    {
   
        sendMessage();
        Response.Redirect(Request.Url.AbsoluteUri);
        Label2.Visible = true;
        
    }
}