using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyconnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            login.Text = "Sign in/Join";

        else
        {
            login.Text = Session["name"].ToString();
            puan.Text = Session["puan"].ToString();
            logout.Visible = true;


        }



        if (!IsPostBack)
        {
            getDataDLL();
        }


        dataList();

    }

    public void dataList()

    {

        //using (BookclubEntities context = new BookclubEntities())
        //{

        //    var content = from st in context.booksmains select st;
        //    DataList1.DataSource = content.ToList();
        //    DataList1.DataBind();


        //}





        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        DataTable dt = new DataTable();
        using (connection)
        {

            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * from booksmain", connection);
            adapter.Fill(dt);

        }

        DataList1.DataSource = dt;
        DataList1.DataBind();

    }

    public void getDataDLL()
    {
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();

        DataTable d1 = new DataTable();
        DataTable d2 = new DataTable();
        DataTable d3 = new DataTable();
        DataTable d4 = new DataTable();
        DataTable d5 = new DataTable();
        DataTable d6 = new DataTable();

        using (connection)
        {

            SqlDataAdapter adapter1 = new SqlDataAdapter("select distinct booktypes.categorytypes from booktypes", connection);
            adapter1.Fill(d1);
            SqlDataAdapter adapter2 = new SqlDataAdapter("select distinct booktypes.pricerangetype from booktypes", connection);
            adapter2.Fill(d2);
            SqlDataAdapter adapter3 = new SqlDataAdapter("select distinct booktypes.availabilitytype from booktypes", connection);
            adapter3.Fill(d3);
            SqlDataAdapter adapter4 = new SqlDataAdapter("select booktypes.pointtype from booktypes", connection);
            adapter4.Fill(d4);
            SqlDataAdapter adapter5 = new SqlDataAdapter("select distinct booktypes.languagetype from booktypes", connection);
            adapter5.Fill(d5);
            SqlDataAdapter adapter6 = new SqlDataAdapter("select distinct booktypes.pricetype from booktypes", connection);
            adapter6.Fill(d6);


        }
        categoryddr.DataSource = d1;
        categoryddr.DataValueField = "categorytypes";
        categoryddr.DataBind();

        pricerangeddr.DataSource = d2;
        pricerangeddr.DataValueField = "pricerangetype";
        pricerangeddr.DataBind();

        availabilityddr.DataSource = d3;
        availabilityddr.DataValueField = "availabilitytype";
        availabilityddr.DataBind();

        pointddr.DataSource = d4;
        pointddr.DataValueField = "pointtype";
        pointddr.DataBind();

        languageddr.DataSource = d5;
        languageddr.DataValueField = "languagetype";
        languageddr.DataBind();

        converterddr.DataSource = d6;
        converterddr.DataValueField = "pricetype";
        converterddr.SelectedIndex = 1;
        converterddr.DataBind();



        connection.Close();

        //}


        //public void getDataDLL()
        //{
        //    using (BookclubEntities context = new BookclubEntities())
        //    {
        //        var catagory = (from st in context.booktypes select st.categorytypes).Distinct();
        //        categoryddr.DataSource = catagory.ToList();
        //        categoryddr.DataBind();

        //        var price = (from st in context.booktypes select st.pricerangetype).Distinct();
        //        pricerangeddr.DataSource = price.ToList();
        //        pricerangeddr.DataBind();

        //        var avai = (from st in context.booktypes select st.availabilitytype).Distinct();
        //        availabilityddr.DataSource = avai.ToList();
        //        availabilityddr.DataBind();

        //        var point = from st in context.booktypes select st.pointtype;
        //        pointddr.DataSource = point.ToList();
        //        pointddr.DataBind();

        //        var language = (from st in context.booktypes select st.languagetype).Distinct();

        //        languageddr.DataSource = language.ToList();
        //        languageddr.DataBind();

        //        var converter = (from st in context.booktypes
        //                        select st.languagetype).Distinct();
        //        converterddr.DataSource = converter.ToList();
        //        converterddr.DataBind();



        //    }




    }

    int queryFlag = 0;
    public bool cboxitemcheck(string check)
    {
        string[] list = { categoryddr.Text, availabilityddr.Text, pointddr.Text, languageddr.Text };

        foreach (var item in list)
        {

            if (item != "All" && item != check && queryFlag == 1)
            {
                return true;
            }
        }
     
        queryFlag = 1;
        return false;
    }

    public void ddlSearch()

    {
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        DataTable dt = new DataTable();
        //string a = availabilityddr.Text;

        var Mainquery = "select dbo.booksmain.name,dbo.booksmain.author,booksmain.image,booksmain.USnewprice,booksmain.USprice,booksmain.USsaveprice,booksmain.date,booksmain.number,booksmain.link,booksmain.bookID,booksmain.language,booksmain.Enewprice,booksmain.Eprice,booksmain.Esaveprice,booksmain.Tnewprice,booksmain.Tprice,booksmain.Tsaveprice,booksInformation.avaib,booksInformation.category,booksInformation.language,booksInformation.point,booksInformation.pricetype from dbo.booksmain inner join dbo.booksInformation on booksmain.bookID=booksInformation.bookID";
        var Mainquery2 = "select dbo.booksmain.name,dbo.booksmain.author,booksmain.image,booksmain.USnewprice,booksmain.USprice,booksmain.USsaveprice,booksmain.date,booksmain.number,booksmain.link,booksmain.bookID,booksmain.languages,booksmain.Enewprice,booksmain.Eprice,booksmain.Esaveprice,booksmain.Tnewprice,booksmain.Tprice,booksmain.Tsaveprice,booksInformation.avaib,booksInformation.category,booksInformation.language,booksInformation.point,booksInformation.pricetype from dbo.booksmain inner join dbo.booksInformation on booksmain.bookID=booksInformation.bookID where";
        string[] query = new string[5];
        //SqlDataAdapter adapter = new SqlDataAdapter(query + " where category =@category and avaib=@avai", conn);

        if (categoryddr.Text != "All")
        {
            if (cboxitemcheck(categoryddr.Text))
            {
                query[0] = " AND category=@category";
            }
            else
            {
                query[0] = " category=@category";
            }
        }



        if (availabilityddr.Text != "All")
        {

            if (cboxitemcheck(availabilityddr.Text))
            {
                query[1] = " AND avaib =@avaib";
            }
            else
            {
                query[1] = " avaib =@avaib";
            }

        }




        if (pointddr.Text != "All")
        {
            if (cboxitemcheck(pointddr.Text))
            {
                query[2] = " AND point=@point";
            }
            else
            {
                query[2] = " point=@point";
            }

        }
        if (pricerangeddr.Text != "All")
        {

            if (cboxitemcheck(pricerangeddr.Text))
            {
                query[1] = " AND pricetype =@price";
            }
            else
            {
                query[1] = " pricetype =@price";
            }

        }
        if (languageddr.Text != "All")
        {

            if (cboxitemcheck(languageddr.Text))
            {
                query[1] = " AND language =@language";
            }
            else
            {
                query[1] = " language =@language";
            }

        }




        string resultquery="";
        foreach (var item in query)
        {
            resultquery += item; 
        }
        if (queryFlag==0)
        {
            resultquery = Mainquery;
        }
        else
        {
            resultquery = Mainquery2 + resultquery;
        }







        //if (pointddr.Text=="All")
        //{

        //}

        //else
        //{

        //}

        //if (languageddr.Text=="All")
        //{

        //}
        //else
        //{

        //}

        SqlDataAdapter adapter = new SqlDataAdapter(resultquery, conn);

        try{ adapter.SelectCommand.Parameters.AddWithValue("@category", categoryddr.Text); } catch  { }
        try { adapter.SelectCommand.Parameters.AddWithValue("@avaib", availabilityddr.Text); } catch { }
        try { adapter.SelectCommand.Parameters.AddWithValue("@point", pointddr.Text); } catch { }
        try { adapter.SelectCommand.Parameters.AddWithValue("@price", pricerangeddr.Text); } catch { }
        try { adapter.SelectCommand.Parameters.AddWithValue("@language", languageddr.Text); } catch { }

        adapter.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        conn.Close();


    }


    protected void refine_Click(object sender, EventArgs e)
    {
        ddlSearch();
    }


    public void searchButton()

    {

        SqlConnection conn = new SqlConnection(connectionString);

        conn.Open();

        DataTable table = new DataTable();

        SqlDataAdapter adapter = new SqlDataAdapter("select dbo.booksmain.name,dbo.booksmain.author,booksmain.image,booksmain.USnewprice,booksmain.USprice,booksmain.USsaveprice,booksmain.date,booksmain.number,booksmain.link,booksmain.bookID,booksmain.languages,booksmain.Enewprice,booksmain.Eprice,booksmain.Esaveprice,booksmain.Tnewprice,booksmain.Tprice,booksmain.Tsaveprice,booksmain.Id from dbo.booksmain where name + author like @search", conn);
        adapter.SelectCommand.Parameters.AddWithValue("@search", "%" + searchbox.Value + "%");

        adapter.Fill(table);

        DataList1.DataSource = table;
        DataList1.DataBind();
        conn.Close();


    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        searchButton();
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["name"] = null;
        Session["puan"] = null;
        Response.Redirect("Default.aspx");

    }

    protected void messagebutton_Click(object sender, EventArgs e)
    {
        if (Session["name"] == null)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('YOU MUST LOGIN FIRST');</script>");

        else
        {
            Response.Redirect("mesaj.aspx");


        }
    }
}