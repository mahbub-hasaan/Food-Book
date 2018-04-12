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
    public partial class Registration : System.Web.UI.Page
    {
        Database DB = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        private void Add_user()
        {
            string query = @"INSERT INTO [dbo].[User]
                                       ([user_uName]
                                       ,[user_fName]
                                       ,[user_lName]
                                       ,[user_Email]
                                       ,[user_Phone]
                                       ,[user_Password])
                                VALUES('"+txtName.Text+"','"+txtFname.Text+ "','"+txtLname.Text+ "','"+txtEmail.Text+ "','"+TxtPhone.Text+ "','"+txtPassword.Text+"')";
            try
            {
                DB.Execute_Query(query);
            }
            catch(SqlException ex)
            {
                lblMsg.Text = ex.Message;
            }
            finally
            {
                lblMsg.Text = "Saved Successfully!!";
                txtEmail.Text = String.Empty;
                txtFname.Text = String.Empty;
                txtLname.Text = String.Empty;
                txtName.Text = String.Empty;
                txtPassword.Text = String.Empty;
                TxtPhone.Text = String.Empty;
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            Add_user();
        
        }



    }

}