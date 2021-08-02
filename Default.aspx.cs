using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
   MySqlCommand cmd;
    static VehicleDBMgr vdm;
    static string User_sno = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["userdata_sno"] == null)
                Response.Redirect("Login.aspx");
            if (!Page.IsCallback)
            {
                if (!Page.IsPostBack)
                {
                    vdm = new VehicleDBMgr();

                    User_sno = Session["userdata_sno"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            if (ex.Message == "Object reference not set to an instance of an object.")
            {
                MessageBox.Show("Session Expired", this);
                Response.Redirect("Login.aspx");
            }
        }
    }
}