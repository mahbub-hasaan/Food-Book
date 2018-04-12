using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Experiment
{
    public partial class Order : System.Web.UI.Page
    {
        Database DB = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (HttpContext.Current.Session["Cart"] == null && Session["FoodName"]!=null && Session["FoodPrice"]!=null)
                {
                    string query = @"INSERT INTO [dbo].[Order]
                                               ([CustomerID])
                                         VALUES('"+ Session["user"] + "')";
                    DB.Execute_Query(query);
                    string query1 = @"SELECT Top(1)* FROM [Emperiment].[dbo].[Order] where CustomerID=('"+ Session["user"] + "') ORDER BY OrderID DESC";

                    Session["Cart"] = DB.GetData(query1).Rows[0].Field<int>("OrderID");
                    OrderData();
                    
                }
                else if(Session["FoodName"] != null && Session["FoodPrice"] != null)
                {
                    OrderData();
                 
                }
                else
                {
                     
                }
                ShowCart();
            }
            else
            {
                Response.Redirect("~/");
            }
            
        }


        public void OrderData()
        {
            string query = @"INSERT INTO [dbo].[OrderDetail]
                                               ([FoodName]
                                               ,[FoodPrice]
                                               ,[OrderID])
                                         VALUES('" + Session["FoodName"]+"','"+Session["FoodPrice"]+"','"+ Session["Cart"] + "')";
            DB.Execute_Query(query);
            Session["FoodName"] = null;
            Session["FoodPrice"] = null;
        }

        public void ShowCart()
        {
            string query = @"SELECT [Product]
                      ,[FoodName]
                      ,[FoodPrice]
                  FROM [dbo].[OrderDetail] where OrderID=('"+ Session["Cart"] + "')";
            DataTable dt= DB.GetData(query);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

           Label2.Text=dt.Compute("SUM(FoodPrice)","").ToString();
           
        }
    }
}