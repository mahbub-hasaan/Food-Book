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
    public partial class store : System.Web.UI.Page
    {
        Database DB = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                if (!Page.IsPostBack)
                {
                    ShowGrid();
                }
            }
            else
            {
                Response.Redirect("~/");
            }
        }



        public void AddFood()
        {
        
            if(FileUpload1.HasFile)
            {
                String str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//Uploads//" + str);
                String path = "~//Uploads//" + str.ToString();
                string query = @"INSERT INTO [dbo].[Foods1]
                                                       ([FoodName]
                                                       ,[FoodPrice]
                                                       ,[FoodStock]
                                                       ,[FoodImg])
                                                 VALUES('"+txtName.Text+"','"+txtPrice.Text+"','"+txtQuantity.Text+"','"+path+"')";
                DB.Execute_Query(query);
                lblSuccess.Text = "Successfully Saved!!";
                ShowGrid();
                

            }
            else
            {
                lblFaild.Text = "Wrong input!";
            }
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            AddFood();
        }

        public void ShowGrid()
        {
            string query = @"SELECT 
                              [FoodName]
                              ,[FoodPrice]
                              ,[FoodStock]
                              ,[FoodImg]
                          FROM [dbo].[Foods1]";
            GridFood.DataSource = DB.GetData(query);
            GridFood.DataBind();
            
        }

        protected void GridFood_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridFood.EditIndex = e.NewEditIndex;
            ShowGrid();

        }

        protected void GridFood_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label LabelName = (Label)GridFood.Rows[e.RowIndex].FindControl("Label2");
            string query = @"DELETE FROM [dbo].[foods1] WHERE FoodPrice=" + LabelName.Text;          
            if (DB.Execute_Query(query) == 1)
            {
                ShowGrid();
            }
        }

        protected void GridFood_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridFood.EditIndex = -1;
            ShowGrid();
            

        }

        protected void GridFood_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridFood.PageIndex = e.NewPageIndex;
            ShowGrid();
        }

        protected void GridFood_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblName = (Label)GridFood.Rows[e.RowIndex].FindControl("Label1");
            TextBox txtPrice = (TextBox)GridFood.Rows[e.RowIndex].FindControl("TextBox2");
            TextBox txtStock = (TextBox)GridFood.Rows[e.RowIndex].FindControl("TextBox3");
            string query = @"UPDATE [dbo].[foods1] SET [FoodPrice] ='"+Convert.ToInt32(txtPrice.Text)+"' ,[FoodStock] = '"+Convert.ToInt32(txtStock.Text)+"'WHERE FoodName='"+lblName.Text+"'";
            if (DB.Execute_Query(query) == 1)
            {
                GridFood.EditIndex = -1;
                ShowGrid();               
            }

        }
    }
}