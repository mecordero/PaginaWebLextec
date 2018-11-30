using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Online_Shopping_Backup
{
    public partial class Home : System.Web.UI.MasterPage
    {
        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie user = Request.Cookies["UEmail"];

            if (LoginTemplate != null && LogoutTemplate != null)
            {
                if (user != null)
                {
                    LoginTemplate.Visible = false;
                    LogoutTemplate.Visible = true;
                }
                else
                {
                    LoginTemplate.Visible = true;
                    LogoutTemplate.Visible = false;
                }
            }

            try
            {
                string Role = Session["Role"].ToString();
                lbl_name.Text = "Bienvenido " + Request.Cookies["uname"].Value;

                if (Role != null)
                {
                    if (Role == "user" || Role == "admin")
                    {
                        btn_Edit_Profile.Visible = true;
                    }
                    else
                    {
                        btn_Edit_Profile.Visible = false;
                    }
                }
                else
                {
                    btn_Edit_Profile.Visible = false;
                }
            }
            catch{}

            //TODO: Check out what this does
            //navigation();
        }



        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void img_shopping_chart_Click(object sender, ImageClickEventArgs e)
        {
            string u_id = "";
            try
            {
                u_id = Request.Cookies["u_id"].Value;
            }
            catch
            { }

            Response.Redirect("~/add_cart.aspx?u_id=" + u_id);

        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin.aspx");
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void btn_Edit_Profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Login.aspx");
        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie user = Request.Cookies["UEmail"];

            if (user == null)
            {
                return;
            }

            Request.Cookies.Remove("UEmail");
            Response.Cookies["UEmail"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/Pages/Home.aspx");
        }
    }
}