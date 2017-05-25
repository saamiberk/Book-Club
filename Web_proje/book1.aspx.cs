using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;

public partial class book1 : System.Web.UI.Page
{
    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;
    static int flag;
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!this.IsPostBack)
        {
            getDatatable();
            dataTable();

        }

        if (string.IsNullOrEmpty((string)Session["Icon"]))
        {
            commenticon.ImageUrl = "~/images/usernot.png";
            txtcomment.Text = "YOU MUST LOGIN FIRST";
            txtcomment.Enabled = false;

        }
            
        else
            commenticon.ImageUrl = "~/images/" + Session["Icon"].ToString();




    }

    protected void OnClick(object sender, RatingEventArgs e)
    {

        SqlConnection connection = new SqlConnection(connectionString);

        connection.Open();

        SqlCommand command = new SqlCommand("INSERT INTO dbo.UserRatings(UserRatings1)Values(@rating)", connection);

        command.Parameters.AddWithValue("@rating", e.Value);

        command.ExecuteNonQuery();
        connection.Close();

        Response.Redirect(Request.Url.AbsoluteUri);

    }


    public void getDatatable()
    {

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable dt = new DataTable();

        SqlDataAdapter adapter = new SqlDataAdapter("SELECT ISNULL(AVG(UserRatings1), 0) AverageRating, COUNT(UserRatings1) RatingCount FROM dbo.UserRatings", connection);


        adapter.Fill(dt);
        Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
        lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating is {1}", dt.Rows[0]["RatingCount"], Convert.ToDouble(dt.Rows[0]["AverageRating"]).ToString("0.00"));

        connection.Close();

      

    }
    //    public void image()

    //    {
    //        if (string.IsNullOrEmpty((string)Session["Icon"]))
    //        {
    //            commenticon.ImageUrl = "~/image/usernot.png";
    //    }
    //        else
    //        {
    //            commenticon.ImageUrl = "~/image/" + Session["Icon"].ToString();
    //}



    //    }

    public void sendComment()

    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("insert into dbo.Comments(Name,Icon,Comment,Date,Hour)Values(@name,@icon,@comment,@date,@hour)", connection);
        cmd.Parameters.AddWithValue("@name", Session["Name"].ToString());
        cmd.Parameters.AddWithValue("@icon", Session["Icon"].ToString());
        cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@hour", DateTime.Now.ToLongTimeString());

        cmd.ExecuteNonQuery();

        connection.Close();
        Response.Redirect(Request.Url.AbsoluteUri);

    }
    public void dataTable()
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        DataTable table = new DataTable();

        SqlDataAdapter dt = new SqlDataAdapter("Select * from dbo.Comments", connection);

        dt.Fill(table);

        DataList1.DataSource = table;
        DataList1.DataBind();
        connection.Close();


    }

    public string puanUp()

    {
        string name = Session["name"].ToString();       
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update dbo.Register set Puan=Puan+100 where Name=@name", connection);
        cmd.Parameters.AddWithValue("name", name);
        cmd.ExecuteNonQuery();
        SqlCommand cmd1 = new SqlCommand("select Puan from dbo.Register where Name=@name", connection);
        cmd1.Parameters.AddWithValue("name", name);
        SqlDataReader dr = cmd1.ExecuteReader();
        string x = "";
        while (dr.Read())
        {
            x = dr["Puan"].ToString();

        }
        connection.Close();

        return x;
               
    }

    public string puanUpLike()
    {
        string name = Session["name"].ToString();
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update dbo.Register set Puan=Puan+50 where Name=@name", connection);
        cmd.Parameters.AddWithValue("name", name);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        SqlCommand cmd1 = new SqlCommand("select Puan from dbo.Register where Name=@name", connection);
        cmd1.Parameters.AddWithValue("name", name);
        SqlDataReader dr = cmd1.ExecuteReader();
        string x = "";
        while(dr.Read())
        {
            x = dr["Puan"].ToString();

        }
        connection.Close();

        return x;

    }

    
    public void like(string id)

    {        
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update dbo.Comments set Begen=Begen+1 where Id=@id", connection);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.ExecuteNonQuery();
        connection.Close();
        Response.Redirect(Request.Url.AbsoluteUri);

    }

    public void dislike(string id)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("update dbo.Comments set Begenme=Begenme+1 where Id=@id", connection);
        cmd.Parameters.AddWithValue("@id", id);
        cmd.ExecuteNonQuery();
        connection.Close();
        Response.Redirect(Request.Url.AbsoluteUri);

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        var x = (Label)Master.FindControl("puan");

        Session["puan"] = puanUpLike();
        x.Text = Session["puan"].ToString();            
        sendComment();


    }

    //public List<string> commentToString()
    //{
    //    SqlConnection connection = new SqlConnection(connectionString);
    //    connection.Open();

    //    var id = new List<string>();


    //    SqlCommand cmd = new SqlCommand("select dbo.Comments.Id from dbo.Comments", connection);
        
    //    SqlDataReader dr = cmd.ExecuteReader();
       
    //    while (dr.Read())
    //    {
    //        id.Add(dr["Id"].ToString());
    //    }
      

    //    return id;

        
    //}




    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

        var x = (Label)e.Item.FindControl("commentid");
        var y = (Label)Master.FindControl("puan");

        if(e.CommandName == "likecomment")

        {
            Session["puan"] = puanUpLike();
            y.Text = Session["puan"].ToString();
            like(x.Text);         
            
        }
        if(e.CommandName == "dislikecomment")

        {
            Session["puan"] = puanUpLike();
            y.Text = Session["puan"].ToString();
            dislike(x.Text);

        }        


    }
}


