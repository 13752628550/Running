using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebFormSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnButton_Click(object sender, EventArgs e)
        {
            Session["username"] = username.Text;
            Session["password"] = userfghfgh.Text;
            Response.Redirect("~/details.aspx")       ;   
        }
    }
}