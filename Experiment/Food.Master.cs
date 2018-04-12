using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Experiment
{
    public partial class Food : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Cart"] = null;
            Session["FoodName"] = null;
            Session["FoodPrice"] = null;
            Session["user"] = null;
            Response.Redirect("~/");
        }
    }
}