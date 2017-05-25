using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class topUser : System.Web.UI.Page
{

    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        topUsers();
    }

    public void topUsers()
    {

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        DataTable table = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter("select dbo.Register.Name,dbo.Register.Puan from dbo.Register order by Puan DESC",connection);

        adapter.Fill(table);

        DataList1.DataSource = table;
        DataList1.DataBind();

        connection.Close();



        

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