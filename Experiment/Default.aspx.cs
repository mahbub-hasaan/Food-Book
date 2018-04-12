using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Experiment
{
    public partial class Defualt : System.Web.UI.Page
    {
        Database DB = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {

            string query = @"SELECT * FROM [dbo].[User] where user_Email=('" + txtEmail.Text + "') and user_Password=('" + txtPassword.Text + "')";
            DataTable dt = DB.GetData(query);
            if (dt.Rows.Count == 0)
            {
                lblmsg.Text = "Password Is Incorrect";
            }
            else if(dt.Rows[0].Field<string>("user_type")!=null)
            {
                Response.Write(dt.Rows[0].Field<string>("user_type"));
                Session["admin"] = dt.Rows[0].Field<string>("user_type");
                Response.Redirect("Member.aspx");
            }
            else if(dt.Rows[0].Field<string>("user_type")==null)
            {
                Session["user"]=txtEmail.Text;
                Response.Redirect("foods.aspx");
            }
        }
    }
}