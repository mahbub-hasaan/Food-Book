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
    public partial class foods : System.Web.UI.Page
    {
        Database DB = new Database();
        //string ItemName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (!IsPostBack)
                {
                    GetFoodData();
                    Response.Write(Repeater1.Items[0].FindControl("FoodName"));
                }
            }
            else
            {
                Response.Redirect("~/");
            }
            
        }



        public void GetFoodData()
        {
            string query = @"SELECT
                              [FoodName]
                              ,[FoodPrice]
                              ,[FoodStock]
                              ,[FoodImg]
                          FROM [dbo].[Foods1]";
            Repeater1.DataSource = DB.GetData(query);
            Repeater1.DataBind();
        }

        protected void btnADD_Click(object sender, EventArgs e)
        {
            //Session["FoodName"] = Repeater1.Items[0].FindControl("FoodName");  
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName=="Add_To_Cart")
            {
                string query = @"select*from Foods1 where FoodName='"+e.CommandArgument+"' ";
                DataTable dt = DB.GetData(query);
                Response.Write(dt.Rows[0].Field<string>("FoodName"));
                Response.Write(dt.Rows[0].Field<int>("FoodPrice"));
                Session["foodName"] = dt.Rows[0].Field<string>("FoodName");
                Session["FoodPrice"] = dt.Rows[0].Field<int>("FoodPrice");
                Response.Redirect("Order.aspx");
            }
            
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}
