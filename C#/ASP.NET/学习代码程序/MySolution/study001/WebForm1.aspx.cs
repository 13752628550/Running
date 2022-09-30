using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace study001
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string msg = "";
            switch(DateTime.Now.Hour)
            {
                case 11:
                case 12:
                    msg = "吃午饭";
                    break;

            }

            msg = name + msg;
            lblMsg.Text = msg;

        }
    }
}