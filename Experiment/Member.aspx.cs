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
    public partial class Member : System.Web.UI.Page
    {
        Database DB = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["admin"]!=null && Session["user"]==null)
            {
                string query = @"SELECT [user_id]
                                  ,[user_uName]
                                  ,[user_fName]
                                  ,[user_lName]
                                  ,[user_Email]
                                  ,[user_Phone]
                                  ,[user_Password]
                                  ,[user_type]
                              FROM [dbo].[User]";
                GridMember.DataSource=DB.GetData(query);
                GridMember.DataBind();
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}