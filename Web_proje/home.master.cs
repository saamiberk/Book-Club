using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.MasterPage
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
        
          
           

    }
    protected void logout_Click(object sender, EventArgs e)
    {
        
        Session["name"] = null;
        Session["puan"] = null;
        Response.Redirect("Default.aspx");
        
    }
}
